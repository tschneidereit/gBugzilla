<div id='bugzilla-body' class='git_style'>
<style type="text/css">
{{stylesheet}}
</style>

<div class="bz_alias_short_desc_container edit_form">
  <span class="last_comment_link"><a href="#c35" accesskey="l"><b>L</b>ast Comment //TODO: fix</a></span> <a href="{{bzWeb}}show_bug.cgi?id={{id}}"><b>Bug&nbsp;{{id}}</b></a> - <span id="summary_alias_container"><span id="short_desc_nonedit_display">Simplify gcMallocBytes accounting</span></span>
  <div class="bz_default_hidden" id="summary_alias_input">
    <table id="summary">
      <tbody>
        <tr>
          <td colspan="2"></td>
        </tr>
        <tr>
          <td>
            <label accesskey="s" for="short_desc"><u>S</u>ummary</label>:
          </td>
          <td>
            {{summary}}
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<table class="edit_form">
  <tbody>
    <tr>
      <td id="bz_show_bug_column_1" class="bz_show_bug_column">
        <table>
          <tbody>
            <tr>
              <td class="field_label">
                <b><a href="{{bzWeb}}page.cgi?id=fields.html#status">Status</a></b>:
              </td>
              <td id="bz_field_status">
                <span id="static_bug_status">{{status}}</span>
              </td>
            </tr>
            <tr>
              <td class="field_label">
                <label for="status_whiteboard" accesskey="w"><b><u>W</u>hiteboard</b></label>:
              </td>
              <td colspan="2"></td>
            </tr>
            <tr>
              <td class="field_label">
                <label for="keywords" accesskey="k"><b><a href="{{bzWeb}}describekeywords.cgi"><u>K</u>eywords</a></b></label>:
              </td>
              <td class="field_value" colspan="2"></td>
            </tr>
            <tr>
              <td colspan="2" class="bz_section_spacer"></td>
            </tr>
            <tr>
              <th class="field_label" id="field_label_product">
                <a title="Bugs are categorised into Products and Components. Select a Classification to narrow down this list." class="field_help_link" href="{{bzWeb}}describecomponents.cgi">Product:</a>
              </th>
              <td class="field_value" id="field_container_product">
                {{product}}
              </td>
            </tr>
            <tr class="bz_default_hidden">
              <th class="field_label" id="field_label_classification">
                <a title="Bugs are categorised into Classifications, Products and Components. classifications is the top-level categorisation." class="field_help_link" href="{{bzWeb}}page.cgi?id=fields.html#classification">{{classification}}</a>
              </th>
              <td class="field_value" id="field_container_classification">
                Components
              </td>
            </tr>
            <tr>
              <th class="field_label" id="field_label_component">
                <a title="Components are second-level categories; each belongs to a particular Product. Select a Product to narrow down this list." class="field_help_link" href="{{bzWeb}}describecomponents.cgi?product=Core">Component:</a>
              </th>
              <td class="field_value" id="field_container_component">
                {{component}}
              </td>
            </tr>
            <tr>
              <td class="field_label">
                <label for="version"><b>Version</b></label>:
              </td>
              <td>
                {{version}}
              </td>
            </tr>
            <tr>
              <td class="field_label">
                <label for="rep_platform" accesskey="h"><b>Platform</b></label>:
              </td>
              <td class="field_value">
                {{platform}} {{platform}}
              </td>
            </tr>
            <tr>
              <td colspan="2" class="bz_section_spacer"></td>
            </tr>
            <tr>
              <td class="field_label">
                <label for="priority" accesskey="i"><b><a href="{{bzWeb}}page.cgi?id=fields.html#importance"><u>I</u>mportance</a></b></label>:
              </td>
              <td>
                {{priority}} {{severity}} <span id="votes_container">(<a href="{{bzWeb}}page.cgi?id=voting/user.html&amp;bug_id={{id}}#vote_{{id}}">vote</a>)</span>
              </td>
            </tr>
            <tr>
              <td class="field_label">
                <label for="target_milestone"><a href="{{bzWeb}}page.cgi?id=fields.html#target_milestone">Target&nbsp;Milestone</a></label>:
              </td>
              <td>
                {{target_milestone}}
              </td>
            </tr>
            <tr>
              <td class="field_label">
                <b><a href="{{bzWeb}}page.cgi?id=fields.html#assigned_to">Assigned To</a></b>:
              </td>
              <td>
                <span class="vcard"><span class="fn">{{assigned_to.real_name}}</span></span>
              </td>
            </tr>
            <tr>
              <td class="field_label">
                <label for="qa_contact" accesskey="q"><b><u>Q</u>A Contact</b></label>:
              </td>
              <td>
                <span class="vcard">{{qa_contact.name}}</span>
              </td>
            </tr>
            <tr>
              <td colspan="2" class="bz_section_spacer"></td>
            </tr>
            <tr>
              <td class="field_label">
                <label for="bug_file_loc" accesskey="u"><b><u>U</u>RL</b></label>:
              </td>
              <td>
                <span id="bz_url_input_area"></span>
                {{url}}
              </td>
            </tr>
            <tr>
              <td colspan="2" class="bz_section_spacer"></td>
            </tr>
            <tr>
              <th class="field_label">
                <label for="dependson">Depends&nbsp;on</label>:
              </th>
              <td>
                <span id="dependson_input_area"></span>
                <a href="{{bzWeb}}show_bug.cgi?id={{depends_on}}">{{depends_on}} TODO: support multiple deps</a>
              </td>
            </tr>
            <tr>
              <th class="field_label">
                <label for="blocked" accesskey="b"><u>B</u>locks</label>:
              </th>
              <td>
                <span id="blocked_input_area"></span>
                <a href="{{bzWeb}}show_bug.cgi?id={{blocks}}">{{blocks}} TODO: support multiple blocked bugs</a>
              </td>
            </tr>
            <tr>
              <th>
                &nbsp;
              </th>
              <td colspan="2" id="show_dependency_tree_or_graph" align="left">
                Show dependency <a href="{{bzWeb}}showdependencytree.cgi?id={{id}}&amp;hide_resolved=1">tree</a> /&nbsp;<a href="{{bzWeb}}showdependencygraph.cgi?id={{id}}">graph</a>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
      <td>
        <div class="bz_column_spacer">
          &nbsp;
        </div>
      </td>
      <td id="bz_show_bug_column_2" class="bz_show_bug_column_table" valign="top">
        <table cellpadding="3" cellspacing="1">
          <tbody>
            <tr>
              <td class="field_label">
                <b>Reported</b>:
              </td>
              <td>
                {{creation_time}} by <span class="vcard"><span class="fn">{{creator.real_name}}</span></span>
              </td>
            </tr>
            <tr>
              <td class="field_label">
                <b>Modified</b>:
              </td>
              <td>
                {{last_change_time}} (<a href="{{bzWeb}}show_activity.cgi?id={{id}}">History</a>)
              </td>
            </tr>
            <tr>
              <td class="field_label">
                <label for="newcc" accesskey="a"><b>CC List</b>:</label>
              </td>
              <td>
                10 users
                <div id="cc_edit_area">
                  <select id="cc" name="cc" multiple="multiple" size="5">
                    {{#cc}}<option value="{{name}}">{{name}}</option>{{/cc}}
                  </select>
                </div>
              </td>
            </tr>
            <tr>
              <td colspan="2" class="bz_section_spacer"></td>
            </tr>
            <tr>
              <td class="field_label">
                <label><b>Flags:</b></label>
              </td>
              <td>
                <span title="Ryan VanderMeulen">ryanvm</span>: in-testsuite-<br>
                TODO: render flags
              </td>
            </tr>
            <tr>
              <th class="field_label" id="field_label_see_also">
                <a title="This allows you to refer to bugs in other installations. You can enter a URL to a bug in the 'Add Bug URLs' field to note that that bug is related to this one. You can enter multiple URLs at once by separating them with a comma. You should normally use this field to refer to bugs in other installations. For bugs in this installation, it is better to use the Depends on and Blocks fields." class="field_help_link" href="{{bzWeb}}page.cgi?id=fields.html#see_also">See Also:</a>
              </th>
              <td class="field_value" id="field_container_see_also">TODO: render</td>
            </tr>
            <tr>
              <td colspan="2" class="bz_section_spacer"></td>
            </tr>
            <tr>
              <th class="field_label" id="field_label_cf_crash_signature">
                Crash Signature:
              </th>
              <td class="field_value" id="field_container_cf_crash_signature" colspan="2">
                <div class="uneditable_textarea">TODO: render</div>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td colspan="3">
        <hr id="bz_top_half_spacer">
      </td>
    </tr>
  </tbody>
</table>
<table id="bz_big_form_parts" cellpadding="0" cellspacing="0">
  <tbody>
    <tr>
      <td>
        <script type="text/javascript">
        function toggle_display(link) {
        var table = document.getElementById("attachment_table");
        // Store current height for scrolling later
        var originalHeight = table.offsetHeight;
        var rows = querySelectorAll('#attachment_table .bz_tr_obsolete');

        for (var i = 0; i < rows.length; i++) {
          rows[i].classList.toggle('bz_default_hidden');
        }

        if (rows[0].classList.contains('bz_default_hidden')) {
          link.innerHTML = "Show Obsolete";
        }
        else {
          link.innerHTML = "Hide Obsolete";
        }

        var newHeight = table.offsetHeight;
        // This scrolling makes the window appear to not move at all.
        window.scrollBy(0, newHeight - originalHeight);

        return false;
        }
        </script><br>
        <table style="width: 674px;" id="attachment_table" cellpadding="4" cellspacing="0">
          <tbody>
            <tr id="a0">
              <th colspan="3" align="left">
                Attachments
              </th>
            </tr>
            {{#attachments}}
            <tr id="a1" class="{{#is_patch}}bz_patch{{/is_patch}}{{#is_obsolete}} bz_tr_obsolete bz_default_hidden{{/is_obsolete}}">
              <td valign="top">
                <a href="{{bzWeb}}attachment.cgi?id={{id}}" title="View the content of the attachment"><b>{{description}}</b></a> <span class="bz_attach_extra_info">({{size}} B, {{#is_patch}}patch{{/is_patch}})<br>
                <a href="#attach_{{id}}" title="Go to the comment associated with the attachment">{{creation_time}}</a>, <span class="vcard"><span class="fn">{{attacher.name}}</span></span></span>
              </td>
              <td class="bz_attach_flags" valign="top">
                <i>no flags TODO: render</i>
              </td>
              <td valign="top">
                <a href="{{bzWeb}}attachment.cgi?id={{id}}&amp;action=edit">Details</a> | <a href="{{bzWeb}}attachment.cgi?id={{id}}&amp;action=diff">Diff</a> | <a href="{{bzWeb}}page.cgi?id=splinter.html&amp;bug={{id}}&amp;attachment={{id}}">Splinter Review</a>
              </td>
            </tr>
            {{/attachments}}
            <tr class="bz_attach_footer">
              <td colspan="3">
                <span class="bz_attach_view_hide"><a href="#a0" onclick="return toggle_display(this);">Show Obsolete</a> (9) <a href="{{bzWeb}}attachment.cgi?bugid={{id}}&amp;action=viewall">View All</a></span> <a href="{{bzWeb}}attachment.cgi?bugid={{id}}&amp;action=enter">Add an attachment</a> (proposed patch, testcase, etc.)
              </td>
            </tr>
          </tbody>
        </table><br>
        <div id="comment_top_hat">
          <script type="text/javascript">
function summonCommentBox() {
          var commentbox = document.getElementById('add_comment');
          document.getElementById('comment_top_hat').appendChild(commentbox);
          document.getElementById('wave_wand').style.display = 'none';
          }
          </script>
          <p id="wave_wand">
            <a href="javascript:summonCommentBox()"><i>Summon comment box</i></a>
          </p>
        </div>
      </td>
      <td></td>
    </tr>
  </tbody>
</table>

<div class="bz_comments bzJS-commentoverflow">
{{#comments}}
    <div id="c{{$.index}}" class="bz_comment{{#$.first}} bz_first_comment{{/$.first}}">
        <div class="bz_comment_head">
            <span class="bz_comment_actions">
                [<a class="bz_reply_link" href="#add_comment" 
                    onclick="console.log('not implemented yet'); return false;">reply</a>]
            </span>
            <span class="bz_comment_number">
                <a href="{{bzWeb}}show_bug.cgi?id={{bugId}}#c{{$.index}}">Comment {{$.index}} </a>
            </span>
            <span class="bz_comment_user">
                <span class="vcard"><span class="fn">{{creator.real_name}} </span>
            </span>
            <span title="{{creation_time}}" data-timestamp="{{creation_time}}" class="bz_comment_time"> 
                {{creation_time}} </span> //TODO: render pretty time like BugzillaJS does
        </div>
        <pre class="bz_comment_text" id="comment_text_{{$.index}}">{{text}} </pre>
    </div>
{{/comments}}
</div>
</div>