# Encoding: UTF-8

{fileTypes: ["slate"],
 foldingStartMarker: /^\s*[_A-z0-9]+@.+$/,
 foldingStopMarker: /^.*(?<_1>\])[A-z ]*\.$/,
 keyEquivalent: "^~S",
 name: "Slate",
 patterns: 
  [{match: 
     /\b(?<_1>ifTrue:|ifFalse:|whileTrue:|whileFalse:|loop|ifNil:|ifNotNil:|ifNotNilDo:|if:|then:|else:|do:|\^|error:|warn:|signal)\b/,
    name: "keyword.control.slate"},
   {match: 
     /\b(?<_1>clone|new|copy|resend|forwardTo:|is:|isReally:|as:|[-+=<>,;\/\\*]+)\b/,
    name: "keyword.operator.slate"},
   {match: /&[A-Za-z0-9_]+:?/, name: "keyword.other.name-of-parameter.slate"},
   {match: /\b(?<_1>lobby|it|thisContext|here)\b/,
    name: "variable.language.slate"},
   {begin: /"/,
    beginCaptures: {0 => {name: "punctuation.definition.string.begin.slate"}},
    end: "\"",
    endCaptures: {0 => {name: "punctuation.definition.string.end.slate"}},
    name: "string.quoted.double.slate",
    patterns: [{match: /\\./, name: "constant.character.escape.slate"}]},
   {begin: /'/,
    beginCaptures: {0 => {name: "punctuation.definition.string.begin.slate"}},
    end: "'",
    endCaptures: {0 => {name: "punctuation.definition.string.end.slate"}},
    name: "string.quoted.single.slate",
    patterns: [{match: /\\./, name: "constant.character.escape.slate"}]},
   {begin: /\#\{/,
    beginCaptures: {0 => {name: "punctuation.definition.array.begin.slate"}},
    end: "\\}",
    endCaptures: {0 => {name: "punctuation.definition.array.end.slate"}},
    name: "meta.array.slate",
    patterns: [{include: "#nest_curly"}, {include: "$self"}]},
   {begin: /\#\(/,
    beginCaptures: {0 => {name: "punctuation.definition.array.begin.slate"}},
    comment: "Should restrict contents to literals.",
    end: "\\)",
    endCaptures: {0 => {name: "punctuation.definition.array.end.slate"}},
    name: "meta.array.literal.slate",
    patterns: [{include: "#nest_parens"}]},
   {match: 
     /#(?<_1>[[:lower:]]|_|[+=\-\/!%&*|><~?])(?<_2>\w|[+=\-\/!%&*|><~?:])*/,
    name: "meta.block.compact.slate"},
   {begin: /(?<_1>\[)(?:\s*\|\s*(?<_2>(?::\w+\s+)*:\w+)\s*\|)?/,
    captures: 
     {1 => {name: "punctuation.section.block.slate"},
      2 => {name: "variable.parameter.block.slate"}},
    end: "(\\])",
    name: "meta.block.slate",
    patterns: 
     [{match: /\s+/, name: "meta.block.header.slate"},
      {begin: /(?:\|(?<_1>\s*(?:\w+\s+)*\w+\s*)?\||(?=[^\s|]))/,
       captures: {1 => {name: "variable.other.local.slate"}},
       end: "(?=\\])",
       name: "meta.block.content.slate",
       patterns: [{include: "$base"}]}]},
   {begin: /define: #(?<_1>\w+)/,
    beginCaptures: {1 => {name: "entity.name.type.slate"}},
    end: "\\s",
    name: "meta.definition.slate"},
   {match: /\b(?<_1>:\w+|\w+@)/, name: "variable.parameter.slate"},
   {match: /\b(?<_1>\/\\|\\\/|and:|or:|not|xor:)\b/,
    name: "keyword.operator.logical.slate"},
   {match: /\b(?<_1>True|False|Nil|NoRole)\b/,
    name: "constant.language.slate"},
   {match: 
     /\b[+-]?(?<_1>[0-9]+[Rr][0-9A-Za-z]+(?<_2>[.][0-9A-Za-z]+)?|[0-9]+(?<_3>[.][0-9]+)?)\b/,
    name: "constant.numeric.slate"},
   {captures: {1 => {name: "punctuation.definition.constant.slate"}},
    match: /(?<_1>\$)(?<_2>\S|\\[\\ntsbre0avf])/,
    name: "constant.character.slate"},
   {captures: {1 => {name: "punctuation.definition.constant.slate"}},
    match: /(?<_1>#)\S+/,
    name: "constant.other.slate"},
   {match: /(?<_1>\b\w+ traits\b)/, name: "support.class.slate"},
   {match: /\`[-A-Za-z0-9+=*^<>?,;\/\\]+:?/,
    name: "keyword.control.import.slate"},
   {match: /\s+$/, name: "invalid.deprecated.trailing-whitespace.slate"},
   {include: "#keyword"},
   {begin: /(?<_1>\w+)@/,
    beginCaptures: {1 => {name: "variable.parameter.function.slate"}},
    end: "($|\\[)",
    endCaptures: {1 => {name: "entity.name.function.slate"}},
    name: "meta.function.unary.slate",
    patterns: [{include: "$self"}]}],
 repository: 
  {:"binary-selector" => 
    {match: 
      /\b(?<_1>[=+-\/?<>,;^*]+[A-Za-z0-9_=+-\/?<>,;^*]+[=+-\/?<>,;^*]+)\b/},
   :"escaped-char" => {match: /\\./},
   keyword: 
    {match: /\b(?<_1>[A-Za-z_][A-Za-z_0-9]+:)\b/,
     name: "variable.other.slate"},
   nest_curly: {begin: /\{/, end: "\\}", patterns: [{include: "#nest_curly"}]},
   nest_parens: 
    {begin: /\(/, end: "\\)", patterns: [{include: "#nest_parens"}]},
   :"unary-selector" => {match: /\b(?<_1>[A-Za-z_][A-Za-z_0-9]+)\b/}},
 scopeName: "source.slate",
 uuid: "A7676F36-C7D2-4C3E-8519-944577C66C6A"}
