# Encoding: UTF-8

[{content: 
   "class ${1:ReverseTo}\n  def initialize($3)\n    @$3 = $3\n  end\n\n  def matches?(actual)\n    @actual = actual\n    # Satisfy expectation here. Return false or raise an error if it's not met.\n    ${0:@actual.reverse.should == @$3}\n    true\n  end\n\n  def failure_message\n    \"expected \#{@actual.inspect} to $2 \#{@$3.inspect}, but it didn't\"\n  end\n\n  def negative_failure_message\n    \"expected \#{@actual.inspect} not to $2 \#{@$3.inspect}, but it did\"\n  end\nend\n\ndef ${2:reverse_to}(${3:expected})\n  $1.new($3)\nend",
  name: "Custom Matcher",
  scope: "source.ruby.rspec",
  tabTrigger: "mat",
  uuid: "55BF6C99-B4C4-4772-B7DC-0A18407E429C"},
 {content: "require File.dirname(__FILE__) + '/../spec_helper'",
  name: "Require spec_helper",
  scope: "source.ruby.rspec",
  tabTrigger: "resh",
  uuid: "DAD2B74D-2105-42B0-9FC5-466F3B3D0DB7"},
 {content: 
   "Story \"${1:title}\", %{\n  As a${2:role}\n  I want ${3:feature}\n  So that ${4:value}  \n} do\nend",
  name: "Story",
  scope: "source.ruby.rspec",
  tabTrigger: "st",
  uuid: "73A67D49-CA5B-4B8A-9B62-003506276CDD"},
 {content: "after(${1::each}) do\n  $0\nend",
  name: "after",
  scope: "source.ruby.rspec",
  tabTrigger: "aft",
  uuid: "1201777F-3AC4-4B2A-9A46-C215F891B07A"},
 {content: "and_raise(${1:exception})",
  name: "and_raise",
  scope: "source.ruby.rspec",
  tabTrigger: "anr",
  uuid: "65B85B0D-26FC-4A08-8D6A-7BF00AA787FC"},
 {content: "and_return(${1:value})",
  name: "and_return with args",
  scope: "source.ruby.rspec",
  tabTrigger: "anra",
  uuid: "804A1B15-0756-438F-892F-2B72BE4490F0"},
 {content: "and_return { $1 }",
  name: "and_return with block",
  scope: "source.ruby.rspec",
  tabTrigger: "anrb",
  uuid: "C57E9EFD-3FE7-40ED-832E-DD812D1FB769"},
 {content: "and_throw(${1:sym})",
  name: "and_throw",
  scope: "source.ruby.rspec",
  tabTrigger: "ant",
  uuid: "2CC293EE-496A-4B66-928C-332DDCBEE884"},
 {content: "and_yield(${1:values})",
  name: "and_yield",
  scope: "source.ruby.rspec",
  tabTrigger: "any",
  uuid: "ED3A9BE5-8695-44FF-9B6B-A7FF4C13727C"},
 {content: "any_number_of_times",
  name: "any_number_of_times",
  scope: "source.ruby.rspec",
  tabTrigger: "annot",
  uuid: "D5E64C38-9CBC-4825-9A66-5718DA91AAD6"},
 {content: "at_least(${1:n}).times",
  name: "at_least",
  scope: "source.ruby.rspec",
  tabTrigger: "atl",
  uuid: "F2FDA911-B713-4788-81BF-EF33E9A4FB26"},
 {content: "at_most(${1:n}).times",
  name: "at_most",
  scope: "source.ruby.rspec",
  tabTrigger: "atm",
  uuid: "9A891C8D-4285-4C7D-BA03-6CA50A89F9C0"},
 {content: "before(${1::each}) do\n  $0\nend",
  name: "before",
  scope: "source.ruby.rspec",
  tabTrigger: "bef",
  uuid: "7D960FC5-4859-4328-A06B-73A3CF6763E0"},
 {content: "controller_name :${1:controller}",
  name: "controller_name",
  scope: "source.ruby.rspec",
  tabTrigger: "conn",
  uuid: "57374EB7-6CCE-4281-97A7-289905315351"},
 {content: 
   "require File.dirname(__FILE__) + '/../spec_helper'\n\ndescribe ${1:controller} do\n  $0\nend",
  name: "describe (Controller)",
  scope: "source.ruby.rspec",
  tabTrigger: "desc",
  uuid: "FC8C2948-3653-41B3-965A-5D0B7C64CB41"},
 {content: 
   "describe ${1:controller}, \"${2:GET|POST|PUT|DELETE} ${3:/some/path}${4: with some parameters}\" do\n  $0\nend",
  name: "describe (RESTful Controller)",
  scope: "source.ruby.rspec",
  tabTrigger: "desrc",
  uuid: "0ED99C84-1F7B-471E-BB88-B59C5D08FA6B"},
 {content: 
   "describe \"${1:description}\" do\n  it \"should ${2:description}\" do\n    $0\n  end\nend",
  name: "describe (String)",
  scope: "source.ruby.rspec",
  tabTrigger: "des",
  uuid: "34CBBD13-CE8E-4601-9968-C2CB0D771CA5"},
 {content: 
   "describe ${1:Type} do\n  it \"should ${2:description}\" do\n    $0\n  end\nend",
  name: "describe (type)",
  scope: "source.ruby.rspec",
  tabTrigger: "dest",
  uuid: "2ED94046-DAF7-4C91-8D98-771513BB3804"},
 {content: 
   "describe ${1:Type}, \"${2:description}\" do\n  it \"should ${3:description}\" do\n    $0\n  end\nend",
  name: "describe (type, string)",
  scope: "source.ruby.rspec",
  tabTrigger: "dests",
  uuid: "ACFE21E0-902B-45C4-BF54-D137718FF61C"},
 {content: "exactly(${1:n}).times",
  name: "exactly",
  scope: "source.ruby.rspec",
  tabTrigger: "ex",
  uuid: "1A3662E4-DB9D-4F29-8E42-984755A419FA"},
 {content: "it \"${2:should ${1:description}}\" ${3:do\n  $0\nend}",
  name: "it",
  scope: "source.ruby.rspec",
  tabTrigger: "it",
  uuid: "AD51AA2B-09C9-40DE-9720-2FD43C967FA9"},
 {content: "it_should_behave_like ${2:\"$1\"}$0",
  name: "it_should_behave_like",
  scope: "source.ruby.rspec",
  tabTrigger: "itsbl",
  uuid: "D13C48F3-C62B-4456-B075-36B424D573CC"},
 {content: 
   "${1:var} = mock(\"${2:mock_name}\"${3:, :null_object => true})\n$0",
  name: "mock",
  scope: "source.ruby.rspec",
  tabTrigger: "moc",
  uuid: "AA3D9F87-FE8F-4808-A732-F368CCB9DED6"},
 {content: "once",
  name: "once",
  scope: "source.ruby.rspec",
  tabTrigger: "on",
  uuid: "695ECDF3-FEFC-4702-AF71-641E64017907"},
 {content: "ordered",
  name: "ordered",
  scope: "source.ruby.rspec",
  tabTrigger: "ord",
  uuid: "F0524EA5-3438-4238-871C-A5AAAAFC8CA3"},
 {content: "${1:target}.should == ${2:value}\n$0",
  name: "should ==",
  scope: "source.ruby.rspec",
  tabTrigger: "sh=",
  uuid: "AF99B458-D589-414D-87C7-8FACD2EF9FD5"},
 {content: "${1:target}.should =~ /${2:regexp}/\n$0",
  name: "should =~",
  scope: "source.ruby.rspec",
  tabTrigger: "shm",
  uuid: "0BD5A07E-5FB3-44A3-991F-ABA04BA632D7"},
 {content: "${1:target}.should be(${2:result})\n$0",
  name: "should be",
  scope: "source.ruby.rspec",
  tabTrigger: "shb",
  uuid: "F401AA03-A119-4965-8677-BDAAE8312F13"},
 {content: "${1:target}.should be_close(${2:result}, ${3:tolerance})\n$0",
  name: "should be_close",
  scope: "source.ruby.rspec",
  tabTrigger: "shbc",
  uuid: "5A203680-6F32-482F-A6A3-50CB7EE99E0E"},
 {content: "${1:target}.should be_instance_of(${2:klass})\n$0",
  name: "should be_instance_of",
  scope: "source.ruby.rspec",
  tabTrigger: "shbio",
  uuid: "8C5B6597-E115-4569-AE58-EF04042B21CD"},
 {content: "${1:target}.should be_a_kind_of(${2:klass})\n$0",
  name: "should be_kind_of",
  scope: "source.ruby.rspec",
  tabTrigger: "shbko",
  uuid: "29BF3286-6D33-418D-9BD5-79BAB0797FE4"},
 {content: "response.should be_redirect\n$0",
  name: "should be_redirect",
  scope: "source.ruby.rspec",
  tabTrigger: "shbr",
  uuid: "E4DA45B3-736F-40DF-8344-25A79E073730"},
 {content: "response.should be_success\n$0",
  name: "should be_success",
  scope: "source.ruby.rspec",
  tabTrigger: "shbs",
  uuid: "0A118507-983C-4441-8B00-73AF7E931FC5"},
 {content: "${1:target}.should eql(${2:value})\n$0",
  name: "should eql",
  scope: "source.ruby.rspec",
  tabTrigger: "she",
  uuid: "0F03467B-16F7-4764-99C6-B7F123E95E5C"},
 {content: "${1:target}.should equal(${2:value})\n$0",
  name: "should equal",
  scope: "source.ruby.rspec",
  tabTrigger: "she",
  uuid: "7DB5AC43-745F-488A-99F1-54CD923DCC38"},
 {content: "${1:target}.should have(${2:num}).${3:things}\n$0",
  name: "should have",
  scope: "source.ruby.rspec",
  tabTrigger: "shh",
  uuid: "42B1F497-2BAF-425D-9829-57E35456E7FE"},
 {content: "${1:target}.should have_at_least(${2:num}).${3:things}\n$0",
  name: "should have_at_least",
  scope: "source.ruby.rspec",
  tabTrigger: "shhal",
  uuid: "8A4F8C8E-B347-4D18-9203-247256874C47"},
 {content: "${1:target}.should have_at_most(${2:num}).${3:things}\n$0",
  name: "should have_at_most",
  scope: "source.ruby.rspec",
  tabTrigger: "shham",
  uuid: "1BE271C6-3310-46A8-83E1-88C45BBE27AC"},
 {content: "${1:target}.should have(${2:x}).records\n$0",
  name: "should have_records",
  scope: "source.ruby.rspec",
  tabTrigger: "shhr",
  uuid: "9605BD4A-93E5-4D57-99FB-D8844D40F183"},
 {content: "${1:target}.should match(/${2:regexp}/)\n$0",
  name: "should match",
  scope: "source.ruby.rspec",
  tabTrigger: "shm",
  uuid: "D6CE8D1B-16EC-4E0E-8089-62F193D3D048"},
 {content: "${1:target}.should ${2:be_${3:predicate}} $4\n$0",
  name: "should predicate",
  scope: "source.ruby.rspec",
  tabTrigger: "shp",
  uuid: "FCFC8C47-F477-4674-BFDD-2E0B8D475CE0"},
 {content: "lambda { $1 }.should raise_error(${2:error})\n$0",
  name: "should raise_error",
  scope: "source.ruby.rspec",
  tabTrigger: "shre",
  uuid: "813263F0-A2C0-465F-A617-69ECBAF8F7DD"},
 {content: "response.should redirect_to(${1:url})\n$0",
  name: "should redirect_to",
  scope: "source.ruby.rspec",
  tabTrigger: "shrt",
  uuid: "96F0A193-32F1-4A75-9093-5D20E36593EC"},
 {content: "response.should render_template(:${1:template})\n$0",
  name: "should render_template",
  scope: "source.ruby.rspec",
  tabTrigger: "shrt",
  uuid: "647C94D6-42FE-40F0-8618-73F7725BF59E"},
 {content: "${1:target}.should respond_to(:${2:sym})\n$0",
  name: "should respond_to",
  scope: "source.ruby.rspec",
  tabTrigger: "shrt",
  uuid: "D139CA8C-AACC-4314-AB86-BB3021D31B12"},
 {content: "${1:target}.should satisfy { |obj| $2 }\n$0",
  name: "should satisfy",
  scope: "source.ruby.rspec",
  tabTrigger: "shs",
  uuid: "3FF9AC90-799D-4BFD-8203-58199A1AD429"},
 {content: "lambda { $1 }.should throw_symbol(:${2:symbol})\n$0",
  name: "should throw",
  scope: "source.ruby.rspec",
  tabTrigger: "sht",
  uuid: "C41E8AD6-00F5-44E7-9809-F79666FE79F0"},
 {content: "${1:target}.should_not == ${2:value}\n$0",
  name: "should_not ==",
  scope: "source.ruby.rspec",
  tabTrigger: "shn=",
  uuid: "3A699BC3-3E17-4CFD-844C-2285F971379C"},
 {content: "${1:target}.should_not =~ /${2:regexp}/\n$0",
  name: "should_not =~",
  scope: "source.ruby.rspec",
  tabTrigger: "shnm",
  uuid: "7563CED5-5FD8-454C-972C-AC240D549E8B"},
 {content: "${1:target}.should_not be(${2:result})\n$0",
  name: "should_not be",
  scope: "source.ruby.rspec",
  tabTrigger: "shnb",
  uuid: "BD1CBF13-3A1F-49AB-8B3A-25967B437FD7"},
 {content: "${1:target}.should_not be_close(${2:result}, ${3:tolerance})\n$0",
  name: "should_not be_close",
  scope: "source.ruby.rspec",
  tabTrigger: "shnbc",
  uuid: "259BCEC6-878E-411F-A6B7-69B038B75CE1"},
 {content: "${1:target}.should_not be_instance_of(${2:klass})\n$0",
  name: "should_not be_instance_of",
  scope: "source.ruby.rspec",
  tabTrigger: "shbio",
  uuid: "364B3C9C-409C-4FC8-A12A-9A05CFB476CF"},
 {content: "${1:target}.should_not be_a_kind_of(${2:klass})\n$0",
  name: "should_not be_kind_of",
  scope: "source.ruby.rspec",
  tabTrigger: "shkof",
  uuid: "96C5A0CC-08D9-4DCE-B127-78370964E64E"},
 {content: "response.should_not be_redirect\n$0",
  name: "should_not be_redirect",
  scope: "source.ruby.rspec",
  tabTrigger: "shnbr",
  uuid: "E79DAF3F-8960-47C1-A34C-3D0E4B0AF926"},
 {content: "response.should_not be_success\n$0",
  name: "should_not be_success",
  scope: "source.ruby.rspec",
  tabTrigger: "shnbs",
  uuid: "8303E848-4F07-4D3C-98FA-19DA4676812E"},
 {content: "${1:target}.should_not eql(${2:value})\n$0",
  name: "should_not eql",
  scope: "source.ruby.rspec",
  tabTrigger: "shne",
  uuid: "04BED613-C9EF-4E41-82D7-9958BBDBE0E3"},
 {content: "${1:target}.should_not equal(${2:value})\n$0",
  name: "should_not equal",
  scope: "source.ruby.rspec",
  tabTrigger: "shne",
  uuid: "A6966089-6A33-4836-B85D-9CB72DBEB0A5"},
 {content: "${1:target}.should_not match(/${2:regexp}/)\n$0",
  name: "should_not match",
  scope: "source.ruby.rspec",
  tabTrigger: "shnm",
  uuid: "014285F3-D908-427F-B535-E5A4AEF09339"},
 {content: "${1:target}.should_not ${2:be_${3:predicate}} $4\n$0",
  name: "should_not predicate",
  scope: "source.ruby.rspec",
  tabTrigger: "shnp",
  uuid: "1D0BB312-A029-4A43-A024-EF6C03506CEC"},
 {content: "lambda { $1 }.should_not raise_error(${2:error})\n$0",
  name: "should_not raise_error",
  scope: "source.ruby.rspec",
  tabTrigger: "shnre",
  uuid: "D6B8DA1B-D07A-4C1E-A27B-59C502104BEA"},
 {content: "${1:target}.should_not respond_to(:${2:sym})\n$0",
  name: "should_not respond_to",
  scope: "source.ruby.rspec",
  tabTrigger: "shnrt",
  uuid: "E352E5F0-C83B-4C36-AC72-7BFC4F58DBF0"},
 {content: "${1:target}.should_not satisfy { |obj| $2 }\n$0",
  name: "should_not satisfy",
  scope: "source.ruby.rspec",
  tabTrigger: "shns",
  uuid: "E573AF3E-F301-4105-ACA3-C9913431E6ED"},
 {content: "lambda { $1 }.should_not throw_symbol(:${2:symbol})\n$0",
  name: "should_not throw",
  scope: "source.ruby.rspec",
  tabTrigger: "shnt",
  uuid: "EF7CD2D2-68BC-425B-9C49-7E3597EFE804"},
 {content: "${1:mock}${1/^.+$/./}should_not_receive(:${2:message})",
  name: "should_not_receive",
  scope: "source.ruby.rspec",
  tabTrigger: "shnr",
  uuid: "4CBCCACF-D6DA-49A6-9A8E-EC2F9CD15E94"},
 {content: "${1:mock}${1/^.+$/./}should_receive(:${2:message})",
  name: "should_receive",
  scope: "source.ruby.rspec",
  tabTrigger: "shr",
  uuid: "0A7E08E5-4756-49BA-B015-FB3A4D11EA45"},
 {content: "twice",
  name: "twice",
  scope: "source.ruby.rspec",
  tabTrigger: "tw",
  uuid: "85E6D1EE-74A4-4B4A-8A00-942B788FF599"},
 {content: "with(${1:args})",
  name: "with args",
  scope: "source.ruby.rspec",
  tabTrigger: "wia",
  uuid: "3F3E8066-8C1A-40D1-85C7-9DC18C6A34BA"}]
