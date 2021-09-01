/*
 * Copyright (c) 2021 Broadcom.
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

lexer grammar TechnicalLexer;
channels{COMMENTS}
// This grammar should not contains any explicit token declaration.
// There should be only symbols, literal patterns, and fragments.
// The purpose of this file is to allow similar parsing by the preprocessor and parser.
// All the token declarations that are common to several lexers should be duplicated to the appropriate lexers.

// symbols
ASTERISKCHAR : '*';
DOUBLEASTERISKCHAR : '**';
COLONCHAR : ':';
COMMACHAR : ',';
COMMENTTAG : '*>';
DOLLARCHAR : '$';
DOUBLEQUOTE : '"';

// period full stopPosition
DOT_FS : '.' EOF?;
EQUALCHAR : '=';
LESSTHANCHAR : '<';
LESSTHANOREQUAL : '<=';
LPARENCHAR : '(';
MINUSCHAR : '-';
MORETHANCHAR : '>';
MORETHANOREQUAL : '>=';
NOTEQUALCHAR : '<>';
PLUSCHAR : '+';
SEMICOLON_FS : ';' EOF?;
SINGLEQUOTE : '\'';
RPARENCHAR : ')';
SLASHCHAR : '/';
SQLLINECOMMENTCHAR: '--';

LEVEL_NUMBER : ([1-9])|([0][1-9])|([1234][0-9]);
LEVEL_NUMBER_66 : '66';
LEVEL_NUMBER_77 : '77';
LEVEL_NUMBER_88 : '88';

INTEGERLITERAL : (PLUSCHAR | MINUSCHAR)? DIGIT+ | LEVEL_NUMBER;

SINGLEDIGITLITERAL : DIGIT;

NUMERICLITERAL : (PLUSCHAR | MINUSCHAR)? DIGIT* (DOT_FS | COMMACHAR) DIGIT+ (('e' | 'E') (PLUSCHAR | MINUSCHAR)? DIGIT+)?;

NONNUMERICLITERAL : UNTRMSTRINGLITERAL | STRINGLITERAL | DBCSLITERAL | HEXNUMBER | NULLTERMINATED;

CHAR_STRING_CONSTANT : HEXNUMBER | STRINGLITERAL;

IDENTIFIER : [a-zA-Z0-9][-_a-zA-Z0-9]*;
COPYBOOK_IDENTIFIER : [a-zA-Z0-9#@$][-_a-zA-Z0-9#@$]*;
FILENAME : IDENTIFIER+ '.' IDENTIFIER+;

OCTDIGITS : OCT_DIGIT;
HEX_NUMBERS : HEXNUMBER;

// whitespace, line breaks, comments, ...
NEWLINE : '\r'? '\n' -> channel(HIDDEN);
COMMENTLINE : COMMENTTAG WS ~('\n' | '\r')* -> channel(COMMENTS);
WS : [ \t\f]+ -> channel(HIDDEN);

//SQL comments
SQLLINECOMMENT
	:	SQLLINECOMMENTCHAR ~[\r\n]* NEWLINE -> channel(HIDDEN)
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
