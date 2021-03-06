# Encoding: UTF-8

[{name: "Miscellaneous Matlab",
  scope: "source.matlab",
  settings: 
   {decreaseIndentPattern: 
     "^\\s*\\b(end\\w*|catch|else|elseif|case|otherwise)\\b",
    highlightPairs: [["(", ")"], ["[", "]"], ["{", "}"], ["\"", "\""]],
    increaseIndentPattern: 
     "(?x)^\\s*\n    \\b(\n       function\n       |if|else|elseif\n       |switch|case|otherwise\n       |for|while\n\t  |try|catch\n       |unwind_protect\n\t)\\b",
    smartTypingPairs: 
     [["(", ")"], ["[", "]"], ["{", "}"], ["\"", "\""], ["'", "'"]]},
  uuid: "2CD1353B-AEC7-4BBF-8061-6038D1E93FA8"},
 {name: "Miscellaneous Octave",
  scope: "source.octave",
  settings: 
   {decreaseIndentPattern: 
     "^\\s*(catch|else|elseif|end|endfunction|endif|endswitch|endwhile|endfor|endtry)\\b",
    highlightPairs: [["(", ")"], ["[", "]"], ["{", "}"], ["\"", "\""]],
    increaseIndentPattern: 
     "^\\s*(catch|else|elseif|for|function|if|switch|while|try).*",
    shellVariables: [{name: "TM_COMMENT_START", value: "% "}],
    smartTypingPairs: [["(", ")"], ["[", "]"], ["{", "}"]]},
  uuid: "DCAA0C20-AF0B-4E64-A947-43DA07B901A4"},
 {name: "Preferences",
  scope: "source.matlab, source.octave",
  settings: 
   {shellVariables: 
     [{name: "TM_USE_OCTAVE", value: "0"},
      {name: "TM_CLOSE_FUNCTIONS", value: "1"},
      {name: "TM_COMMENT_START", value: "% "}]},
  uuid: "FCA472FC-0F54-4C92-BFE1-00880FE1DA3F"},
 {name: "Symbol List: Functions",
  scope: 
   "source.matlab meta.function.with-arguments, source.matlab meta.function.without-arguments",
  settings: 
   {showInSymbolList: 1,
    symbolTransformation: 
     "\n\ts/^\\s*function\\s+//;\n\ts/(?>.*=)\\s*//; # remove output args \n    "},
  uuid: "5EC2B9C8-1311-4C27-A421-A7982E6418AA"}]
