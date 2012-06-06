let pageMod = require("page-mod");
let data = require("self").data;
let Request = require("request").Request;
let Mustache = require('mustache');
let storage = require("simple-storage").storage;
let {Cc, Ci} = require("chrome");
let cookieService = Cc["@mozilla.org/cookieService;1"].getService(Ci.nsICookieService);
let ioService = Cc["@mozilla.org/network/io-service;1"].getService(Ci.nsIIOService);
let cookieManager = Cc["@mozilla.org/cookiemanager;1"].getService(Ci.nsICookieManager2);

exports.main = function(options, callback)
{
    pageMod.PageMod({
        include: /.+mail\.google\.com\/mail\/.+shva=.+/,
        contentScriptWhen: 'end',
        contentScriptFile: data.url("gbugs.js"),
        onAttach: function(worker)
        {
            worker.port.on('bugViewOpened', function(data)
            {
                const cached = storage.bugsCache[data.bug];
                if (cached && cached.messageCount === data.messageCount)
                {
                    worker.port.emit('bugDataLoaded', 
                        {'bug' : data.bug, 'response' : renderBug(cached.json, data.web)});
                    return;
                }
                let bzRequestURI = data.api + 'bug/' + data.bug 
                    + '?include_fields=_default,comments,history' + getLogin(data.web);
                Request(
                {
                    'url' : bzRequestURI,
                    'headers' : {'Accept' : 'application/json', 'Content-Type' : 'application/json'},
                    'onComplete' : function(response)
                    {
                        const json = response.json;
                        storage.bugsCache[data.bug] = 
                            {'messageCount' : data.messageCount, 'json' : json};
                        worker.port.emit('bugDataLoaded', 
                            {'bug' : data.bug, 'response' : renderBug(json, data.web)});
                    }

                }).get();
            });
          	worker.postMessage('ready');
        }
    });
}

let bugStylesheet = data.load('gbugs.css');
let bugTemplate = data.load('gbugs.tpl');
if (!storage.bugsCache)
    storage.bugsCache = {};

function renderBug(bug, webUrl)
{
    bug.stylesheet = bugStylesheet;
    bug.bugId = bug.id;
    bug.bzWeb = webUrl;
    return Mustache.render(bugTemplate, bug);
}

function getLogin(webUrl)
{
    let credentials = '';
    const host = webUrl.split('/')[2];
    for (let cookies = cookieManager.getCookiesFromHost(host); cookies.hasMoreElements();)
    {
        let cookie = cookies.getNext().QueryInterface(Ci.nsICookie);
        if (cookie.host !== host)
            continue;
        if (cookie.name === 'Bugzilla_login')
            credentials += '&userid=' + cookie.value;
        if (cookie.name === 'Bugzilla_logincookie')
            credentials += '&cookie=' + cookie.value;
    }
    return credentials;
}