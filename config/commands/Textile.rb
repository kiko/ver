# Encoding: UTF-8

[{beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\nENV['TM_SELECTED_TEXT'].to_s.each_line() { |line|\n\tif(line =~ /^\\*/)\n\t\tprint(\"*\#{line}\")\n\telse\n\t\tprint(\"* \#{line}\")\n\tend\n}\n",
  input: "selection",
  keyEquivalent: "^*",
  name: "Bullet List",
  output: "replaceSelectedText",
  scope: "text.html.textile",
  uuid: "9F539C5E-46E1-45F4-9AD7-6BF05BE0C7ED"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\nbegin \n  require 'rubygems'\n  require 'redcloth'\nrescue LoadError\n  require ENV['TM_BUNDLE_SUPPORT'] + '/lib/redcloth'\nend\n\ncontents = []\n$stdin.each_line { |line| contents << line }\n\nputs(RedCloth.new(contents.join()).to_html(:textile))",
  fallbackInput: "document",
  input: "selection",
  keyEquivalent: "^H",
  name: "Convert Document / Selection to HTML",
  output: "replaceSelectedText",
  scope: "text.html.textile",
  uuid: "9B769AE9-BE8F-45B9-91E0-39533AD8114B"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\nrequire ENV['TM_SUPPORT_PATH'] + \"/lib/ui\"\n\nif color = TextMate::UI.request_color\n  print \"{color:\#{color}}\"\nend\n",
  fallbackInput: "word",
  input: "none",
  keyEquivalent: "@C",
  name: "Insert Color…",
  output: "afterSelectedText",
  scope: "text.html.textile",
  uuid: "7164B649-E5B6-4A2C-BF01-671528D0A780"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\nENV['TM_SELECTED_TEXT'].to_s.each_line() { |line|\n\tif(line =~ /^#/)\n\t\tprint(\"#\#{line}\")\n\telse\n\t\tprint(\"# \#{line}\")\n\tend\n}\n",
  input: "selection",
  keyEquivalent: "^#",
  name: "Number List",
  output: "replaceSelectedText",
  scope: "text.html.textile",
  uuid: "EE76702D-2370-44B6-85E6-772922D963A2"},
 {beforeRunningCommand: "nop",
  command: 
   "#!/usr/bin/env ruby\nbegin \n  require 'rubygems'\n  require 'redcloth'\nrescue LoadError\n  require ENV['TM_BUNDLE_SUPPORT'] + '/lib/redcloth'\nend\n\nrequire \"\#{ENV['TM_SUPPORT_PATH']}/lib/tm/htmloutput\"\n\ncontents = []\n$stdin.each_line { |line| contents << line }\n\noutput = RedCloth.new(contents.join()).to_html(:textile)\n\nTextMate::HTMLOutput.show(:title => \"Textile Preview\", :sub_title => ENV['TM_FILENAME']) do |io|\n  io << output\n end\n\n",
  input: "document",
  keyEquivalent: "^~@p",
  name: "Preview",
  output: "showAsHTML",
  scope: "text.html.textile",
  uuid: "2684F52C-663F-47F3-8320-C8FCB71E276F"},
 {beforeRunningCommand: "nop",
  command: 
   "echo '<meta http-equiv=\"refresh\" content=\"0; http://redcloth.org/hobix.com/textile/\">'",
  input: "none",
  keyEquivalent: "^h",
  name: "Show Documentation",
  output: "showAsHTML",
  scope: "text.html.textile",
  uuid: "B9EE97CD-E059-4FE5-AD3A-EEC7D5A23E99"}]
