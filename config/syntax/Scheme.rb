# Encoding: UTF-8

{comment: 
  "\n\t\tThe foldings do not currently work the way I want them to. This\n\t\tmay be a limitation of the way they are applied rather than the\n\t\tregexps in use. Nonetheless, the foldings will end on the last\n\t\tidentically indented blank line following an s-expression. Not\n\t\tideal perhaps, but it works. Also, the #illegal pattern never\n\t\tmatches an unpaired ( as being illegal. Why?! -- Rob Rix\n\t\t\n\t\tOk, hopefully this grammar works better on quoted stuff now.  It\n\t\tmay break for fancy macros, but should generally work pretty\n\t\tsmoothly.  -- Jacob Rus\n\t\t\n\t\tI have attempted to get this under control but because of the way folding\n\t\tand indentation interact in Textmate, I am not sure if it is possible. In the\n\t\tmeantime, I have implemented Python-style folding anchored at newlines.\n\t\tAdditionally, I have made some minor improvements to the numeric constant\n\t\thighlighting. Next up is square bracket expressions, I guess, but that\n\t\tshould be trivial. -- ozy`\n\t",
 fileTypes: ["scm", "sch"],
 foldingStartMarker: 
  /(?x)^ [ \t]* \(
	  (?<par>
	    ( [^()\n]++ | \( \g<par> \)? )*+
	  )
	$/,
 foldingStopMarker: /^\s*$/,
 keyEquivalent: "^~S",
 name: "Scheme",
 patterns: 
  [{include: "#comment"},
   {include: "#sexp"},
   {include: "#string"},
   {include: "#language-functions"},
   {include: "#quote"},
   {include: "#illegal"}],
 repository: 
  {comment: 
    {captures: {1 => {name: "punctuation.definition.comment.scheme"}},
     match: /(;).*$\n?/,
     name: "comment.line.semicolon.scheme"},
   constants: 
    {patterns: 
      [{match: /#[t|f]/, name: "constant.language.boolean.scheme"},
       {match: 
         /(?<=[\(\s])((#e|#i)?[0-9]+(\.[0-9]+)?|(#x)[0-9a-fA-F]+|(#o)[0-7]+|(#b)[01]+)(?=[\s;()'",\[\]])/,
        name: "constant.numeric.scheme"}]},
   illegal: {match: /[()\[\]]/, name: "invalid.illegal.parenthesis.scheme"},
   :"language-functions" => 
    {patterns: 
      [{match: 
         /(?x)
	(?<=(\s|\(|\[)) # preceded by space or ( 
	( do|or|and|else|quasiquote|begin|if|case|set!|
	  cond|let|unquote|define|let\*|unquote-splicing|delay|
	  letrec)
	(?=(\s|\())/,
        name: "keyword.control.scheme"},
       {comment: 
         "\n\t\t\t\t\t\tThese functions run a test, and return a boolean\n\t\t\t\t\t\tanswer.\n\t\t\t\t\t",
        match: 
         /(?x)
	(?<=(\s|\()) # preceded by space or (
	( char-alphabetic|char-lower-case|char-numeric|
	  char-ready|char-upper-case|char-whitespace|
	  (?:char|string)(?:-ci)?(?:=|<=?|>=?)|
	  atom|boolean|bound-identifier=|char|complex|
	  identifier|integer|symbol|free-identifier=|inexact|
	  eof-object|exact|list|(?:input|output)-port|pair|
	  real|rational|zero|vector|negative|odd|null|string|
	  eq|equal|eqv|even|number|positive|procedure
	)
	(\?)		# name ends with ? sign
	(?=(\s|\()) # followed by space or (
	/,
        name: "support.function.boolean-test.scheme"},
       {comment: 
         "\n\t\t\t\t\t\tThese functions change one type into another.\n\t\t\t\t\t",
        match: 
         /(?x)
	(?<=(\s|\()) # preceded by space or (
	( char->integer|exact->inexact|inexact->exact|
	  integer->char|symbol->string|list->vector|
	  list->string|identifier->symbol|vector->list|
	  string->list|string->number|string->symbol|
	  number->string
	)
	(?=(\s|\()) # followed by space or (					
	/,
        name: "support.function.convert-type.scheme"},
       {comment: 
         "\n\t\t\t\t\t\tThese functions are potentially dangerous because\n\t\t\t\t\t\tthey have side-effects which could affect other\n\t\t\t\t\t\tparts of the program.\n\t\t\t\t\t",
        match: 
         /(?x)
	(?<=(\s|\()) # preceded by space or (
	( set-(?:car|cdr)|				 # set car\/cdr
	  (?:vector|string)-(?:fill|set) # fill\/set string\/vector
	)
	(!)			# name ends with ! sign
	(?=(\s|\()) # followed by space or (
	/,
        name: "support.function.with-side-effects.scheme"},
       {comment: "\n\t\t\t\t\t\t+, -, *, /, =, >, etc. \n\t\t\t\t\t",
        match: 
         /(?x)
	(?<=(\s|\()) # preceded by space or (
	( >=?|<=?|=|[*\/+-])
	(?=(\s|\()) # followed by space or (
	/,
        name: "keyword.operator.arithmetic.scheme"},
       {match: 
         /(?x)
	(?<=(\s|\()) # preceded by space or (
	( append|apply|approximate|
	  call-with-current-continuation|call\/cc|catch|
	  construct-identifier|define-syntax|display|foo|
	  for-each|force|cd|gen-counter|gen-loser|
	  generate-identifier|last-pair|length|let-syntax|
	  letrec-syntax|list|list-ref|list-tail|load|log|
	  macro|magnitude|map|map-streams|max|member|memq|
	  memv|min|newline|nil|not|peek-char|rationalize|
	  read|read-char|return|reverse|sequence|substring|
	  syntax|syntax-rules|transcript-off|transcript-on|
	  truncate|unwrap-syntax|values-list|write|write-char|
	  
	  # cons, car, cdr, etc
	  cons|c(a|d){1,4}r| 
                          
	  # unary math operators
	  abs|acos|angle|asin|assoc|assq|assv|atan|ceiling|
	  cos|floor|round|sin|sqrt|tan|
	  (?:real|imag)-part|numerator|denominator
                          
	  # other math operators
	  modulo|exp|expt|remainder|quotient|lcm|
                          
	  # ports \/ files
	  call-with-(?:input|output)-file|
	  (?:close|current)-(?:input|output)-port|
	  with-(?:input|output)-from-file|
	  open-(?:input|output)-file|
	  
	  # char-«foo»
	  char-(?:downcase|upcase|ready)|
	  
	  # make-«foo»
	  make-(?:polar|promise|rectangular|string|vector)
	  
	  # string-«foo», vector-«foo»
	  string(?:-(?:append|copy|length|ref))?|
	  vector(?:-length|-ref)
	)
	(?=(\s|\()) # followed by space or (
	/,
        name: "support.function.general.scheme"}]},
   quote: 
    {comment: 
      "\n\t\t\t\tWe need to be able to quote any kind of item, which creates\n\t\t\t\ta tiny bit of complexity in our grammar.  It is hopefully\n\t\t\t\tnot overwhelming complexity.\n\t\t\t\t\n\t\t\t\tNote: the first two matches are special cases.  quoted\n\t\t\t\tsymbols, and quoted empty lists are considered constant.other\n\t\t\t\t\n\t\t\t",
     patterns: 
      [{captures: {1 => {name: "punctuation.section.quoted.symbol.scheme"}},
        match: /(?x)
	(')\s*
	([[:alnum:]][[:alnum:]!$%&*+-.\/:<=>?@^_~]*)
	/,
        name: "constant.other.symbol.scheme"},
       {captures: 
         {1 => {name: "punctuation.section.quoted.empty-list.scheme"},
          2 => {name: "meta.expression.scheme"},
          3 => {name: "punctuation.section.expression.begin.scheme"},
          4 => {name: "punctuation.section.expression.end.scheme"}},
        match: /(?x)
	(')\s*
	((\()\s*(\)))
	/,
        name: "constant.other.empty-list.schem"},
       {begin: /(')\s*/,
        beginCaptures: {1 => {name: "punctuation.section.quoted.scheme"}},
        comment: "quoted double-quoted string or s-expression",
        end: "(?=[\\s()])|(?<=\\n)",
        name: "string.other.quoted-object.scheme",
        patterns: [{include: "#quoted"}]}]},
   :"quote-sexp" => 
    {begin: /(?<=\()\s*(quote)\b\s*/,
     beginCaptures: {1 => {name: "keyword.control.quote.scheme"}},
     comment: 
      "\n\t\t\t\tSomething quoted with (quote «thing»).  In this case «thing»\n\t\t\t\twill not be evaluated, so we are considering it a string.\n\t\t\t",
     contentName: "string.other.quote.scheme",
     end: "(?=[\\s)])|(?<=\\n)",
     patterns: [{include: "#quoted"}]},
   quoted: 
    {patterns: 
      [{include: "#string"},
       {begin: /(\()/,
        beginCaptures: 
         {1 => {name: "punctuation.section.expression.begin.scheme"}},
        end: "(\\))",
        endCaptures: 
         {1 => {name: "punctuation.section.expression.end.scheme"}},
        name: "meta.expression.scheme",
        patterns: [{include: "#quoted"}]},
       {include: "#quote"},
       {include: "#illegal"}]},
   sexp: 
    {begin: /(\()/,
     beginCaptures: 
      {1 => {name: "punctuation.section.expression.begin.scheme"}},
     end: "(\\))(\\n)?",
     endCaptures: 
      {1 => {name: "punctuation.section.expression.end.scheme"},
       2 => {name: "meta.after-expression.scheme"}},
     name: "meta.expression.scheme",
     patterns: 
      [{include: "#comment"},
       {begin: 
         /(?x)
	(?<=\()       # preceded by (
	(define)\s+   # define
	(\()          # list of parameters
	  ([[:alnum:]][[:alnum:]!$%&*+-.\/:<=>?@^_~]*)
	  ((\s+
	    ([[:alnum:]][[:alnum:]!$%&*+-.\/:<=>?@^_~]*|[._])
	   )*
	  )\s*
	(\))
	/,
        captures: 
         {1 => {name: "keyword.control.scheme"},
          2 => {name: "punctuation.definition.function.scheme"},
          3 => {name: "entity.name.function.scheme"},
          4 => {name: "variable.parameter.function.scheme"},
          7 => {name: "punctuation.definition.function.scheme"}},
        end: "(?=\\))",
        name: "meta.declaration.procedure.scheme",
        patterns: 
         [{include: "#comment"}, {include: "#sexp"}, {include: "#illegal"}]},
       {begin: 
         /(?x)
	(?<=\() # preceded by (
	(lambda)\s+
	(\() # opening paren
	((?:
	  ([[:alnum:]][[:alnum:]!$%&*+-.\/:<=>?@^_~]*|[._])
	  \s+
	)*(?:
	  ([[:alnum:]][[:alnum:]!$%&*+-.\/:<=>?@^_~]*|[._])
	)?)
	(\)) # closing paren
	/,
        captures: 
         {1 => {name: "keyword.control.scheme"},
          2 => {name: "punctuation.definition.variable.scheme"},
          3 => {name: "variable.parameter.scheme"},
          6 => {name: "punctuation.definition.variable.scheme"}},
        comment: 
         "\n\t\t\t\t\t\tNot sure this one is quite correct.  That \\s* is\n\t\t\t\t\t\tparticularly troubling\n\t\t\t\t\t",
        end: "(?=\\))",
        name: "meta.declaration.procedure.scheme",
        patterns: 
         [{include: "#comment"}, {include: "#sexp"}, {include: "#illegal"}]},
       {begin: 
         /(?<=\()(define)\s([[:alnum:]][[:alnum:]!$%&*+-.\/:<=>?@^_~]*)\s*.*?/,
        captures: 
         {1 => {name: "keyword.control.scheme"},
          2 => {name: "variable.other.scheme"}},
        end: "(?=\\))",
        name: "meta.declaration.variable.scheme",
        patterns: 
         [{include: "#comment"}, {include: "#sexp"}, {include: "#illegal"}]},
       {include: "#quote-sexp"},
       {include: "#quote"},
       {include: "#language-functions"},
       {include: "#string"},
       {include: "#constants"},
       {match: /(?<=[\(\s])(#\\)(space|newline|tab)(?=[\s\)])/,
        name: "constant.character.named.scheme"},
       {match: /(?<=[\(\s])(#\\)x[0-9A-F]{2,4}(?=[\s\)])/,
        name: "constant.character.hex-literal.scheme"},
       {match: /(?<=[\(\s])(#\\).(?=[\s\)])/,
        name: "constant.character.escape.scheme"},
       {comment: 
         "\n\t\t\t\t\t\tthe . in (a . b) which conses together two elements\n\t\t\t\t\t\ta and b. (a b c) == (a . (b . (c . nil)))\n\t\t\t\t\t",
        match: /(?<=[ ()])\.(?=[ ()])/,
        name: "punctuation.separator.cons.scheme"},
       {include: "#sexp"},
       {include: "#illegal"}]},
   string: 
    {begin: /(")/,
     beginCaptures: 
      {1 => {name: "punctuation.definition.string.begin.scheme"}},
     end: "(\")",
     endCaptures: {1 => {name: "punctuation.definition.string.end.scheme"}},
     name: "string.quoted.double.scheme",
     patterns: [{match: /\\./, name: "constant.character.escape.scheme"}]}},
 scopeName: "source.scheme",
 uuid: "3EC2CFD0-909C-4692-AC29-1A60ADBC161E"}
