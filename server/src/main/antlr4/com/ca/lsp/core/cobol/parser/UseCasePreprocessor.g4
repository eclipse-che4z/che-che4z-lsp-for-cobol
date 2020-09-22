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
 *    Broadcom, Inc. - initial API and implementation
 *
 */

grammar UseCasePreprocessor;

startRule
   : .*? ((copybookStatement | variableStatement | paragraphStatement | errorStatement | multiTokenError | NEWLINE)+ .*?)+ EOF
   ;

multiTokenError
   : MULTITOKENSTART multiToken diagnostic* MULTITOKENSTOP
   ;

multiToken
   : (word | copybookStatement | variableStatement | paragraphStatement | errorStatement | multiTokenError | TEXT)+
   ;

errorStatement
   : START (STRINGLITERAL | word | TEXT)? diagnostic* STOP
   ;

copybookStatement
   : (copybookUsage | copybookDefinition) diagnostic* STOP
   ;

copybookUsage
   : COPYBOOKUSAGE cpyIdentifier
   ;

copybookDefinition
   : COPYBOOKDEFINITION cpyIdentifier
   ;

variableStatement
   : (variableUsage | variableDefinition) diagnostic* STOP
   ;

variableUsage
   : VARIABLEUSAGE word
   ;

variableDefinition
   : VARIABLEDEFINITION word
   ;

paragraphStatement
   : (paragraphUsage | paragraphDefinition) diagnostic* STOP
   ;

paragraphUsage
   : PARAGRPHUSAGE word
   ;

paragraphDefinition
   : PARAGRPHDEFINITION word
   ;

diagnostic
   : DIAGNOSTICSTART identifier
   ;

word
   : identifier replacement?
   ;

replacement
   : REPLACEMENTSTART identifier
   ;

identifier
   : IDENTIFIER
   ;

cpyIdentifier
   : cpyName replacement?
   ;

cpyName
   : IDENTIFIER | COPYBOOKNAME
   ;

START : '{';
STOP : '}';
VARIABLEDEFINITION : START + '$*';
VARIABLEUSAGE : START + '$';
PARAGRPHDEFINITION : START + '#*';
PARAGRPHUSAGE : START + '#';
COPYBOOKDEFINITION : START + '~*';
COPYBOOKUSAGE : START + '~';
DIAGNOSTICSTART : '|';
REPLACEMENTSTART : '^';
MULTITOKENSTART : START + '_';
MULTITOKENSTOP : '_' + STOP;

STRINGLITERAL : ["] ~["]* ["];
IDENTIFIER : [a-zA-Z0-9:]+ ([-_]+ [a-zA-Z0-9:]+)*;

COPYBOOKNAME : [a-zA-Z0-9#@$]+ ([-_]+ [a-zA-Z0-9#@$]+)*;

// whitespace, line breaks, comments, ...
NEWLINE : '\r'? '\n' -> channel(HIDDEN);
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