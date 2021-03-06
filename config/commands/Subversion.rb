# Encoding: UTF-8

[{beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\n\"${TM_RUBY:-ruby}\" -r \"$TM_SUPPORT_PATH/lib/shelltokenize.rb\" <<END\n\tsvn = ENV['TM_SVN'] || \"svn\"\n\tputs %x{\#{svn} add \#{TextMate.selected_paths_for_shell}}\nEND",
  input: "none",
  keyEquivalent: "^A",
  name: "Add to Repository",
  output: "showAsTooltip",
  uuid: "CB149C8E-74CD-11D9-813D-000A95A89C98"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\nexport LANG='EN'\n\"$TM_SVN\" blame -v \"$TM_FILEPATH\" 2>&1 \\\n|\"${TM_RUBY:-ruby}\" -- \"${TM_BUNDLE_SUPPORT}/format_blame.rb\"",
  dontFollowNewOutput: true,
  input: "none",
  keyEquivalent: "^A",
  name: "Blame",
  output: "showAsHTML",
  uuid: "37113D20-778A-11D9-B053-0011242E4184"},
 {beforeRunningCommand: "saveModifiedFiles",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\nrequire_cmd \"${TM_RUBY:=ruby}\" \"We need Ruby to proceed.\"\n\nexport TM_RUBY\nexport TM_SVN\nexport CommitWindow=\"$TM_SUPPORT_PATH/bin/CommitWindow.app/Contents/MacOS/CommitWindow\"\n\ncd \"${TM_PROJECT_DIRECTORY:-$TM_DIRECTORY}\"\n\"${TM_RUBY:-ruby}\" -- \"${TM_BUNDLE_SUPPORT}/svn_commit.rb\" &> /dev/console &\n",
  input: "none",
  keyEquivalent: "^A",
  name: "Commit…",
  output: "discard",
  uuid: "5F2BCB27-7A5B-11D9-A61B-000A95A89C98"},
 {beforeRunningCommand: "nop",
  command: 
   "if [[ -n \"$TM_SELECTED_FILE\" && -d \"$TM_SELECTED_FILE\" ]]\n   then cd \"$TM_SELECTED_FILE\"\n   else cd \"${TM_PROJECT_DIRECTORY:-$TM_DIRECTORY}\"\nfi\n\n\"${TM_SVN:-svn}\" diff --diff-cmd diff",
  input: "none",
  name: "Diff Selected Files With Working Copy (BASE)",
  output: "openAsNewDocument",
  uuid: "18D4CF4B-2363-412E-B396-6E33868B2EE4"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\n\"${TM_RUBY:-ruby}\" <<'END'\n#!/usr/bin/env ruby -w\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/svn_diff\"\n\nSubversion::diff_active_file('BASE', \"Diff With Working Copy\")\nEND",
  input: "none",
  keyEquivalent: "^A",
  name: "Diff With Working Copy (BASE)",
  output: "openAsNewDocument",
  uuid: "11D4D7C2-7665-11D9-B58C-000A95A89C98"},
 {beforeRunningCommand: "nop",
  command: 
   ". \"$TM_SUPPORT_PATH/lib/webpreview.sh\"\nhtml_header \"Subversion Help\" \"Subversion\"\n\n\"$TM_SUPPORT_PATH/lib/markdown_to_help.rb\" <<'EOF'\n\nThis document describes the commands of the TextMate Subversion bundle and how you can fine-tune their behavior. For general Subversion help and tutorial, you should read the [Subversion book](http://svnbook.red-bean.com/ \"Version Control with Subversion\").\n\n# Command Reference\n\n## Adding, Removing, Updating, Committing\n\nThese commmands operate on the selected files/folders in the project, or the active file if it doesn't belong to a project.\n\n*\t__Add to Repository__\n\n\tSchedules the targets for addition to the repository.\n\n*\t__Remove From Repository&hellip;__\n\n\tSchedules the targets for removal from the repository.\n\n*\t__Revert__\n\n\tReverts the file to the base revision. Any modifications to the file will be lost.\n\n*\t__Update to Newest__\n\n\tUpdates the targets with the newest changes from the repository.\n\n*\t__Commit__\n\n\tCommits your changed files to the repository. A dialog asks you for the description of\n\tyour changes; you may also choose to exclude files from the commit by unchecking them.\n\tIf no files are selected or active, this command does nothing. If the target files\n\thave no local changes, nothing happens.\n\n## Information, Logs, Status\n\n*\t__Blame__\n\n\tDisplays a line-by-line history of the active file, showing you who wrote which line in what revision.\t Click a line to jump to it in an editor window.  Hover over a revision number or author name to see when the corresponding line was last changed. The date format is [adjustable](#tm_svn_date_format). Requires access to the repository.\n\n*\t__Info__\n\n\tDisplays detailed information about the selected files, including the type of file, who last changed the file, the date file was last changed, the repository URL to the file, and other information. Does not require access to the repository.\n\n\tSome parameters are configurable via shell variables; see the [Configuration Options](#tm_svn_info) section below.\n\n*\t__Log__\n\t\n\tDisplays the commit message history for the selected files.\n\tSome parameters are configurable via shell variables; see the [Configuration Options](#tm_svn_log) section below.\n\t\n*\t__View Revision&hellip;__\n\n\tDisplays a different revision of the active file. This command presents you with a list of revisions to choose from.\n\n*\t__Status__\n\n\tDisplays the modification status for each of the selected files/folders, or for the active file's directory if there is no project.\n\tDoes not access the repository.\n\n## Comparing Revisions\n\nThese commands operate on the active file.\n\n*\t__Diff Revisions&hellip;__\n\t\n\tDisplays the differences between two specific revisions of the active file. You will be presented with a list of revisions; please select two.\n\t\n*\t__Diff With Newest (HEAD)__\n\t\n\tDisplays the differences between the active file and the newest available revision of the file on the server.\n\tEquivalent to `svn diff -rHEAD`.\n\t\n*\t__Diff With Working Copy (BASE)__\n\t\n\tDisplays the differences between the active file and an unaltered, pristine copy of the file at the same revision.\n\tEquivalent to `svn diff -rBASE`.\n\t\n*\t__Diff With Previous Revision (PREV)__\n\t\n\tDisplays the differences between the active file and the previous revision of the file.\n\tEquivalent to `svn diff -rPREV`.\n\t\n*\t__Diff With Revision&hellip;__\n\t\n\tDisplays the differences between the active file and a different revision of the same file. This command presents you with a list of revisions to choose from.\n\t\n## Merging Revisions\n\n*\t__Show Available Revisions for Merging__\n\n\tDisplay revisions that can be merged into a selected folder in a project. This command requires the [`svnmerge.py`](http://www.orcaware.com/svn/wiki/Svnmerge.py \"svnmerge.py is a tool for automatic branch management\") script to be installed and for merge tracking to have been previously initiated.\n\n*\t__Resolve Conflicts With FileMerge&hellip;__\n\n\tOpens the active file in FileMerge. This command sets up FileMerge to facilitate conflict resolution.\n\n*\t__Resolved__\n\n\tRemoves conflict-related artifact files for the selected file, allowing the file to be committed after you have fixed the conflicts. Does not remove conflict markers or resolve conflicts itself.\n\n## Check Out\n\n*\t__Check Out&hellip;__\n\t\n\tCheck out a local working copy of a repository directory. Asks for a path to the repository directory to check out.\n\n# Configuration Options\n\nThese shell variables allow you to tweak the behavior of the certain commands if need be. The default values should make sense for normal use. Learn [how to set these variables](?static_variables).\n\n## Tools\n\n*\t`$TM_SVN` (default: `svn`)\n\t\n\tthe path to your svn executable. Must be reachable either as an absolute path or as a relative path from the shell PATH environment variable.\n\t\n*\t`$TM_SVNMERGE` (default: `svnmerge`)\n\t\n\tthe path to your svnmerge.py script.\n\t\n*\t`$TM_RUBY` (default: `ruby`)\n\t\n\tHere you can tweak with what Ruby the formatting scripts will be executed.\n\t\n*\t`$TM_SVN_DIFF_CMD` (default: not set)\n\t\n\tAllows you to set a command that should be used to present file differences. If you want use Apple’s FileMerge application, use [`fmdiff`](http://ssel.vub.ac.be/ssel/internal:fmdiff).\n\n## Date Format\n\n*\t<a name=\"tm_svn_date_format\">`$TM_SVN_DATE_FORMAT`</a> (default: not set&mdash;no changes, just show what SVN shows)\n\t\n\tA date format string that allows you to tweak the format in which Blame, Log and Info show you dates.\t \n\tSee [strftime(3)](http://developer.apple.com/documentation/Darwin/Reference/ManPages/man3/strftime.3.html \"man page for strftime(3)\") for what you can enter here.\n\n## Blame, Info, and Log Options\n\n*\t`$TM_SVN_CLOSE` (default: false)\n\t\n\tAdjust whether the windows of Blame and Info close when you click on a link which opens a file in TM.  Set it to `1` or `true` if windows should close or to something else if they should not.\n\t\n*\t<a name=\"tm_svn_log\">`$TM_SVN_LOG_RANGE`</a> (default: `BASE:1`)\n\t\n\tThe default range to query for log messages.\n\t\n*\t`$TM_SVN_LOG_LIMIT` (default: 15)\n\t\n\tThe number of messages to show.\t 0 means no limit.\n\n*\t<a name=\"tm_svn_info\">`$TM_SVN_INFO_HIDE`</a> (default: nothing)\n\n\tHere you can adjust what keys of the info stream you don't want to see, it is case insensitive and a comma (,) separated list.\n\tIf you enter a `*`, it is assumed that you want to hide all vars, if so, you can make some values visible again with `$TM_SVN_INFO_SHOW`.\n\n*\t`$TM_SVN_INFO_SHOW` (default: everything else)\n\n\tThis is also a comma separated list of keys, it just makes sense if you did hide all with the above var.\n\t`*` has no special meaning here. Everything you enter here will be shown if you want to hide everything else.\n\n*\t`$TM_SVN_IGNORE_BAD_LINES` (default: not set)\n\n\tBy setting this variable, Log will not print unexpected text that may appear at the beginning of Subversion's output. This could be useful if you frequently see this output but you deem it safe to ignore.\n\nEOF\n",
  dontFollowNewOutput: true,
  input: "none",
  keyEquivalent: "^A",
  name: "Help",
  output: "showAsHTML",
  uuid: "0CE6FB29-8467-11D9-ABBA-0011242E4184"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\n: ${TM_RUBY:=ruby}\nFORMAT_INFO=\"${TM_BUNDLE_SUPPORT}/format_info.rb\"\n\nif [[ -z $TM_SELECTED_FILES ]]; then\n   \"$TM_SVN\" info \"$TM_FILEPATH\" 2>&1 \\\n   |\"$TM_RUBY\" -- \"$FORMAT_INFO\"\nelse\n   eval \"$TM_SVN\" info \"$TM_SELECTED_FILES\" 2>&1 \\\n   |\"$TM_RUBY\" -- \"$FORMAT_INFO\"\nfi",
  dontFollowNewOutput: true,
  input: "none",
  keyEquivalent: "^A",
  name: "Info",
  output: "showAsHTML",
  uuid: "56BE2092-806D-11D9-A0FB-0011242E4184"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\n: ${TM_RUBY:=ruby}\n: ${TM_SVN_LOG_RANGE:=HEAD:1}\n: ${TM_SVN_LOG_LIMIT:=15}\nFORMAT_LOG=\"${TM_BUNDLE_SUPPORT}/format_log_xml.rb\"\n\nif [[ $TM_SVN_LOG_LIMIT -eq 0 ]]; then\n\tLIMIT=\"\"\nelse\n\tLIMIT=\"--limit $TM_SVN_LOG_LIMIT\"\nfi\n\nif [[ -z $TM_SELECTED_FILES ]]; then\n   \"$TM_SVN\" log --xml $LIMIT -vr \"$TM_SVN_LOG_RANGE\" \\\n   \"$TM_FILEPATH\" 2>&1 | \"$TM_RUBY\" -- \"$FORMAT_LOG\"\nelse\n   eval \"$TM_SVN\" log --xml $LIMIT -vr \"$TM_SVN_LOG_RANGE\" \\\n   \"$TM_SELECTED_FILES\" 2>&1 | \"$TM_RUBY\" -- \"$FORMAT_LOG\"\nfi",
  dontFollowNewOutput: true,
  input: "none",
  keyEquivalent: "^A",
  name: "Log",
  output: "showAsHTML",
  uuid: "55048B05-38AA-4B6C-A83C-7F6190F53B6C"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\nif [[ -z \"$TM_SELECTED_FILES\" && -z $TM_FILEPATH ]]; then\n   exit_show_tool_tip \"No files selected.\"\nfi\n\nfile_list () {\n   if [[ -n \"$TM_SELECTED_FILES\" ]]; then\n      eval arr=(\"$TM_SELECTED_FILES\")\n      for (( i = 0; i < ${#arr[@]}; i++ )); do\n         FILE=\"${arr[$i]}\"\n         echo \"${FILE#\#$TM_PROJECT_DIRECTORY/}\"\n      done\n   else\n      echo \"$TM_FILENAME\"\n   fi\n}\n\nrv=$(CocoaDialog textbox --float --title \"Remove from Repository\" \\\n   --string-output --no-newline --informative-text \\\n   \"These files will be scheduled for deletion during the next commit.\" \\\n   --text \"$(file_list|sort -f)\" --button1 \"Delete\" --button2 \"Cancel\")\n\nif [[ \"$rv\" == \"Delete\" ]]; then\n   if [[ -n \"$TM_SELECTED_FILES\" ]];\n      then eval \"$TM_SVN\" rm \"$TM_SELECTED_FILES\"\n      else      \"$TM_SVN\" rm \"$TM_FILEPATH\"\n   fi\nfi\n",
  input: "none",
  keyEquivalent: "^A",
  name: "Remove From Repository…",
  output: "showAsTooltip",
  uuid: "40EF180F-B8AE-40F7-8237-40A53314B57C"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/bin/bash\n#\n# Wrapper script to use FileMerge to resolve Subversion conflicts\n# [modified slightly from http://ssel.vub.ac.be/svn-gen/bdefrain/fmscripts/fmresolve]\n#\n\nconflictfile=\"$TM_FILEPATH\"\nFM=\"/Developer/Applications/Utilities/FileMerge.app/Contents/MacOS/FileMerge\"\n\nrequire_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\nrequire_cmd \"$FM\" \"You must install the Apple developer tools to run FileMerge\"\n\nfunction lookup {\n\tlocal info=$1\n\tlocal wantedkey=$2\n\tlocal key\n\tlocal value\n\t# Split lines in info through word splitting\n\tlocal IFS=$'\\n'\n\tfor line in $info; do\n\t\tkey=${line%%: *}\n\t\tvalue=${line#*: }\n\t\tif [ $key == $wantedkey ]; then\n\t\t\tRETVAL=$value\n\t\t\treturn 0\n\t\tfi\n\tdone\n\treturn 1\n}\n\nfiledir=`dirname \"$conflictfile\"`\ninfo=`\"$TM_SVN\" info \"$conflictfile\"`\nlookup \"$info\" \"Conflict Current Base File\" && leftfile=$RETVAL\nlookup \"$info\" \"Conflict Previous Working File\" && rightfile=$RETVAL\nlookup \"$info\" \"Conflict Previous Base File\" && ancestorfile=$RETVAL\nmergefile=`basename \"$conflictfile\"`\n\nif [ -z \"$leftfile\" ] || [ -z \"$rightfile\" ] || [ -z \"$ancestorfile\" ]; then\n\techo \"Can't obtain conflict info for $conflictfile\" 1>&2\n\texit 2\nfi\n\n#echo Starting FileMerge... 1>&2\n\"$FM\" -left \"${filedir}/${leftfile}\" -right \"${filedir}/${rightfile}\" -ancestor \"${filedir}/${ancestorfile}\" -merge \"${filedir}/${mergefile}\" &>/dev/null &\n\n",
  input: "none",
  keyEquivalent: "^A",
  name: "Resolve Conflicts With FileMerge…",
  output: "showAsTooltip",
  uuid: "E8EE6110-2DBA-4FC1-807B-9B19B5DE6737"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\n\"$TM_SVN\" resolved \"$TM_FILEPATH\"\n\n# force TM to refresh the project to get rid of the conflict files..\nrescan_project\n",
  input: "none",
  keyEquivalent: "^A",
  name: "Resolved",
  output: "showAsTooltip",
  uuid: "8C299FDF-E050-4AFE-A306-491DC4C4A11A"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\neval '\"$TM_BUNDLE_SUPPORT/revert_file.rb\"' \"${TM_SELECTED_FILES:-'$TM_FILEPATH'}\"\n",
  input: "none",
  keyEquivalent: "^A",
  name: "Revert",
  output: "showAsTooltip",
  uuid: "B9F3EC5C-B299-11D9-9356-0011242E4184"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\nrequire_cmd \"${TM_RUBY:=ruby}\" \"We need Ruby to proceed.\"\n\nexport TM_RUBY\nexport TM_SVN\nexport CommitWindow=\"$TM_SUPPORT_PATH/bin/CommitWindow.app/Contents/MacOS/CommitWindow\"\n\n{ if [[ -z $TM_SELECTED_FILES ]]\n\tthen\n\texport WorkPath=\"${TM_PROJECT_DIRECTORY:-$TM_DIRECTORY}\"\n\texport TM_SELECTED_FILES=\"'\"${WorkPath//\\'/\\'\\\\\\'\\'}\"'\"\n\t\"$TM_SVN\" status \"$WorkPath\" 2>&1| \"${TM_RUBY:-ruby}\" -KU -- \"${TM_BUNDLE_SUPPORT}/format_status.rb\" \"--status\"\n\telse\n\teval \"$TM_SVN\" status \"$TM_SELECTED_FILES\" 2>&1 |\"${TM_RUBY:-ruby}\" -KU -- \"${TM_BUNDLE_SUPPORT}/format_status.rb\" \"--status\"\nfi; }\n",
  dontFollowNewOutput: true,
  input: "none",
  keyEquivalent: "^A",
  name: "Status",
  output: "showAsHTML",
  uuid: "01F140D9-749F-11D9-8199-000A95A89C98"},
 {beforeRunningCommand: "saveModifiedFiles",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\nif [[ -n \"$TM_SELECTED_FILE\" && -d \"$TM_SELECTED_FILE\" ]]\n   then WorkPath=\"$TM_SELECTED_FILE\"\n   else WorkPath=\"${TM_PROJECT_DIRECTORY:-$TM_DIRECTORY}\"\nfi\n\nexport TM_SVN\nexport WorkPath\n\n\"$TM_SVN\" update \"$WorkPath\" 2>&1 \\\n|\"${TM_RUBY:-ruby}\" -- \"${TM_BUNDLE_SUPPORT}/format_status.rb\"\n\n# force TM to refresh the current file..\nrescan_project\n",
  input: "none",
  name: "Update Selected Files to Newest (HEAD)",
  output: "showAsHTML",
  uuid: "A1DEEFE4-7E3A-11D9-81A1-000A95A89C98"},
 {beforeRunningCommand: "saveModifiedFiles",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\n\"${TM_RUBY:-ruby}\" -r \"$TM_SUPPORT_PATH/lib/shelltokenize.rb\" <<END\n\tsvn = ENV['TM_SVN'] || \"svn\"\n\truby = ENV['TM_RUBY'] || \"ruby\"\n\tsupport = ENV['TM_BUNDLE_SUPPORT']\n\tpaths = TextMate.selected_paths_array\n\t\n\t# TODO: Ideally, we'd like to use a tooltip for one and not others, but we can't switch from a tooltip\n\t# to dynamic HTML output (or maybe we could double-fork a process?)\n\t# if ((paths.size == 1) and not (File.directory? paths[0]))\n\t#\tputs %x{\#{svn} update \#{TextMate.selected_paths_for_shell}}\n\t# else\n\t\tupdate = IO.popen(\"'\#{svn}' update \#{TextMate.selected_paths_for_shell}\", 'r')\n\t\tformat = IO.popen(\"'\#{ruby}' -- '\#{support}/format_status.rb'\", 'w')\n\t\tupdate.each_line { |line| format.puts(line) }\n\t# end\t\nEND\n\n# force TM to refresh the current file..\nrescan_project\n",
  input: "none",
  keyEquivalent: "^A",
  name: "Update to Newest (HEAD)",
  output: "showAsHTML",
  uuid: "175D3D76-74CE-11D9-813D-000A95A89C98"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\nruby >& /tmp/tm_svn_debug <<END &\nbegin\n\trequire \"$TM_BUNDLE_SUPPORT/svn_revision_chooser\"\n\n\tSubversion::view_revision(\"$TM_FILEPATH\")\nrescue Exception => error\n\tTextMate::UI.alert(:warning, \"You’ve discovered a bug\", \"Please report the following text: \#{error}\\n\\n\#{error.backtrace.join(%Q{\\n})}\")\nend\nEND\n",
  input: "none",
  keyEquivalent: "^A",
  name: "View Revision…",
  output: "discard",
  uuid: "05DF9B5B-AB88-4597-ACD3-DD1DCEDC0BE8"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\n# Setup Dialog asking for host\nurl=$(CocoaDialog inputbox --float \\\n    --title \"Subversion Checkout\" \\\n    --informative-text \"URL:\" \\\n    --text \"svn+ssh://\" \\\n    --button1 \"Checkout\" \\\n    --button2 \"Cancel\")\n\n# If user canceled exit.\n[[ \"${url:0:1}\" == \"2\" ]] && exit_discard\n\n# skip the return code so we are left with just the url\nurl=\"${url:2}\"\n\n# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #\n\n# Setup Dialog asking where to save\nlocation=$(CocoaDialog filesave --float \\\n    --text \"Checking out $url\" \\\n    --with-file \"$(basename \"$url\")\" )\n\n# If user canceled exit.\n[[ -z \"$location\" ]] && exit_discard\n\n# format the checkout output\nexport WorkPath=\"$location\" # format_status will show paths as relative to this value\n\"$TM_SVN\" checkout \"$url\" \"$location\" 2>&1 |\"${TM_RUBY:-ruby}\" -KU -- \"${TM_BUNDLE_SUPPORT}/format_status.rb\" --checkout\n\nopen -b com.macromates.textmate \"$location\"\n",
  input: "none",
  keyEquivalent: "^A",
  name: " Check Out…",
  output: "showAsHTML",
  uuid: "03E4CAA8-0F74-4394-8709-4EF0E22F908B"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\nruby >& /tmp/tm_svn_debug <<END &\nbegin\n\trequire 'tempfile'\n\trequire \"$TM_BUNDLE_SUPPORT/svn_revision_chooser\"\n\trequire \"$TM_BUNDLE_SUPPORT/svn_diff\"\n\n\tfile = ENV['TM_FILEPATH']\n\trevisions = Subversion::choose_revision(file, \"Diff two revs of \#{File.basename(file)}\", 2)\n\tunless revisions.nil?\n\t\tdiff_text = Subversion::diff_working_copy_with_revision(:paths => [file],\n\t\t\t\t\t\t\t\t:revision => \"\#{revisions[1]}:\#{revisions[0]}\",\n\t\t\t\t\t\t\t\t:command_name => \"Diff Revisions…\")\n\t\tTempfile.open(\"svndiff \#{File.basename(file)}\") do |tempfile|\n\t\t\ttempfile.write(diff_text)\n\t\t\ttempfile.flush\n\t\t\t%x{\"\#{ENV['TM_SUPPORT_PATH']}/bin/mate\" -w \#{e_sh(tempfile.path)}}\n\t\tend\n\tend\n\nrescue Exception => error\n\tTextMate::UI.alert(:warning, \"You’ve discovered a bug\", \"Please report the following text: \#{error}\\n\\n\#{error.backtrace.join(%Q{\\n})}\")\nend\nEND\n",
  input: "none",
  keyEquivalent: "^A",
  name: " Diff Revisions…",
  output: "discard",
  uuid: "C7802039-B3C4-11D9-8D63-000A95A89C98"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\n\"${TM_RUBY:-ruby}\" <<'END'\n#!/usr/bin/env ruby -w\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/svn_diff\"\n\nSubversion::diff_active_file('HEAD', \"Diff With Newest\")\nEND\n",
  input: "none",
  keyEquivalent: "^A",
  name: " Diff With Newest (HEAD)",
  output: "openAsNewDocument",
  uuid: "DF784C33-74D7-11D9-813D-000A95A89C98"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\n\"${TM_RUBY:-ruby}\" <<'END'\n#!/usr/bin/env ruby -w\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/svn_diff\"\n\nSubversion::diff_active_file('PREV', \"Diff With Previous\")\nEND",
  input: "none",
  keyEquivalent: "^A",
  name: " Diff With Previous Revision (PREV)",
  output: "openAsNewDocument",
  uuid: "37135380-74CE-11D9-813D-000A95A89C98"},
 {beforeRunningCommand: "nop",
  command: 
   "require_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\nruby >& /tmp/tm_svn_debug <<END &\nbegin\n\trequire 'tempfile'\n\trequire \"$TM_BUNDLE_SUPPORT/svn_revision_chooser\"\n\trequire \"$TM_BUNDLE_SUPPORT/svn_diff\"\n\n\tfile = ENV['TM_FILEPATH']\n\trevisions = Subversion::choose_revision(file, \"Diff \#{File.basename(file)} working copy?\")\n\t\n\tunless revisions.nil?\n\t\tdiff_text = Subversion::diff_working_copy_with_revision(:paths => [file], :revision => revisions[0], :command_name => \"Diff With Revision…\")\n\t\tTempfile.open(\"svndiff \#{File.basename(file)}\") do |tempfile|\n\t\t\ttempfile.write(diff_text)\n\t\t\ttempfile.flush\n\t\t\t%x{\"\#{ENV['TM_SUPPORT_PATH']}/bin/mate\" -w \#{e_sh(tempfile.path)}}\n\t\tend\n\tend\n\nrescue Exception => error\n\tTextMate::UI.alert(:warning, \"You’ve discovered a bug\", \"Please report the following text: \#{error}\\n\\n\#{error.backtrace.join(%Q{\\n})}\")\nend\nEND\n",
  input: "none",
  keyEquivalent: "^A",
  name: " Diff With Revision…",
  output: "discard",
  uuid: "32E15B26-B444-11D9-8D63-000A95A89C98"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/bin/bash\n#\nrequire_cmd \"${TM_SVN:=svn}\" \"If you have installed svn, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVN</tt> shell variable (e.g. in Preferences / Advanced)\"\n\nrequire_cmd \"${TM_SVNMERGE:=svnmerge}\" \"If you have installed svnmerge, then you need to either update your <tt>PATH</tt> or set the <tt>TM_SVNMERGE</tt> shell variable (e.g. in Preferences / Advanced)\"\n\nworkpath=\"$TM_SELECTED_FILE\"\nif [[ ! -d \"$workpath\" ]]; then\n\tpre <<< \"Please select a folder in the project drawer.\"\n\texit\nfi\n\nFORMAT_LOG=\"${TM_BUNDLE_SUPPORT}/format_log.rb\"\n\n# svnmerge calls stty if COLUMNS is not set. Apparently Python has no is_tty? equivalent.\nexport COLUMNS=80\n\ncd \"$workpath\"\n\n# check for no or multiple HEADs\nintegratedRevs=`svn propget svnmerge-integrated \"$workpath\"`\nif [[ -z \"$integratedRevs\" ]]; then\n\tpre <<< \"Merge tracking has not been initialized for '$workpath'\"\n\texit\nfi\n\ntheHead=`osascript <<END\n\t-- split heads (yes, svnmerge uses spaces to delimit; hopefully spaces in filenames get URI-style encoded, but I haven't checked)\n\tset AppleScript's text item delimiters to {\" \"}\n\tset theList to (every text item of \"$integratedRevs\")\n\n\t-- split head names from associated revision numbers\n\tset theHeads to {}\n\tset AppleScript's text item delimiters to {\":\"}\n\trepeat with i from 1 to the count of theList\n\t\tset theHeads to (theHeads & (text item 1 of (item i of theList)))\n\tend\n\n\tif the count of theHeads is greater than 1 then\n\t\ttell app \"TextMate\"\n\t\t\tchoose from list theHeads with prompt \"Please choose the HEAD directory for '$workpath':\"\n\t\tend tell\n\telse if the count of theHeads is 1 then\n\t\tset the result to item 1 of theHeads\n\telse\n\t\tset the result to false\n\tend if\nEND`\n\n# exit if user canceled\n[[ \"$theHead\" = \"false\" ]] && exit_discard\n\n\n\"$TM_SVNMERGE\" avail --log -S \"`basename $theHead`\" 2>&1 \\\n\t| \"${TM_RUBY:=ruby}\" -- \"$FORMAT_LOG\" '--title=Revisions Available for Merging'\n",
  input: "none",
  keyEquivalent: "^A",
  name: " Show Available Revisions for Merging",
  output: "showAsHTML",
  uuid: "BA4B9C28-6566-46E8-8482-9A52DCB5384D"}]
