# Encoding: UTF-8

[{content: ".FALSE.",
  name: ".FALSE.",
  scope: "source.fortran",
  tabTrigger: "F",
  uuid: "EC40FA8C-65A9-40B6-9A5E-FC681755FADD"},
 {content: ".TRUE.",
  name: ".TRUE.",
  scope: "source.fortran",
  tabTrigger: "T",
  uuid: "9A5E1955-62E4-4BA4-937B-A76B402D0825"},
 {content: 
   "allocate(${1:array}, stat=${2:err})\nif ($2 /= 0) print *, \"${1/(\\w+).*/$1/}: Allocation request denied\"\n",
  name: "Allocate Array",
  scope: "source.fortran",
  tabTrigger: "al",
  uuid: "51F171BF-D317-4510-A0E1-22565AFFDF55"},
 {content: 
   "allocate(${1:array}, stat=${2:err})\nif ($2 /= 0) print *, \"${1/(\\w+).*/$1/}: Allocation request denied\"\n\n$0if (allocated(${1/(\\w+).*/$1/})) deallocate(${1/(\\w+).*/$1/}, stat=$2)\nif ($2 /= 0) print *, \"${1/(\\w+).*/$1/}: Deallocation request denied$0\"",
  name: "Allocate and Deallocate array",
  scope: "source.fortran",
  tabTrigger: "alloc",
  uuid: "718929E8-73E2-4B9F-B430-0888D5971952"},
 {content: ".and.",
  name: "And",
  scope: "source.fortran",
  tabTrigger: "and",
  uuid: "3537B123-DB04-475A-8B8A-A5D223872FC1"},
 {content: 
   "character(len=$1${2:, kind=$3})${4:, ${5:attributes}} :: ${6:name}",
  name: "Character",
  scope: "source.fortran",
  tabTrigger: "char",
  uuid: "0D6B27F6-93D7-46FC-ABC5-658D26D13A2C"},
 {content: 
   "close(unit=${1:iounit}, iostat=${2:ios}${3:, status=\"delete\"})\nif ( $2 /= 0 ) stop \"Error closing file unit $1\"\n",
  name: "Close File",
  scope: "source.fortran",
  tabTrigger: "close",
  uuid: "B011EFC4-3A9A-4A42-AEAC-B8766008B828"},
 {content: "type(${1:type name})${2:, ${3:attributes}} :: ${4:name}",
  name: "Custom Type",
  scope: "source.fortran",
  tabTrigger: "typ",
  uuid: "C7F4ECBD-46FE-4E88-A6C6-2F645B319821"},
 {content: 
   "if (allocated($1)) deallocate(${1:array}, stat=${2:err})\nif ($2 /= 0) print *, \"$1: Deallocation request denied$0\"",
  name: "Deallocate Array",
  scope: "source.fortran",
  tabTrigger: "deal",
  uuid: "8AA9DF85-9F20-417E-A71A-5B5BC555B0AA"},
 {content: "dot_product($1,$2)",
  name: "Dot Product of Vectors",
  scope: "source.fortran",
  tabTrigger: "dot",
  uuid: "F05CAEAE-2DBC-45F9-A83C-A41378159D5C"},
 {content: ".eq.",
  name: "Equal",
  scope: "source.fortran",
  tabTrigger: "eq",
  uuid: "2316E789-8E34-4874-A517-6BF8E52ECC4C"},
 {content: ".eqv.",
  name: "Equality",
  scope: "source.fortran",
  tabTrigger: "eqv",
  uuid: "0123B289-0889-41AA-839A-F7F2D6154723"},
 {content: ".gt.",
  name: "Greater Than",
  scope: "source.fortran",
  tabTrigger: "gt",
  uuid: "7526D521-2CF7-4436-9D11-824B76D424F6"},
 {content: ".ge.",
  name: "Greater or Equal",
  scope: "source.fortran",
  tabTrigger: "ge",
  uuid: "BFF92277-2A0B-40E1-A896-9DB8C1C69036"},
 {content: "(${1:i}, $1 = ${2:1}, ${3:100}, ${4:1})$0",
  name: "Implied do",
  scope: "source.fortran",
  tabTrigger: "ido",
  uuid: "35ECB83E-D696-4441-989A-AAAF9E63F156"},
 {content: "maxloc(${1:source}${2:, mask=${3:($1>0)}})",
  name: "Index of Maximum",
  scope: "source.fortran",
  tabTrigger: "maxloc",
  uuid: "5092CD14-3CCC-4EC2-B8F1-09A5277977F9"},
 {content: "minloc(${1:source}${2:, mask=${3:$1>0}})",
  name: "Index of Minimum",
  scope: "source.fortran",
  tabTrigger: "minloc",
  uuid: "F0A4E40E-C92B-44B8-AFD8-CB15E94C81F1"},
 {content: 
   "open(unit=${1:iounit}, file=${2:name}, iostat=${3:ios}, status=\"${4:old}\", action=\"${5:read}\")\nif ( $3 /= 0 ) stop \"Error opening file ${2/[\\\"\\'](.*)[\\\"\\']/$1/}\"\n",
  name: "Input File",
  scope: "source.fortran",
  tabTrigger: "open",
  uuid: "20CAACE7-E2D8-4233-8F1E-0ABA182047D4"},
 {content: 
   "inquire(file=${1:filename}, opened=${2:ioopen}, exists=${3:ioexist}, number=${4:iounit})",
  name: "Inquire (by Filename)",
  scope: "source.fortran",
  tabTrigger: "inq",
  uuid: "1A5B5A09-1080-48CF-A4C3-3F81ACE69074"},
 {content: 
   "inquire(unit=${1:iounit}, opened=${2:ioopen}, name=${3:filename}, action=${4:ioaction})",
  name: "Inquire (by Unit)",
  scope: "source.fortran",
  tabTrigger: "inq",
  uuid: "60090CCF-B104-47B5-BCB8-E2811EBA9CCF"},
 {content: "integer${1:(${2:kind})}${3:, ${4:attributes}} :: ${5:name}",
  name: "Integer",
  scope: "source.fortran",
  tabTrigger: "int",
  uuid: "F3344347-B9EF-4574-B15E-22170D50D850"},
 {content: ".lt.",
  name: "Less Than",
  scope: "source.fortran",
  tabTrigger: "lt",
  uuid: "F8C2C9C2-B317-43E4-AEFD-AFF17B85728F"},
 {content: ".le.",
  name: "Less or Equal",
  scope: "source.fortran",
  tabTrigger: "le",
  uuid: "F19E59C4-7D5F-4EA8-A29A-F144F4F2AC85"},
 {content: " &\n",
  keyEquivalent: "^\n",
  name: "Line Continuation",
  scope: "source.fortran",
  uuid: "0B000E20-A4F2-495A-B0B1-242851333225"},
 {content: "logical${1:(${2:kind})}${3:, ${4:attributes}} :: ${5:name}",
  name: "Logical",
  scope: "source.fortran",
  tabTrigger: "log",
  uuid: "6DBAE3F7-1B5A-4999-9246-E2A12A7C5555"},
 {content: "lbound(${1:source}${2:, dim=${3:1}})",
  name: "Lower Bound",
  scope: "source.fortran",
  tabTrigger: "lbound",
  uuid: "1757DE15-4544-482C-89DC-0781E39A7F87"},
 {content: "matmul($1,$2)",
  name: "Matrix Multiplication",
  scope: "source.fortran",
  tabTrigger: "mat",
  uuid: "E8684191-D405-4BD8-BCEB-8BC9E150550B"},
 {content: "maxval(${1:source}${2:, dim=${3:1}}${4:, mask=${5:($1>0)}})",
  name: "Maximum Value",
  scope: "source.fortran",
  tabTrigger: "maxval",
  uuid: "8781D199-2E4E-4D11-BFF3-F8729D9523C1"},
 {content: "minval(${1:source}${2:, dim=${3:1}}${4:, mask=${5:($1>0)}})",
  name: "Minimum Value",
  scope: "source.fortran",
  tabTrigger: "minval",
  uuid: "4AD4A84B-5110-4B49-9E0F-88B08A5AAF97"},
 {content: ".neqv.",
  name: "Non-Equality",
  scope: "source.fortran",
  tabTrigger: "neqv",
  uuid: "3B8BB0B3-CEE1-496B-B844-465F49C038E6"},
 {content: ".not.",
  name: "Not",
  scope: "source.fortran",
  tabTrigger: "not",
  uuid: "76A04572-9358-499C-B2E3-5E96445441E2"},
 {content: 
   "open(unit=${1:iounit}, file=${2:name}, iostat=${3:ios}, &\n     status=\"${4:old/new/replace/scratch/unknown}\", action=\"${5:read/write/readwrite}\", access=\"${7:sequential/direct}\"${7/(direct)$|.*/(?1:, recl=)/}$0)\nif ( $3 /= 0 ) stop \"Error opening file ${2/[\\\"\\'](.*)[\\\"\\']/$1/}\"",
  name: "Open File",
  scope: "source.fortran",
  tabTrigger: "open",
  uuid: "48F02C1F-F6FA-444F-8CE7-7B81C7A7344B"},
 {content: ".or.",
  name: "Or",
  scope: "source.fortran",
  tabTrigger: "or",
  uuid: "536D0C28-DD04-4B0C-8B22-61649F607322"},
 {content: 
   "open(unit=${1:iounit}, file=${2:name}, iostat=${3:ios}, status=\"${4:new}\", action=\"${5:write}\")\nif ( $3 /= 0 ) stop \"Error opening file ${2/[\\\"\\'](.*)[\\\"\\']/$1/}\"\n",
  name: "Output File",
  scope: "source.fortran",
  tabTrigger: "open",
  uuid: "9AA512D2-E341-4F05-A2BB-EBB339E3B187"},
 {content: "product(${1:source}${2:, dim=${3:1}}${4:, mask=${5:($1>0)}})",
  name: "Product of Elements",
  scope: "source.fortran",
  tabTrigger: "prod",
  uuid: "3D90E5F6-5002-4E48-B1C1-4C9E62DF24AF"},
 {content: "character(len=*) :: ",
  name: "Quick Character",
  scope: "source.fortran",
  tabTrigger: "c",
  uuid: "670364D4-4FAD-4A3B-949C-1A68F43FCDA1"},
 {content: "type(${1:type name}) :: ",
  name: "Quick Custom Type",
  scope: "source.fortran",
  tabTrigger: "t",
  uuid: "1503AED6-304A-423E-AEC6-BE6836EBB720"},
 {content: "integer :: ",
  name: "Quick Integer",
  scope: "source.fortran",
  tabTrigger: "i",
  uuid: "34C0C62D-B2EC-4C39-B072-CCA5EBEC9B8C"},
 {content: "logical :: ",
  name: "Quick Logical",
  scope: "source.fortran",
  tabTrigger: "l",
  uuid: "C2434FF9-D70D-4C85-A93A-9CDC637FE633"},
 {content: 
   "open(unit=${1:iounit}, file=${2:name}, iostat=${3:ios})\nif ( $3 /= 0 ) stop \"Error opening file ${2/[\\\"\\'](.*)[\\\"\\']/$1/}\"",
  name: "Quick Open",
  scope: "source.fortran",
  tabTrigger: "op",
  uuid: "B118C813-3B21-49DB-8EEB-323CBAADBE00"},
 {content: "print*, ",
  name: "Quick Print",
  scope: "source.fortran",
  tabTrigger: "pr",
  uuid: "B907E3F4-F0DD-41BF-8148-98486B9F7654"},
 {content: "read*, ",
  name: "Quick Read",
  scope: "source.fortran",
  tabTrigger: "re",
  uuid: "397592DB-34D9-45B6-AD23-F2E88FEB36C9"},
 {content: "real :: ",
  name: "Quick Real",
  scope: "source.fortran",
  tabTrigger: "r",
  uuid: "C5AD4DF9-76C8-45A2-9705-6A31AD084007"},
 {content: "write(unit=${1:iounit}, fmt=*) ${0:variables}\n",
  name: "Quick Write",
  scope: "source.fortran",
  tabTrigger: "wr",
  uuid: "87B37A6D-B542-4502-94CA-521A92E056D6"},
 {content: "call random_number($0)",
  name: "Random Number",
  scope: "source.fortran",
  tabTrigger: "rn",
  uuid: "2186372D-4DFE-424D-B7CC-81686816FBEB"},
 {content: "call random_seed(${1:size=${2:<int>}}${3:put=(/$4/)})",
  name: "Random Seed",
  scope: "source.fortran",
  tabTrigger: "rs",
  uuid: "9D750E6B-948F-4913-9710-A3EAD3B9F804"},
 {content: 
   "read(unit=${1:iounit}, fmt=\"(${2:format string})\", iostat=${3:istat}) ${4:variables}\nif ( $3 /= 0 ) stop \"Read error in file unit $1\"\n",
  name: "Read",
  scope: "source.fortran",
  tabTrigger: "read",
  uuid: "C1A0A9D5-9D5D-479C-B079-7C4FB7ACD700"},
 {content: 
   "read(unit=${1:iounit}, fmt=\"(${2:format string})\", iostat=${3:istat}, advance='NO', size=${4:number of characters}) ${5:variables}\nif ( $3 /= 0 ) stop \"Read error in file unit $1\"\n",
  name: "Read (Non Advancing Mode)",
  scope: "source.fortran",
  tabTrigger: "read",
  uuid: "C93DF526-E933-4560-B63A-8E1CE6196FB7"},
 {content: "real${1:(${2:kind})}${3:, ${4:attributes}} :: ${5:name}",
  name: "Real",
  scope: "source.fortran",
  tabTrigger: "rea",
  uuid: "819B3AC9-225F-4699-A0F7-7ECBEE895AD2"},
 {content: 
   "open(unit=${1:iounit}, iostat=${3:ios}, status=\"${4:scratch}\", action=\"${5:readwrite}\")\nif ( $3 /= 0 ) stop \"Error opening scratch file on unit $1\"\n",
  name: "Scratch File",
  scope: "source.fortran",
  tabTrigger: "open",
  uuid: "3693BFC4-76F5-4ED3-837B-BD383BBAC5B0"},
 {content: "size(${1:source}${2:, dim=${3:1}})",
  name: "Size",
  scope: "source.fortran",
  tabTrigger: "size",
  uuid: "CA4E14B0-9F08-40F4-A7D9-61E9E7192FD4"},
 {content: "sum(${1:source}${2:, dim=${3:1}}${4:, mask=${5:($1>0)}})",
  name: "Sum of Elements",
  scope: "source.fortran",
  tabTrigger: "sum",
  uuid: "06C627D7-EB49-4FDF-A2B6-C9CC7CE97241"},
 {content: "type ${1:type name}\n\t$0\nend type $1",
  name: "Type Definition",
  scope: "source.fortran",
  tabTrigger: "type",
  uuid: "03298138-1221-4FF3-A6E6-C3F016CEA132"},
 {content: "ubound(${1:source}${2:, dim=${3:1}})",
  name: "Upper Bound",
  scope: "source.fortran",
  tabTrigger: "ubound",
  uuid: "EDA18DD2-F08C-44BF-90C1-A5FC7E55E909"},
 {content: "(/ $TM_SELECTED_TEXT$0 /)",
  keyEquivalent: "@A",
  name: "Wrap Selection in Array Brackets",
  scope: "source.fortran",
  uuid: "E5E4BACF-96DD-43EF-A400-D7D3F6ABBF85"},
 {content: 
   "write(unit=${1:iounit}, fmt=\"(${2:format string})\", iostat=${3:ios}${4:, advance='NO'}) ${5:variables}\nif ( $3 /= 0 ) stop \"Write error in file unit $1\"\n",
  name: "Write",
  scope: "source.fortran",
  tabTrigger: "write",
  uuid: "A96BC9D7-5A5C-413C-8F3D-8155F98CCC79"},
 {content: "all(${1:mask}${2:, dim=${3:1}})",
  name: "all",
  scope: "source.fortran",
  tabTrigger: "all",
  uuid: "93FA9EEB-7A4E-4907-B723-A2B379FCA041"},
 {content: "any(${1:mask}${2:, dim=${3:1}})",
  name: "any",
  scope: "source.fortran",
  tabTrigger: "any",
  uuid: "ABBFB45A-CA54-4812-A2AC-732C52D78953"},
 {content: "case ${1:default}\n\t$0",
  name: "case",
  scope: "source.fortran",
  tabTrigger: "case",
  uuid: "9C4F8960-34D5-4BE1-9CC0-91E6C67E7622"},
 {content: "count(${1:mask}${2:, dim=${3:1}})",
  name: "count",
  scope: "source.fortran",
  tabTrigger: "count",
  uuid: "73D0556C-56DB-4BCD-ABBC-456B77BEAB7E"},
 {content: "cycle",
  name: "cycle",
  scope: "source.fortran",
  tabTrigger: "cy",
  uuid: "CDED87E6-BD6D-4EA4-8649-10B1D7103A6F"},
 {content: "data ${1:variable} / ${2:data} /",
  name: "data",
  scope: "source.fortran",
  tabTrigger: "data",
  uuid: "A20B45D5-F448-410D-B9CD-FA6AC4F174D6"},
 {content: "do${1: ${2:i} = ${3:1}, ${4:100}, ${5:1}}\n\t$0\nend do",
  name: "do",
  scope: "source.fortran",
  tabTrigger: "do",
  uuid: "7A9D5F06-1CB9-46EF-9E93-C33A08BCC84D"},
 {content: "do while ( ${1:condition} )\n\t$0\nend do",
  name: "do while",
  scope: "source.fortran",
  tabTrigger: "dow",
  uuid: "6136E9F7-7683-43E8-94F8-535CBE8045CD"},
 {content: "elseif ( ${1:condition} ) then\n\t",
  name: "elseif",
  scope: "source.fortran",
  tabTrigger: "elif",
  uuid: "E3CB3696-76E6-45E5-B3BD-98D6C412FB8E"},
 {content: "forall (${1:i=1:100}${2:, mask})\n\t$0\nend forall",
  name: "forall",
  scope: "source.fortran.modern",
  tabTrigger: "for",
  uuid: "BFF323CA-733A-41FD-A9EB-F32B84A77870"},
 {content: 
   "function ${1:name}\n\t${2:argument type}, intent(${3:inout}) :: ${1/\\w+\\((.*)\\)|.*/$1/}\n\t${4:function type} :: ${1/(\\w+).*/$1/}\n\t$0\nend function ${1/(\\w+).*/$1/}",
  name: "function",
  scope: "source.fortran",
  tabTrigger: "fun",
  uuid: "F08951B5-CAC2-4373-9422-8588D0F1E742"},
 {content: "if ( ${1:condition} ) then\n\t$0\nend if",
  name: "if",
  scope: "source.fortran",
  tabTrigger: "if",
  uuid: "93DAD02F-8CF5-413A-8C43-8574AABEF998"},
 {content: "if ( ${1:condition} ) ",
  name: "if (single line)",
  scope: "source.fortran",
  tabTrigger: "if",
  uuid: "3EE70024-01D5-46E1-A8FE-15A02D31C999"},
 {content: "implicit none\n",
  name: "implicit none",
  scope: "source.fortran",
  tabTrigger: "imp",
  uuid: "097FA6C9-28FE-4A55-9FC6-0116074ED962"},
 {content: "interface ${1:name}\n\t$0\nend interface ! $1",
  name: "interface",
  scope: "source.fortran",
  tabTrigger: "interf",
  uuid: "358E0BE9-B020-4932-A421-79F269CE10A1"},
 {content: "max($1, $2${, $3:...})$0",
  name: "max",
  scope: "source.fortran",
  tabTrigger: "max",
  uuid: "450D663B-E62D-45BA-B194-D2C560A886B8"},
 {content: "merge(${1:source}, ${2:alternative}, mask=(${2:$1>0}))",
  name: "merge",
  scope: "source.fortran",
  tabTrigger: "merge",
  uuid: "61F063A9-1F71-4748-97ED-DB2E8DC4E8F5"},
 {content: "min($1, $2${, $3:...})$0",
  name: "min",
  scope: "source.fortran",
  tabTrigger: "min",
  uuid: "8814A6E1-7A85-4313-A75A-1D83EC1A9CD7"},
 {content: "module ${1:name}\n\n\timplicit none\n\t$0\n\nend module $1\n",
  name: "module",
  scope: "source.fortran",
  tabTrigger: "mod",
  uuid: "BE566EAC-E0C9-4922-99CC-AE5349751A5C"},
 {content: "module procedure ${0:name}",
  name: "module procedure",
  scope: "source.fortran",
  tabTrigger: "mp",
  uuid: "212C550B-1D28-4713-BF75-F660254D04C4"},
 {content: 
   "${1:name}: do${2: ${3:i} = ${4:1}, ${5:100}, ${6:1}}\n\t$0\nend do $1",
  name: "named: do",
  scope: "source.fortran",
  tabTrigger: "ndo",
  uuid: "5F5CE350-E65B-4A12-9DE4-7F520EA7CEDA"},
 {content: 
   "${1:name}: select case ($2:variable)\n\tcase ($3:values) $1\n\t\t$0\nend select $1",
  name: "named: select case",
  scope: "source.fortran",
  tabTrigger: "nsel",
  uuid: "883F17D6-1CC0-4D5F-8F47-0A57E59BAEE5"},
 {content: 
   "pack(${1:array}, mask=(${2:$1>0})${3:, vector=${4:destination vector}})",
  name: "pack",
  scope: "source.fortran",
  tabTrigger: "pack",
  uuid: "BCB3E520-B100-4B1D-9DAE-62D0FEB1EA52"},
 {content: "program ${1:name}\n\n\timplicit none\n\t$0\n\nend program $1\n",
  name: "program",
  scope: "source.fortran",
  tabTrigger: "prog",
  uuid: "3CE33649-97AE-4497-BFA0-FA79AAEB5EE0"},
 {content: 
   "reshape(${1:source}${2:, shape=(/$3/)}${4:, pad=(/$5/)}${6:, order=(/${7:2,1}/)})",
  name: "reshape",
  scope: "source.fortran",
  tabTrigger: "resh",
  uuid: "41715FAB-5954-4B10-A092-3FC9FA3E3D67"},
 {content: "select case ($1:variable)\n\tcase ($2:values)\n\t\t$0\nend select",
  name: "select case",
  scope: "source.fortran",
  tabTrigger: "sel",
  uuid: "37641F82-864C-4FE5-B93B-7B9FC13166BB"},
 {content: "spread(${1:source}, dim=${2:1}, ncopies=$3)",
  name: "spread",
  scope: "source.fortran",
  tabTrigger: "spread",
  uuid: "7331B9EE-F03D-4472-9243-992184B260A6"},
 {content: "stop \"${1:message}\"",
  name: "stop",
  scope: "source.fortran",
  tabTrigger: "stop",
  uuid: "7F2C2B22-50AA-49D5-A432-C8CDE12EDB09"},
 {content: 
   "subroutine ${1:name}\n\t${2:argument type}, intent(${3:inout}) :: ${1/\\w+\\((.*)\\)|.*/$1/}\n\t$0\nend subroutine ${1/(\\w+).*/$1/}",
  name: "subroutine",
  scope: "source.fortran",
  tabTrigger: "sub",
  uuid: "73DCA7B1-1444-418A-89ED-6F44B061538F"},
 {content: 
   "unpack(${1:vector}, mask=(${2:$1>0}), field=${3:destination array})",
  name: "unpack",
  scope: "source.fortran",
  tabTrigger: "unpack",
  uuid: "FFB7CA04-CB4B-4303-BF2A-CFD69A8665FA"},
 {content: "where ( $1 ${2:==} $3 )\n\t$0\nend where",
  name: "where",
  scope: "source.fortran",
  tabTrigger: "whe",
  uuid: "EDEB3A12-66A0-435B-A15D-28C18444A242"},
 {content: "where ( $1 ${2:==} $3 ) ",
  name: "where (single line)",
  scope: "source.fortran",
  tabTrigger: "wh",
  uuid: "663FC26D-BEC6-4B64-8704-502E7348CABD"}]
