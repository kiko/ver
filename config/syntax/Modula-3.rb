# Encoding: UTF-8

{fileTypes: ["m3", "cm3"],
 keyEquivalent: "^~M",
 name: "Modula-3",
 patterns: 
  [{match: 
     /\b(ANY|ARRAY|AS|BEGIN|BITS|BRANDED|BY|CASE|CONST|DIV|DO|ELSE|ELSIF|END|EVAL|EXCEPT|EXCEPTION|EXIT|EXPORTS|FINALLY|FOR|FROM|GENERIC|IF|IMPORT|INTERFACE|LOCK|LOOP|METHODS|MOD|MODULE|OBJECT|OF|OVERRIDES|PROCEDURE|RAISE|RAISES|READONLY|RECORD|REF|REPEAT|RETURN|REVEAL|ROOT|SET|THEN|TO|TRY|TYPE|TYPECASE|UNSAFE|UNTIL|UNTRACED|VALUE|VAR|WHILE|WITH|IN|NOT|AND|OR)\b/,
    name: "keyword.other.modula-3"},
   {match: 
     /\b(ABS|ADDRESS|ADR|ADRSIZE|BITSIZE|BOOLEAN|BYTESIZE|CARDINAL|CEILING|CHAR|DEC|DISPOSE|EXTENDED|FIRST|FLOAT|FLOOR|INC|INTEGER|ISTYPE|LAST|LONGREAL|LOOPHOLE|MAX|MIN|MUTEX|NARROW|NEW|NUMBER|ORD|REAL|REFANY|ROUND|SUBARRAY|TEXT|TRUNC|TYPECODE|VAL)\b/,
    name: "storage.type.modula-3"},
   {match: /\b(FALSE|NIL|NULL|TRUE)\b/, name: "constant.language.modula-3"},
   {match: 
     /\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f|ll|LL|ull|ULL)?\b/,
    name: "constant.numeric.modula-3"},
   {begin: /'/,
    beginCaptures: 
     {0 => {name: "punctuation.definition.string.begin.modula-3"}},
    end: "'",
    endCaptures: {0 => {name: "punctuation.definition.string.end.modula-3"}},
    name: "string.quoted.single.modula-3",
    patterns: 
     [{match: /\\([ntrf\\'"]|([0-7]{3}))/,
       name: "constant.character.escape.modula-3"}]},
   {begin: /"/,
    beginCaptures: 
     {0 => {name: "punctuation.definition.string.begin.modula-3"}},
    end: "\"",
    endCaptures: {0 => {name: "punctuation.definition.string.end.modula-3"}},
    name: "string.quoted.double.modula-3",
    patterns: 
     [{match: /\\([ntrf\\'"]|([0-7]{3}))/,
       name: "constant.character.escape.modula-3"}]},
   {begin: /\(\*/,
    captures: {0 => {name: "punctuation.definition.comment.modula-3"}},
    end: "\\*\\)",
    name: "comment.block.modula-3"}],
 scopeName: "source.modula-3",
 uuid: "479D53FA-6ED6-11D9-8471-0011242E4184"}
