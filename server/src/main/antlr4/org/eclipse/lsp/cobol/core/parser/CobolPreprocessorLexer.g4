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
EXEC_SQL: EXEC WS SQL;
EXEC: E X E C;
FUNCTION: F U N C T I O N;
IN: I N;
INCLUDE: I N C L U D E;
LEADING: L E A D I N G;
LIST: L I S T;
MAP: M A P;
NO: N O;
OF: O F;
OFF: O F F;
PIC : P I C  -> pushMode(PICTURECLAUSE);
PICTURE : P I C T U R E -> pushMode(PICTURECLAUSE);
REPLACING: R E P L A C I N G;
REPLACE: R E P L A C E;
TITLE: T I T L E;
TRAILING: T R A I L I N G;
SOURCE: S O U R C E;
SQL: S Q L;
SUPPRESS: S U P P R E S S;
EJECT: E J E C T DOT_FS? -> channel(HIDDEN);
SKIP1 : S K I P '1' DOT_FS? -> channel(HIDDEN);
SKIP2 : S K I P '2' DOT_FS? -> channel(HIDDEN);
SKIP3 : S K I P '3' DOT_FS? -> channel(HIDDEN);

// compiler directive tokens
TITLESTATEMENT : (TITLE ' '+ .*? NEWLINE)  ;

CONTROL_DIRECTIVE: ASTERISKCHAR (CONTROL | CBL) ((' '| COMMACHAR)
                  (SOURCE | NO SOURCE | LIST | NO LIST | MAP | NO MAP
                  | IDENTIFIER? ))+  DOT?;

ENTER_STMT: ENTER ' '+ IDENTIFIER? (' '+ IDENTIFIER)? ' '* DOT;

// symbols
DOUBLEEQUALCHAR : '==';
EMPTYPSEUDOTEXT : '====';
PIPECHAR : '||';
SELECT_ALL : '.*';


mode PICTURECLAUSE;
FINALCHARSTRING: CHARSTRING+ ->popMode;
CHARSTRING: PICTURECHARSGROUP1+ PICTURECHARSGROUP2? LParIntegralRPar? '.'? (PICTURECHARSGROUP1|PICTURECHARSGROUP2)
			PICTURECHARSGROUP1+ PICTURECHARSGROUP2? LParIntegralRPar?|
			PICTURECHARSGROUP1* '.' PICTUREPeriodAcceptables+ LParIntegralRPar?|
			PICTURECHARSGROUP1* PICTURECHARSGROUP2? PICTURECHARSGROUP1+ LParIntegralRPar? '.'? (PICTURECHARSGROUP1|PICTURECHARSGROUP2)|
			PICTURECHARSGROUP1* PICTURECHARSGROUP2? PICTURECHARSGROUP1+ LParIntegralRPar?|
			PICTURECHARSGROUP2 PICTURECHARSGROUP1* LParIntegralRPar? '.'? (PICTURECHARSGROUP1|PICTURECHARSGROUP2)|
			PICTURECHARSGROUP2 PICTURECHARSGROUP1* LParIntegralRPar?
;

DOT_FS2 : '.' ('\r' | '\n' | '\f' | '\t' | ' ')+ -> popMode;
PICTURECHARSGROUP1: PICTURECharAcceptedMultipleTime+;
PICTURECHARSGROUP2: PICTURECharAcceptedOneTime+;
WS2 : [ \t\f;]+ -> channel(HIDDEN);
IS2: I S;
LParIntegralRPar: LPARENCHAR INTEGERLITERAL RPARENCHAR;
fragment PICTUREPeriodAcceptables: ('0'|'9'|B|Z|CR|DB|ASTERISKCHAR|COMMACHAR|MINUSCHAR|PLUSCHAR|SLASHCHAR);
fragment PICTURECharAcceptedMultipleTime: (A|G|N|P|X|DOLLARCHAR|PICTUREPeriodAcceptables);
fragment PICTURECharAcceptedOneTime: (V|E|S|CR|DB);
fragment SSMinusChar: S U B S C H E M A MINUSCHAR;
