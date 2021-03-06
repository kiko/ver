# Encoding: UTF-8

[{content: "beginCaptures = {\n\t1 = { name = '$1'; };\n};",
  name: "Begin Captures",
  scope: "source.plist.tm-grammar",
  tabTrigger: "begcap",
  uuid: "3E5051E7-18CF-4BD4-89A5-045416831972"},
 {content: "captures = {\n\t1 = { name = '$1'; };\n};",
  name: "Captures",
  scope: "source.plist.tm-grammar",
  tabTrigger: "cap",
  uuid: "8C3D6E62-E865-4655-9B20-E3B95F07F9B6"},
 {content: "comment = '$0';",
  name: "Comment",
  scope: "source.plist.tm-grammar",
  tabTrigger: "com",
  uuid: "1CB08CB5-7CBE-4A5D-A69B-DC04244838C4"},
 {content: "contentName = '$1';",
  name: "Content Name",
  scope: "source.plist.tm-grammar",
  tabTrigger: "connam",
  uuid: "D738436A-B700-4299-A7D7-A242BDDF3A67"},
 {content: "disabled = 1;",
  name: "Disable",
  scope: "source.plist.tm-grammar",
  tabTrigger: "dis",
  uuid: "7534A315-9A3D-449B-9AD0-DE603A77C356"},
 {content: 
   "ENV['TM_${1:S}${1/^(S)|(B)$|.*/(?1:UPPORT_PATH:(?2:UNDLE_SUPPORT))/}']",
  name: "ENV['TM_…']",
  scope: "source.ruby",
  tabTrigger: "env",
  uuid: "19C1DA95-E682-4FE1-973F-00994065C520"},
 {content: "endCaptures = {\n\t1 = { name = '$1'; };\n};",
  name: "End Captures",
  scope: "source.plist.tm-grammar",
  tabTrigger: "endcap",
  uuid: "36B66AAB-42A5-4366-B7C1-790A749181D4"},
 {content: "''",
  keyEquivalent: "'",
  name: "Grammar - Single Quotes",
  scope: 
   "source.plist.tm-grammar string.quoted.single, source.plist.tm-grammar string.regexp.oniguruma.single",
  uuid: "012C6C9B-07CC-40B8-A10B-B95B253A94A1"},
 {content: "name = '$1';",
  name: "Name",
  scope: "source.plist.tm-grammar",
  tabTrigger: "nam",
  uuid: "EF6B4C87-F1A9-4D06-8712-587857CC3D5E"},
 {content: "patterns = (\n\t$0\n);",
  name: "Patterns",
  scope: "source.plist.tm-grammar",
  tabTrigger: "pat",
  uuid: "4AB06A04-02CF-4E7B-9E7E-07747A68160C"},
 {content: "${1:rule_name} = {\n\tpatterns = (\n\t\t$0\n\t);\n};",
  name: "Patterns (Repository)",
  scope: 
   "source.plist.tm-grammar meta.dictionary.repository -meta.value-pair.repository-item",
  tabTrigger: "pat",
  uuid: "D07ABF67-A3E1-4454-BAEE-FF5C349CB049"},
 {content: "repository = {\n\t${1:rule_name} = {\n\t\t$0\n\t};\n};",
  name: "Repository",
  scope: "source.plist.tm-grammar",
  tabTrigger: "rep",
  uuid: "A9191F2E-8FAC-41B9-B729-9663E42452DD"},
 {content: 
   "require ENV['TM_${1:S}${1/^(S)|(B)$|.*/(?1:UPPORT_PATH:(?2:UNDLE_SUPPORT))/}'] + '/lib/$2'",
  name: "Require 'Support/lib/…'",
  scope: "source.ruby",
  tabTrigger: "sup",
  uuid: "526FEEF9-9C52-4165-B814-7DAB441084D5"},
 {content: "{\tname = '${1:name}';\n\tbegin = '$2';\n\tend = '$3';\n},",
  name: "Rule — Begin / End",
  scope: "source.plist.tm-grammar meta.array.patterns",
  tabTrigger: "beg",
  uuid: "0D8A14ED-0701-4AD8-8A9C-15AD1BA60D8D"},
 {content: "begin = '$1';\nend = '$2';",
  name: "Rule — Begin / End (Inside Rule)",
  scope: "source.plist.tm-grammar meta.dictionary.rule",
  tabTrigger: "beg",
  uuid: "1473BF02-466B-4F5F-B694-81703E4B6E76"},
 {content: 
   "${1:rule_name} = {\n\tname = '${2:name}';\n\tbegin = '$3';\n\tend = '$4';\n};",
  name: "Rule — Begin / End (Repository)",
  scope: 
   "source.plist.tm-grammar meta.dictionary.repository -meta.value-pair.repository-item",
  tabTrigger: "beg",
  uuid: "A611946B-D67F-4B16-ABC7-ECBBCC0F6331"},
 {content: "{\tinclude = '$1'; },",
  name: "Rule — Include",
  scope: "source.plist.tm-grammar",
  tabTrigger: "inc",
  uuid: "D5BA7FE7-543F-47FC-BECD-750200B81762"},
 {content: "{\tname = '${1:name}';\n\tmatch = '${2:pattern}';\n},",
  name: "Rule — Match",
  scope: "source.plist.tm-grammar meta.array.patterns",
  tabTrigger: "mat",
  uuid: "D9B7683F-308C-4A42-92FB-6DFC06240A92"},
 {content: "match = '${1:pattern}';",
  name: "Rule — Match (Inside Rule)",
  scope: "source.plist.tm-grammar meta.dictionary.rule",
  tabTrigger: "mat",
  uuid: "C145B244-D9A6-43C6-9011-B84D00F7FE96"},
 {content: 
   "${1:rule_name} = {\n\tname = '${2:name}';\n\tmatch = '${3:pattern}';\n};",
  name: "Rule — Match (Repository)",
  scope: 
   "source.plist.tm-grammar meta.dictionary.repository -meta.value-pair.repository-item",
  tabTrigger: "mat",
  uuid: "FD59E166-A9BD-40FD-821F-E8AFEA5175A0"}]
