# Encoding: UTF-8

[{beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/greasemonkey.rb\"\nGreasemonkey.new.continue_header_url",
  input: "document",
  keyEquivalent: "",
  name: "Continue Header URL",
  output: "afterSelectedText",
  scope: "source.js.greasemonkey meta.header meta.directive",
  uuid: "A38AD71E-0665-4E1E-8FEF-B2D22291BE0D"},
 {beforeRunningCommand: "nop",
  command: 
   "# Slightly modified version of the command for the JavaScript bundle by Thomas Aylott(?)\n\n# index created using: curl -s 'http://devguru.com/technologies/javascript/index.asp'|grep -o '<a href=\"[0-9]*.asp\">[a-z][a-zA-Z]*</a>'|perl -pe 's/<a href=\"([^\"]*)\">([^<]*)<\\/a>/$2\\t$1/'|sort|uniq|gzip >data/dev_guru_index.gz\n\n# First try GM docs\n\nref=$(ruby -e '\n\tGM_ENTRIES = %w{GM_addStyle GM_getValue GM_setValue GM_log GM_openInTab GM_registerMenuCommand GM_xmlhttpRequest unsafeWindow}\n\tlook_up = ENV[\"TM_SELECTED_TEXT\"] || ENV[\"TM_CURRENT_WORD\"]\n\tputs look_up if GM_ENTRIES.include?(look_up)\n')\n\n[[ -n \"$ref\" ]] && exit_show_html \"<meta http-equiv='Refresh' content='0;URL=http://wiki.greasespot.net/$ref'>\"\n\n# Then try JS docs\n\nref=$(zgrep -w \"^${TM_SELECTED_TEXT:-$TM_CURRENT_WORD}\" \"$TM_BUNDLE_SUPPORT/data/dev_guru_index.gz\"|cut -f2)\n\n[[ -n \"$ref\" ]] && exit_show_html \"<meta http-equiv='Refresh' content='0;URL=http://devguru.com/technologies/javascript/$ref'>\"\n\necho \"No documentation found for \\\"${TM_SELECTED_TEXT:-$TM_CURRENT_WORD}\\\".\"",
  fallbackInput: "word",
  input: "selection",
  keyEquivalent: "^h",
  name: "Documentation for Word / Selection",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "276FCB93-FB0E-49A9-A5E8-3714D4A0D0C6"},
 {beforeRunningCommand: "nop",
  command: "open \"http://userscripts.org/forums/1\"",
  input: "none",
  keyEquivalent: "^H",
  name: "Forum: US.O Script Development",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "2DB71989-6521-4590-8B27-67750D947891"},
 {beforeRunningCommand: "nop",
  command: 
   "exit_show_html \"<meta http-equiv='Refresh' content='0;URL=http://developer.mozilla.org/en/docs/DOM:element#Properties'>\"",
  input: "none",
  keyEquivalent: "^H",
  name: "Gecko DOM Element",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "E5F0DC32-D1AB-4CF0-8028-CC1972BEAECA"},
 {beforeRunningCommand: "nop",
  command: 
   "exit_show_html \"<meta http-equiv='Refresh' content='0;URL=http://wiki.greasespot.net/Main_Page'>\"",
  input: "none",
  keyEquivalent: "^H",
  name: "GreaseSpot Wiki",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "FA3989DC-F289-4E76-A441-57EA6A9C7141"},
 {beforeRunningCommand: "nop",
  command: 
   ". \"$TM_SUPPORT_PATH/lib/webpreview.sh\"\nhtml_header \"Greasemonkey Bundle Help\" \"Greasemonkey\"\n\"$TM_SUPPORT_PATH/lib/markdown_to_help.rb\" \"$TM_BUNDLE_SUPPORT/help.markdown\"\nhtml_footer",
  input: "none",
  name: "Help",
  output: "showAsHTML",
  scope: "source.js.greasemonkey",
  uuid: "70D8CA43-2F62-416C-90DF-D1F83EB358CE"},
 {beforeRunningCommand: "nop",
  command: "open \"irc://irc.freenode.net/javascript\"",
  input: "none",
  keyEquivalent: "^H",
  name: "IRC: #javascript@Freenode",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "320A9A37-5564-4AA3-AE09-99369B9D4CA1"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/greasemonkey.rb\"\nGreasemonkey.new.install_and_edit",
  input: "document",
  keyEquivalent: "@b",
  name: "Install and Edit",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "D5D90653-B908-45AF-9BD1-D2ACAC494256"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/greasemonkey.rb\"\nGreasemonkey.new.manage_gm_values",
  input: "document",
  name: "Manage GM_Values",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "5A9C9F8A-99E8-451D-BC0C-B5C2A8A9A45E"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/greasemonkey.rb\"\nGreasemonkey.new.open_installed_script",
  input: "none",
  keyEquivalent: "^~@g",
  name: "Open Installed Script…",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "17B22F8D-8631-4E3A-A1A2-CECD17F95320"},
 {beforeRunningCommand: "saveActiveFile",
  command: 
   "#!/usr/bin/env ruby\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/greasemonkey.rb\"\nGreasemonkey.new.reload_firefox",
  input: "none",
  keyEquivalent: "@r",
  name: "Reload Firefox",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "B5AD55C2-887E-4649-BCD0-C50273612E86"},
 {beforeRunningCommand: "saveActiveFile",
  command: 
   "#!/usr/bin/env ruby\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/greasemonkey.rb\"\nGreasemonkey.new.reload_firefox(5)  # Return in 5 secs",
  input: "none",
  keyEquivalent: "@R",
  name: "Reload Firefox and Return",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "39AD9681-039A-400F-BBBA-C5B4D57A0C3E"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/greasemonkey.rb\"\nGreasemonkey.new.remove_logs",
  input: "selection",
  name: "Remove Logs in Document / Selection",
  output: "replaceSelectedText",
  scope: "source.js.greasemonkey",
  uuid: "C5B821F3-DDB1-4911-8C89-32FD98033769"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/greasemonkey.rb\"\nGreasemonkey.new.toggle_log_comments",
  input: "selection",
  name: "Toggle Logs in Document / Selection",
  output: "replaceSelectedText",
  scope: "source.js.greasemonkey",
  uuid: "0674F266-C30F-4089-95A4-DDB68E89439E"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/greasemonkey.rb\"\nGreasemonkey.new.uninstall_script",
  input: "document",
  name: "Uninstall Script…",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "36925E11-3A1B-4040-9A6E-629ABD7200D9"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/greasemonkey.rb\"\nGreasemonkey.new.update_metadata",
  input: "document",
  keyEquivalent: "@d",
  name: "Update Metadata",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "881818AE-F2D4-4E5C-9245-5FF8B61B417D"},
 {beforeRunningCommand: "saveActiveFile",
  command: 
   "#!/usr/bin/env ruby\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/greasemonkey.rb\"\nGreasemonkey.new.upload_to_userscripts",
  input: "document",
  keyEquivalent: "@u",
  name: "Upload to Userscripts.org…",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "EA15C388-6EB3-4650-B958-EE43A4A7320B"},
 {beforeRunningCommand: "nop",
  command: 
   "exit_show_html \"<meta http-equiv='Refresh' content='0;URL=http://www.w3schools.com/xpath/'>\"",
  input: "none",
  keyEquivalent: "^H",
  name: "XPath",
  output: "showAsTooltip",
  scope: "source.js.greasemonkey",
  uuid: "40315F35-E51D-4C22-94E2-52FB206066BB"}]
