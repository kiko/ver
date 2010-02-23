# Encoding: UTF-8

[{beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n$: << ENV['TM_SUPPORT_PATH'] + '/lib'\nrequire 'escape'\ndef esc(str)\n  e_sn(str).gsub(/\\}/, '\\\\}') # escaping inside a placeholder\nend\n\ns = STDIN.read\nif s.empty? then\n  print \"**$1**\"\nelsif s =~ /^\\*{2}(.*)\\*{2}$/ then\n  print \"${1:\#{esc $1}}\"\nelsif ENV.has_key? 'TM_SELECTED_TEXT'\n  print \"${1:**\#{esc s}**}\"\nelse\n  print \"**\#{e_sn s}**\"\nend",
  fallbackInput: "word",
  input: "selection",
  keyEquivalent: "@b",
  name: "Bold",
  output: "insertAsSnippet",
  scope: "text.restructuredtext",
  uuid: "898151BC-D897-47DC-AF8A-9E2DB6A25AF6"},
 {beforeRunningCommand: "nop",
  command: 
   "TRST=${TM_RST2HTML:=rst2html.py}\n\nrequire_cmd \"$TRST\" \"You can either set the <tt>TM_RST2HTML</tt> variable to the full path of your docutils (docutils.sourceforge.net) installation (e.g. <tt>/Library/Frameworks/Python.framework/Versions/2.4/bin/rst2html.py</tt> or set the <tt>PATH</tt> variable to include the path of the docutils converters.\"\n\n# Send the current file through rst2html.py\n$TRST \"$TM_FILEPATH\"",
  input: "document",
  keyEquivalent: "^H",
  name: "Convert Document to HTML",
  output: "replaceDocument",
  scope: "text.restructuredtext",
  uuid: "43F50126-B6DE-4B92-84DC-8600C0772CDB"},
 {beforeRunningCommand: "nop",
  command: 
   "TRST=${TM_RST2HTML:=rst2html.py}\n\nrequire_cmd \"$TRST\" \"You can either set the <tt>TM_RST2HTML</tt> variable to the full path of your docutils (docutils.sourceforge.net) installation (e.g. <tt>/Library/Frameworks/Python.framework/Versions/2.4/bin/rst2html.py</tt> or set the <tt>PATH</tt> variable to include the path of the docutils converters.\"\n\n# Send the current file through rst2html.py\n$TRST \"$TM_FILEPATH\"",
  input: "selection",
  keyEquivalent: "@r",
  name: "Create HTML Document",
  output: "openAsNewDocument",
  scope: "text.restructuredtext",
  uuid: "F4B2F9D2-09E8-4A8D-876B-0163A9AF3653"},
 {beforeRunningCommand: "saveActiveFile",
  command: 
   "TRST=${TM_RST2LATEX:=rst2newlatex.py}\n\nrequire_cmd \"$TRST\" \"You can either set the <tt>TM_RST2LATEX</tt> variable to the full path of your docutils (docutils.sourceforge.net) installation (e.g. <tt>/Library/Frameworks/Python.framework/Versions/2.4/bin/rst2html.py</tt> or set the <tt>PATH</tt> variable to include the path of the docutils converters.\"\n\n$TRST \"$TM_FILEPATH\"",
  input: "selection",
  keyEquivalent: "@r",
  name: "Create LaTeX Document",
  output: "openAsNewDocument",
  scope: "text.restructuredtext",
  uuid: "87617D0E-E9E1-42EB-BBD6-CCB890C7DF8C"},
 {beforeRunningCommand: "nop",
  command: 
   "TRST=${TM_RST2S5:=rst2s5.py}\n\nrequire_cmd \"$TRST\" \"You can either set the <tt>TM_RST2S5</tt> variable to the full path of your docutils (docutils.sourceforge.net) installation (e.g. <tt>/Library/Frameworks/Python.framework/Versions/2.4/bin/rst2html.py</tt> or set the <tt>PATH</tt> variable to include the path of the docutils converters.\"\n\n$TRST \"$TM_FILEPATH\"",
  input: "selection",
  keyEquivalent: "@r",
  name: "Create S5 Document",
  output: "openAsNewDocument",
  scope: "text.restructuredtext",
  uuid: "E54E0D99-5558-4168-9DDA-963F066FBA58"},
 {beforeRunningCommand: "nop",
  command: 
   "TRST=${TM_RST2XML:=rst2xml.py}\n\nrequire_cmd \"$TRST\" \"You can either set the <tt>TM_RST2XML</tt> variable to the full path of your docutils (docutils.sourceforge.net) installation (e.g. <tt>/Library/Frameworks/Python.framework/Versions/2.4/bin/rst2html.py</tt> or set the <tt>PATH</tt> variable to include the path of the docutils converters.\"\n\n$TRST \"$TM_FILEPATH\"",
  input: "selection",
  keyEquivalent: "@r",
  name: "Create XML Document",
  output: "openAsNewDocument",
  scope: "text.restructuredtext",
  uuid: "756B8E3C-9928-4552-A15E-17320BBC2E91"},
 {beforeRunningCommand: "nop",
  command: 
   "TPY=${TM_PYTHON:-pythonw}\n\"$TPY\" \"$TM_BUNDLE_SUPPORT/extend_title.py\"",
  fallbackInput: "scope",
  input: "selection",
  keyEquivalent: "^T",
  name: "Extend Title",
  output: "insertAsSnippet",
  scope: "meta.paragraph.restructuredtext ",
  uuid: "D2EF8647-6586-464B-B759-6F2A8A50E542"},
 {beforeRunningCommand: "nop",
  command: 
   ". \"$TM_SUPPORT_PATH/lib/webpreview.sh\"\nhtml_header \"reStructeredText Bundle Help\" \"reStructeredText\"\nMarkdown.pl <<'EOF'\n\n## What is it\nDocutils is an open-source text processing system for processing plaintext documentation into useful formats, such as HTML or LaTeX. It includes reStructuredText, the easy to read, easy to use, what-you-see-is-what-you-get plaintext markup language.\n\n## Requirements\nTo install using Mac Ports:\n\n    sudo port install py-docutils\n\n## Syntax\nInformation about RST can be found [here](http://docutils.sourceforge.net/rst.html)\n\n## Using it\nThis bundle includes the standard text processing commands: Preview, Preview in Browser, Convert Document to HTML (in place), and Validate.\n\nEOF\nhtml_footer",
  input: "none",
  name: "Help",
  output: "showAsHTML",
  scope: "text.restructuredtext",
  uuid: "481BD550-B156-4FA0-B14C-265BF74EFBFE"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n$: << ENV['TM_SUPPORT_PATH'] + '/lib'\nrequire 'escape'\ndef esc(str)\n  e_sn(str).gsub(/\\}/, '\\\\}') # escaping inside a placeholder\nend\n\ns = STDIN.read\nif s.empty? then\n  print \"*$1*\"\nelsif s =~ /^(\\*+)(.*[^\\*])\\*+$/ then\n  m, s = $1, $2\n  case m.length\n    when 1 then print \"${1:\#{esc s}}\"\n    when 2 then print \"${1:***\#{esc s}***}\"\n    else print \"${1:**\#{esc s}**}\"\n  end\nelsif ENV.has_key? 'TM_SELECTED_TEXT'\n  print \"${1:*\#{esc s}*}\"\nelse\n  print \"*\#{e_sn s}*\"\nend",
  fallbackInput: "word",
  input: "selection",
  keyEquivalent: "@i",
  name: "Italic",
  output: "insertAsSnippet",
  scope: "text.restructuredtext",
  uuid: "B0266484-FC3B-412B-8469-F0A8E3092345"},
 {beforeRunningCommand: "saveActiveFile",
  command: 
   "TRST=${TM_RST2HTML:=rst2html.py}\nrequire_cmd \"$TRST\" \"You can either set the <tt>TM_RST2HTML</tt> variable to the full path of your docutils (docutils.sourceforge.net) installation (e.g. <tt>/Library/Frameworks/Python.framework/Versions/2.4/bin/rst2html.py</tt> or set the <tt>PATH</tt> variable to include the path of the docutils converters.\"\n\n\nif [[ -f \"$TM_DIRECTORY/default.css\" ]]\n\tthen stylesheet=\"$TM_DIRECTORY/default.css\"\nelif [[ -f \"$TM_PROJECT_DIRECTORY/default.css\" ]]\n\tthen stylesheet=\"$TM_PROJECT_DIRECTORY/default.css\"\nelse\n\tcss=`mktemp -t /tmp`\n\techo 'body {\t\n\t\tbackground-color: #eee;\n\t}\n\t.document {\n\t\tbackground: white;\n\t\tfont-family: Georgia, serif;\n\t\tfont-size: 13px;\n\t\tborder: 1px #888 solid;\n\t\tpadding: 0 1em;\n\t}' > $css\n\tstylesheet=$css\n\ttmpCreated=\"yes\"\nfi\n\nif [[ -n $stylesheet ]]\n\tthen flags=\"--embed-stylesheet --stylesheet=$stylesheet\"\n\telse flags=\"\"\nfi\n\n$TRST $flags \"$TM_FILEPATH\"\n\nif [[ -n $css ]]\n\tthen rm $css\nfi",
  input: "document",
  keyEquivalent: "^~@p",
  name: "Preview",
  output: "showAsHTML",
  scope: "text.restructuredtext",
  uuid: "7A099026-D785-48D9-ACAD-318ECF2A3BE4"},
 {beforeRunningCommand: "saveActiveFile",
  command: 
   "TRST=${TM_RST2HTML:=rst2html.py}\n\nrequire_cmd \"$TRST\" \"You can either set the <tt>TM_RST2HTML</tt> variable to the full path of your docutils (docutils.sourceforge.net) installation (e.g. <tt>/Library/Frameworks/Python.framework/Versions/2.4/bin/rst2html.py</tt> or set the <tt>PATH</tt> variable to include the path of the docutils converters.\"\n\n# Send the current file through rst2html.py\n\nif [[ -f \"$TM_DIRECTORY/default.css\" ]]\n\tthen stylesheet=\"$TM_DIRECTORY/default.css\"\nelif [[ -f \"$TM_PROJECT_DIRECTORY/default.css\" ]]\n\tthen stylesheet=\"$TM_PROJECT_DIRECTORY/default.css\"\nelse\n\tcss=`mktemp -t /tmp`\n\techo 'body {\t\n\t\tbackground-color: #eee;\n\t}\n\t.document {\n\t\tbackground: white;\n\t\tfont-family: Georgia, serif;\n\t\tfont-size: 13px;\n\t\tborder: 1px #888 solid;\n\t\tpadding: 0 1em;\n\t}' > $css\n\tstylesheet=$css\nfi\n\nif [[ -n $stylesheet ]]\n\tthen flags=\"--embed-stylesheet --stylesheet=$stylesheet\"\n\telse flags=\"\"\nfi\n\nout=`mktemp -t /tmp`\necho \"Running: $TRST $flags \\\"$TM_FILEPATH\\\" \\\"$out.html\\\"\"\n$TRST $flags \"$TM_FILEPATH\" \"$out.html\"\nopen \"$out.html\"\n\n#rm \"$out.html\"\nif [[ -n $css ]]\n\tthen rm $css\nfi\n\n\n",
  input: "document",
  keyEquivalent: "^@p",
  name: "Preview in Browser",
  output: "showAsTooltip",
  scope: "text.restructuredtext",
  uuid: "065700E0-FE74-43E9-867E-019FF0D1487B"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\n$: << ENV['TM_SUPPORT_PATH'] + '/lib'\nrequire 'escape'\ndef esc(str)\n  e_sn(str).gsub(/\\}/, '\\\\}') # escaping inside a placeholder\nend\n\ns = STDIN.read\nif s.empty? then\n  print \"\\\\`\\\\`$1\\\\`\\\\`\"\nelsif s =~ /^\\\\`(.*)\\\\`$/ then\n  print \"${1:\#{esc $1}}\"\nelsif ENV.has_key? 'TM_SELECTED_TEXT'\n  print \"${1:\\\\`\\\\`\#{esc s}\\\\`\\\\`}\"\nelse\n  print \"\\\\`\\\\`\#{e_sn s}\\\\`\\\\`\"\nend",
  fallbackInput: "word",
  input: "selection",
  keyEquivalent: "@k",
  name: "Typewriter",
  output: "insertAsSnippet",
  scope: "text.restructuredtext",
  uuid: "4C8AB52A-5C88-4786-9FCE-28777DBB02B5"},
 {beforeRunningCommand: "saveActiveFile",
  captureFormatString: "Line: $2 Error: \"$3\"",
  capturePattern: "^(.+):(\\d+): (.+)",
  command: 
   "TRST=${TM_RST2HTML:=rst2html.py}\n# TRST = \"/System/Library/Frameworks/Python.framework/Versions/2.3/bin/rst2html.py\"\n# Send the current file through rst2html.py\n\"$TRST\" \"$TM_FILEPATH\" 1>/dev/null|pre",
  fileCaptureRegister: "1",
  input: "none",
  keyEquivalent: "^V",
  lineCaptureRegister: "2",
  name: "Validate Syntax",
  output: "showAsHTML",
  scope: "text.restructuredtext",
  uuid: "10B4E8D0-91DC-4764-9237-64009560BF3B"}]
