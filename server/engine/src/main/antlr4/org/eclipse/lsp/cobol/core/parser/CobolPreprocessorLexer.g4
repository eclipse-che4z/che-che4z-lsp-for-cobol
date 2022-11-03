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

lexer grammar CobolPreprocessorLexer;
channels{COMMENTS}
import TechnicalLexer;
// compiler only keywords
CBL : C B L;
CONTROL: C O N T R O L;
COPY: C O P Y;
BY: B Y;
CR: C R;
DB: D B;
END_EXEC : E N D MINUSCHAR E X E C ;
ENTER: E N T E R;
EXEC: E X E C;
FILE : F I L E;
FUNCTION: F U N C T I O N;
IDMS : I D M S;
IN: I N;
INCLUDE: I N C L U D E;
LEADING: L E A D I N G;
LINKAGE: L I N K A G E;
PROCEDURE: P R O C E D U R E;
DIVISION: D I V I S I O N;
LIST: L I S T;
MAID: M A I D;
MAP: M A P;
MAP_CONTROL: M A P MINUSCHAR C O N T R O L;
MODULE : M O D U L E;
NO: N O;
NOLIST: N O L I S T;
NOMAP: N O M A P;
NOSOURCE: N O S O U R C E;
OF: O F;
OFF: O F F;
PIC : P I C  -> pushMode(PICTURECLAUSE);
PICTURE : P I C T U R E -> pushMode(PICTURECLAUSE);
PLUSPLUSINCLUDE : PLUSCHAR PLUSCHAR INCLUDE;
RECORD : R E C O R D;
REDEFINES : R E D E F I N E S;
REPLACING: R E P L A C I N G;
REPLACE: R E P L A C E;
TITLE: T I T L E;
TRAILING: T R A I L I N G;
SECTION: S E C T I O N;
SOURCE: S O U R C E;
SQL: S Q L;
SUPPRESS: S U P P R E S S;
VERSION : V E R S I O N;
WORKING_STORAGE : W O R K I N G MINUSCHAR S T O R A G E;
EJECT: E J E C T DOT_FS? -> channel(HIDDEN);
SKIP1 : S K I P '1' DOT_FS? -> channel(HIDDEN);
SKIP2 : S K I P '2' DOT_FS? -> channel(HIDDEN);
SKIP3 : S K I P '3' DOT_FS? -> channel(HIDDEN);

// symbols
DOUBLEEQUALCHAR : '==';
EMPTYPSEUDOTEXT : '====';
PIPECHAR : '||';
PIPECHAR2: '!!';
SELECT_ALL : '.*';

// COBOL special separators
SEMICOLONSEPARATOR2 : '; ' ;
COMMASEPARATOR2 : ', ' ;

mode PICTURECLAUSE;
FINALCHARSTRING: CHARSTRING+ ->popMode;
DOT_FS2 : '.' EOF? -> popMode;
PICTUREIS : I S;
CHARSTRING: PICTURECHARSGROUP1+ PICTURECHARSGROUP2? LParIntegralRPar? '.'? (PICTURECHARSGROUP1|PICTURECHARSGROUP2)
			PICTURECHARSGROUP1+ PICTURECHARSGROUP2? LParIntegralRPar?|
			PICTURECHARSGROUP1* '.' PICTUREPeriodAcceptables+ LParIntegralRPar?|
			PICTURECHARSGROUP1* PICTURECHARSGROUP2? PICTURECHARSGROUP1+ LParIntegralRPar? '.'? (PICTURECHARSGROUP1|PICTURECHARSGROUP2)|
			PICTURECHARSGROUP1* PICTURECHARSGROUP2? PICTURECHARSGROUP1+ LParIntegralRPar?|
			PICTURECHARSGROUP2 PICTURECHARSGROUP1* LParIntegralRPar? '.'? (PICTURECHARSGROUP1|PICTURECHARSGROUP2)|
			PICTURECHARSGROUP2 PICTURECHARSGROUP1* LParIntegralRPar?
;

PICTURECHARSGROUP1: PICTURECharAcceptedMultipleTime+;
PICTURECHARSGROUP2: PICTURECharAcceptedOneTime+;
WS2 : [ \t\f]+ -> channel(HIDDEN);
TEXT : ~('\n' | '\r');
NEXTLINE: ('\n');
LParIntegralRPar: LPARENCHAR INTEGERLITERAL RPARENCHAR;
fragment PICTUREPeriodAcceptables: ('0'|'9'|B|Z|CR|DB|ASTERISKCHAR|COMMACHAR|MINUSCHAR|PLUSCHAR|SLASHCHAR);
fragment PICTURECharAcceptedMultipleTime: (A|G|N|P|X|DOLLARCHAR|PICTUREPeriodAcceptables);
fragment PICTURECharAcceptedOneTime: (V|E|S|CR|DB);
