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
lexer grammar Db2SqlLexer;
channels{COMMENTS}

// DB2 SQL Reserved Keywords
AND : A N D;
AS : A S;
BINARY : B I N A R Y;
BLOB : B L O B;
BLOB_FILE : B L O B MINUSCHAR F I L E;
BLOB_LOCATOR : B L O B MINUSCHAR L O C A T O R;
CHAR : C H A R;
CHARACTER : C H A R A C T E R;
CLIENT : C L I E N T;
CLOB : C L O B;
CLOB_FILE : C L O B MINUSCHAR F I L E;
CLOB_LOCATOR : C L O B MINUSCHAR L O C A T O R;
CURRENT : C U R R E N T;
DBCLOB : D B C L O B;
DBCLOB_FILE : D B C L O B MINUSCHAR F I L E;
DBCLOB_LOCATOR : D B C L O B MINUSCHAR L O C A T O R;
EXEC_SQL: E X E C [ \t\f\r\n]+ S Q L;
EXEC_SQLIMS: E X E C [ \t\f\r\n]+ S Q L I M S;
END_EXEC: E N D MINUSCHAR E X E C;
FILLER: F I L L E R;
G_CHAR: G;
IS : I S;
K_CHAR: K;
LARGE : L A R G E;
LIKE : L I K E;
LOCATOR : L O C A T O R;
M_CHAR: M;
NOT : N O T;
OBJECT : O B J E C T;
OCCURS : O C C U R S;
OR : O R;
RESULT_SET_LOCATOR : R E S U L T MINUSCHAR S E T MINUSCHAR L O C A T O R;
ROWID : R O W I D;
SELECTIVITY : S E L E C T I V I T Y;
SERVER : S E R V E R;
SQL : S Q L;
TABLE : T A B L E;
TIMES : T I M E S;
TYPE : T Y P E;
USAGE : U S A G E;
VARBINARY : V A R B I N A R Y;
VARYING : V A R Y I N G;
XML : X M L;

// symbols
COMMACHAR : ',';
DOT_FS : '.' EOF?;
LPARENCHAR : '(';
MINUSCHAR : '-';
PLUSCHAR : '+';
SEMICOLON_FS : ';' EOF?;
RPARENCHAR : ')';

// Constructors symbols
SINGLEDIGIT_1: '1';
DOUBLEDIGIT_1: '01';
SINGLEDIGITLITERAL : DIGIT;
INTEGERLITERAL : DIGIT+;
IDENTIFIER : [\p{Alnum}\p{General_Category=Other_Letter}] [-_\p{Alnum}\p{General_Category=Other_Letter}]*;

NUMERICLITERAL : (PLUSCHAR | MINUSCHAR)? DIGIT* (DOT_FS | COMMACHAR) DIGIT+ (('e' | 'E') (PLUSCHAR | MINUSCHAR)? DIGIT+)?;

// whitespace, line breaks, comments, ...
NEWLINE : '\r'? '\n' -> channel(HIDDEN);
WS : [ \t\f]+ -> channel(HIDDEN);

// treat all the non-processed tokens as errors
ERRORCHAR : . ;


 fragment DIGIT: [0-9];
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
