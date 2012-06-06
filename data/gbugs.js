let conversation;
let bzUrl;
let bug;

function replaceConversation(element)
{
    conversation = element;
    //TODO: use destructuring to combine the following two
    bzUrl = getBzWebUrl();
    bug = findBugId();
    if (!bug)
        return;
    self.port.emit('bugViewOpened', 
        {'api': getBzRestUrl(), 'web': bzUrl, 'bug' : bug, 'messageCount' : getMessageCount()});
}

//TODO: probably implement support for setting bugzilla instances in the preferences
function getBzRestUrl() 'https://api-dev.bugzilla.mozilla.org/latest/';

function getMessageCount()
{
    return conversation.querySelectorAll('.Bk').length;
}

function getBzWebUrl()
{
    const match = /(http.+?)show_bug\.cgi\?/.exec(conversation.innerHTML);
    if (!match)
        return '';
    return match[1];
}
function findBugId()
{
    const match = /http.+?show_bug\.cgi\?id=(\d+)/.exec(conversation.innerHTML);
    if (!match)
        return null;
    return match[1];
}

function enhanceView(data)
{
    if (data.bug !== bug)
        return;
    conversation.innerHTML = data.response;
}

function loadGmonkey()
{
    if (unsafeWindow.gmonkey)
    {
      unsafeWindow.gmonkey.load("2", function(api)
      {
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
self.port.on('bugDataLoaded', enhanceView);