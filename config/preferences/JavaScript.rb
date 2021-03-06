# Encoding: UTF-8

[{name: "Comments",
  scope: "source.js",
  settings: 
   {shellVariables: 
     [{name: "TM_COMMENT_START", value: "// "},
      {name: "TM_COMMENT_START_2", value: "/*"},
      {name: "TM_COMMENT_END_2", value: "*/"}]},
  uuid: "A67A8BD9-A951-406F-9175-018DD4B52FD1"},
 {name: "JavaScript Indent",
  scope: "source.js",
  settings: 
   {decreaseIndentPattern: 
     "^(.*\\*/)?\\s*(\\}|\\))([^{]*\\{)?([;,]?\\s*|\\.[^{]*|\\s*\\)[;\\s]*)$",
    increaseIndentPattern: "^.*(\\{[^}\"']*|\\([^)\"']*)$"},
  uuid: "BC062860-3346-4D3B-8421-C5543F83D11F"},
 {name: "Symbol List Banned",
  scope: "source.js meta.property.function entity.name.function",
  settings: {showInSymbolList: "0"},
  uuid: "834BC727-6B31-4073-A161-4823227219EF"},
 {name: "Symbol List Class",
  scope: "source.js entity.name.type.class",
  settings: 
   {showInSymbolList: "1", symbolTransformation: "\n      s/^/• /g;\n   "},
  uuid: "3CEA49B2-A5C5-405C-82E2-B8B668877C37"},
 {name: "Symbol List Instance",
  scope: "source.js entity.name.instance",
  settings: 
   {showInSymbolList: "1", symbolTransformation: "\n      s/^/\\t/g;\n   "},
  uuid: "E6EB7CC8-04E8-43A9-93B2-BC9EF5BA862B"},
 {name: "Symbol List Sub 1",
  scope: "source.js object.property.function -(meta.group meta.group)",
  settings: 
   {showInSymbolList: "1", symbolTransformation: "\n      s/^/ :/g;\n   "},
  uuid: "73557394-4F0F-4DD3-8029-EEE8201AC7F5"},
 {name: "Symbol List Sub 2",
  scope: "source.js meta.group meta.group object.property.function",
  settings: 
   {showInSymbolList: "1", symbolTransformation: "\n      s/^/  :/g;\n   "},
  uuid: "51841DDB-C2A4-461C-A8AB-6C124AD50EAE"}]
