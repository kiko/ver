# Encoding: UTF-8

[{name: "Completions: Cocoa",
  scope: "source.objc, source.objc++",
  settings: 
   {completions: 
     ["retain",
      "release",
      "autorelease",
      "description",
      "stringWithFormat:",
      "componentsSeparatedByString:",
      "componentsJoinedByString:",
      "isEqualToString:",
      "UTF8String",
      "lastPathComponent",
      "pathExtension",
      "stringByAbbreviatingWithTildeInPath",
      "stringByAppendingPathComponent:",
      "stringByAppendingPathExtension:",
      "stringByDeletingLastPathComponent",
      "stringByDeletingPathExtension",
      "stringByExpandingTildeInPath",
      "stringByResolvingSymlinksInPath",
      "stringByStandardizingPath",
      "valueForKey:",
      "valueForKeyPath:",
      "setValue:",
      "forKey:",
      "forKeyPath:",
      "NSArray",
      "NSDictionary",
      "NSMutableArray",
      "NSMutableDictionary",
      "NSMutableString",
      "NSString"]},
  uuid: "512175CE-933E-4312-BBF2-D744700CB4CA"},
 {name: "Highlight Pairs: Protocol Specifiers",
  scope: 
   "meta.protocol-list.objc | meta.inherited-protocol.end.objc | meta.return-type.objc | meta.argument-type.objc",
  settings: {highlightPairs: [["<", ">"], ["(", ")"]]},
  uuid: "0D675D9D-B93C-400D-B8D6-C9888F7FAAE4"},
 {name: "Symbol List: Method",
  scope: "meta.function.objc",
  settings: 
   {showInSymbolList: 1,
    symbolTransformation: 
     "\n\t\ts/^([-+])\\s*\\(.*?\\)\\s*/ $1 /; # strip result type\n\t\ts/:\\s*\\(.*?\\)\\s*\\w+\\s*/:/g;   # strip argument variables\n\t\ts/\\s*;?$//g;                  # strip terminating ws + semi-colon\n\t"},
  uuid: "ADFCD53A-3CC4-4C31-88C4-BB607684951A"},
 {name: "Typing Pairs: Protocol Specifier",
  scope: 
   "(meta.interface-or-protocol.objc | meta.return-type.objc | meta.argument-type.objc) - meta.protocol-list.objc",
  settings: {smartTypingPairs: [["<", ">"], ["(", ")"]]},
  uuid: "C41409C1-97FD-4326-A8E9-7BF89ED6BEAF"}]
