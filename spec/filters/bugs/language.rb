# NOTE: run bin/format-filters after changing this file
opal_filter "language" do
  fails "$LOAD_PATH.resolve_feature_path return nil if feature cannot be found" # NoMethodError: undefined method `resolve_feature_path' for ["foo"]
  fails "$LOAD_PATH.resolve_feature_path returns what will be loaded without actual loading, .rb file" # NoMethodError: undefined method `resolve_feature_path' for ["foo"]
  fails "$LOAD_PATH.resolve_feature_path returns what will be loaded without actual loading, .so file" # NoMethodError: undefined method `resolve_feature_path' for ["foo"]
  fails "A Proc taking |*a, **kw| arguments does not autosplat keyword arguments" # Expected [[1], {"a"=>1}] == [[[1, {"a"=>1}]], {}] to be truthy but was false
  fails "A Symbol literal with invalid bytes raises an EncodingError at parse time" # Actually passes, the error comes from the difference between MRI's opal and compiled opal-parser
  fails "A block yielded a single Array assigns elements to mixed argument types" # Expected [1, 2, [], 3, 2, {"x"=>9}] == [1, 2, [3], {"x"=>9}, 2, {}] to be truthy but was false
  fails "A block yielded a single Array assigns elements to required arguments when a keyword rest argument is present"
  fails "A block yielded a single Array does not call #to_hash on final argument to get keyword arguments and does not autosplat" # ArgumentError: expected kwargs
  fails "A block yielded a single Array does not call #to_hash on the argument when optional argument and keyword argument accepted and does not autosplat" # ArgumentError: expected kwargs
  fails "A block yielded a single Array does not call #to_hash on the last element if keyword arguments are present" # ArgumentError: expected kwargs
  fails "A block yielded a single Array does not call #to_hash on the last element when there are more arguments than parameters" # ArgumentError: expected kwargs
  fails "A block yielded a single Array does not treat final Hash as keyword arguments and does not autosplat" # Expected [nil, {"a"=>10}] == [[{"a"=>10}], {}] to be truthy but was false
  fails "A block yielded a single Array does not treat hashes with string keys as keyword arguments and does not autosplat" # Expected [nil, {"a"=>10}] == [[{"a"=>10}], {}] to be truthy but was false
  fails "A block yielded a single Array when non-symbol keys are in a keyword arguments Hash does not separate non-symbol keys and symbol keys and does not autosplat" # Expected [nil, {"a"=>10, "b"=>2}] == [[{"a"=>10, "b"=>2}], {}] to be truthy but was false
  fails "A class definition extending an object (sclass) can use return to cause the enclosing method to return"
  fails "A class definition extending an object (sclass) raises a TypeError when trying to extend numbers"
  fails "A class definition raises TypeError if any constant qualifying the class is not a Module"
  fails "A class definition raises TypeError if the constant qualifying the class is nil"
  fails "A class definition raises a TypeError if inheriting from a metaclass"
  fails "A lambda expression 'lambda { ... }' assigns variables from parameters for definition '@a = lambda { |*, **k| k }'" # ArgumentError: expected kwargs
  fails "A lambda expression 'lambda { ... }' assigns variables from parameters for definition \n    def m(a) yield a end\n    def m2() yield end\n    @a = lambda { |a, | a }"
  fails "A lambda expression 'lambda { ... }' requires a block"
  fails "A lambda expression 'lambda { ... }' with an implicit block raises ArgumentError" # Expected ArgumentError (/tried to create Proc object without a block/) but no exception was raised (nil was returned)
  fails "A lambda literal -> () { } assigns variables from parameters for definition '@a = -> (*, **k) { k }'" # ArgumentError: expected kwargs
  fails "A method assigns local variables from method parameters for definition 'def m() end'" # ArgumentError: [SpecEvaluate#m] wrong number of arguments(1 for 0)
  fails "A method assigns local variables from method parameters for definition 'def m(*a) a end'" # Expected [{}] to equal []
  fails "A method assigns local variables from method parameters for definition 'def m(a, **) a end'" # Expected ArgumentError but no exception was raised ({"a"=>1, "b"=>2} was returned)
  fails "A method assigns local variables from method parameters for definition 'def m(a, **k) [a, k] end'" # Expected ArgumentError but no exception was raised ([{"a"=>1, "b"=>2}, {}] was returned)
  fails "A method assigns local variables from method parameters for definition 'def m(a, **nil); a end;'" # Opal::SyntaxError: Unsupported arg type kwnilarg
  fails "A method assigns local variables from method parameters for definition 'def m(a, b: 1) [a, b] end'" # Expected ArgumentError but no exception was raised ([{"a"=>1, "b"=>2}, 1] was returned)
  fails "A method assigns local variables from method parameters for definition 'def m(a:) a end'"
  fails "A method assigns local variables from method parameters for definition 'def m(a:, **k) [a, k] end'"
  fails "A method assigns local variables from method parameters for definition 'def m(a:, b: 1) [a, b] end'"
  fails "A method assigns local variables from method parameters for definition 'def m(a:, b:) [a, b] end'"
  fails "A method assigns local variables from method parameters for definition 'def m(a=1, b: 2) [a, b] end'"
  fails "A method assigns local variables from method parameters for definition 'def m(a=1, b:) [a, b] end'"
  fails "A method assigns local variables from method parameters for definition \n    def m(a, b = nil, c = nil, d, e: nil, **f)\n      [a, b, c, d, e, f]\n    end" # Exception: Cannot read property '$$is_array' of undefined
  fails "A method assigns the last Hash to the last optional argument if the Hash contains non-Symbol keys and is not passed as keywords" # Exception: Object.defineProperty called on non-object
  fails "A method definition in an eval creates a class method"
  fails "A method definition in an eval creates an instance method"
  fails "A method raises ArgumentError if passing hash as keyword arguments for definition 'def m(a: nil); a; end'" # Expected ArgumentError but no exception was raised (1 was returned)
  fails "A method when passing an empty keyword splat to a method that does not accept keywords for definition 'def m(*a); a; end'" # Expected [{}] == [] to be truthy but was false
  fails "A method when passing an empty keyword splat to a method that does not accept keywords for definition 'def m(a); a; end'" # Expected ArgumentError but no exception was raised (nil was returned)
  fails "A nested method definition creates a class method when evaluated in a class method"
  fails "A nested method definition creates a method in the surrounding context when evaluated in a def expr.method"
  fails "A nested method definition creates an instance method inside Class.new" # NoMethodError: undefined method `new_def' for #<#<Class:0x40de>:0x40dc>
  fails "A nested method definition creates an instance method when evaluated in an instance method"
  fails "A number literal can be a decimal literal with trailing 'r' to represent a Rational" # requires String#to_r
  fails "A number literal can be a float literal with trailing 'r' to represent a Rational" # Expected (5030569068109113/288230376151711740) == (136353847812057/7812500000000000) to be truthy but was false
  fails "A singleton class doesn't have singleton class"
  fails "A singleton class raises a TypeError for symbols"
  fails "A singleton method definition can be declared for a global variable"
  fails "A singleton method definition raises FrozenError with the correct class name" # Expected FrozenError but no exception was raised ("foo" was returned)
  fails "Accessing a class variable raises a RuntimeError when a class variable is overtaken in an ancestor class" # Expected RuntimeError (/class variable @@cvar_overtaken of .+ is overtaken by .+/) but no exception was raised ("subclass" was returned)
  fails "Accessing a class variable raises a RuntimeError when accessed from the toplevel scope (not in some module or class)" # Expected RuntimeError (class variable access from toplevel) but got: NameError (uninitialized class variable @@cvar_toplevel1 in MSpecEnv)
  fails "Allowed characters allows non-ASCII lowercased characters at the beginning" # Expected nil == 1 to be truthy but was false
  fails "Allowed characters allows not ASCII upcased characters at the beginning" # NameError: wrong constant name ἍBB
  fails "Allowed characters does not allow non-ASCII upcased characters at the beginning" # Expected SyntaxError (/dynamic constant assignment/) but no exception was raised ("test" was returned)
  fails "An ensure block inside 'do end' block is executed even when a symbol is thrown in it's corresponding begin block" # Expected ["begin", "rescue", "ensure"] to equal ["begin", "ensure"]
  fails "An ensure block inside a begin block is executed even when a symbol is thrown in it's corresponding begin block"
  fails "An ensure block inside a class is executed even when a symbol is thrown" # Expected ["class", "rescue", "ensure"] to equal ["class", "ensure"]
  fails "An instance method definition with a splat requires the presence of any arguments that precede the *" # ArgumentError: [MSpecEnv#foo] wrong number of arguments(1 for -3)
  fails "An instance method raises FrozenError with the correct class name" # Expected FrozenError but no exception was raised (#<Module:0x225b4> was returned)
  fails "An instance method raises an error with too few arguments" # ArgumentError: [MSpecEnv#foo] wrong number of arguments(1 for 2)
  fails "An instance method raises an error with too many arguments" # ArgumentError: [MSpecEnv#foo] wrong number of arguments(2 for 1)
  fails "An instance method with a default argument evaluates the default when required arguments precede it" # ArgumentError: [MSpecEnv#foo] wrong number of arguments(0 for -2)
  fails "An instance method with a default argument prefers to assign to a default argument before a splat argument" # ArgumentError: [MSpecEnv#foo] wrong number of arguments(0 for -2)
  fails "Assigning an anonymous module to a constant sets the name of a module scoped by an anonymous module" # NoMethodError: undefined method `end_with?' for nil
  fails "Executing break from within a block raises LocalJumpError when converted into a proc during a a super call" # Expected LocalJumpError but no exception was raised (1 was returned)
  fails "Executing break from within a block returns from the original invoking method even in case of chained calls"
  fails "Executing break from within a block works when passing through a super call" # Expected to not get Exception
  fails "Execution variable $: is initialized to an array of strings"
  fails "Execution variable $: is read-only"
  fails "Execution variable $: is the same object as $LOAD_PATH and $-I"
  fails "Global variable $-a is read-only"
  fails "Global variable $-d is an alias of $DEBUG"
  fails "Global variable $-l is read-only"
  fails "Global variable $-p is read-only"
  fails "Global variable $-v is an alias of $VERBOSE"
  fails "Global variable $-w is an alias of $VERBOSE"
  fails "Global variable $0 is the path given as the main script and the same as __FILE__"
  fails "Global variable $0 raises a TypeError when not given an object that can be coerced to a String"
  fails "Global variable $< is read-only"
  fails "Global variable $? is read-only"
  fails "Global variable $? is thread-local"
  fails "Global variable $FILENAME is read-only"
  fails "Global variable $VERBOSE converts truthy values to true" # Expected 1 to be true
  fails "Global variable $\" is read-only"
  fails "Hash literal checks duplicated float keys on initialization" # Expected warning to match: /key 1.0 is duplicated|duplicated key/ but got: ""
  fails "Hash literal checks duplicated keys on initialization" # Expected warning to match: /key 1000 is duplicated|duplicated key/ but got: ""
  fails "Hash literal expands a BasicObject using ** into the containing Hash literal initialization" # NoMethodError: undefined method `respond_to?' for BasicObject
  fails "Heredoc string allow HEREDOC with <<\"identifier\", interpolated" # Expected #<Encoding:UTF-16LE> to equal #<Encoding:ASCII-8BIT (dummy)>
  fails "Heredoc string allows HEREDOC with <<'identifier', no interpolation" # Expected #<Encoding:UTF-16LE> to equal #<Encoding:ASCII-8BIT (dummy)>
  fails "Heredoc string allows HEREDOC with <<-'identifier', allowing to indent identifier, no interpolation" # Expected #<Encoding:UTF-16LE> to equal #<Encoding:ASCII-8BIT (dummy)>
  fails "Heredoc string allows HEREDOC with <<-\"identifier\", allowing to indent identifier, interpolated" # Expected #<Encoding:UTF-16LE> to equal #<Encoding:ASCII-8BIT (dummy)>
  fails "Heredoc string allows HEREDOC with <<-identifier, allowing to indent identifier, interpolated" # Expected #<Encoding:UTF-16LE> to equal #<Encoding:ASCII-8BIT (dummy)>
  fails "Heredoc string allows HEREDOC with <<identifier, interpolated" # Expected #<Encoding:UTF-16LE> to equal #<Encoding:ASCII-8BIT (dummy)>
  fails "Instantiating a singleton class raises a TypeError when allocate is called"
  fails "Instantiating a singleton class raises a TypeError when new is called"
  fails "Keyword arguments are now separated from positional arguments when the method takes a ** parameter does not convert a positional Hash to keyword arguments" # Expected ArgumentError (wrong number of arguments (given 4, expected 3)) but no exception was raised (42 was returned)
  fails "Keyword arguments are now separated from positional arguments when the method takes a key: parameter when it's called with a positional Hash and no ** raises ArgumentError" # Expected ArgumentError (wrong number of arguments (given 4, expected 3)) but no exception was raised (42 was returned)
  fails "Literal (A::X) constant resolution uses the module or class #inspect to craft the error message if they are anonymous" # Expected NameError (/uninitialized constant <unusable info>::DOES_NOT_EXIST/) but got: NameError (uninitialized constant #<Module:0x50c0>::DOES_NOT_EXIST)
  fails "Literal (A::X) constant resolution uses the module or class #name to craft the error message" # Expected NameError (/uninitialized constant ModuleName::DOES_NOT_EXIST/) but got: NameError (uninitialized constant #<Module:0x50ba>::DOES_NOT_EXIST)
  fails "Literal (A::X) constant resolution with dynamically assigned constants evaluates the right hand side before evaluating a constant path"
  fails "Literal Regexps caches the Regexp object"
  fails "Literal Regexps support handling unicode 9.0 characters with POSIX bracket expressions" # Expected "" to equal "𐓘"
  fails "Literal Regexps supports (?# )"
  fails "Literal Regexps supports (?> ) (embedded subexpression)"
  fails "Literal Regexps supports \\g (named backreference)"
  fails "Literal Regexps supports character class composition"
  fails "Literal Regexps supports conditional regular expressions with named capture groups" # Exception: named captures are not supported in javascript: "^(?<word>foo)?(?(<word>)(T)|(F))$"
  fails "Literal Regexps supports conditional regular expressions with positional capture groups" # Exception: Invalid regular expression: /^(foo)?(?(1)(T)|(F))$/: Invalid group
  fails "Literal Regexps supports escaping characters when used as a terminator" # Expected "!" to equal "(?-mix:!)"
  fails "Literal Regexps supports possessive quantifiers"
  fails "Literal Regexps throws SyntaxError for malformed literals"
  fails "Literal Regexps treats an escaped non-escapable character normally when used as a terminator" # Expected "\\$" to equal "(?-mix:\\$)"
  fails "Local variable shadowing does not warn in verbose mode" # Expected nil == [3, 3, 3] to be truthy but was false
  fails "Magic comments in a loaded file are case-insensitive" # LoadError: cannot load such file -- ruby/language/fixtures/case_magic_comment
  fails "Magic comments in a loaded file are optional" # LoadError: cannot load such file -- ruby/language/fixtures/no_magic_comment
  fails "Magic comments in a loaded file can be after the shebang" # LoadError: cannot load such file -- ruby/language/fixtures/shebang_magic_comment
  fails "Magic comments in a loaded file can take Emacs style" # LoadError: cannot load such file -- ruby/language/fixtures/emacs_magic_comment
  fails "Magic comments in a loaded file can take vim style" # LoadError: cannot load such file -- ruby/language/fixtures/vim_magic_comment
  fails "Magic comments in a loaded file determine __ENCODING__" # LoadError: cannot load such file -- ruby/language/fixtures/magic_comment
  fails "Magic comments in a loaded file do not cause bytes to be mangled by passing them through the wrong encoding" # LoadError: cannot load such file -- ruby/language/fixtures/bytes_magic_comment
  fails "Magic comments in a loaded file must be at the first line" # LoadError: cannot load such file -- ruby/language/fixtures/second_line_magic_comment
  fails "Magic comments in a loaded file must be the first token of the line" # LoadError: cannot load such file -- ruby/language/fixtures/second_token_magic_comment
  fails "Magic comments in a required file are case-insensitive" # NameError: uninitialized constant Encoding::Big5
  fails "Magic comments in a required file are optional" # Expected nil to equal "UTF-8"
  fails "Magic comments in a required file can be after the shebang" # NameError: uninitialized constant Encoding::Big5
  fails "Magic comments in a required file can take Emacs style" # NameError: uninitialized constant Encoding::Big5
  fails "Magic comments in a required file can take vim style" # NameError: uninitialized constant Encoding::Big5
  fails "Magic comments in a required file determine __ENCODING__" # NameError: uninitialized constant Encoding::Big5
  fails "Magic comments in a required file do not cause bytes to be mangled by passing them through the wrong encoding" # Expected nil to equal "[167, 65, 166, 110]"
  fails "Magic comments in a required file must be at the first line" # Expected nil to equal "UTF-8"
  fails "Magic comments in a required file must be the first token of the line" # Expected nil to equal "UTF-8"
  fails "Magic comments in an -e argument are case-insensitive" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in an -e argument are optional" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in an -e argument can be after the shebang" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in an -e argument can take Emacs style" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in an -e argument can take vim style" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in an -e argument determine __ENCODING__" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in an -e argument do not cause bytes to be mangled by passing them through the wrong encoding" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in an -e argument must be at the first line" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in an -e argument must be the first token of the line" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in an eval are case-insensitive" # ArgumentError: [File.read] wrong number of arguments(2 for 1)
  fails "Magic comments in an eval are optional" # ArgumentError: [File.read] wrong number of arguments(2 for 1)
  fails "Magic comments in an eval can be after the shebang" # ArgumentError: [File.read] wrong number of arguments(2 for 1)
  fails "Magic comments in an eval can take Emacs style" # ArgumentError: [File.read] wrong number of arguments(2 for 1)
  fails "Magic comments in an eval can take vim style" # ArgumentError: [File.read] wrong number of arguments(2 for 1)
  fails "Magic comments in an eval determine __ENCODING__" # ArgumentError: [File.read] wrong number of arguments(2 for 1)
  fails "Magic comments in an eval do not cause bytes to be mangled by passing them through the wrong encoding" # ArgumentError: [File.read] wrong number of arguments(2 for 1)
  fails "Magic comments in an eval must be at the first line" # ArgumentError: [File.read] wrong number of arguments(2 for 1)
  fails "Magic comments in an eval must be the first token of the line" # ArgumentError: [File.read] wrong number of arguments(2 for 1)
  fails "Magic comments in stdin are case-insensitive" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in stdin are optional" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in stdin can be after the shebang" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in stdin can take Emacs style" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in stdin can take vim style" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in stdin determine __ENCODING__" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in stdin do not cause bytes to be mangled by passing them through the wrong encoding" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in stdin must be at the first line" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in stdin must be the first token of the line" # ArgumentError: unknown encoding name - locale
  fails "Magic comments in the main file are case-insensitive" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x8aa2e>
  fails "Magic comments in the main file are optional" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x8aa2e>
  fails "Magic comments in the main file can be after the shebang" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x8aa2e>
  fails "Magic comments in the main file can take Emacs style" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x8aa2e>
  fails "Magic comments in the main file can take vim style" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x8aa2e>
  fails "Magic comments in the main file determine __ENCODING__" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x8aa2e>
  fails "Magic comments in the main file do not cause bytes to be mangled by passing them through the wrong encoding" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x8aa2e>
  fails "Magic comments in the main file must be at the first line" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x8aa2e>
  fails "Magic comments in the main file must be the first token of the line" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x8aa2e>
  fails "NoMethodError#message calls receiver.inspect only when calling Exception#message" # Expected ["inspect_called"] to equal []
  fails "Numbered parameters does not support more than 9 parameters" # Expected NameError (/undefined local variable or method `_10'/) but got: NoMethodError (undefined method `_10' for #<MSpecEnv:0x5d700>)
  fails "Operators * / % are left-associative"
  fails "Operators <=> == === != =~ !~ have higher precedence than &&" # Expected false == false to be falsy but was true
  fails "Optional constant assignment with ||= causes side-effects of the module part to be applied (for nil constant)" # Expected 3 == 1 to be truthy but was false
  fails "Optional constant assignment with ||= causes side-effects of the module part to be applied only once (for undefined constant)" # Expected 2 == 1 to be truthy but was false  
  fails "Optional variable assignments using compounded constants with &&= assignments" # Expected warning to match: /already initialized constant/ but got: ""
  fails "Optional variable assignments using compounded constants with operator assignments" # Expected warning to match: /already initialized constant/ but got: ""
  fails "Pattern matching Array pattern calls #deconstruct once for multiple patterns, caching the result" # Expected ["deconstruct", "deconstruct"] == ["deconstruct"] to be truthy but was false
  fails "Pattern matching Array pattern raises TypeError if #deconstruct method does not return array" # Expected TypeError (/deconstruct must return Array/) but no exception was raised (nil was returned)
  fails "Pattern matching Hash pattern does not match object if #deconstruct_keys method does not return Hash" # Expected TypeError (/deconstruct_keys must return Hash/) but got: NoMethodError (undefined method `key?' for "")
  fails "Pattern matching Hash pattern does not match object if #deconstruct_keys method returns Hash with non-symbol keys" # Expected true == false to be truthy but was false
  fails "Pattern matching Hash pattern raise SyntaxError when keys duplicate in pattern" # Expected SyntaxError (/duplicated key name/) but got: SyntaxError (duplicate hash pattern key a)
  fails "Pattern matching alternative pattern does not support variable binding" # Expected SyntaxError (/illegal variable in alternative pattern/) but no exception was raised (nil was returned)
  fails "Pattern matching cannot mix in and when operators" # Expected SyntaxError (/syntax error, unexpected `in'/) but got: SyntaxError (unexpected token kIN)
  fails "Pattern matching variable pattern allows applying ^ operator to bound variables" # NoMatchingPatternError: [1, 1]
  fails "Pattern matching variable pattern does not support using variable name (except _) several times" # Expected SyntaxError (/duplicated variable name/) but got: SyntaxError (duplicate variable name a)
  fails "Pattern matching variable pattern requires bound variable to be specified in a pattern before ^ operator when it relies on a bound variable" # Expected SyntaxError (/n: no such local variable/) but got: SyntaxError (no such local variable: `n')
  fails "Pattern matching variable pattern supports existing variables in a pattern specified with ^ operator" # SyntaxError: no such local variable: `a'
  fails "Pattern matching warning when regular form does not warn about pattern matching is experimental feature" # NameError: uninitialized constant Warning
  fails "Predefined global $+ captures the last non nil capture"
  fails "Predefined global $+ is equivalent to $~.captures.last"
  fails "Predefined global $, raises TypeError if assigned a non-String"
  fails "Predefined global $-0 changes $/"
  fails "Predefined global $-0 does not call #to_str to convert the object to a String"
  fails "Predefined global $-0 raises a TypeError if assigned a boolean"
  fails "Predefined global $-0 raises a TypeError if assigned an Integer" # Expected TypeError but no exception was raised (1 was returned)
  fails "Predefined global $. can be assigned a Float" # Expected 123.5 to equal 123
  fails "Predefined global $. raises TypeError if object can't be converted to an Integer" # Expected TypeError but no exception was raised (#<MockObject:0x518b4> was returned)
  fails "Predefined global $. should call #to_int to convert the object to an Integer" # Expected #<MockObject:0x518c2> to equal 321
  fails "Predefined global $/ changes $-0"
  fails "Predefined global $/ does not call #to_str to convert the object to a String"
  fails "Predefined global $/ raises a TypeError if assigned a boolean"
  fails "Predefined global $/ raises a TypeError if assigned an Integer" # Expected TypeError but no exception was raised (#<Number>(#pretty_inspect raised #<TypeError: no implicit conversion of Number into String>) was returned)
  fails "Predefined global $_ is Thread-local"
  fails "Predefined global $_ is set at the method-scoped level rather than block-scoped"
  fails "Predefined global $stdout raises TypeError error if assigned to nil"
  fails "Predefined global $stdout raises TypeError error if assigned to object that doesn't respond to #write"
  fails "Predefined global $~ is set at the method-scoped level rather than block-scoped"
  fails "Predefined global $~ raises an error if assigned an object not nil or instanceof MatchData"
  fails "Ruby String interpolation returns a string with the source encoding by default" # Expected #<Encoding:UTF-8> == #<Encoding:ASCII-8BIT (dummy)> to be truthy but was false
  fails "Ruby String interpolation returns a string with the source encoding, even if the components have another encoding" # ArgumentError: unknown encoding name - euc-jp
  fails "The ** operator hash with omitted value accepts mixed syntax" # NameError: uninitialized constant MSpecEnv::a
  fails "The ** operator hash with omitted value accepts short notation 'key' for 'key: value' syntax" # NameError: uninitialized constant MSpecEnv::a
  fails "The ** operator hash with omitted value ignores hanging comma on short notation" # NameError: uninitialized constant MSpecEnv::a
  fails "The ** operator hash with omitted value works with methods and local vars" # NameError: uninitialized constant #<Class:0x874c0>::bar
  fails "The BEGIN keyword accesses variables outside the eval scope"
  fails "The BEGIN keyword runs first in a given code unit"
  fails "The BEGIN keyword runs in a shared scope"
  fails "The BEGIN keyword runs multiple begins in FIFO order"
  fails "The BEGIN keyword uses top-level for self" # NameError: uninitialized constant TOPLEVEL_BINDING
  fails "The END keyword runs last in a given code unit" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x1e972>
  fails "The END keyword runs multiple ends in LIFO order" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x1e972>
  fails "The END keyword runs only once for multiple calls" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x1e972>
  fails "The __ENCODING__ pseudo-variable is US-ASCII by default"
  fails "The __ENCODING__ pseudo-variable is the encoding specified by a magic comment in the file"
  fails "The __ENCODING__ pseudo-variable is the encoding specified by a magic comment inside an eval"
  fails "The __ENCODING__ pseudo-variable is the evaluated strings's one inside an eval"
  fails "The __FILE__ pseudo-variable equals the absolute path of a file loaded by a relative path" # we can't clear $LOADED_FEATURES, should be treated as readonly
  fails "The __FILE__ pseudo-variable equals the absolute path of a file loaded by an absolute path" # we can't clear $LOADED_FEATURES, should be treated as readonly
  fails "The __LINE__ pseudo-variable equals the line number of the text in a loaded file"
  fails "The alias keyword can create a new global variable, synonym of the original" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x4478>
  fails "The alias keyword can override an existing global variable and make them synonyms" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x4478>
  fails "The alias keyword is not allowed against Integer or String instances" # Expected TypeError but got: Exception (Cannot read property '$to_s' of undefined)
  fails "The alias keyword on top level defines the alias on Object"
  fails "The alias keyword operates on methods defined via attr, attr_reader, and attr_accessor"
  fails "The alias keyword operates on the object's metaclass when used in instance_eval"
  fails "The alias keyword supports aliasing twice the same global variables" # NoMethodError: undefined method `tmp' for #<MSpecEnv:0x22a72>
  fails "The break statement in a captured block from a scope that has returned raises a LocalJumpError when calling the block from a method"
  fails "The break statement in a captured block from a scope that has returned raises a LocalJumpError when yielding to the block"
  fails "The break statement in a captured block from another thread raises a LocalJumpError when getting the value from another thread" # NameError: uninitialized constant Thread
  fails "The break statement in a captured block when the invocation of the scope creating the block is still active raises a LocalJumpError when invoking the block from a method"
  fails "The break statement in a captured block when the invocation of the scope creating the block is still active raises a LocalJumpError when invoking the block from the scope creating the block"
  fails "The break statement in a captured block when the invocation of the scope creating the block is still active raises a LocalJumpError when yielding to the block"
  fails "The break statement in a lambda created at the toplevel returns a value when invoking from a block"
  fails "The break statement in a lambda created at the toplevel returns a value when invoking from a method"
  fails "The break statement in a lambda created at the toplevel returns a value when invoking from the toplevel"
  fails "The break statement in a lambda from a scope that has returned raises a LocalJumpError when yielding to a lambda passed as a block argument"
  fails "The break statement in a lambda from a scope that has returned returns a value to the block scope invoking the lambda in a method" # Exception: $brk is not defined
  fails "The break statement in a lambda from a scope that has returned returns a value to the method scope invoking the lambda" # Exception: $brk is not defined
  fails "The break statement in a lambda returns from the call site if the lambda is passed as a block" # Expected ["before", "unreachable1", "unreachable2", "after"] to equal ["before", "after"]
  fails "The break statement in a lambda when the invocation of the scope creating the lambda is still active returns a value to a block scope invoking the lambda in a method below" # Exception: $brk is not defined
  fails "The break statement in a lambda when the invocation of the scope creating the lambda is still active returns a value to the method scope below invoking the lambda" # Exception: $brk is not defined
  fails "The break statement in a lambda when the invocation of the scope creating the lambda is still active returns a value to the scope creating and calling the lambda" # Exception: $brk is not defined
  fails "The break statement in a lambda when the invocation of the scope creating the lambda is still active returns from the lambda" # Exception: unexpected break
  fails "The break statement in a lambda when the invocation of the scope creating the lambda is still active returns nil when not passed an argument" # Exception: $brk is not defined
  fails "The class keyword does not raise a SyntaxError when opening a class without a semicolon" # NameError: uninitialized constant ClassSpecsKeywordWithoutSemicolon
  fails "The def keyword within a closure looks outside the closure for the visibility"
  fails "The defined? keyword for a scoped constant returns nil when a constant is defined on top-level but not on the class" # Expected "constant" to be nil
  fails "The defined? keyword for a simple constant returns 'constant' when the constant is defined" # Expected false == true to be truthy but was false
  fails "The defined? keyword for an expression returns 'assignment' for assigning a local variable" # Expected false == true to be truthy but was false
  fails "The defined? keyword for literals for a literal Array returns 'expression' if each element is defined" # Expected false == true to be truthy but was false
  fails "The defined? keyword for literals returns 'false' for false" # Expected false == true to be truthy but was false
  fails "The defined? keyword for literals returns 'nil' for nil" # Expected false == true to be truthy but was false
  fails "The defined? keyword for literals returns 'self' for self" # Expected false == true to be truthy but was false
  fails "The defined? keyword for literals returns 'true' for true" # Expected false == true to be truthy but was false
  fails "The defined? keyword for super for a method taking no arguments returns 'super' when a superclass method exists" # Expected false == true to be truthy but was false
  fails "The defined? keyword for variables returns 'class variable' when called with the name of a class variable" # Expected false == true to be truthy but was false
  fails "The defined? keyword for variables returns 'global-variable' for a global variable that has been assigned nil" # Expected false == true to be truthy but was false
  fails "The defined? keyword for variables returns 'instance-variable' for an instance variable that has been assigned to nil"
  fails "The defined? keyword for variables returns 'instance-variable' for an instance variable that has been assigned" # Expected false == true to be truthy but was false
  fails "The defined? keyword for variables returns 'local-variable' when called with the name of a local variable" # Expected false == true to be truthy but was false
  fails "The defined? keyword for variables returns nil for a global variable that has been read but not assigned to"
  fails "The defined? keyword for variables when a Regexp matches a String returns nil for non-captures"
  fails "The defined? keyword for variables when a String matches a Regexp returns nil for non-captures"
  fails "The defined? keyword for yield returns 'yield' if a block is passed to a method not taking a block parameter" # Expected false == true to be truthy but was false
  fails "The defined? keyword when called with a method name without a receiver returns 'method' if the method is defined" # Expected false == true to be truthy but was false
  fails "The if expression with a boolean range ('flip-flop' operator) evaluates the first conditions lazily with exclusive-end range"
  fails "The if expression with a boolean range ('flip-flop' operator) evaluates the first conditions lazily with inclusive-end range"
  fails "The or operator has a lower precedence than 'next' in 'next true or false'"
  fails "The redo statement in a method is invalid and raises a SyntaxError" # Expected SyntaxError but no exception was raised ("m" was returned)
  fails "The redo statement triggers ensure block when re-executing a block"
  fails "The rescue keyword allows rescue in 'do end' block" # NoMethodError: undefined method `call' for nil
  fails "The rescue keyword inline form can be inlined" # Expected Infinity to equal 1
  fails "The rescue keyword only accepts Module or Class in rescue clauses" # RuntimeError: error
  fails "The rescue keyword only accepts Module or Class in splatted rescue clauses" # RuntimeError: error
  fails "The rescue keyword rescues the exception in the deepest rescue block declared to handle the appropriate exception type" # Expected "StandardError: an error occurred" to include ":in `raise_standard_error'"
  fails "The return keyword at top level return with argument warns but does not affect exit status" # Exception: path.substr is not a function
  fails "The return keyword at top level within a block within a class is not allowed" # Exception: path.substr is not a function
  fails "The super keyword uses block argument given to method when used in a block" # LocalJumpError: no block given
  fails "The super keyword uses given block even if arguments are passed explicitly"
  fails "The throw keyword raises an UncaughtThrowError if used to exit a thread" # NotImplementedError: Thread creation not available
  fails "The unpacking splat operator (*) when applied to a BasicObject coerces it to Array if it respond_to?(:to_a)" # NoMethodError: undefined method `respond_to?' for BasicObject
  fails "The until expression restarts the current iteration without reevaluating condition with redo"
  fails "The until modifier restarts the current iteration without reevaluating condition with redo"
  fails "The until modifier with begin .. end block restart the current iteration without reevaluating condition with redo" # Expected [1] to equal [0, 0, 0, 1, 2]
  fails "The while expression stops running body if interrupted by break in a begin ... end element op-assign value"
  fails "The while expression stops running body if interrupted by break in a parenthesized element op-assign value"
  fails "The yield call taking a single argument yielding to a lambda should not destructure an Array into multiple arguments" # Expected ArgumentError but no exception was raised ([1, 2] was returned)
  fails "The yield call taking no arguments ignores assignment to the explicit block argument and calls the passed block"
  fails "Using yield in a singleton class literal raises a SyntaxError" # Expected SyntaxError (/Invalid yield/) but got: SyntaxError (undefined method `uses_block!' for nil)
  fails "a method definition that sets more than one default parameter all to the same value only allows overriding the default value of the first such parameter in each set" # ArgumentError: [MSpecEnv#foo] wrong number of arguments(2 for -1)
  fails "a method definition that sets more than one default parameter all to the same value treats the argument after the multi-parameter normally" # ArgumentError: [MSpecEnv#bar] wrong number of arguments(3 for -1)
  fails "kwarg with omitted value in a method call accepts short notation 'kwarg' in method call for definition 'def call(*args, **kwargs) = [args, kwargs]'" # NameError: uninitialized constant SpecEvaluate::a
  fails "kwarg with omitted value in a method call with methods and local variables for definition \n    def call(*args, **kwargs) = [args, kwargs]\n    def bar\n      \"baz\"\n    end\n    def foo(val)\n      call bar:, val:\n    end" # NameError: uninitialized constant SpecEvaluate::bar
  fails "self in a metaclass body (class << obj) raises a TypeError for numbers"
  fails "self in a metaclass body (class << obj) raises a TypeError for symbols"
  fails "self.send(:block_given?) returns false when a method defined by define_method is called with a block"
  fails "self.send(:block_given?) returns true if and only if a block is supplied"
  fails "top-level constant lookup on a class does not search Object after searching other scopes" # Expected NameError but no exception was raised (Hash was returned)
  fails_badly "Pattern matching refinements are used for #=== in constant pattern"
  fails_badly "Pattern matching refinements are used for #deconstruct"
  fails_badly "Pattern matching refinements are used for #deconstruct_keys"
  fails_badly "The while expression stops running body if interrupted by break in a begin ... end attribute op-assign-or value"
  fails_badly "The while expression stops running body if interrupted by break in a parenthesized attribute op-assign-or value"
  fails_badly "The while expression stops running body if interrupted by break with unless in a begin ... end attribute op-assign-or value"
  fails_badly "The while expression stops running body if interrupted by break with unless in a parenthesized attribute op-assign-or value"
end
