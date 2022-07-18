/*
 * Copyright (c) 2022 Broadcom.
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

lexer grammar DaCoLexer;

channels{COMMENTS}
import TechnicalLexer;

ADD : A D D;
ADDRESS : A D D R E S S;
AFTER : A F T E R;
ALL : A L L;
ANA : A N A;
ANALIST : A N A L I S T;
ANY : A N Y;
BOTH : B O T H;
ASC : A S C;
ASCENDING : A S C E N D I N G;
AUTO : A U T O;
AVG : A V G;
BUFFER : B U F F E R;
BY : B Y;
CHECK : C H E C K;
CLOSE : C L O S E;
COLS : C O L S;
CR : C R;
DATE : D A T E;
DAY : D A Y;
DAY_OF_WEEK : D A Y MINUSCHAR O F MINUSCHAR W E E K;
DB : D B;
DEBUG : D E B U G;
DEBUG_CONTENTS : D E B U G MINUSCHAR C O N T E N T S;
DEBUG_ITEM : D E B U G MINUSCHAR I T E M;
DEBUG_LINE : D E B U G MINUSCHAR L I N E;
DEBUG_NAME : D E B U G MINUSCHAR N A M E;
DEBUG_SUB_1 : D E B U G MINUSCHAR S U B MINUSCHAR '1';
DEBUG_SUB_2 : D E B U G MINUSCHAR S U B MINUSCHAR '2';
DEBUG_SUB_3 : D E B U G MINUSCHAR S U B MINUSCHAR '3';
DELETE : D E L E T E;
DELIMITER : D E L I M I T E R;
DES : D E S;
DESCENDING : D E S C E N D I N G;
DESCRIPTION : D E S C R I P T I O N;
DESIGNER : D E S I G N E R;
DFLD: D F L D;
DISPLAY : D I S P L A Y;
DOM : D O M;
DUPLICATE : D U P L I C A T E;
EMA : E M A;
END : E N D;
ENDRPT : E N D R P T;
ENTITY : E N T I T Y;
ERROR : E R R O R;
EXEC : E X E C;
FALSE : F A L S E;
FIELD : F I E L D;
FILE : F I L E;
FILL : F I L L;
FIND : F I N D;
FOR : F O R;
FROM : F R O M;
FUNCTION : F U N C T I O N;
GET : G E T;
GRS : G R S;
HEX : H E X;
HIGH_VALUE : H I G H MINUSCHAR V A L U E;
HIGH_VALUES : H I G H MINUSCHAR V A L U E S;
IN : I N;
INFO : I N F O;
INPUT : I N P U T;
INSERT : I N S E R T;
INTEGER : I N T E G E R;
INTO : I N T O;
INVERT : I N V E R T;
IS : I S;
ITEM : I T E M;
JNIENVPTR : J N I E N V P T R;
JOB : J O B;
LAYOUT : L A Y O U T;
LENGTH : L E N G T H;
LINAGE_COUNTER : L I N A G E MINUSCHAR C O U N T E R;
LINE: L I N E;
LINES : L I N E S;
LINE_COUNTER : L I N E MINUSCHAR C O U N T E R;
LOW_VALUE : L O W MINUSCHAR V A L U E;
LOW_VALUES : L O W MINUSCHAR V A L U E S;
MATCH : M A T C H;
NETWORK : N E T W O R K;
NEXT : N E X T;
NO_POS : N O MINUSCHAR P O S;
NULL : N U L L;
NULLS : N U L L S;
MAX : M A X;
MESSAGE : M E S S A G E;
MODIFY : M O D I F Y;
ODETTE : O D E T T E;
OF : O F;
ON : O N;
OPEN : O P E N;
OWN : O W N;
OWNER : O W N E R;
OUTPUT : O U T P U T;
PACKET : P A C K E T;
PAGE : P A G E;
PAGE_COUNTER : P A G E MINUSCHAR C O U N T E R;
PRIOR : P R I O R;
QUOTE : Q U O T E;
QUOTES : Q U O T E S;
RANDOM: R A N D O M;
READ : R E A D;
REPLACE : R E P L A C E;
REPORT : R E P O R T;
RESTORE : R E S T O R E;
RESULT : R E S U L T;
RETURN : R E T U R N;
RETURN_CODE : R E T U R N MINUSCHAR C O D E;
ROW : R O W;
RCU : R C U;
SEQ : S E Q;
SHIFT_IN : S H I F T MINUSCHAR I N;
SHIFT_OUT : S H I F T MINUSCHAR O U T;
SHOW : S H O W;
SINGLE : S I N G L E;
SORT : S O R T;
SORT_CONTROL : S O R T MINUSCHAR C O N T R O L;
SORT_CORE_SIZE : S O R T MINUSCHAR C O R E MINUSCHAR S I Z E;
SORT_FILE_SIZE : S O R T MINUSCHAR F I L E MINUSCHAR S I Z E;
SORT_MESSAGE : S O R T MINUSCHAR M E S S A G E;
SORT_MODE_SIZE : S O R T MINUSCHAR M O D E MINUSCHAR S I Z E;
SORT_RETURN : S O R T MINUSCHAR R E T U R N;
SPACE : S P A C E;
SPACES : S P A C E S;
START : S T A R T;
SAVE : S A V E;
STATS : S T A T S;
STD : S T D;
STRING : S T R I N G;
SUM : S U M;
TABLE : T A B L E;
TALLY : T A L L Y;
TASK : T A S K;
TIME : T I M E;
TO : T O;
TRANSACTION : T R A N S A C T I O N;
TRUE : T R U E;
USER : U S E R;
USING : U S I N G;
VERSION : V E R S I O N;
VOLSER : V O L S E R;
WARNING : W A R N I N G;
WHEN_COMPILED : W H E N MINUSCHAR C O M P I L E D;
WITH : W I T H;
WRITE : W R I T E;
YES : Y E S;
ZERO : Z E R O;
ZEROES : Z E R O E S;
ZEROS : Z E R O S;

// COBOL statement start keywords
ACCEPT : A C C E P T;
ALTER : A L T E R;
CALL : C A L L;
CANCEL : C A N C E L;
COMPUTE : C O M P U T E;
CONTINUE : C O N T I N U E;
DISABLE : D I S A B L E;
DIVIDE : D I V I D E;
ENABLE : E N A B L E;
ENTRY : E N T R Y;
EVALUATE : E V A L U A T E;
WHEN : W H E N;
END_EVALUATE : E N D MINUSCHAR E V A L U A T E;
EXHIBIT : E X H I B I T;
EXIT : E X I T;
GENERATE : G E N E R A T E;
GOBACK : G O B A C K;
GO : G O;
IF : I F;
ELSE : E L S E;
END_IF : E N D MINUSCHAR I F;
INITIALIZE : I N I T I A L I Z E;
INITIATE : I N I T I A T E;
INSPECT : I N S P E C T;
MERGE : M E R G E;
MOVE : M O V E;
MULTIPLY : M U L T I P L Y;
PERFORM : P E R F O R M;
END_PERFORM: E N D MINUSCHAR P E R F O R M;
PURGE : P U R G E;
READY : R E A D Y;
RESET : R E S E T;
RECEIVE : R E C E I V E;
RELEASE : R E L E A S E;
REWRITE : R E W R I T E;
SEARCH : S E A R C H;
SEND : S E N D;
SERVICE : S E R V I C E;
SET : S E T;
STOP : S T O P;
SUBTRACT : S U B T R A C T;
TERMINATE : T E R M I N A T E;
UNSTRING : U N S T R I N G;
XML : X M L;

// IDMS statement start keywords
TRANSFER : T R A N S F E R;
ABEND : A B E N D;
ATTACH : A T T A C H;
BIND : B I N D;
CHANGE : C H A N G E;
COMMIT : C O M M I T;
CONNECT : C O N N E C T;
DC : D C;
DEQUEUE : D E Q U E U E;
DISCONNECT : D I S C O N N E C T;
ENDPAGE : E N D P A G E;
ENQUEUE : E N Q U E U E;
ERASE : E R A S E;
FINISH : F I N I S H;
FREE : F R E E;
INQUIRE : I N Q U I R E;
KEEP : K E E P;
LOAD : L O A D;
MAP : M A P;
OBTAIN : O B T A I N;
POST : P O S T;
PUT : P U T;
ROLLBACK : R O L L B A C K;
SNAP : S N A P;
STARTPAGE : S T A R T P A G E;
STORE : S T O R E;
WAIT : W A I T;

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

PICTURECHARSGROUP1: PICTURECharAcceptedMultipleTime+;
PICTURECHARSGROUP2: PICTURECharAcceptedOneTime+;
WS2 : [ \t\f]+ -> channel(HIDDEN);
LParIntegralRPar: LPARENCHAR INTEGERLITERAL RPARENCHAR;
fragment PICTUREPeriodAcceptables: ('0'|'9'|B|Z|CR|DB|ASTERISKCHAR|COMMACHAR|MINUSCHAR|PLUSCHAR|SLASHCHAR);
fragment PICTURECharAcceptedMultipleTime: (A|G|N|P|X|DOLLARCHAR|PICTUREPeriodAcceptables);
fragment PICTURECharAcceptedOneTime: (V|E|S|CR|DB);
