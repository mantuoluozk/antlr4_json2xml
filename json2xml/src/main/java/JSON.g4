// Derived from http://json.org
grammar JSON;

json:   object
    |   array
    ;

object
    :   '{' pair (',' pair)* '}'    # AnObject
    |   '{' '}'                     # EmptyObject
    ;

array
    :   '[' value (',' value)* ']'  # ArrayOfValues
    |   '[' ']'                     # EmptyArray
    ;

pair:   STRING ':' value ;//pair:   STRING '=' value ;

value
    :   STRING		# String
    |   NUMBER		# Atom
    |   object  	# ObjectValue
    |   array  		# ArrayValue
    |   'true'		# Atom
    |   'false'		# Atom
    |   'null'		# Atom
    ;

LCURLY : '{' ;
LBRACK : '[' ;
STRING :  '"' (ESC | ~["\\])* '"' ;//STRING :   (ESC | ~["\\])* ;

fragment ESC :   '\\' (["\\/bfnrt] | UNICODE) ; //以fragment开头的规则只能被其他的此法分析器规则使用，他们并不是词法符号
fragment UNICODE : 'u' HEX HEX HEX HEX ;        //十六进制数
fragment HEX : [0-9a-fA-F] ;

NUMBER
    :   '-'? INT '.' INT EXP?   // 1.35, 1.35E-9, 0.3, -4.5
    |   '-'? INT EXP            // 1e10 -3e4
    |   '-'? INT                // -3, 45
    ;
fragment INT :   '0' | '1'..'9' '0'..'9'* ; // no leading zeros
fragment EXP :   [Ee] [+\-]? INT ; // \- since - means "range" inside [...]

WS  :   [ \t\n\r]+ -> skip ;
