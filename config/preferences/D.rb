# Encoding: UTF-8

[{name: "Comments",
  scope: "source.d",
  settings: 
   {shellVariables: 
     [{name: "TM_COMMENT_START", value: "// "},
      {name: "TM_COMMENT_START_2", value: "/*"},
      {name: "TM_COMMENT_END_2", value: "*/"},
      {name: "TM_COMMENT_MODE_2", value: "block"},
      {name: "TM_COMMENT_START_3", value: "/+"},
      {name: "TM_COMMENT_END_3", value: "+/"},
      {name: "TM_COMMENT_MODE_3", value: "block"}]},
  uuid: "4A7C08E3-CF6E-47AC-B5C4-F177BC6F2653"},
 {name: "Indentation Rules",
  scope: "source.d",
  settings: 
   {decreaseIndentPattern: 
     "^(.*\\*/)?\\s*\\}([^}{\"']*\\{)?[;\\s]*(//.*|/\\*.*\\*/\\s*)?$|^\\s*(public|private|protected):\\s*$",
    increaseIndentPattern: 
     "^.*\\{[^}\"']*$|^\\s*(public|private|protected):\\s*$",
    indentNextLinePattern: 
     "^(?!(.*[};:])?\\s*(//|/\\*.*\\*/\\s*$)).*[^\\s;:{}]\\s*$"},
  uuid: "7C8F9C84-7DCC-4DD7-B32E-A638F322199F"},
 {name: "Symbol List: Method / Constructor",
  scope: 
   "source.d meta.definition.method, source.d meta.definition.constructor, source.d meta.definition.destructor",
  settings: 
   {showInSymbolList: 0,
    symbolTransformation: "\n      s/^\\s*([^\\)]+)/ $1/;  # pad"},
  uuid: "A6BCFD4A-B6CC-49C6-93F9-FEB979CC679E"}]
