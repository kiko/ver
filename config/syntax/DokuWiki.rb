# Encoding: UTF-8

{fileTypes: [],
 firstLineMatch: "^\\s*={2,}(.*)={2,}\\s*$",
 foldingStartMarker: /(<(php|html|file|nowiki)>|<code(\s*.*)?>)|\/\*\*|\{\s*$/,
 foldingStopMarker: /(<\/(code|php|html|file|nowiki)>)|\*\*\/|^\s*\}/,
 keyEquivalent: /^~D/,
 name: "DokuWiki",
 patterns: 
  [{include: "#php"},
   {include: "#inline"},
   {begin: /"/,
    beginCaptures: 
     {0 => {name: "punctuation.definition.string.begin.dokuwiki"}},
    end: "\"",
    endCaptures: {0 => {name: "punctuation.definition.string.end.dokuwiki"}},
    name: "string.quoted.double.dokuwiki",
    patterns: [{match: /\\./, name: "constant.character.escape.dokuwiki"}]},
   {begin: /\(\(/,
    captures: {0 => {name: "punctuation.definition.comment.dokuwiki"}},
    end: "\\)\\)",
    name: "comment.block.documentation.dokuwiki"},
   {captures: 
     {1 => {name: "punctuation.definition.heading.dokuwiki"},
      3 => {name: "punctuation.definition.heading.dokuwiki"}},
    match: /^\s*(={2,})(.*)(={2,})\s*$\n?/,
    name: "markup.heading.dokuwiki"},
   {match: /~~NOTOC~~/, name: "keyword.other.notoc.dokuwiki"},
   {match: /~~NOCACHE~~/, name: "keyword.other.nocache.dokuwiki"},
   {match: /^\s*-{4,}\s*$/, name: "meta.separator.dokuwiki"},
   {match: /\\\\\s/, name: "markup.other.paragraph.dokuwiki"},
   {begin: /^((\t+)|( {2,}))(\*)/,
    captures: {4 => {name: "punctuation.definition.list_item.dokuwiki"}},
    end: "$\\n?",
    name: "markup.list.unnumbered.dokuwiki",
    patterns: [{include: "#inline"}]},
   {begin: /^((\t+)|( {2,}))(-)/,
    captures: {4 => {name: "punctuation.definition.list_item.dokuwiki"}},
    end: "$\\n?",
    name: "markup.list.numbered.dokuwiki",
    patterns: [{include: "#inline"}]},
   {begin: /^[|^]/,
    beginCaptures: {0 => {name: "punctuation.definition.table.dokuwiki"}},
    end: "$",
    name: "markup.other.table.dokuwiki",
    patterns: [{include: "#inline"}]},
   {begin: /(\<)(file|nowiki)(\>)/,
    captures: 
     {0 => {name: "meta.tag.template.dokuwiki"},
      1 => {name: "punctuation.definition.tag.dokuwiki"},
      2 => {name: "entity.name.tag.dokuwiki"},
      3 => {name: "punctuation.definition.tag.dokuwiki"}},
    end: "(<\\/)(\\2)(\\>)",
    name: "markup.raw.dokuwiki"},
   {begin: /(%%|\'\')/,
    captures: {0 => {name: "punctuation.definition.raw.dokuwiki"}},
    end: "\\1",
    name: "markup.raw.dokuwiki"},
   {begin: /(<)(html)(>)/,
    captures: 
     {0 => {name: "meta.tag.template.block.dokuwiki"},
      1 => {name: "punctuation.definition.tag.dokuwiki"},
      2 => {name: "entity.name.tag.dokuwiki"},
      3 => {name: "punctuation.definition.tag.dokuwiki"}},
    end: "(</)(html)(>)",
    patterns: [{include: "text.html.basic"}]},
   {match: /^((\s\s)|(\t))[^\*\-].*$/, name: "markup.raw.dokuwiki"},
   {begin: /(\<)(sub|sup|del)(\>)/,
    captures: 
     {0 => {name: "meta.tag.template.dokuwiki"},
      1 => {name: "punctuation.definition.tag.dokuwiki"},
      2 => {name: "entity.name.tag.dokuwiki"},
      3 => {name: "punctuation.definition.tag.dokuwiki"}},
    end: "(\\</)(\\2)(\\>)",
    name: "markup.other.dokuwiki",
    patterns: [{include: "#inline"}]},
   {begin: /(<)(code)(?:\s+[^>]*)?(>)/,
    captures: 
     {0 => {name: "meta.tag.template.code.dokuwiki"},
      1 => {name: "punctuation.definition.tag.dokuwiki"},
      2 => {name: "entity.name.tag.dokuwiki"},
      3 => {name: "punctuation.definition.tag.dokuwiki"}},
    end: "(</)(code)(>)",
    name: "markup.raw.dokuwiki"}],
 repository: 
  {inline: 
    {patterns: 
      [{begin: /\*\*/,
        captures: {0 => {name: "punctuation.definition.bold.dokuwiki"}},
        end: "\\*\\*",
        name: "markup.bold.dokuwiki",
        patterns: [{include: "#inline"}]},
       {begin: /\/\//,
        captures: {0 => {name: "punctuation.definition.italic.dokuwiki"}},
        end: "//",
        name: "markup.italic.dokuwiki",
        patterns: [{include: "#inline"}]},
       {begin: /__/,
        captures: {0 => {name: "punctuation.definition.underline.dokuwiki"}},
        end: "__",
        name: "markup.underline.dokuwiki",
        patterns: [{include: "#inline"}]},
       {captures: 
         {1 => {name: "punctuation.definition.image.dokuwiki"},
          2 => {name: "markup.underline.link.dokuwiki"},
          3 => {name: "punctuation.definition.image.dokuwiki"}},
        match: /(\{\{)(.+?)(\}\})/,
        name: "meta.image.inline.dokuwiki"},
       {captures: 
         {1 => {name: "punctuation.definition.link.dokuwiki"},
          2 => {name: "markup.underline.link.dokuwiki"},
          3 => {name: "punctuation.definition.link.dokuwiki"}},
        match: /(\[\[)(.*?)(\]\])/,
        name: "meta.link.dokuwiki"},
       {captures: 
         {1 => {name: "punctuation.definition.link.dokuwiki"},
          2 => {name: "markup.underline.link.interwiki.dokuwiki"},
          3 => {name: "punctuation.definition.link.dokuwiki"}},
        match: /(\[\[)([^\[\]]+\>[^|\]]+)(\]\])/},
       {captures: {1 => {name: "markup.underline.link.dokuwiki"}},
        match: 
         /((https?|telnet|gopher|wais|ftp|ed2k|irc):\/\/[\w\/\#~:.?+=&%@!\-;,]+?(?=[.:?\-;,]*[^\w\/\#~:.?+=&%@!\-;,]))/},
       {captures: 
         {1 => {name: "punctuation.definition.link.dokuwiki"},
          2 => {name: "markup.underline.link.dokuwiki"},
          3 => {name: "punctuation.definition.link.dokuwiki"}},
        match: /(<)([\w0-9\-_.]+?@[\w\-]+\.[\w\-\.]+\.*[\w]+)(\>)/,
        name: "meta.link.email.dokuwiki"}]},
   php: 
    {patterns: 
      [{include: "source.php"},
       {begin: /(^\s*)?(?=<php>)/,
        beginCaptures: 
         {1 => {name: "punctuation.whitespace.embedded.leading.dokuwiki"}},
        contentName: "meta.embedded.php",
        end: "(?<=</php>)(?!<php>)(\\s*$\\n?)",
        endCaptures: 
         {1 => {name: "punctuation.whitespace.embedded.trailing.dokuwiki"}},
        patterns: 
         [{begin: /((<)(php)(>))/,
           beginCaptures: 
            {0 => {name: "punctuation.definition.embedded.begin.dokuwiki"},
             1 => {name: "meta.tag.template.dokuwiki"},
             2 => {name: "punctuation.definition.tag.dokuwiki"},
             3 => {name: "entity.name.tag.dokuwiki"},
             4 => {name: "punctuation.definition.tag.dokuwiki"}},
           contentName: "source.php",
           end: "(((</))(php)(>))",
           endCaptures: 
            {0 => {name: "punctuation.definition.embedded.end.dokuwiki"},
             1 => {name: "meta.tag.template.dokuwiki"},
             2 => {name: "punctuation.definition.tag.dokuwiki"},
             3 => {name: "source.php"},
             4 => {name: "entity.name.tag.dokuwiki"},
             5 => {name: "punctuation.definition.tag.dokuwiki"}},
           patterns: [{include: "source.php"}]}]}]}},
 scopeName: "text.html.dokuwiki",
 uuid: "862D8B02-501E-4205-9DA4-FB7CDA7AE3DA"}