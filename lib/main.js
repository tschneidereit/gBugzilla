let pageMod = require("page-mod");
let data = require("self").data;
let Request = require("request").Request;

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
                console.log(data.api + 'bug/' + data.bug 
                        + '?include_fields=_default,comments,history,attachments.data');
                Request(
                {
                    'url' : data.api + 'bug/' + data.bug 
                        + '?include_fields=_default,comments,history,attachments.data',
                    'headers' : {'Accept' : 'application/json', 'Content-Type' : 'application/json'},
                    'onComplete' : function(response)
                    {
                        console.log(response.text);
                        worker.port.emit('bugDataLoaded', {'bug' : data.bug, 'response' : response.text});
                    }

                }).get();
            });
          	worker.postMessage('ready');
        }
    });
}
