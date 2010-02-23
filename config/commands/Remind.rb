# Encoding: UTF-8

[{beforeRunningCommand: "nop",
  command: "mate ~/.reminders\n",
  input: "none",
  name: "Edit Reminders",
  output: "showAsTooltip",
  uuid: "C958CCC3-109D-40E0-ADB5-DFAA1A9DE8AF"},
 {beforeRunningCommand: "nop",
  command: 
   "# show this month's calendar\n. \"$TM_SUPPORT_PATH/lib/webpreview.sh\"\nhtml_header \"Remind bundle Help\" \"Remind\"\n\nMarkdown.pl <<'MARKDOWN'\n\n## Intro\n\n[Remind][] is a calendar/reminder shell command which takes as input your calendar file (which is written in a simple plain text format) and outputs upcoming events.\n\nOn Mac OS X Remind is useful with something like [GeekTool][] (get the [unofficial branch][GTBranch]) which allows you to setup a shell command to run periodically and have its output shown nicely on your desktop.\n\n[Remind]: http://www.roaringpenguin.com/penguin/open_source_remind.php\n[GeekTool]: http://projects.tynsoe.org/en/geektool/\n[GTBranch]: http://www.jaw.it/pages/en/x_misc.html\n\n## Installing `remind`\n\nYou can download Remind from [MacPorts](http://macports.org/) by using:\n    \n    sudo port install remind\n\n## This Bundle\n\nThis bundle offers a language grammar for your `~/.reminders` file, a few useful snippets, and commands to show upcoming events or a calender for this week/month.\n\nMARKDOWN\n\nhtml_footer\n",
  input: "none",
  name: "Help",
  output: "showAsHTML",
  scope: "source.remind",
  uuid: "A72C1A66-38B4-4DB5-8C82-0F4E522E31A7"},
 {beforeRunningCommand: "nop",
  command: 
   "# show this month's calendar\n. \"$TM_SUPPORT_PATH/lib/webpreview.sh\"\nhtml_header \"Calendar for this Month\" \"Remind\"\nrequire_cmd rem\n\nrem ${REMIND_FLAGS:--mb1} -pl|rem2html --tableonly --nomini|perl -pe 's/<table class=\"caltable\" border=1  bgcolor=\"#FFFFFF\" width=100%>/<table class=\"pro_table remind_table\" cellspacing=\"0\" cellpadding=\"5\" width=\"100%\">/'\n\nhtml_footer\n",
  fallbackInput: "none",
  input: "none",
  keyEquivalent: "^~@p",
  name: "This Month",
  output: "showAsHTML",
  scope: "source.remind",
  uuid: "95F8AD0C-B0B5-4A3E-ACD2-4786F2E02318"},
 {beforeRunningCommand: "nop",
  command: 
   "# show this weeks calendar in a tooltip\nrequire_cmd rem\n\nrem ${REMIND_FLAGS:--mb1} -c+\n",
  input: "none",
  keyEquivalent: "^~@p",
  name: "This Week",
  output: "showAsTooltip",
  scope: "source.remind",
  uuid: "851259CB-28FD-4B01-A23C-1DB5F46F92BF"},
 {beforeRunningCommand: "nop",
  command: 
   "# show current reminders in a tooltip\nrequire_cmd rem\n\nrem ${REMIND_FLAGS:--mb1} -g\n",
  input: "none",
  keyEquivalent: "^~@p",
  name: "Upcoming Events",
  output: "showAsTooltip",
  scope: "source.remind",
  uuid: "EE6760B3-1869-44F9-A050-CB407CCDB94B"}]
