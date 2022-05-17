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
import TechnicalLexer;

// DB2 SQL Reserved Keywords

ABSOLUTE : A B S O L U T E;
ACCELERATION : A C C E L E R A T I O N;
ACCELERATOR : A C C E L E R A T O R;
ACCESS : A C C E S S;
ACCESSCTRL : A C C E S S C T R L;
ACCTNG: A C C T N G;
ACTION : A C T I O N;
ACTIVATE : A C T I V A T E;
ACTIVE : A C T I V E;
ADD : A D D;
ADDRESS : A D D R E S S;
AFTER : A F T E R;
AGE: A G E;
ALGORITHM : A L G O R I T H M;
ALIAS : A L I A S;
ALL : A L L;
ALLOCATE : A L L O C A T E;
ALLOW : A L L O W;
ALTER : A L T E R;
ALTERIN : A L T E R I N;
ALWAYS : A L W A Y S;
AND : A N D;
ANY : A N Y;
APPEND : A P P E N D;
APPLCOMPAT : A P P L C O M P A T;
APPLICATION : A P P L I C A T I O N;
APPLNAME : A P P L N A M E;
ARCHIVE : A R C H I V E;
ARRAY: A R R A Y;
ARRAY_EXISTS : A R R A Y UNDERSCORECHAR E X I S T S;
AS : A S;
ASC : A S C;
ASCII : A S C I I;
ASENSITIVE : A S E N S I T I V E;
ASSEMBLE : A S S E M B L E;
ASSOCIATE : A S S O C I A T E;
ASUTIME : A S U T I M E;
AT : A T;
ATOMIC : A T O M I C;
ATTRIBUTES : A T T R I B U T E S;
AUDIT : A U D I T;
AUTHENTICATION : A U T H E N T I C A T I O N;
AUTHID : A U T H I D;
AUTONOMOUS : A U T O N O M O U S;
AUX : A U X;
AUXILIARY : A U X I L I A R Y;
AVG : A V G;
BASED : B A S E D;
BEFORE : B E F O R E;
BEGIN : B E G I N;
BETWEEN : B E T W E E N;
BIGINT : B I G I N T;
BINARY : B I N A R Y;
BINARY_STRING_CONSTANT : BXNUMBER;
BIND : B I N D;
BINDADD : B I N D A D D;
BINDAGENT : B I N D A G E N T;
BIT : B I T;
BLOB : B L O B;
BOTH : B O T H;
BSDS : B S D S;
BUFFERPOOL : B U F F E R P O O L;
BUFFERPOOLS : B U F F E R P O O L S;
BUSINESS_TIME : B U S I N E S S UNDERSCORECHAR T I M E;
BY : B Y;
CACHE: C A C H E;
CALL : C A L L;
CALLED : C A L L E D;
CALLER : C A L L E R;
CAPTURE : C A P T U R E;
CARDINALITY : C A R D I N A L I T Y;
CASCADE : C A S C A D E;
CASCADED : C A S C A D E D;
CASE : C A S E;
CAST : C A S T;
CATALOG_NAME: C A T A L O G UNDERSCORECHAR N A M E;
CCSID : C C S I D;
CHANGE : C H A N G E;
CHANGED : C H A N G E D;
CHANGES : C H A N G E S;
CHAR : C H A R;
CHARACTER : C H A R A C T E R;
CHARACTER_LENGTH : C H A R A C T E R UNDERSCORECHAR L E N G T H;
CHAR_LENGTH : C H A R UNDERSCORECHAR L E N G T H;
CHECK : C H E C K;
CLAUSE : C L A U S E;
CLIENT : C L I E N T;
CLIENT_ACCTNG : CLIENT UNDERSCORECHAR ACCTNG; //SPECIAL REGITERS ?
CLIENT_APPLNAME: CLIENT UNDERSCORECHAR APPLNAME;
CLIENT_CORR_TOKEN: CLIENT UNDERSCORECHAR CORR UNDERSCORECHAR TOKEN;
CLIENT_USERID: CLIENT UNDERSCORECHAR USERID;
CLIENT_WRKSTNNAME: CLIENT UNDERSCORECHAR WRKSTNNAME;
CLOB : C L O B;
CLONE : C L O N E;
CLOSE : C L O S E;
CLUSTER : C L U S T E R;
COALESCE : C O A L E S C E;
COBOL : C O B O L;
COLLECTION : C O L L E C T I O N;
COLLID : C O L L I D;
COLUMN : C O L U M N;
COLUMNS : C O L U M N S;
COMMENT : C O M M E N T;
COMMIT : C O M M I T;
COMMITTED: C O M M I T T E D;
COMPATIBILITY : C O M P A T I B I L I T Y;
COMPRESS : C O M P R E S S;
CONCAT : C O N C A T;
CONCENTRATE : C O N C E N T R A T E;
CONCURRENT : C O N C U R R E N T;
CONDITION : C O N D I T I O N;
CONDITION_NUMBER : C O N D I T I O N UNDERSCORECHAR N U M B E R;
CONNECT : C O N N E C T;
CONNECTION : C O N N E C T I O N;
CONSTANT : C O N S T A N T;
CONSTRAINT : C O N S T R A I N T;
CONTAINS : C O N T A I N S;
CONTEXT : C O N T E X T;
CONTINUE : C O N T I N U E;
CONTROL : C O N T R O L;
COPY : C O P Y;
CORR : C O R R;
CORRELATION : C O R R E L A T I O N;
COUNT : C O U N T;
COUNT_BIG : C O U N T UNDERSCORECHAR B I G;
COVARIANCE: C O V A R I A N C E;
CREATE : C R E A T E;
CREATEALIAS : C R E A T E A L I A S;
CREATEDBA : C R E A T E D B A;
CREATEDBC : C R E A T E S G;
CREATEIN : C R E A T E I N;
CREATESG : C R E A T E S G;
CREATETAB : C R E A T E T A B;
CREATETMTAB : C R E A T E T M T A B;
CREATETS : C R E A T E T S;
CREATE_SECURE_OBJECT : C R E A T E UNDERSCORECHAR S E C U R E UNDERSCORECHAR O B J E C T;
CROSS : C R O S S;
CS : C S;
CUBE : C U B E;
CUME_DIST: C U M E UNDERSCORECHAR D I S T;
CURRENT : C U R R E N T;
CURRENTLY : C U R R E N T L Y;
CURRENT_DATE : C U R R E N T UNDERSCORECHAR D A T E;
CURRENT_LC_CTYPE : CURRENT UNDERSCORECHAR LC_CTYPE;
CURRENT_PATH : C U R R E N T UNDERSCORECHAR P A T H;
CURRENT_SCHEMA : C U R R E N T UNDERSCORECHAR S C H E M A;
CURRENT_SERVER : C U R R E N T UNDERSCORECHAR SERVER;
CURRENT_TIME : C U R R E N T UNDERSCORECHAR TIME;
CURRENT_TIMESTAMP : C U R R E N T UNDERSCORECHAR TIMESTAMP;
CURRENT_TIMEZONE : C U R R E N T UNDERSCORECHAR TIMEZONE;
CURSOR : C U R S O R;
CURSORS : C U R S O R S;
CURSOR_NAME : C U R S O R UNDERSCORECHAR N A M E;
CYCLE : C Y C L E;
DATA : D A T A;
DATAACCESS : D A T A A C C E S S;
DATABASE : D A T A B A S E;
DATACLAS: D A T A C L A S;
DATE : D A T E;
DAY : D A Y;
DAYOFMONTH : D A Y O F M O N T H;
DAYOFWEEK : D A Y O F W E E K;
DAYOFYEAR : D A Y O F Y E A R;
DAYS : D A Y S;
DB2 : D B '2;';
DB2SQL : D B '2' S Q L;
DB2_AUTHENTICATION_TYPE : D B '2' UNDERSCORECHAR A U T H E N T I C A T I O N UNDERSCORECHAR T Y P E;
DB2_AUTHORIZATION_ID : D B '2' UNDERSCORECHAR A U T H O R  I Z A T I O N UNDERSCORECHAR I D;
DB2_CONNECTION_STATE : D B '2' UNDERSCORECHAR C O N N E C T I O N UNDERSCORECHAR S T A T E;
DB2_CONNECTION_STATUS : D B '2' UNDERSCORECHAR C O N N E C T I O N UNDERSCORECHAR S T A T U S;
DB2_ENCRYPTION_TYPE : D B '2' UNDERSCORECHAR E N C R Y P T I O N UNDERSCORECHAR T Y P E;
DB2_ERROR_CODE1 : D B '2' UNDERSCORECHAR E R R O R UNDERSCORECHAR C O D E '1';
DB2_ERROR_CODE2 : D B '2' UNDERSCORECHAR E R R O R UNDERSCORECHAR C O D E '2';
DB2_ERROR_CODE3 : D B '2' UNDERSCORECHAR E R R O R UNDERSCORECHAR C O D E '3';
DB2_ERROR_CODE4 : D B '2' UNDERSCORECHAR E R R O R UNDERSCORECHAR C O D E '4';
DB2_GET_DIAGNOSTICS_DIAGNOSTICS : D B '2' UNDERSCORECHAR G E T UNDERSCORECHAR D I A G N O S T I C S UNDERSCORECHAR D I A G N O S T I C S;
DB2_INTERNAL_ERROR_POINTER : D B '2' UNDERSCORECHAR I N T E R N A L UNDERSCORECHAR E R R O R UNDERSCORECHAR P O I N T E R;
DB2_LAST_ROW : D B '2' UNDERSCORECHAR L A S T UNDERSCORECHAR R O W;
DB2_LINE_NUMBER : D B '2' UNDERSCORECHAR L I N E UNDERSCORECHAR N U M B E R;
DB2_MESSAGE_ID : D B '2' UNDERSCORECHAR M E S S A G E UNDERSCORECHAR I D;
DB2_MODULE_DETECTING_ERROR : D B '2' UNDERSCORECHAR M O D U L E UNDERSCORECHAR D E T E C T I N G UNDERSCORECHAR E R R O R;
DB2_NUMBER_PARAMETER_MARKERS : D B '2' UNDERSCORECHAR N U M B E R UNDERSCORECHAR P A R A M E T E R UNDERSCORECHAR M A R K E R S;
DB2_NUMBER_RESULT_SETS : D B '2' UNDERSCORECHAR N U M B E R UNDERSCORECHAR R E S U L T UNDERSCORECHAR S E T S;
DB2_NUMBER_ROWS : D B '2' UNDERSCORECHAR N U M B E R UNDERSCORECHAR ROWS;
DB2_ORDINAL_TOKEN1 : D B '2' UNDERSCORECHAR O R D I N A L UNDERSCORECHAR T O K E N '1';
DB2_ORDINAL_TOKEN2 : D B '2' UNDERSCORECHAR O R D I N A L UNDERSCORECHAR T O K E N '2';
DB2_ORDINAL_TOKEN3 : D B '2' UNDERSCORECHAR O R D I N A L UNDERSCORECHAR T O K E N '3';
DB2_ORDINAL_TOKEN4: D B '2' UNDERSCORECHAR O R D I N A L UNDERSCORECHAR T O K E N '4';
DB2_PRODUCT_ID : D B '2' UNDERSCORECHAR P R O D U C T UNDERSCORECHAR I D;
DB2_REASON_CODE : D B '2' UNDERSCORECHAR R E A S O N UNDERSCORECHAR C O D E;
DB2_RETURNED_SQLCODE : D B '2' UNDERSCORECHAR R E T U R N E D UNDERSCORECHAR S Q L C O D E;
DB2_RETURN_STATUS : D B '2' UNDERSCORECHAR R E T U R N UNDERSCORECHAR S T A T U S;
DB2_ROW_NUMBER : D B '2' UNDERSCORECHAR R O W UNDERSCORECHAR N U M B E R;
DB2_SERVER_CLASS_NAME : D B '2' UNDERSCORECHAR S E R V E R UNDERSCORECHAR C L A S S UNDERSCORECHAR N A M E;
DB2_SQLERRD1 : D B '2' UNDERSCORECHAR S Q L E R R D '1';
DB2_SQLERRD2 : D B '2' UNDERSCORECHAR S Q L E R R D '2';
DB2_SQLERRD3 : D B '2' UNDERSCORECHAR S Q L E R R D '3';
DB2_SQLERRD4 : D B '2' UNDERSCORECHAR S Q L E R R D '4';
DB2_SQLERRD5 : D B '2' UNDERSCORECHAR S Q L E R R D '5';
DB2_SQLERRD6 : D B '2' UNDERSCORECHAR S Q L E R R D  '6';
DB2_SQLERRD_SET : D B '2' UNDERSCORECHAR S Q L E R R D UNDERSCORECHAR S E T;
DB2_SQL_ATTR_CURSOR_HOLD : D B '2' UNDERSCORECHAR S Q L UNDERSCORECHAR A T T R UNDERSCORECHAR C U R S O R UNDERSCORECHAR H O L D;
DB2_SQL_ATTR_CURSOR_ROWSET : D B '2' UNDERSCORECHAR S Q L UNDERSCORECHAR A T T R  C U R S O R UNDERSCORECHAR R O W S E T;
DB2_SQL_ATTR_CURSOR_SCROLLABLE : D B '2' UNDERSCORECHAR S Q L UNDERSCORECHAR A T T R UNDERSCORECHAR C U R S OR UNDERSCORECHAR S C R O L L A B L E;
DB2_SQL_ATTR_CURSOR_SENSITIVITY : D B '2' UNDERSCORECHAR S Q L UNDERSCORECHAR A T T R UNDERSCORECHAR C U R S O R UNDERSCORECHAR S E N S I T I V I T Y;
DB2_SQL_ATTR_CURSOR_TYPE : D B '2' UNDERSCORECHAR S Q L UNDERSCORECHAR A T T R UNDERSCORECHAR C U R S O R UNDERSCORECHAR T Y P E;
DB2_SQL_NESTING_LEVEL : D B '2' UNDERSCORECHAR S Q L UNDERSCORECHAR N E S T I N G UNDERSCORECHAR L E V E L;
DB2_TOKEN_COUNT : D B '2' UNDERSCORECHAR T O K E N UNDERSCORECHAR C O U N T;
DBADM : D B A D M;
DBCLOB : D B C L O B;
DBCTRL : D B C T R L;
DBINFO : D B I N F O;
DBMAINT : D B M A I N T;
DEACTIVATE : D E A C T I V A T E;
DEALLOCATE : D E A L L O C A T E;
DEBUG : D E B U G;
DEBUGSESSION : D E B U G S E S S I O N;
DEC : D E C;
DECFLOAT : D E C F L O A T;
DECIMAL : D E C I M A L;
DECLARE : D E C L A R E;
DEC_ROUND_CEILING : D E C UNDERSCORECHAR R O U N D UNDERSCORECHAR C E I L I N G;
DEC_ROUND_DOWN : D E C UNDERSCORECHAR R O U N D UNDERSCORECHAR D O W N ;
DEC_ROUND_FLOOR : D E C UNDERSCORECHAR R O U N D UNDERSCORECHAR F L O O R;
DEC_ROUND_HALF_DOWN : D E C UNDERSCORECHAR R O U N D UNDERSCORECHAR H A L F UNDERSCORECHAR D O W N;
DEC_ROUND_HALF_EVEN : D E C UNDERSCORECHAR R O U N D UNDERSCORECHAR H A L F UNDERSCORECHAR E V E N;
DEC_ROUND_HALF_UP : D E C UNDERSCORECHAR R O U N D UNDERSCORECHAR H A L F UNDERSCORECHAR U P;
DEC_ROUND_UP : D E C UNDERSCORECHAR R O U N D UNDERSCORECHAR U P;
DEFAULT : D E F A U L T;
DEFAULTS : D E F A U L T S;
DEFER : D E F E R;
DEFERRED : D E F E R R E D;
DEFINE : D E F I N E;
DEFINEBIND : D E F I N E B I N D;
DEFINER : D E F I N E R;
DEFINERUN : D E F I N E R U N;
DEGREE : D E G R E E;
DELETE : D E L E T E;
DENSE_RANK: D E N S E UNDERSCORECHAR R A N K;
DEPENDENT : D E P E N D E N T;
DESC : D E S C;
DESCRIBE : D E S C R I B E;
DESCRIPTOR : D E S C R I P T O R;
DETERMINISTIC : D E T E R M I N I S T I C;
DIAGNOSTICS : D I A G N O S T I C S;
DISABLE : D I S A B L E;
DISALLOW : D I S A L L O W;
DISPATCH : D I S P A T C H;
DISPLAY : D I S P L A Y;
DISPLAYDB : D I S P L A Y D B;
DISTINCT : D I S T I N C T;
DO : D O;
DOUBLE : D O U B L E;
DOUBLEQUOTE : D O U B L E Q U O T E;
DROP : D R O P;
DROPIN : D R O P I N;
DSNDB04 : D S N D B '0' '4'; //TODO: ask if this is required or it should be just an identifier
DSSIZE: D S S I Z E;
DYNAMIC : D Y N A M I C;
DYNAMICRULES : D Y N A M I C R U L E S;
EACH : E A C H;
EBCDIC : E B C D I C;
EDITPROC: E D I T P R O C;
ELEMENT  : E L E M E N T;
ELIGIBLE : E L I G I B L E;
ELSE : E L S E;
ELSEIF : E L S E I F;
EMPTY : E M P T Y;
ENABLE : E N A B L E;
ENCODING : E N C O D I N G;
ENCRYPTION : E N C R Y P T I O N;
END : E N D;
ENDING : E N D I N G;
ENFORCED : E N F O R C E D;
ENVIRONMENT : E N V I R O N M E N T;
ERASE : E R A S E;
ESCAPE : E S C A P E;
EUR : E U R;
EVERY : E V E R Y;
EXCEPT : E X C E P T;
EXCHANGE : E X C H A N G E;
EXCLUDE : E X C L U D E;
EXCLUDING : E X C L U D I N G;
EXCLUSIVE : E X C L U S I V E;
EXECUTE : E X E C U T E;
EXISTS : E X I S T S;
EXIT : E X I T;
EXPLAIN : E X P L A I N;
EXTERNAL : E X T E R N A L;
EXTRA : E X T R A;
EXTRACT : E X T R A C T;
FAILBACK : F A I L B A C K;
FAILURE: F A I L U R E;
FAILURES : F A I L U R E S;
FENCED : F E N C E D;
FETCH : F E T C H;
FIELDPROC: F I E L D P R O C;
FINAL : F I N A L;
FIRST : F I R S T;
FIRST_VALUE: F I R S T UNDERSCORECHAR V A L U E;
FLOAT : F L O A T;
FOLLOWING : F O L L O W I N G;
FOR : F O R;
FOREIGN : F O R E I G N;
FORMAT : F O R M A T;
FOUND : F O U N D;
FREE : F R E E;
FREEPAGE : F R E E P A G E;
FROM : F R O M;
FULL : F U L L;
FUNCTION : F U N C T I O N;
FUNCTION_LEVEL_10: V '1' ZERO_DIGIT R '1';
FUNCTION_LEVEL_11: V '1' '1' R '1';
FUNCTION_LEVEL_12: V DIGIT DIGIT R DIGIT M DIGIT DIGIT DIGIT;
GBPCACHE : G B P C A C H E;
GENERAL : G E N E R A L;
GENERATE : G E N E R A T E;
GENERATED : G E N E R A T E D;
GENERIC : G E N E R I C;
GET : G E T;
GET_ACCEL_ARCHIVE : G E T UNDERSCORECHAR A C C E L UNDERSCORECHAR A R C H I V E;
GLOBAL : G L O B A L;
GO : G O;
GOTO : G O T O;
GRANT : G R A N T;
GRAPHIC : G R A P H I C;
GROUP : G R O U P;
GROUPING : G R O U P I N G;
G_CHAR: G;
HANDLER : H A N D L E R;
HASH : H A S H;
HAVING : H A V I N G;
HEX : H E X;
HIDDENCHAR : H I D D E N;
HIGH : SINGLEQUOTE H I G H SINGLEQUOTE;
HINT: H I N T;
HISTORY : H I S T O R Y;
HOLD : H O L D;
HOUR : H O U R;
HOURS : H O U R S;
ID : I D;
IDENTITY : I D E N T I T Y;
IF : I F;
IGNORE : I G N O R E;
IMAGCOPY : I M A G C O P Y;
IMMEDIATE : I M M E D I A T E;
IMPLICITLY : I M P L I C I T L Y;
IN : I N;
INCLUDE : I N C L U D E;
INCLUDING : I N C L U D I N G;
INCLUSIVE : I N C L U S I V E;
INCREMENT : I N C R E M E N T;
INDEX : I N D E X;
INDEXBP : I N D E X B P;
INDICATOR : I N D I C A T O R;
INHERIT : I N H E R I T;
INITIALLY : I N I T I A L L Y;
INLINE : I N L I N E;
INNER : I N N E R;
INOUT : I N O U T;
INPUT : I N P U T;
INSENSITIVE : I N S E N S I T I V E;
INSERT : I N S E R T;
INSTEAD : I N S T E A D;
INT : I N T;
INTEGER : I N T E G E R;
INTERSECT : I N T E R S E C T;
INTO : I N T O;
INVALID : I N V A L I D;
INVOKEBIND : I N V O K E B I N D;
INVOKERUN : I N V O K E R U N;
IS : I S;
ISO : I S O;
ISOLATION : I S O L A T I O N;
ITERATE : I T E R A T E;
JAR : J A R;
JAVA : J A V A;
JIS : J I S;
JOBNAME: J O B N A M E;
JOIN : J O I N;
KEEP : K E E P;
KEY : K E Y;
KEYS : K E Y S;
K_CHAR: K;
LABEL : L A B E L;
LABELS : L A B E L S;
LAG: L A G;
LANGUAGE : L A N G U A G E;
LANGUAGE_C : C;
LARGE : L A R G E;
LAST : L A S T;
LAST_VALUE: L A S T UNDERSCORECHAR V A L U E;
LC_CTYPE : L C UNDERSCORECHAR C T Y P E;
LEAD : L E A D;
LEAVE : L E A V E;
LEFT : L E F T;
LENGTH : L E N G T H;
LEVEL : L E V E L;
LIKE : L I K E;
LIMIT : L I M I T;
LITERALS : L I T E R A L S;
LOAD : L O A D;
LOB : L O B;
LOCAL : L O C A L;
LOCALE : L O C A L E;
LOCATION : L O C A T I O N;
LOCATOR : L O C A T O R;
LOCATORS : L O C A T O R S;
LOCK : L O C K;
LOCKED : L O C K E D;
LOCKMAX : L O C K M A X;
LOCKS : L O C K S;
LOCKSIZE : L O C K S I Z E;
LOGGED : L O G G E D;
LOOP : L O O P;
LOW : SINGLEQUOTE L O W SINGLEQUOTE;
LOWER :L O W E R;
MAIN : M A I N;
MAINTAINED : M A I N T A I N E D;
MASK : M A S K;
MATCHED : M A T C H E D;
MATERIALIZED : M A T E R I A L I Z E D;
MAX : M A X;
MAXPARTITIONS : M A X P A R T I T I O N S;
MAXROWS : M A X R O W S;
MAXVALUE : M A X V A L U E;
MEMBER : M E M B E R;
MERGE : M E R G E;
MESSAGE_TEXT: M E S S A G E UNDERSCORECHAR T E X T;
MGMTCLAS: M G M T C L A S;
MICROSECOND : M I C R O S E C O N D;
MICROSECONDS : M I C R O S E C O N D S;
MIN: M I N;
MINUTE : M I N U T E;
MINUTES : M I N U T E S;
MINVALUE : M I N V A L U E;
MIXED : M I X E D;
MODE : M O D E;
MODIFIERS : M O D I F I E R S;
MODIFIES :  M O D I F I E S;
MONITOR1 : M O N I T O R '1';
MONITOR2 : M O N I T O R '2';
MONTH : M O N T H;
MONTHS : M O N T H S;
MORECHAR : M O R E;
MOVE : M O V E;
MULTIPLIER : M U L T I P L I E R;
M_CHAR: M;
NAME : N A M E;
NAMES : N A M E S;
NAMESPACE : N A M E S P A C E;
NATIONAL : N A T I O N A L;
NCNAME: N C N A M E;
NEW : N E W;
NEW_TABLE : N E W UNDERSCORECHAR T A B L E;
NEXT : N E X T;
NO : N O;
NODEFER : N O D E F E R;
NONE : N O N E;
NOT : N O T;
NTH_VALUE: N T H UNDERSCORECHAR V A L U E;
NTILE: N T I L E;
NULL : N U L L;
NULLS : N U L L S;
NULTERM : N U L T E R M;
NUMBER : N U M B E R;
NUMERIC : N U M E R I C;
NUMPARTS: N U M P A R T S;
OBID: O B I D;
OBJECT : O B J E C T;
OF : O F;
OFF : O F F;
OFFSET : O F F S E T;
OLD : O L D;
OLD_TABLE : O L D UNDERSCORECHAR T A B L E;
ON : O N;
ONCE : O N C E;
ONLY : O N L Y;
OPEN : O P E N;
OPERATION : O P E R A T I O N;
OPTHINT : O P T H I N T;
OPTIMIZATION : O P T I M I Z A T I O N;
OPTION : O P T I O N;
OPTIONAL : O P T I O N A L;
OPTIONS : O P T I O N S;
OR : O R;
ORDER : O R D E R;
ORDINALITY : O R D I N A L I T Y;
ORGANIZE : O R G A N I Z E;
ORIGINAL : O R I G I N A L;
OUT : O U T;
OUTCOME : O U T C O M E;
OUTER : O U T E R;
OUTPUT : O U T P U T;
OVER : O V E R;
OVERLAPS : O V E R L A P S;
OVERRIDING : O V E R R I D I N G;
OWNER : O W N E R;
OWNERSHIP : O W N E R S H I P;
PACKADM : P A C K A D M;
PACKAGE : P A C K A G E;
PACKAGESET: P A C K A G E S E T;
PACKAGE_NAME : P A C K A G E UNDERSCORECHAR N A M E;
PACKAGE_SCHEMA : P A C K A G E UNDERSCORECHAR S C H E M A;
PACKAGE_VERSION : P A C K A G E UNDERSCORECHAR V E R S I O N;
PADDED : P A D D E D;
PAGE : P A G E;
PAGENUM : P A G E N U M;
PARALLEL : P A R A L L E L;
PARAMETER : P A R A M E T E R;
PART : P A R T;
PARTITION : P A R T I T I O N;
PARTITIONED: P A R T I T I O N E D;
PASSING : P A S S I N G;
PASSWORD : P A S S W O R D;
PATH : P A T H;
PCTFREE : P C T F R E E;
PENDING : P E N D I N G;
PERCENT_RANK: P E R C E N T UNDERSCORECHAR R A N K;
PERIOD : P E R I O D;
PERMISSION : P E R M I S S I O N;
PIECESIZE : P I E C E S I Z E;
PLAN : P L A N;
PLI : P L I;
PORTION : P O R T I O N;
POSITION : P O S I T I O N;
POSITIONING : P O S I T I O N I N G;
PRECEDING : P R E C E D I N G;
PRECISION : P R E C I S I O N;
PREPARE : P R E P A R E;
PRESERVE : P R E S E R V E;
PREVIOUS: P R E V I O U S;
PRIMARY : P R I M A R Y;
PRIOR : P R I O R;
PRIQTY : P R I Q T Y ;
PRIVILEGES : P R I V I L E G E S;
PROCEDURE : P R O C E D U R E;
PROFILE : P R O F I L E;
PROGRAM : P R O G R A M;
PUBLIC : P U B L I C;
QUALIFIER : Q U A L I F I E R;
QUERY : Q U E R Y;
QUERYNO : Q U E R Y N O;
QUOTED_NONE : SINGLEQUOTE N O N E SINGLEQUOTE;
RANDOM : R A N D O M;
RANGE : R A N G E;
RANK : R A N K;
RATIO_TO_REPORT: R A T I O UNDERSCORECHAR T O UNDERSCORECHAR R E P O R T;
READ : R E A D;
READS : R E A D S;
REAL : R E A L;
RECORDS : R E C O R D S;
RECOVER : R E C O V E R;
RECOVERDB : R E C O V E R D B;
REF : R E F;
REFERENCES : R E F E R E N C E S;
REFERENCING : R E F E R E N C I N G;
REFRESH : R E F R E S H;
REGENERATE : R E G E N E R A T E;
REGISTERS : R E G I S T E R S;
RELATIVE : R E L A T I V E;
RELEASE : R E L E A S E;
REMOVE : R E M O V E;
RENAME : R E N A M E;
REOPT : R E O P T;
REORG : R E O R G;
REPAIR : R E P A I R;
REPEAT : R E P E A T;
REPLACE : R E P L A C E;
REQUIRED : R E Q U I R E D;
RESET : R E S E T;
RESIDENT : R E S I D E N T;
RESIGNAL : R E S I G N A L;
RESOLUTION : R E S O L U T I O N;
RESPECT : R E S P E C T;
RESTART : R E S T A R T;
RESTRICT : R E S T R I C T;
RESULT : R E S U L T;
RESULT_SET_LOCATOR : R E S U L T UNDERSCORECHAR S E T UNDERSCORECHAR L O C A T O R;
RETAIN : R E T A I N;
RETURN : R E T U R N;
RETURNED_SQLSTATE : R E T U R N E D UNDERSCORECHAR S Q L S T A T E;
RETURNING : R E T U R N I N G;
RETURNS : R E T U R N S;
REUSE : R E U S E;
REVOKE : R E V O K E;
REXX : R E X X;
RIGHT : R I G H T;
ROLE : R O L E;
ROLLBACK : R O L L B A C K;
ROLLUP : R O L L U P;
ROTATE : R O T A T E;
ROUNDING : R O U N D I N G;
ROUND_CEILING : R O U N D UNDERSCORECHAR C E I L I N G;
ROUND_DOWN :  R O U N D UNDERSCORECHAR D O W N;
ROUND_FLOOR : R O U N D UNDERSCORECHAR  F L O O R;
ROUND_HALF_DOWN : R O U N D UNDERSCORECHAR H A L F UNDERSCORECHAR D O W N;
ROUND_HALF_EVEN : R O U N D UNDERSCORECHAR H A L F UNDERSCORECHAR E V E N;
ROUND_HALF_UP : R O U N D UNDERSCORECHAR H A L F UNDERSCORECHAR U P;
ROUND_UP : R O U N D UNDERSCORECHAR U P;
ROUTINE : R O U T I N E;
ROW : R O W;
ROWID : R O W I D;
ROWS : R O W S;
ROWSET : R O W S E T;
ROW_COUNT : R O W UNDERSCORECHAR C O U N T;
ROW_NUMBER: R O W UNDERSCORECHAR N U M B E R;
RR : R R;
RS : R S;
RULES: R U L E S;
RUN : R U N;
SAVEPOINT : S A V E P O I N T;
SBCS : S B C S;
SCHEMA : S C H E M A;
SCHEME : S C H E M E;
SCRATCHPAD : S C R A T C H P A D;
SCROLL : S C R O L L;
SECOND : S E C O N D;
SECONDS : S E C O N D S;
SECQTY : S E C Q T Y;
SECTION : S E C T I O N;
SECURED : S E C U R E D;
SECURITY : S E C U R I T Y;
SEGSIZE: S E G S I Z E;
SELECT : S E L E C T;
SELECTIVITY : S E L E C T I V I T Y;
SENSITIVE : S E N S I T I V E;
SEQUENCE : S E Q U E N C E;
SERVAUTH : S E R V A U T H;
SERVER : S E R V E R;
SERVER_NAME : SERVER UNDERSCORECHAR N A M E;
SESSION : S E S S I O N;
SESSION_USER : S E S S I O N UNDERSCORECHAR U S E R;
SET : S E T;
SETS : S E T S;
SHARE : S H A R E;
SIGNAL : S I G N A  L;
SIZE : S I Z E;
SKIPCHAR : S K I P;
SMALLINT : S M A L L I N T;
SOME : S O M E;
SOURCE : S O U R C E;
SPACE : S P A C E;
SPECIAL : S P E C I A L;
SPECIFIC : S P E C I F I C;
SQL : S Q L;
SQLADM : S Q L A D M;
SQLCA : S Q L C A;
SQLCODE : S Q L C O D E;
SQLD : S Q L D;
SQLDA : S Q L D A;
SQLDABC : S Q L D A B C;
SQLERROR : S Q L E R R O R;
SQLEXCEPTION : S Q L E X C E P T I O N;
SQLID : S Q L I D;
SQLN : S Q L N;
SQLSTATE : S Q L S T A T E;
SQLVAR : S Q L V A R;
SQLWARNING : S Q L W A R N I N G;
STABILIZED : S T A B I L I Z E D;
STACKED : S T A C K E D;
START : S T A R T;
STARTDB : S T A R T D B;
STARTING : S T A R T I N G;
STATEMENT : S T A T E M E N T;
STATEMENTS : S T A T E M E N T S;
STATIC : S T A T I C;
STATS : S T A T S;
STAY : S T A Y;
STDDEV : S T D D E V;
STMTCACHE : S T M T C A C H E;
STMTID : S T M T I D;
STMTTOKEN : S T M T T O K E N;
STOGROUP : S T O G R O U P;
STOP : S T O P;
STOPALL : S T O P A L L;
STOPDB : S T O P D B;
STORAGE : S T O R A G E;
STORCLAS: S T O R C L A S;
STORES : S T O R E S;
STOSPACE : S T O S P A C E;
STRUCTURE : S T R U C T U R E;
STYLE : S T Y L E;
SUB : S U B;
SUBSTR : S U B S T R;
SUBSTRING : S U B S T R I N G;
SUM : S U M;
SYNONYM : S Y N O N Y M;
SYSADM : S Y S A D M;
SYSCTRL : S Y S C T R L;
SYSDEFLT : S Y S D E F L T;
SYSIBM : S Y S I B M;
SYSOPR : S Y S O P R;
SYSTEM : S Y S T E M;
SYSTEM_TIME : S Y S T E M UNDERSCORECHAR T I M E;
TABLE : T A B L E;
TABLESPACE : T A B L E S P A C E;
TEMPORAL: T E M P O R A L;
TEMPORARY : T E M P O R A R Y;
THEN : T H E N;
TIME : T I M E;
TIMESTAMP : T I M E S T A M P;
TIMEZONE : T I M E Z O N E;
TO : T O;
TOKEN : T O K E N;
TRACE : T R A C E;
TRACKMOD : T R A C K M O D;
TRANSACTION : T R A N S A C T I O N;
TRANSFER : T R A N S F E R;
TRANSLATE : T R A N S L A T E;
TRANSLATION : T R A N S L A T I O N;
TRIGGER : T R I G G E R;
TRIGGERS : T R I G G E R S;
TRIM : T R I M;
TRUNCATE : T R U N C A T E;
TRUSTED : T R U S T E D;
TYPE : T Y P E;
TYPES: T Y P E S;
UNBOUNDED : U N B O U N D E D;
UNICODE : U N I C O D E;
UNION : U N I O N;
UNIQUE : U N I Q U E;
UNNEST : U N N E S T;
UNPACK : U N P A C K;
UNTIL : U N T I L;
UPDATE : U P D A T E;
UPON : U P O N;
UPPER : U P P E R;
UR : U R;
URL : U R L;
USA : U S A;
USAGE : U S A G E;
USE : U S E;
USER : U S E R;
USERID : U S E R I D;
USING : U S I N G;
V1 : V '1';
VALIDATE : V A L I D A T E;
VALIDPROC: V A L I D P R O C;
VALUE : V A L U E;
VALUES : V A L U E S;
VARBINARY : V A R B I N A R Y;
VARCHAR : V A R C H A R;
VARGRAPHIC : V A R G R A P H I C;
VARIABLE : V A R I A B L E;
VARIANCE: V A R I A N C E;
VARYING : V A R Y I N G;
VCAT : V C A T;
VERSION : V E R S I O N;
VERSIONING : V E R S I O N I N G;
VERSIONS : V E R S I O N S;
VIEW : V I E W;
VOLATILE : V O L A T I L E;
VOLUMES : V O L U M E S;
WAIT : W A I T;
WAITFORDATA : W A I T F O R D A T A;
WHEN : W H E N;
WHENEVER : W H E N E V E R;
WHERE : W H E R E;
WHILE : W H I L E;
WITH : W I T H;
WITHOUT : W I T H O U T;
WLM : W L M;
WORK : W O R K;
WORKFILE : W O R K F I L E;
WRAPPED : W R A P P E D;
WRITE : W R I T E;
WRKSTNNAME: W R K S T N N A M E;
XML : X M L;
XMLCAST: XML C A S T;
XMLNAMESPACES: X M L N A M E S P A C E S;
XMLPATTERN: X M L P A T T E R N;
XMLQUERY: X M L Q U E R Y;
XMLSCHEMA: X M L S C H E M A;
XMLTABLE : X M L T A B L E;
YEAR : Y E A R;
YEARS : Y E A R S;
YES : Y E S;
ZONE : Z O N E;


// special separator tokens for embedded langauages
SEMICOLONSEPARATORSQL : '; ' ;
COMMASEPARATORDB2 : ', ' ;

// Constructors symbols
GRAPHIC_CONSTANT : GRAPHICUNICODE | GRAHICCHAR;
DOUBLESLASHCHAR : '//';
LSQUAREBRACKET :     '[';
RSQUAREBRACKET :     ']';
UNDERSCORECHAR :     '_';
PIPECHAR : '||';
QUESTIONMARK : '?';
PERCENT : '%';
SELECT_ALL : '.*';

TIMESTAMPLITERAL: DIGIT DIGIT '.' DIGIT DIGIT '.' DIGIT DIGIT | // hh.mm.ss;
                  DIGIT DIGIT '.' DIGIT DIGIT (A M | P M) | //hh:mm AM /PM
                  DIGIT DIGIT '.' DIGIT DIGIT ':' DIGIT DIGIT |// hh.mm:ss
                  DIGIT DIGIT ':' DIGIT DIGIT ':' DIGIT DIGIT '.'  DIGIT DIGIT DIGIT DIGIT DIGIT DIGIT;//hh:mm:ss.nnnnnn
DATELITERAL: '\'' (DIGIT DIGIT DIGIT DIGIT '-' DIGIT DIGIT '-' DIGIT DIGIT | //yyyy-mm-dd
                   DIGIT DIGIT '/' DIGIT DIGIT '/' DIGIT DIGIT DIGIT DIGIT | //mm/dd/yyyy
                   DIGIT DIGIT '.' DIGIT DIGIT '.' DIGIT DIGIT DIGIT DIGIT |//dd.mm.yyyy
                   DIGIT DIGIT '-' DIGIT DIGIT '-' DIGIT DIGIT DIGIT DIGIT) TIMESTAMPLITERAL? '\'';//yyyy-mm-dd

fragment BXNUMBER :
	B X '"' [0-9A-F]+ '"'
	| B X '\'' [0-9A-F]+ '\''
;

fragment GRAPHICUNICODE :
	U X '"' [0-9A-F]+ '"'
	| U X '\'' [0-9A-F]+ '\''
;

fragment GRAHICCHAR :
	G X '"' [0-9A-F]+ '"'
	| G X '\'' [0-9A-F]+ '\''
;
