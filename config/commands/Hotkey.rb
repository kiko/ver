# Encoding: UTF-8

[{beforeRunningCommand: "nop",
  bundleUUID: "5AE8DC40-A7BB-4E63-AE9B-D7E24C2E339C",
  command: 
   ". \"$TM_SUPPORT_PATH/lib/webpreview.sh\"\nhtml_header \"Hotkey Help\" \"Hotkey\"\nMarkdown.pl <<'EOF'\n<title>Hotkey Bundle</title>\n\n## About\n\nThe hotkey bundle allows you to store a shell command on control shift 1-5 (US keymap) for the current project.\n\n## How it works\n\nThe first time you press control shift 1-5, it will ask you for the shell command to run. After that, the same key will run that command with output shown as a tool tip.  All commands are run from the base of the project directory.\n\n## Internals\n\nThe list of recorded shell commands is kept in the project folder as `.tmhotkeys` (in YAML format).\n\nEOF\nhtml_footer",
  input: "none",
  name: "Help",
  output: "showAsHTML",
  uuid: "18C33747-DEB1-4F36-B1E3-EF1D544C1D96"},
 {beforeRunningCommand: "nop",
  command: 
   "cd ${TM_PROJECT_DIRECTORY}\n\"${TM_RUBY:=ruby}\" <<'EOF'\n\nnum = 1\n\n`\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\" --check`\nif($? == 0)\n  print `\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\"`\n  exit()\nend\n\noutput = `CocoaDialog inputbox --title Input --informative-text 'What command should be run?' --button1 Record --button2 'Cancel'`\noutput = output.split(\"\\n\")\n\n# check the button pressed, exit if it wasn't Record\nif(output[0] !~ /^1$/)\n\texit\nend\n\n# update the command\n`\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\" -u '\#{output[1].strip.gsub(/'/, '\\\\\\\\1')}'`\n\n# run the command\nprint `\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\"`\n",
  input: "none",
  keyEquivalent: "^!",
  name: "ctrl-shift-1",
  output: "showAsTooltip",
  uuid: "52991D39-38F1-4A33-9C7D-5D39EB289889"},
 {beforeRunningCommand: "nop",
  command: 
   "cd ${TM_PROJECT_DIRECTORY}\n\"${TM_RUBY:=ruby}\" <<'EOF'\n\nnum = 2\n\n`\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\" --check`\nif($? == 0)\n  print `\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\"`\n  exit()\nend\n\noutput = `CocoaDialog inputbox --title Input --informative-text 'What command should be run?' --button1 Record --button2 'Cancel'`\noutput = output.split(\"\\n\")\n\n# check the button pressed, exit if it wasn't Record\nif(output[0] !~ /^1$/)\n\texit\nend\n\n# update the command\n`\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\" -u '\#{output[1].strip.gsub(/'/, '\\\\\\\\1')}'`\n\n# run the command\nprint `\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\"`\n",
  input: "none",
  keyEquivalent: "^@",
  name: "ctrl-shift-2",
  output: "showAsTooltip",
  uuid: "768F3AD8-30D7-4AFD-8041-5F02E5EADD44"},
 {beforeRunningCommand: "nop",
  command: 
   "cd ${TM_PROJECT_DIRECTORY}\n\"${TM_RUBY:=ruby}\" <<'EOF'\n\nnum = 3\n\n`\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\" --check`\nif($? == 0)\n  print `\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\"`\n  exit()\nend\n\noutput = `CocoaDialog inputbox --title Input --informative-text 'What command should be run?' --button1 Record --button2 'Cancel'`\noutput = output.split(\"\\n\")\n\n# check the button pressed, exit if it wasn't Record\nif(output[0] !~ /^1$/)\n\texit\nend\n\n# update the command\n`\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\" -u '\#{output[1].strip.gsub(/'/, '\\\\\\\\1')}'`\n\n# run the command\nprint `\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\"`\n",
  input: "none",
  keyEquivalent: "^#",
  name: "ctrl-shift-3",
  output: "showAsTooltip",
  uuid: "5CFF88D2-658D-4E81-9FCA-45673D3E74DD"},
 {beforeRunningCommand: "nop",
  command: 
   "cd ${TM_PROJECT_DIRECTORY}\n\"${TM_RUBY:=ruby}\" <<'EOF'\n\nnum = 4\n\n`\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\" --check`\nif($? == 0)\n  print `\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\"`\n  exit()\nend\n\noutput = `CocoaDialog inputbox --title Input --informative-text 'What command should be run?' --button1 Record --button2 'Cancel'`\noutput = output.split(\"\\n\")\n\n# check the button pressed, exit if it wasn't Record\nif(output[0] !~ /^1$/)\n\texit\nend\n\n# update the command\n`\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\" -u '\#{output[1].strip.gsub(/'/, '\\\\\\\\1')}'`\n\n# run the command\nprint `\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\"`\n",
  input: "none",
  keyEquivalent: "^$",
  name: "ctrl-shift-4",
  output: "showAsTooltip",
  uuid: "8BEF616A-19A7-4AE2-AC59-B812BF701269"},
 {beforeRunningCommand: "nop",
  command: 
   "cd ${TM_PROJECT_DIRECTORY}\n\"${TM_RUBY:=ruby}\" <<'EOF'\n\nnum = 5\n\n`\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\" --check`\nif($? == 0)\n  print `\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\"`\n  exit()\nend\n\noutput = `CocoaDialog inputbox --title Input --informative-text 'What command should be run?' --button1 Record --button2 'Cancel'`\noutput = output.split(\"\\n\")\n\n# check the button pressed, exit if it wasn't Record\nif(output[0] !~ /^1$/)\n\texit\nend\n\n# update the command\n`\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\" -u '\#{output[1].strip.gsub(/'/, '\\\\\\\\1')}'`\n\n# run the command\nprint `\"\#{ENV['TM_BUNDLE_SUPPORT']}/hotkey.rb\" -n \#{num} -c \"\#{ENV['TM_PROJECT_DIRECTORY']}/.tmhotkeys\"`\n",
  input: "none",
  keyEquivalent: "^%",
  name: "ctrl-shift-5",
  output: "showAsTooltip",
  uuid: "2AD289D4-FBE2-40D2-B12D-3D498486B881"}]