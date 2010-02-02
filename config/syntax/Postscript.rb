# Encoding: UTF-8

{fileTypes: ["ps", "eps"],
 firstLineMatch: "^%!PS",
 foldingStartMarker: /\/\*\*|\{\s*$/,
 foldingStopMarker: /\*\*\/|^\s*\}/,
 keyEquivalent: "^~P",
 name: "Postscript",
 patterns: 
  [{begin: /\(/,
    beginCaptures: 
     {0 => {name: "punctuation.definition.string.begin.postscript"}},
    end: "\\)",
    endCaptures: {0 => {name: "punctuation.definition.string.end.postscript"}},
    name: "string.other.postscript",
    patterns: [{include: "#string_content"}]},
   {captures: 
     {1 => {name: "keyword.other.DSC.postscript"},
      3 => {name: "string.unquoted.DSC.postscript"}},
    match: 
     /^(%%(BeginBinary:|BeginCustomColor:|BeginData:|BeginDefaults|BeginDocument:|BeginEmulation:|BeginExitServer:|BeginFeature:|BeginFile:|BeginFont:|BeginObject:|BeginPageSetup:|BeginPaperSize:|BeginPreview:|BeginProcSet|BeginProcessColor:|BeginProlog|BeginResource:|BeginSetup|BoundingBox:|CMYKCustomColor:|ChangeFont:|Copyright:|CreationDate:|Creator:|DocumentCustomColors:|DocumentData:|DocumentFonts:|DocumentMedia:|DocumentNeededFiles:|DocumentNeededFonts:|DocumentNeededProcSets:|DocumentNeededResources:|DocumentPaperColors:|DocumentPaperForms:|DocumentPaperSizes:|DocumentPaperWeights:|DocumentPrinterRequired:|DocumentProcSets:|DocumentProcessColors:|DocumentSuppliedFiles:|DocumentSuppliedFonts:|DocumentSuppliedProcSets:|DocumentSuppliedResources:|EOF|Emulation:|EndBinary:|EndComments|EndCustomColor:|EndData:|EndDefaults|EndDocument:|EndEmulation:|EndExitServer:|EndFeature:|EndFile:|EndFont:|EndObject:|EndPageSetup:|EndPaperSize:|EndPreview:|EndProcSet|EndProcessColor:|EndProlog|EndResource:|EndSetup|ExecuteFile:|Extensions:|Feature:|For:|IncludeDocument:|IncludeFeature:|IncludeFile:|IncludeFont:|IncludeProcSet:|IncludeResource:|LanguageLevel:|OperatorIntervention:|OperatorMessage:|Orientation:|Page:|PageBoundingBox:|PageCustomColors|PageCustomColors:|PageFiles:|PageFonts:|PageMedia:|PageOrder:|PageOrientation:|PageProcessColors|PageProcessColors:|PageRequirements:|PageResources:|PageTrailer|Pages:|PaperColor:|PaperForm:|PaperSize:|PaperWeight:|ProofMode:|RGBCustomColor:|Requirements:|Routing:|Title:|Trailer|VMlocation:|VMusage:|Version|Version:|\+|\?BeginFeatureQuery:|\?BeginFileQuery:|\?BeginFontListQuery:|\?BeginFontQuery:|\?BeginPrinterQuery:|\?BeginProcSetQuery:|\?BeginQuery:|\?BeginResourceListQuery:|\?BeginResourceQuery:|\?BeginVMStatus:|\?EndFeatureQuery:|\?EndFileQuery:|\?EndFontListQuery:|\?EndFontQuery:|\?EndPrinterQuery:|\?EndProcSetQuery:|\?EndQuery:|\?EndResourceListQuery:|\?EndResourceQuery:|\?EndVMStatus:))\s*(.*)$\n?/,
    name: "meta.Document-Structuring-Comment.postscript"},
   {captures: {1 => {name: "punctuation.definition.comment.postscript"}},
    match: /(%).*$\n?/,
    name: "comment.line.percentage.postscript"},
   {begin: /\<\</,
    captures: {0 => {name: "punctuation.definition.dictionary.postscript"}},
    end: "\\>\\>",
    name: "meta.dictionary.postscript",
    patterns: [{include: "$self"}]},
   {begin: /\[/,
    captures: {0 => {name: "punctuation.definition.array.postscript"}},
    end: "\\]",
    name: "meta.array.postscript",
    patterns: [{include: "$self"}]},
   {begin: /{/,
    captures: {0 => {name: "punctuation.definition.procedure.postscript"}},
    end: "}",
    name: "meta.procedure.postscript",
    patterns: [{include: "$self"}]},
   {begin: /\<\~/,
    beginCaptures: 
     {0 => {name: "punctuation.definition.string.begin.postscript"}},
    end: "\\~\\>",
    endCaptures: {0 => {name: "punctuation.definition.string.end.postscript"}},
    name: "string.other.base85.postscript",
    patterns: 
     [{match: /[!-z\s]+/},
      {match: /./, name: "invalid.illegal.base85.char.postscript"}]},
   {begin: /\</,
    beginCaptures: 
     {0 => {name: "punctuation.definition.string.begin.postscript"}},
    end: "\\>",
    endCaptures: {0 => {name: "punctuation.definition.string.end.postscript"}},
    name: "string.other.hexadecimal.postscript",
    patterns: 
     [{match: /[0-9A-Fa-f\s]+/},
      {match: /./, name: "invalid.illegal.hexadecimal.char.postscript"}]},
   {comment: 
     "well, not really, but short of listing rules for all bases from 2-36 best we can do",
    match: /[0-3]?[0-9]#[0-9a-zA-Z]+/,
    name: "constant.numeric.radix.postscript"},
   {match: /(\-|\+)?\d+(\.\d*)?([eE](\-|\+)?\d+)?/,
    name: "constant.numeric.postscript"},
   {match: /(\-|\+)?\.\d+([eE](\-|\+)?\d+)?/,
    name: "constant.numeric.postscript"},
   {match: 
     /\b(abs|add|aload|anchorsearch|and|arc|arcn|arct|arcto|array|ashow|astore|atan|awidthshow|begin|bind|bitshift|bytesavailable|cachestatus|ceiling|charpath|clear|cleartomark|cleardictstack|clip|clippath|closefile|closepath|colorimage|concat|concatmatrix|condition|configurationerror|copy|copypage|cos|count|countdictstack|countexecstack|counttomark|cshow|currentblackgeneration|currentcacheparams|currentcmykcolor|currentcolor|currentcolorrendering|currentcolorscreen|currentcolorspace|currentcolortransfer|currentcontext|currentdash|currentdevparams|currentdict|currentfile|currentflat|currentfont|currentglobal|currentgray|currentgstate|currenthalftone|currenthalftonephase|currenthsbcolor|currentlinecap|currentlinejoin|currentlinewidth|currentmatrix|currentmiterlimit|currentobjectformat|currentpacking|currentpagedevice|currentpoint|currentrgbcolor|currentscreen|currentshared|currentstrokeadjust|currentsystemparams|currenttransfer|currentundercolorremoval|currentuserparams|curveto|cvi|cvlit|cvn|cvr|cvrs|cvs|cvx|def|defaultmatrix|definefont|defineresource|defineusername|defineuserobject|deletefile|detach|deviceinfo|dict|dictfull|dictstack|dictstackoverflow|dictstackunderflow|div|dtransform|dup|echo|eexec|end|eoclip|eofill|eoviewclip|eq|erasepage|errordict|exch|exec|execform|execstack|execstackoverflow|execuserobject|executeonly|executive|exit|exp|false|file|filenameforall|fileposition|fill|filter|findencoding|findfont|findresource|flattenpath|floor|flush|flushfile|FontDirectory|for|forall|fork|ge|get|getinterval|globaldict|GlobalFontDirectory|glyphshow|grestore|grestoreall|gsave|gstate|gt|handleerror|identmatrix|idiv|idtransform|if|ifelse|image|imagemask|index|ineofill|infill|initclip|initgraphics|initmatrix|initviewclip|instroke|internaldict|interrupt|inueofill|inufill|inustroke|invalidaccess|invalidcontext|invalidexit|invalidfileaccess|invalidfont|invalidid|invalidrestore|invertmatrix|ioerror|ISOLatin1Encoding|itransform|join|kshow|known|languagelevel|le|length|limitcheck|lineto|ln|load|lock|log|loop|lt|makefont|makepattern|mark|matrix|maxlength|mod|monitor|moveto|mul|ne|neg|newpath|noaccess|nocurrentpoint|not|notify|null|nulldevice|or|packedarray|pathbbox|pathforall|pop|print|printobject|product|prompt|pstack|put|putinterval|quit|rand|rangecheck|rcurveto|read|readhexstring|readline|readonly|readstring|realtime|rectclip|rectfill|rectstroke|rectviewclip|renamefile|repeat|resetfile|resourceforall|resourcestatus|restore|reversepath|revision|rlineto|rmoveto|roll|rootfont|rotate|round|rrand|run|save|scale|scalefont|scheck|search|selectfont|serialnumber|setbbox|setblackgeneration|setcachedevice|setcachedevice2|setcachelimit|setcacheparams|setcharwidth|setcmykcolor|setcolor|setcolorrendering|setcolorscreen|setcolorspace|setcolortransfer|setdash|setdevparams|setfileposition|setflat|setfont|setglobal|setgray|setgstate|sethalftone|sethalftonephase|sethsbcolor|setlinecap|setlinejoin|setlinewidth|setmatrix|setmiterlimit|setobjectformat|setoverprint|setpacking|setpagedevice|setpattern|setrgbcolor|setscreen|setshared|setstrokeadjust|setsystemparams|settransfer|setucacheparams|setundercolorremoval|setuserparams|setvmthreshold|shareddict|show|showpage|sin|sqrt|srand|stack|stackoverflow|stackunderflow|StandardEncoding|start|startjob|status|statusdict|stop|stopped|store|string|stringwidth|stroke|strokepath|sub|syntaxerror|systemdict|timeout|transform|translate|true|truncate|type|typecheck|token|uappend|ucache|ucachestatus|ueofill|ufill|undef|undefined|undefinedfilename|undefineresource|undefinedresult|undefinefont|undefineresource|undefinedresource|undefineuserobject|unmatchedmark|unregistered|upath|userdict|UserObjects|usertime|ustroke|ustrokepath|version|viewclip|viewclippath|VMerror|vmreclaim|vmstatus|wait|wcheck|where|widthshow|write|writehexstring|writeobject|writestring|wtranslation|xcheck|xor|xshow|xyshow|yield|yshow)\b/,
    name: "keyword.operator.postscript"},
   {match: /\/\/[^\(\)\<\>\[\]\{\}\/\%\s]+/,
    name: "variable.other.immediately-evaluated.postscript"},
   {match: /\/[^\(\)\<\>\[\]\{\}\/\%\s]+/,
    name: "variable.other.literal.postscript"},
   {comment: 
     "stuff like 22@ff will show as number 22 followed by name @ff, but should be name 22@ff!",
    match: /[^\(\)\<\>\[\]\{\}\/\%\s]+/,
    name: "variable.other.name.postscript"}],
 repository: 
  {string_content: 
    {patterns: 
      [{match: /\\[0-7]{1,3}/, name: "constant.numeric.octal.postscript"},
       {match: /\\(\\|[nrtbf\(\)]|[0-7]{1,3}|\r?\n)/,
        name: "constant.character.escape.postscript"},
       {match: /\\/,
        name: "invalid.illegal.unknown-escape.postscript.ignored"},
       {begin: /\(/, end: "\\)", patterns: [{include: "#string_content"}]}]}},
 scopeName: "source.postscript",
 uuid: "B89483CD-6AE0-4517-BE2C-82F8083B7359"}
