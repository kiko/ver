# Encoding: UTF-8

[{content: "(${0:object}):",
  keyEquivalent: "(",
  name: "Inside Class Def: Insert (..):",
  scope: 
   "source.python meta.class.python invalid.illegal.missing-inheritance.python",
  uuid: "8CE4655C-3BAE-489F-BF42-89FB6B4C4119"},
 {content: "($0):",
  keyEquivalent: "(",
  name: "Inside Function Def: Insert (..):",
  scope: 
   "source.python meta.function.python invalid.illegal.missing-parameters.python",
  uuid: "09C00F1F-859E-455D-BD1B-C8F48CEFB078"},
 {content: "\"$0\"",
  keyEquivalent: "\"",
  name: "Inside String: Insert \"…\"",
  scope: 
   "source.python string.quoted.double.single-line meta.empty-string.double",
  uuid: "44F64180-F86E-4980-895A-2994B0EEDB5D"},
 {content: "'$0'",
  keyEquivalent: "'",
  name: "Inside String: Insert '…'",
  scope: 
   "source.python string.quoted.single.single-line meta.empty-string.single",
  uuid: "1BAD838C-8B2A-45FD-9AD2-7F3DCA2DD388"},
 {content: 
   "class ${1:ClassName}(${2:object}):\n\t${3/.+/\"\"\"/}${3:docstring for $1}${3/.+/\"\"\"\\n/}${3/.+/\\t/}def __init__(self${4/([^,])?(.*)/(?1:, )/}${4:arg}):\n\t\t${5:super($1, self).__init__()}\n${4/(\\A\\s*,\\s*\\Z)|,?\\s*([A-Za-z_][a-zA-Z0-9_]*)\\s*(=[^,]*)?(,\\s*|$)/(?2:\\t\\tself.$2 = $2\\n)/g}\t\t$0",
  name: "New Class",
  scope: "source.python",
  tabTrigger: "class",
  uuid: "659D189C-EC3E-4C4E-9377-B7F5F5216CBD"},
 {content: 
   "def ${1:fname}(${2:`if [ \"$TM_CURRENT_LINE\" != \"\" ]\n\t\t\t\t# poor man's way ... check if there is an indent or not\n\t\t\t\t# (cuz we would have lost the class scope by this point)\n\t\t\t\tthen\n\t\t\t\t\techo \"self\"\n\t\t\t\tfi`}):\n\t${3/.+/\"\"\"/}${3:docstring for $1}${3/.+/\"\"\"\\n/}${3/.+/\\t/}${0:pass}",
  name: "New Function",
  scope: "source.python",
  tabTrigger: "def",
  uuid: "6499BB56-7BB5-11D9-8E83-000D93B6E43C"},
 {content: "def ${1:mname}(self${2/([^,])?.*/(?1:, )/}${2:arg}):\n\t${3:pass}",
  name: "New Method",
  scope: "source.python",
  tabTrigger: "defs",
  uuid: "70E8843A-A8C0-44FC-ACF3-3DEAE48AE784"},
 {content: 
   "def ${1:foo}():\n    doc = \"${2:The $1 property.}\"\n    def fget(self):\n        ${3:return self._$1}\n    def fset(self, value):\n        ${4:self._$1 = value}\n    def fdel(self):\n        ${5:del self._$1}\n    return locals()\n$1 = property(**$1())$0",
  name: "New Property",
  scope: "source.python",
  tabTrigger: "property",
  uuid: "195B332F-4464-4539-9FB3-D89152C960DC"},
 {content: 
   "try:\n\t${1:pass}\nexcept ${2:Exception}, ${3:e}:\n\t${4:raise $3}",
  name: "Try/Except",
  scope: "source.python",
  tabTrigger: "try",
  uuid: "495317BD-13D7-46F9-8A2F-8D234653A3F0"},
 {content: 
   "try:\n\t${1:pass}\nexcept ${2:Exception}, ${3:e}:\n\t${4:raise $3}\nelse:\n\t${5:pass}",
  name: "Try/Except/Else",
  scope: "source.python",
  tabTrigger: "try",
  uuid: "4D382FF4-C740-4250-B4AE-7299DD6B4D3A"},
 {content: 
   "try:\n\t${1:pass}\nexcept${2: ${3:Exception}, ${4:e}}:\n\t${5:raise}\nelse:\n\t${6:pass}\nfinally:\n\t${7:pass}",
  name: "Try/Except/Else/Finally",
  scope: "source.python",
  tabTrigger: "try",
  uuid: "2FB8153A-1ABE-44A7-A760-763BA141724B"},
 {content: 
   "try:\n\t${1:pass}\nexcept ${2:Exception}, ${3:e}:\n\t${4:raise $3}\nfinally:\n\t${5:pass}",
  name: "Try/Except/Finally",
  scope: "source.python",
  tabTrigger: "try",
  uuid: "EEFC5039-2CD4-4CAA-BCCC-41011864596E"},
 {content: "__${1:init}__",
  name: "__magic__",
  scope: "source.python",
  tabTrigger: "__",
  uuid: "2E4E82B5-7E7A-4E23-B095-799DDCDB8F75"},
 {content: "if __name__ == '__main__':\n\t${1:main()}$0",
  name: "if __name__ == '__main__'",
  scope: "source.python",
  tabTrigger: "ifmain",
  uuid: "FD868CF0-FEF8-471B-BB6D-F2D7F54F71F3"},
 {content: "self.",
  name: "self",
  scope: "source.python",
  tabTrigger: ".",
  uuid: "E8128DB6-AF28-4ABA-A1EE-334584D19BE5"}]
