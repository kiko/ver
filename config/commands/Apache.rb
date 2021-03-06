# Encoding: UTF-8

[{beforeRunningCommand: "nop",
  command: "apachectl configtest",
  input: "none",
  keyEquivalent: "@r",
  name: "Config Test",
  output: "showAsTooltip",
  scope: "source.apache-config",
  uuid: "46DBB57A-D7F8-4049-9BE8-4ACABFF5F056"},
 {beforeRunningCommand: "nop",
  command: "apache_doc.rb",
  fallbackInput: "word",
  input: "selection",
  keyEquivalent: "^h",
  name: "Documentation for Word / Selection",
  output: "showAsHTML",
  scope: "source.apache-config",
  uuid: "A7A95E10-D9F9-4519-9538-2C95C8CB0298"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby -rjcode -Ku\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/lib/apache_ctl.rb\"\n\nApacheCTL.new.graceful",
  input: "none",
  keyEquivalent: "@r",
  name: "Graceful Restart",
  output: "discard",
  scope: "source.apache-config",
  uuid: "A33BD582-D5BB-4C5B-A14C-5E47A90B01E3"},
 {beforeRunningCommand: "nop",
  command: 
   ". \"$TM_SUPPORT_PATH/lib/webpreview.sh\"\nhtml_header \"Apache HTTP Server Bundle Help\" \"Apache\"\n\n\"$TM_SUPPORT_PATH/lib/markdown_to_help.rb\" <<'EOF'\n# Installation\n\nThe Apache HTTP Server is installed by default on OS X and can be enabled here \"Sytem Preferences &#x2192; Sharing &#x2192; Web Sharing\". \n\nIf you would like to install it manually then the most recent version of Apache can be downloaded [here](http://httpd.apache.org/download.cgi).\n\n# Configuration Options\n\nThese environment variables allow you to define or customise the behavior of certain commands. For help on setting them please see [TextMate help](?environment_variables).\n\n*  `$TM_APACHE_DIRECTORY`  \n\nIf you have installed your own version of Apache you can set this variable to allow TextMate to use it rather than the default.\nFor example if you installed it via MacPorts then set it to `/opt/local/apache2`.\n\n*  `TM_APACHE_ACCESS_LOG`  \n\nThe path to the access log to open when running the _Tail Access Log_ command. This is optional and will use apache's default when not defined.  \n\n*  `TM_APACHE_ERROR_LOG`  \n\nThe path to the error log to open when running the _Tail Error Log_ command. This is optional and will use apache's default when not defined.  \n\n\n* `TM_APACHE_MANUAL_URI`\n\nCurrently for Leopard users only. If you have installed your own version of Apache HTTP Server, you can set this variable to the location of its manual. It is recommended that this is accessible via the server itself, using a http prefix ie `http://localhost/manual`. If you use a file path ie `/Library/WebServer/share/httpd/manual` the documenation command will open the inital documentation page but any hyperlinks within will fail. If the manual directory is not located the _Documentation for Word/Selection_ command will fall back to the [httpd.apache.org](http://httpd.apache.org/docs/2.2) website using the documentation for Apache 2.2.  \n\nEOF\n\nhtml_footer",
  input: "none",
  name: "Help",
  output: "showAsHTML",
  scope: "source.apache-config",
  uuid: "5B7DE766-BAA9-44B1-B9AD-6BE331E29A03"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby -wKU\n\nSUPPORT = ENV['TM_SUPPORT_PATH']\n\nrequire SUPPORT + '/lib/escape'\nrequire SUPPORT + '/lib/exit_codes'\nrequire SUPPORT + '/lib/osx/plist'\n\ndef find_apache\n    return [ ENV['TM_APACHE_DIRECTORY'].to_s, \n             \"/etc/apache2\", \n             \"/private/etc/httpd\" ].find { |path| File.directory? path }\nend\n\n#Search the path for any filename ending with .conf\ndef search_for_conf path\n    confs = []    \n    search_path = find_apache.to_s + path    \n    Dir.open( search_path ).each do |file|    \n        if file.to_s =~ /\\.conf$/\n            menu_item = { 'title' => File.basename(file), 'path' => search_path + \"/\" + file.to_s }\n            confs.push(menu_item)\n        end\n    end if File.exists?( search_path )\n    confs.push( { 'title' => \"-\" } ) if !confs.empty?\n    return confs\nend\n\nconf_files = search_for_conf( \"\" ) +\n             search_for_conf( \"/users\" ) +\n             search_for_conf( \"/extra\" ) + \n             search_for_conf( \"/other\" )\n\nconf_files.pop()\n\nTextMate.exit_show_tool_tip( \"No .conf files found \") if conf_files.empty?\n\nplist = { 'menuItems' => conf_files }.to_plist\nres = OSX::PropertyList::load(`\"$DIALOG\" -up \#{e_sh plist}`)\n\nTextMate.exit_discard() unless res.has_key? 'selectedMenuItem'\n\n`open -a TextMate \#{res['selectedMenuItem']['path']}`\n",
  input: "none",
  keyEquivalent: "@C",
  name: "Open Config…",
  output: "discard",
  scope: "source.apache-config",
  uuid: "0BB34044-0A2C-4D11-A2DE-30107D622ECF"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n\nrequire ENV['TM_SUPPORT_PATH'] + '/lib/exit_codes'\nrequire ENV['TM_BUNDLE_SUPPORT'] + '/lib/apache_mate'\n\ninclude = STDIN.read.strip\n\nTextMate.exit_show_tool_tip( \"Include line not recognised.\" ) if include.empty?\n\ninclude_path = include.sub( \"Include \", \"\" ).sub( \"*.conf\", \"\" )\n\nunless include_path =~ /^\\//\n\tinclude_path = find_server_root + \"/\" + include_path\nend\n\t\nif File.exist?(include_path)\n   `open -a TextMate \"\#{include_path}\"`\nelse\n    TextMate.exit_show_tool_tip( \"Include file could not be located.\" )\nend\n",
  fallbackInput: "line",
  input: "selection",
  keyEquivalent: "@D",
  name: "Open Include",
  output: "discard",
  scope: "source.include.apache-config",
  uuid: "19821FE1-709A-4B9D-B51C-68DBF8C2A93F"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby -rjcode -Ku\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/lib/apache_ctl.rb\"\n\nApacheCTL.new.restart",
  input: "none",
  keyEquivalent: "@r",
  name: "Restart",
  output: "discard",
  scope: "source.apache-config",
  uuid: "33CB105E-A303-49CC-8F69-9F832D6CD8F4"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby -rjcode -Ku\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/lib/apache_ctl.rb\"\n\nApacheCTL.new.start",
  input: "none",
  keyEquivalent: "@r",
  name: "Start",
  output: "discard",
  scope: "source.apache-config",
  uuid: "CB5FA82C-1287-4312-9407-E695AF16D966"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby -rjcode -Ku\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/lib/apache_ctl.rb\"\n\nApacheCTL.new.stop",
  input: "none",
  keyEquivalent: "@r",
  name: "Stop",
  output: "discard",
  scope: "source.apache-config",
  uuid: "F86D90AC-AF81-48A7-9E04-BA4AA95668B1"},
 {beforeRunningCommand: "nop",
  command: 
   "TIGER_ACCESS_LOG=\"/var/log/httpd/access_log\"\nLEOPARD_ACCESS_LOG=\"/var/log/apache2/access_log\"\n\nif [[ \"$TM_APACHE_ACCESS_LOG\" == \"\" ]]; then\n\n\tif [[ -f \"$LEOPARD_ACCESS_LOG\" ]]; then\n\n\t\tTM_APACHE_ACCESS_LOG=\"$LEOPARD_ACCESS_LOG\"\n\n\telse\n\n\t\tTM_APACHE_ACCESS_LOG=\"$TIGER_ACCESS_LOG\"\n\n\tfi\nfi\n\nif [[ -f \"$TM_APACHE_ACCESS_LOG\" ]]; then\n\n\t#tailLog \"$TM_APACHE_ACCESS_LOG\" \"httpd Access Log\"\n\tosascript \"$TM_BUNDLE_SUPPORT/lib/tail_log.applescript\" \"$TM_APACHE_ACCESS_LOG\" \"httpd Access Log\" >/dev/null;\n\nelse\n\n\texit_show_tool_tip \"http Access Log not located.\"\n\nfi",
  input: "none",
  name: "Tail Access Log",
  output: "discard",
  scope: "source.apache-config",
  uuid: "A7AB0414-104A-4128-B16E-72094A1DD5EB"},
 {beforeRunningCommand: "nop",
  command: 
   "TIGER_ERROR_LOG=\"/var/log/httpd/error_log\"\nLEOPARD_ERROR_LOG=\"/var/log/apache2/error_log\"\n\nif [[ \"$TM_APACHE_ERROR_LOG\" == \"\" ]]; then\n\n\tif [[ -f \"$LEOPARD_ERROR_LOG\" ]]; then\n\n\t\tTM_APACHE_ERROR_LOG=\"$LEOPARD_ERROR_LOG\"\n\n\telse\n\n\t\tTM_APACHE_ERROR_LOG=\"$TIGER_ERROR_LOG\"\n\n\tfi\nfi\n\nif [[ -f \"$TM_APACHE_ERROR_LOG\" ]]; then\n\n\t#tailLog \"$TM_APACHE_ERROR_LOG\" \"httpd Error Log\"\n\tosascript \"$TM_BUNDLE_SUPPORT/lib/tail_log.applescript\" \"$TM_APACHE_ERROR_LOG\" \"httpd Error Log\" >/dev/null;\n\nelse\n\n\texit_show_tool_tip \"http Access Log not located.\"\n\nfi\n",
  input: "none",
  name: "Tail Error Log",
  output: "discard",
  scope: "source.apache-config",
  uuid: "9460A02A-EC2A-4A03-9F99-21201D7B7988"}]
