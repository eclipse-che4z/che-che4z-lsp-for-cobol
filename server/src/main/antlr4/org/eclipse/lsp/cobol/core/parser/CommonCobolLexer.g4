/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */

lexer grammar CommonCobolLexer;

@lexer::members {
    boolean sqlFlag = false;
    String lastTokenText = null;
    public void emit(Token token) {
        super.emit(token);
        lastTokenText = token.getText();
    }
}

ACTION : A C T I O N;
ACTIVITY : A C T I V I T Y {!sqlFlag}?;
ADD : A D D;
ADDRESS : A D D R E S S;
AFTER : A F T E R;
ALLOCATE : A L L O C A T E;
ALTER : A L T E R;
AND : A N D;
AS : A S;
AT : A T;
ATTRIBUTES : A T T R I B U T E S;
AUTHENTICATE : A U T H E N T I C A T E;
AUXILIARY : A U X I L I A R Y;
BINARY : B I N A R Y;
BIT : B I T;
CCSID : C C S I D;
CHANGE : C H A N G E;
CHAR : C H A R;
CHECK : C H E C K;
CLIENT : C L I E N T;
CLOSE : C L O S E;
CODE : C O D E {!sqlFlag}?;
COLOR : C O L O R;
CONDITION : C O N D I T I O N;
CONNECT : C O N N E C T;
CONTROL : C O N T R O L;
COPY : C O P Y;
CREATE : C R E A T E;
CURRENT : C U R R E N T;
DATA : D A T A;
DATE : D A T E;
DAYOFMONTH : D A Y O F M O N T H;
DAYOFWEEK : D A Y O F W E E K;
DAYOFYEAR : D A Y O F Y E A R;
DAYS : D A Y S;
DEFINE : D E F I N E;
DELETE : D E L E T E;
DOCUMENT : D O C U M E N T;
END : E N D;
ENDING : E N D I N G {!sqlFlag}?;
EQUAL : E Q U A L;
ERASE : E R A S E;
EVENT : E V E N T;
EXCEPTION : E X C E P T I O N;
EXTERNAL : E X T E R N A L;
EXTRACT : E X T R A C T;
FILE : F I L E;
FOR : F O R;
FREE : F R E E;
FROM : F R O M;
GENERIC : G E N E R I C;
GET : G E T;
HEX : H E X;
HOLD : H O L D;
HOURS : H O U R S;
IGNORE : I G N O R E;
IMMEDIATE : I M M E D I A T E;
INCREMENT : I N C R E M E N T;
INCLUDE : {if(lastTokenText.equals("EXEC SQL")) {sqlFlag = false;}} I N C L U D E;
INPUT : I N P U T;
INSERT : I N S E R T;
INTO : I N T O;
KEEP : K E E P;
LABEL : L A B E L;
LAST : L A S T;
LENGTH : L E N G T H;
LEVEL : L E V E L;
LOAD : L O A D;
MAIN : M A I N;
MINUTES : M I N U T E S;
MODE : M O D E;
MONTH : M O N T H;
MOVE : M O V E;
NAME : N A M E;
NEXT : N E X T;
NODE : N O D E;
NONE : N O N E;
ON : O N;
OPEN : O P E N;
OPERATION : O P E R A T I O N;
OPTIONS : O P T I O N S;
OR : O R;
OUTPUT : O U T P U T;
OWNER : O W N E R;
PAGE : P A G E;
PAGENUM : P A G E N U M;
PASSWORD : P A S S W O R D;
PATH : P A T H;
POINT : P O I N T;
PREPARE : P R E P A R E;
PROFILE : P R O F I L E;
PROGRAM : P R O G R A M;
QUERY : Q U E R Y;
READ : R E A D;
RECORD : R E C O R D;
RECORDS : R E C O R D S {!sqlFlag}?;
RELEASE : R E L E A S E;
REMOVE : R E M O V E;
REPLACE : R E P L A C E;
RESET : R E S E T;
RESTART : R E S T A R T;
RESULT : R E S U L T;
RESUME : R E S U M E {!sqlFlag}?;
RETAIN : R E T A I N;
RETURN : R E T U R N;
ROLE : R O L E;
ROLLBACK : R O L L B A C K;
RUN : R U N;
SCHEME : S C H E M E;
SECONDS : S E C O N D S;
SECURITY : S E C U R I T Y;
SERVER : S E R V E R;
SESSION : S E S S I O N;
SET : S E T;
SIGNAL : S I G N A L;
START : S T A R T;
STATE : S T A T E;
STATUS : S T A T U S;
STORAGE : S T O R A G E;
TIME : T I M E;
TO : T O;
TOKEN : T O K E N;
TRACE : T R A C E;
TRANSACTION : T R A N S A C T I O N;
TRANSFORM : T R A N S F O R M;
TRIGGER : T R I G G E R;
TYPE : T Y P E;
UNTIL : U N T I L;
SQL : S Q L;
EXEC_SQL: EXEC WS SQL {sqlFlag = true;};
END_EXEC : E N D MINUSCHAR E X E C {sqlFlag = false;};
EXEC : E X E C;
EXECUTE : E X E C U T E;
UPDATE : U P D A T E;
URL : U R L;
USERID : U S E R I D;
USING : U S I N G;
VALIDATION : V A L I D A T I O N;
VALUE : V A L U E;
VOLUME : V O L U M E;
WAIT : W A I T;
WRITE : W R I T E;
YEAR : Y E A R;

// symbols
AMPCHAR : '&';
ASTERISKCHAR : '*';
DOUBLEASTERISKCHAR : '**';
COLONCHAR : ':';
COMMA_EOF : ',' EOF {!sqlFlag}? ->skip;
COMMA_LB : ',' ('\r' | '\n' | '\f' | '\t' | ' ')+ {!sqlFlag}? -> channel(HIDDEN);
COMMACHAR : ',';
COMMENTTAG : '*>';
COMMENTENTRYTAG : '*>CE';
DOLLARCHAR : '$';
DOUBLEQUOTE : '"';
// period full stopPosition
DOT_FS : '.' ('\r' | '\n' | '\f' | '\t' | ' ')+ | '.' EOF;
DOT : '.';
EQUALCHAR : '=';
LESSTHANCHAR : '<';
LESSTHANOREQUAL : '<=';
LPARENCHAR : '(';
MINUSCHAR : '-';
MORETHANCHAR : '>';
MORETHANOREQUAL : '>=';
NOTEQUALCHAR : '<>';
PLUSCHAR : '+';
SEMICOLON_FS : ';' ('\r' | '\n' | '\f' | '\t' | ' ')+ | ';' EOF;
SINGLEQUOTE : '\'';
RPARENCHAR : ')';
SLASHCHAR : '/';
SQLLINECOMMENTCHAR: '--';

LEVEL_NUMBER: ([1-9])|([0][1-9])|([1234][0-9]);
LEVEL_NUMBER_66 : '66';
LEVEL_NUMBER_77 : '77';
LEVEL_NUMBER_88 : '88';

INTEGERLITERAL : (PLUSCHAR | MINUSCHAR)? DIGIT+ | LEVEL_NUMBER;

// DECIMAL_CONST : DIGIT DIGIT DIGIT DIGIT DOT DIGIT {sqlFlag}? ;
SINGLEDIGITLITERAL : DIGIT {sqlFlag}? ;

NUMERICLITERAL : (PLUSCHAR | MINUSCHAR)? DIGIT* (DOT | COMMACHAR) DIGIT+ (('e' | 'E') (PLUSCHAR | MINUSCHAR)? DIGIT+)?;

NONNUMERICLITERAL : UNTRMSTRINGLITERAL | STRINGLITERAL | DBCSLITERAL | HEXNUMBER | NULLTERMINATED;

//TXTLITERAL : STRINGLITERAL | IDENTIFIER;
CHAR_STRING_CONSTANT : HEXNUMBER | STRINGLITERAL;

IDENTIFIER : ([a-zA-Z0-9]+ ([-_]+ [a-zA-Z0-9]+)*);
INVALID_IDENTIFIER : [a-zA-Z0-9#@$]+ ([-_]+ [a-zA-Z0-9#@$]+)*;
FILENAME : IDENTIFIER+ '.' IDENTIFIER+;

OCTDIGITS : OCT_DIGIT {sqlFlag}? ;
HEX_NUMBERS : HEXNUMBER {sqlFlag}? ;

// whitespace, line breaks, comments, ...
NEWLINE : '\r'? '\n' -> channel(HIDDEN);
COMMENTLINE : COMMENTTAG WS ~('\n' | '\r')* -> channel(HIDDEN);
COMMENTENTRYLINE : COMMENTENTRYTAG WS ~('\n' | '\r')*  -> channel(HIDDEN);
WS : [ \t\f;]+ -> channel(HIDDEN);
SEPARATOR : ', ' {!sqlFlag}? -> channel(HIDDEN);

//SQL comments
SQLLINECOMMENT
	:	SQLLINECOMMENTCHAR ~[\r\n]* NEWLINE {sqlFlag}? -> channel(HIDDEN)
	;

// treat all the non-processed tokens as errors
ERRORCHAR : . ;

ZERO_DIGIT: '0';


fragment HEXNUMBER :
	X '"' [0-9A-F]+ '"'
	| X '\'' [0-9A-F]+ '\''
;

fragment NULLTERMINATED :
	Z '"' (~["\n\r] | '""' | '\'')* '"'
	| Z '\'' (~['\n\r] | '\'\'' | '"')* '\''
;

fragment STRINGLITERAL :
	'"' (~["\n\r] | '""' | '\'')* '"'
	| '\'' (~['\n\r] | '\'\'' | '"')* '\''
;

fragment UNTRMSTRINGLITERAL :
	'"' (~["\n\r] | '""' | '\'')*
	| '\'' (~['\n\r] | '\'\'' | '"')*
;

fragment DBCSLITERAL :
	[GN] '"' (~["\n\r] | '""' | '\'')* '"'
	| [GN] '\'' (~['\n\r] | '\'\'' | '"')* '\''
;

fragment
OCT_DIGIT        : [0-8] ;
fragment DIGIT: OCT_DIGIT | [9];
// case insensitive chars
fragment A:('a'|'A');
fragment B:('b'|'B');
fragment C:('c'|'C');
fragment D:('d'|'D');
fragment E:('e'|'E');
fragment F:('f'|'F');
fragment G:('g'|'G');
fragment H:('h'|'H');
fragment I:('i'|'I');
fragment J:('j'|'J');
fragment K:('k'|'K');
fragment L:('l'|'L');
fragment M:('m'|'M');
fragment N:('n'|'N');
fragment O:('o'|'O');
fragment P:('p'|'P');
fragment Q:('q'|'Q');
fragment R:('r'|'R');
fragment S:('s'|'S');
fragment T:('t'|'T');
fragment U:('u'|'U');
fragment V:('v'|'V');
fragment W:('w'|'W');
fragment X:('x'|'X');
fragment Y:('y'|'Y');
fragment Z:('z'|'Z');
