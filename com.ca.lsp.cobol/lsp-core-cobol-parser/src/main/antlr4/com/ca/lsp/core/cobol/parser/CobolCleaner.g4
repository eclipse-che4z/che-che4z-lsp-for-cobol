/*
 * Copyright (c) 2019 Broadcom.
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

grammar CobolCleaner;

startClean
   : cleaning EOF
   ;

cleaning
   : .*? (shittyShit+ .*?)+
   ;

shittyShit
   : execSqlStatement | execSqlImsStatement | execCicsStatement | ejectStatement | NEWLINE | .
   ;

// exec cics statement

execCicsStatement
   : EXEC CICS .*? END_EXEC DOT_FS?
   ;

// exec sql statement

execSqlStatement
   : EXEC SQL .*? END_EXEC DOT_FS?
   ;

// exec sql ims statement

execSqlImsStatement
   : EXEC SQLIMS .*? END_EXEC DOT_FS?
   ;

ejectStatement
   : EJECT DOT_FS?
   ;

//keywords
EJECT: E J E C T;
EXEC: E X E C;
CICS: C I C S;
END_EXEC: E N D MINUSCHAR E X E C;
SQL: S Q L;
SQLIMS : S Q L I M S;

// symbols
COMMENTTAG : '*>';
COMMACHAR : ',';
DOT_FS : '.' ('\r' | '\n' | '\f' | '\t' | ' ')+ | '.' EOF;
DOT : '.';
MINUSCHAR : '-';

fragment HEXNUMBER :
	X '"' [0-9A-F]+ '"'
	| X '\'' [0-9A-F]+ '\''
;

fragment STRINGLITERAL :
	'"' (~["\n\r] | '""' | '\'')* '"'
	| '\'' (~['\n\r] | '\'\'' | '"')* '\''
;

IDENTIFIER : [a-zA-Z0-9]+ ([-_]+ [a-zA-Z0-9]+)*;


// whitespace, line breaks, comments, ...
NEWLINE : '\r'? '\n' -> channel(HIDDEN);
COMMENTLINE : COMMENTTAG ~('\n' | '\r')* -> channel(HIDDEN);
WS : [ \t\f;]+ -> channel(HIDDEN);
TEXT : ~('\n' | '\r');
SEPARATOR : ', ' -> channel(HIDDEN);


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