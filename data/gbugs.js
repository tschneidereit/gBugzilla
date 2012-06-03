let conversation;
let bzUrl;
let bug;
let stylesheet;

function replaceConversation(element)
{
    conversation = element;
    //TODO: use destructuring to combine the following two
    bzUrl = getBzWebUrl(conversation);
    bug = findBugId(conversation);
    const apiURL = getBzRestUrl();
    if (!bug)
        return;
    self.port.emit('bugViewOpened', {'api': apiURL, 'bug' : bug});
}

//TODO: probably implement support for setting bugzilla instances in the preferences
function getBzRestUrl() {return 'https://api-dev.bugzilla.mozilla.org/latest/'};

function getBzWebUrl(element)
{
    const match = /(http.+?)show_bug\.cgi\?/.exec(element.innerHTML);
    if (!match)
        return '';
    return match[1];
}
function findBugId(element)
{
    const match = /http.+?show_bug\.cgi\?id=(\d+)/.exec(element.innerHTML);
    if (!match)
        return null;
    return match[1];
}

function enhanceView(data)
{
    if (data.bug !== bug)
        return;
    const response = JSON.parse(data.response);
    const comments = response.comments.map(renderComment);
    conversation.innerHTML = '<style type="text/css">' + stylesheet 
        + '</style><div class="bz_comments git_style bzJS-commentoverflow">' 
        + comments.join('') + '</div>';
}

function renderComment(comment, index)
{
    return '<div id="c' + index + '" class="bz_comment' 
            + (index > 0 ? '' : ' bz_first_comment') + '">\n'
        + '<div class="bz_comment_head">\n'
            + '<span class="bz_comment_actions">\n'
                + '[<a class="bz_reply_link" href="#add_comment" '
                    + 'onclick=\'console.log("not implemented yet"); return false;\'>reply</a>]\n'
            + '</span>\n'
            + '<span class="bz_comment_number">\n'
                + '<a href="' + bzUrl + 'show_bug.cgi?id=' + bug 
                    + '#c' + index + '">Comment ' + index + '</a>\n'
            + '</span>\n'
            + '<span class="bz_comment_user">\n'
                + '<span class="vcard"><span class="fn">' + comment.creator.real_name + '</span>\n'
            + '</span>\n'
            + '<span title="' + comment.creation_time + '" data-timestamp="' 
                + comment.creation_time + '" class="bz_comment_time">' 
                + comment.creation_time + '</span>\n' //TODO: render pretty time like BugzillaJS does
        + '</div>\n'
        + '<pre class="bz_comment_text" id="comment_text_' + index + '">' + comment.text + '</pre>'
        + '</div>'
}

function loadGmonkey()
{
    if (unsafeWindow.gmonkey)
    {
      unsafeWindow.gmonkey.load("2", function(api)
      {
        for (var key in api) console.log(key);
          api.registerViewChangeCallback(function(view)
          {
            if (api.getActiveViewType() == 'cv')
            {
                let conversation = api.getActiveViewElement();
                if (conversation.querySelector("[email^='bugzilla-daemon']") != null)
                    replaceConversation(conversation);
            }
            else
            {
                conversation = null;
                bug = null;
            }
          });
      });
    }
}


self.on('message', loadGmonkey);
self.port.on('setStylesheet', function(content) {stylesheet = content});
self.port.on('bugDataLoaded', enhanceView);