# Encoding: UTF-8

[{beforeRunningCommand: "nop",
  bundleUUID: "93A1530E-919D-11D9-AE7A-00039369B986",
  command: 
   "#!/usr/bin/env ruby\n\nrequire ENV['TM_SUPPORT_PATH'] + \"/lib/exit_codes\"\nrequire \"\#{ENV['TM_SUPPORT_PATH']}/lib/escape\"\n\nrequire \"\#{ENV['TM_BUNDLE_SUPPORT']}/objc_completion\"\n\ndef stripComments(line)\n  line.gsub(/((['\"])(?:\\\\.|.)*?\\2)|\\/\\*.*?\\*\\/|\\/\\/[^\\n\\r]*/m) do |s| \n    if $1\n      s\n    else\n      ' ' * s.length()\n    end\n  end\nend\n\nclass String\n  def index_of_nth_occurrence_of(n, ch)\n    self.unpack(\"U*\").each_with_index do |e, i|\n      return i if e == ch && (n -= 1) == 0\n    end\n    return -1\n  end\nend\n\ndef caret_position(line)\n  tmp = ENV['TM_LINE_NUMBER'].to_i - ENV['TM_INPUT_START_LINE'].to_i\n  if tmp > 0\n    caret_placement = line.index_of_nth_occurrence_of(tmp,?\\n) + ENV['TM_LINE_INDEX'].to_i\n  else\n    caret_placement =ENV['TM_LINE_INDEX'].to_i-ENV['TM_INPUT_START_LINE_INDEX'].to_i - 1\n  end\nend\n\n\n\nclass FScriptCocoaCompletion < ObjCMethodCompletion\n  def initialize(line, caret_position)\n    @line = line\n  end\n  \n  def match_iter(rgxp,str)\n    offset = 0\n    while m = str.match(rgxp)\n      yield [m, m.begin(0) + offset, m[0].length]\n      str = m.post_match\n      offset += m.end(0)\n    end\n  end\n  \n  def methodNames(line )\n    start = [0]\n    \n    #Count [\n    pat = /\"(?:\\\\.|[^\"\\\\])*\"|'(?:\\\\.|[^'\\\\])*'|([\\[\\{\\(])|([\\]\\)\\]])|[a-zA-Z][a-zA-Z0-9]*:/\n    match_iter(pat , line) do |mat, beg, len|\n#puts mat[1].inspect + \"<<<\"\n      if mat[1]\n        start << beg\n      elsif mat[2]\n        start.pop\n      end\n    end\n    \n    unless start[-1] == 0\n      start = start[-1] + 1 \n    else\n      start = 0\n    end\n    \n    list = \"\"\n    up = 0\n    match_iter(pat , line[start..-1]) do |mat, beg, len|\n      if mat[1]\n        up +=1\n      elsif mat[2] && up > 0\n        up -=1\n      elsif up == 0 && mat[0].match(/^\\w/)\n        list << mat[0]\n      end\n    end\n    return list\n  end\n  \n  def snippet_generator(cand, start, call)\n    start = cand.match(/\#{@mn}/)[0].length\n    super\n  end\n  \n  def print \n    line = @line\n    if k = line.match(/[a-zA-Z_0-1\\'\\]\\)\\}]\\s+([a-zA-Z_][a-zA-Z_0-9]*)$/)\n      mn = methodNames(line)\n      @mn = \"(\#{mn})?\" + k[1] unless mn == \"\"\n      candidates = candidates_or_exit( @mn + \"[[:alpha:]]\", nil, :methods)\n      res =pop_up(candidates, k[1])\n    else\n      res = \"\"\n    end\n  end\nend\n\nline = ENV['TM_CURRENT_LINE']\ni = ENV['TM_LINE_INDEX'].to_i - 1\nTextMate.exit_discard if i == -1\nline = line[0..i]\ncaret_placement = caret_position(line)\nres = FScriptCocoaCompletion.new(stripComments(line) , caret_placement).print\n  os = 0\nprint res\n",
  fallbackInput: "none",
  input: "selection",
  keyEquivalent: "~",
  name: "F-Script Completion",
  output: "insertAsSnippet",
  scope: "source.fscript",
  uuid: "72B7DE39-A1F2-4D0E-96EF-72DF2DAF3ECA"}]
