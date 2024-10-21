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
   : .*? ((copybookStatement | functionDefinition | variableStatement | functionUsage | paragraphStatement | sectionStatement | subroutineStatement
   | constantStatement | errorStatement | multiTokenError | linkageSection | NEWLINE)+ .*?)+ EOF
   ;

multiTokenError
   : MULTITOKENSTART multiToken diagnostic* MULTITOKENSTOP
   ;

multiToken
   : (word | copybookStatement | variableStatement | functionUsage | paragraphStatement | sectionStatement | subroutineStatement
   | constantStatement | errorStatement | multiTokenError | TEXT)+
   ;

linkageSection
   : LINKAGE SECTION DOT
   ;

errorStatement
   : START (STRINGLITERAL | word | TEXT | NUMBERLITERAL)? diagnostic* STOP
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

functionUsage
  : FUNCTIONUSAGE word diagnostic* STOP
  ;

variableDefinition
   : VARIABLEDEFINITION word
   ;

functionDefinition
   : FUNCTIONDEFINITION multiToken replacement? diagnostic STOP
   ;

constantStatement
   : constantUsage diagnostic* STOP
   ;

constantUsage
   : CONSTANTUSAGE word
   ;

paragraphStatement
   : (paragraphUsage | paragraphDefinition) diagnostic* STOP
   ;

sectionStatement
   : (sectionUsage | sectionDefinition) diagnostic* STOP
   ;

paragraphUsage
   : PARAGRPHUSAGE word
   ;

paragraphDefinition
   : PARAGRPHDEFINITION word
   ;

sectionUsage
   : SECTIONUSAGE word
   ;

sectionDefinition
   : SECTIONDEFINITION word
   ;

subroutineStatement
   : subroutineUsage diagnostic* STOP
   ;

subroutineUsage
   : SUBROUTINEUSAGE STRINGLITERAL replacement?
   ;

diagnostic
   : DIAGNOSTICSTART identifier
   ;

word
   : identifier replacement?
   ;

replacement
   : ((FINAL_SIZE_REPLACEMENT_START | ORIGINAL_SIZE_REPLACEMENT_START | ORIGINAL_SIZE_COPY_START) identifier)
   | (PRODUCE_REPLACEMENT identifier (PRODUCE_REPLACEMENT identifier)*)
   ;

identifier
   : (IDENTIFIER | NUMBERLITERAL | LINKAGE | SECTION | DOT | STRINGLITERAL | TEXT)+
   ;

cpyIdentifier
   : cpyName cpyDialect? replacement?
   ;

cpyName
   : IDENTIFIER | COPYBOOKNAME | QUOTED_COPYBOOKNAME | STRINGLITERAL | NUMBERLITERAL | LINKAGE | SECTION
   | LINKAGE
   ;

cpyDialect
   : COPYBOOKDIALECT identifier
   ;

LINKAGE : L I N K A G E;
SECTION : S E C T I O N;
START : '{';
STOP : '}';
VARIABLEDEFINITION : START '$*';
VARIABLEUSAGE : START '$';
CONSTANTUSAGE : START '&';
PARAGRPHDEFINITION : START '#*';
PARAGRPHUSAGE : START '#';
SECTIONDEFINITION : START '@*';
SECTIONUSAGE : START '@';
COPYBOOKDEFINITION : START '~*';
COPYBOOKUSAGE : START '~';
SUBROUTINEUSAGE : START '%';
DIAGNOSTICSTART : '|';
ORIGINAL_SIZE_COPY_START : '`&';
ORIGINAL_SIZE_REPLACEMENT_START : '`';
FINAL_SIZE_REPLACEMENT_START : '^';
PRODUCE_REPLACEMENT: '`->';
COPYBOOKDIALECT: '!';
MULTITOKENSTART : START '_';
MULTITOKENSTOP : '_' STOP;
FUNCTIONDEFINITION : START '$$*';
FUNCTIONUSAGE : START '$$';
DOT : '.';

NUMBERLITERAL : [\-+0-9.,]+;
STRINGLITERAL : ['"] .*? ['"\n];
IDENTIFIER : [a-zA-Z0-9:]+ ([-_]+ [a-zA-Z0-9:]+)*;

COPYBOOKNAME : [a-zA-Z0-9#@$]+ ([-_]+ [a-zA-Z0-9#@$]+)*;
QUOTED_COPYBOOKNAME : '\'' COPYBOOKNAME '\'';

// whitespace, line breaks, comments, ...
NEWLINE : '\r'? '\n' -> channel(HIDDEN);
WS : [ \t\f]+ -> channel(HIDDEN);
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
