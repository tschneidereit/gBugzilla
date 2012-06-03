let conversation;

function replaceConversation(element)
{
    conversation = element
    const apiURL = getBzRestUrl();
    const bug = findBugId(conversation);
    if (!bug)
        return;
    self.port.emit('bugViewOpened', {'api': apiURL, 'bug' : bug});
}

function getBzRestUrl()
{
    //TODO: probably implement support for setting bugzilla instances in the preferences
    return 'https://api-dev.bugzilla.mozilla.org/latest/';
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
    conversation.innerHTML = data.response;
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
            }
          });
      });
    }
}

self.on('message', loadGmonkey);
self.port.on('bugDataLoaded', enhanceView);