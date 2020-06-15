 /*
* Copyright (C) 2017, Ulrich Wolffgang <ulrich.wolffgang@proleap.io>
* All rights reserved.
*
* This software may be modified and distributed under the terms
* of the MIT license. See the LICENSE file for details.
*/

grammar CobolPreprocessor;

startRule
   : .*? ((compilerOptions | copyStatement | execSqlStatement | execCicsStatement | execSqlImsStatement | skipNoStatement | ejectStatement | replaceArea | titleStatement | NEWLINE)+ .*?)+ EOF
   ;

everything
    : ~(ACCEPT | ADD | ALTER | CALL | CANCEL | CLOSE | COMPUTE | CONTINUE | DELETE | DISABLE | DISPLAY | DIVIDE | ENABLE | EXEC | EJECT |
      ENTRY | EVALUATE | EXIT | GENERATE | GOBACK | GO | IF | INITIALIZE | INITIATE | INSPECT | MERGE | MULTIPLY | OPEN | PERFORM | PURGE | READ |
      RECEIVE | RELEASE | RETURN | REWRITE | SEARCH | SEND | SET | SKIP1 | SKIP2 | SKIP3 | SORT | START | STOP | STRING | SUBTRACT | TERMINATE |
      TITLE | UNSTRING | USE | WRITE | XML | DOT_FS | COPY | MOVE)*?
    ;

skipNoStatement
   : (SKIP1 | SKIP2 | SKIP3) everything
   ;

titleStatement
   : TITLE everything
   ;

// compiler options
compilerOptions
   : (PROCESS | CBL) (COMMACHAR? compilerOption | compilerXOpts)+
   ;

compilerXOpts
   : XOPTS LPARENCHAR compilerOption (COMMACHAR? compilerOption)* RPARENCHAR
   ;

compilerOption
   : ADATA | ADV | APOST
   | (ARITH | AR) LPARENCHAR (EXTEND | E_CHAR | COMPAT | C_CHAR) RPARENCHAR
   | BLOCK0
   | (BUFSIZE | BUF) LPARENCHAR literal RPARENCHAR
   | CBLCARD
   | CICS (LPARENCHAR literal RPARENCHAR)?
   | COBOL2 | COBOL3
   | (CODEPAGE | CP) LPARENCHAR literal RPARENCHAR
   | (COMPILE | C_CHAR)
   | CPP | CPSM
   | (CURRENCY | CURR) LPARENCHAR literal RPARENCHAR
   | DATA LPARENCHAR literal RPARENCHAR
   | (DATEPROC | DP) (LPARENCHAR (FLAG | NOFLAG)? COMMACHAR? (TRIG | NOTRIG)? RPARENCHAR)?
   | DBCS
   | (DECK | D_CHAR)
   | DEBUG
   | (DIAGTRUNC | DTR)
   | DLL
   | (DUMP | DU)
   | (DYNAM | DYN)
   | EDF | EPILOG
   | EXIT
   | (EXPORTALL | EXP)
   | (FASTSRT | FSRT)
   | FEPI
   | (FLAG | F_CHAR) LPARENCHAR (E_CHAR | I_CHAR | S_CHAR | U_CHAR | W_CHAR) (COMMACHAR (E_CHAR | I_CHAR | S_CHAR | U_CHAR | W_CHAR))? RPARENCHAR
   | FLAGSTD LPARENCHAR (M_CHAR | I_CHAR | H_CHAR) (COMMACHAR (D_CHAR | DD | N_CHAR | NN | S_CHAR | SS))? RPARENCHAR
   | GDS | GRAPHIC
   | INTDATE LPARENCHAR (ANSI | LILIAN) RPARENCHAR
   | (LANGUAGE | LANG) LPARENCHAR (ENGLISH | CS | EN | JA | JP | KA | UE) RPARENCHAR
   | LEASM | LENGTH | LIB | LIN
   | (LINECOUNT | LC) LPARENCHAR literal RPARENCHAR
   | LINKAGE | LIST
   | MAP
   | MARGINS LPARENCHAR literal COMMACHAR literal (COMMACHAR literal)? RPARENCHAR
   | (MDECK | MD) (LPARENCHAR (C_CHAR | COMPILE | NOC | NOCOMPILE) RPARENCHAR)?
   | NAME (LPARENCHAR (ALIAS | NOALIAS) RPARENCHAR)?
   | NATLANG LPARENCHAR (CS | EN | KA) RPARENCHAR
   | NOADATA | NOADV | NOAWO
   | NOBLOCK0
   | NOCBLCARD | NOCICS | NOCMPR2
   | (NOCOMPILE | NOC) (LPARENCHAR (S_CHAR | E_CHAR | W_CHAR) RPARENCHAR)?
   | NOCPSM
   | (NOCURRENCY | NOCURR)
   | (NODATEPROC | NODP)
   | NODBCS | NODEBUG
   | (NODECK | NOD)
   | NODLL | NODE
   | (NODUMP | NODU)
   | (NODIAGTRUNC | NODTR)
   | (NODYNAM | NODYN)
   | NOEDF | NOEPILOG | NOEXIT
   | (NOEXPORTALL | NOEXP)
   | (NOFASTSRT | NOFSRT)
   | NOFEPI
   | (NOFLAG | NOF)
   | NOFLAGMIG | NOFLAGSTD
   | NOGRAPHIC
   | NOLENGTH | NOLIB | NOLINKAGE | NOLIST
   | NOMAP
   | (NOMDECK | NOMD)
   | NONAME
   | (NONUMBER | NONUM)
   | (NOOBJECT | NOOBJ)
   | (NOOFFSET | NOOFF)
   | NOOPSEQUENCE
   | (NOOPTIMIZE | NOOPT)
   | NOOPTIONS
   | NOP | NOPROLOG
   | NORENT
   | (NOSEQUENCE | NOSEQ)
   | (NOSOURCE | NOS)
   | NOSPIE | NOSQL
   | (NOSQLCCSID | NOSQLC)
   | (NOSSRANGE | NOSSR)
   | NOSTDTRUNC
   | (NOTERMINAL | NOTERM) | NOTEST | NOTHREAD
   | NOVBREF
   | (NOWORD | NOWD)
   | NSEQ
   | (NSYMBOL | NS) LPARENCHAR (NATIONAL | NAT | DBCS) RPARENCHAR
   | NOVBREF
   | (NOXREF | NOX)
   | NOZWB
   | (NUMBER | NUM)
   | NUMPROC LPARENCHAR (MIG | NOPFD | PFD) RPARENCHAR
   | (OBJECT | OBJ)
   | (OFFSET | OFF)
   | OPMARGINS LPARENCHAR literal COMMACHAR literal (COMMACHAR literal)? RPARENCHAR
   | OPSEQUENCE LPARENCHAR literal COMMACHAR literal RPARENCHAR
   | (OPTIMIZE | OPT) (LPARENCHAR (FULL | STD) RPARENCHAR)?
   | OPTFILE | OPTIONS | OP
   | (OUTDD | OUT) LPARENCHAR cobolWord RPARENCHAR
   | (PGMNAME | PGMN) LPARENCHAR (CO | COMPAT | LM | LONGMIXED | LONGUPPER | LU | M_CHAR | MIXED | U_CHAR | UPPER) RPARENCHAR
   | PROLOG
   | (QUOTE | Q_CHAR)
   | RENT
   | RMODE LPARENCHAR (ANY | AUTO | literal) RPARENCHAR
   | (SEQUENCE | SEQ) (LPARENCHAR literal COMMACHAR literal RPARENCHAR)?
   | (SIZE | SZ) LPARENCHAR (MAX | literal) RPARENCHAR
   | (SOURCE | S_CHAR)
   | SP
   | SPACE LPARENCHAR literal RPARENCHAR
   | SPIE
   | SQL (LPARENCHAR literal RPARENCHAR)?
   | (SQLCCSID | SQLC)
   | (SSRANGE | SSR)
   | SYSEIB
   | (TERMINAL | TERM)
   | TEST (LPARENCHAR (HOOK | NOHOOK)? COMMACHAR? (SEP | SEPARATE | NOSEP | NOSEPARATE)? COMMACHAR? (EJPD | NOEJPD)? RPARENCHAR)?
   | THREAD
   | TRUNC LPARENCHAR (BIN | OPT | STD) RPARENCHAR
   | VBREF
   | (WORD | WD) LPARENCHAR cobolWord RPARENCHAR
   | (XMLPARSE | XP) LPARENCHAR (COMPAT | C_CHAR | XMLSS | X_CHAR) RPARENCHAR
   | (XREF | X_CHAR) (LPARENCHAR (FULL | SHORT)? RPARENCHAR)?
   | (YEARWINDOW | YW) LPARENCHAR literal RPARENCHAR
   | ZWB
   ;

// exec cics statement
execCicsStatement
   : EXEC CICS ~END_EXEC*? END_EXEC DOT_FS?
   ;

// exec sql statement
execSqlStatement
   : EXEC SQL ~END_EXEC*? END_EXEC DOT_FS?
   ;

// exec sql ims statement
execSqlImsStatement
   : EXEC SQLIMS ~END_EXEC*? END_EXEC DOT_FS?
   ;

// eject statement
ejectStatement
   : EJECT DOT_FS?
   ;

// copy statement
copyStatement
   : COPY copySource (directoryPhrase | familyPhrase | replacingPhrase | SUPPRESS)* DOT_FS
   ;

copySource
   : (literal | cobolWord) ((OF | IN) copyLibrary)?
   ;

copyLibrary
   : literal | cobolWord
   ;


// replace statement
replacingPhrase
   : REPLACING NEWLINE* replaceClause+
   ;

replaceArea
   : replaceByStatement (copyStatement | charData)* replaceOffStatement?
   ;

replaceByStatement
   : REPLACE (NEWLINE* replaceClause)+ DOT
   ;

replaceOffStatement
   : REPLACE OFF DOT
   ;

replaceClause
   : replaceable NEWLINE* BY NEWLINE* replacement (NEWLINE* directoryPhrase)? (NEWLINE* familyPhrase)?
   ;

directoryPhrase
   : (OF | IN) NEWLINE* (literal | cobolWord)
   ;

familyPhrase
   : ON NEWLINE* (literal | cobolWord)
   ;

replaceable
   : replaceSameElement
   ;

replacement
   : replaceSameElement
   ;

replaceSameElement
   : literal | cobolWord | pseudoText | charDataLine
   ;


// skip statement
skipStatement
   : (SKIP1 | SKIP2 | SKIP3) DOT?
   ;

// literals
pseudoText
   : DOUBLEEQUALCHAR charData? DOUBLEEQUALCHAR
   ;

charData
   : (charDataLine | NEWLINE)+
   ;

charDataLine
   : (cobolWord | literal | filename | TEXT | DOT | LPARENCHAR | RPARENCHAR)+
   ;

cobolWord
   : IDENTIFIER | charDataKeyword
   ;

literal
   : NONNUMERICLITERAL | NUMERICLITERAL
   ;

filename
   : FILENAME
   ;

charDataKeyword
   : ADATA | ADV | ALIAS | ANSI | ANY | APOST | AR | ARITH | AUTO | AWO
   | BIN | BLOCK0 | BUF | BUFSIZE | BY
   | CBL | CBLCARD | CO | COBOL2 | COBOL3 | CODEPAGE | COMMACHAR | COMPAT | COMPILE | CP | CPP | CPSM | CS | CURR | CURRENCY
   | DATA | DATEPROC | DBCS | DD | DEBUG | DECK | DIAGTRUNC | DLI | DLL | DP | DTR | DU | DUMP | DYN | DYNAM
   | EDF | EJPD | EN | ENGLISH | EPILOG | EXCI | EXIT | EXP | EXPORTALL | EXTEND
   | FASTSRT | FLAG | FLAGSTD | FULL | FSRT
   | GDS | GRAPHIC
   | HOOK
   | IN | INTDATE
   | JA | JP
   | KA
   | LANG | LANGUAGE | LC | LENGTH | LIB | LILIAN | LIN | LINECOUNT | LINKAGE | LIST | LM | LONGMIXED | LONGUPPER | LU
   | MAP | MARGINS | MAX | MD | MDECK | MIG | MIXED
   | NAME | NAT | NATIONAL | NATLANG
   | NN
   | NO
   | NOADATA | NOADV | NOALIAS | NOAWO
   | NOBLOCK0
   | NOC | NOCBLCARD | NOCICS | NOCMPR2 | NOCOMPILE | NOCPSM | NOCURR | NOCURRENCY
   | NOD | NODATEPROC | NODBCS | NODE | NODEBUG | NODECK | NODIAGTRUNC | NODLL | NODU | NODUMP | NODP | NODTR | NODYN | NODYNAM
   | NOEDF | NOEJPD | NOEPILOG | NOEXIT | NOEXP | NOEXPORTALL
   | NOF | NOFASTSRT | NOFEPI | NOFLAG | NOFLAGMIG | NOFLAGSTD | NOFSRT
   | NOGRAPHIC
   | NOHOOK
   | NOLENGTH | NOLIB | NOLINKAGE | NOLIST
   | NOMAP | NOMD | NOMDECK
   | NONAME | NONUM | NONUMBER
   | NOOBJ | NOOBJECT | NOOFF | NOOFFSET | NOOPSEQUENCE | NOOPT | NOOPTIMIZE | NOOPTIONS
   | NOP | NOPFD | NOPROLOG
   | NORENT
   | NOS | NOSEP | NOSEPARATE | NOSEQ | NOSEQUENCE | NOSOURCE | NOSPIE | NOSQL | NOSQLC | NOSQLCCSID | NOSSR | NOSSRANGE | NOSTDTRUNC
   | NOTERM | NOTERMINAL | NOTEST | NOTHREAD | NOTRIG
   | NOVBREF
   | NOWORD
   | NOX | NOXREF
   | NOZWB
   | NSEQ | NSYMBOL | NS
   | NUM | NUMBER | NUMPROC
   | OBJ | OBJECT | ON | OF | OFF | OFFSET | OPMARGINS | OPSEQUENCE | OPTIMIZE | OP | OPT | OPTFILE | OPTIONS | OUT | OUTDD
   | PFD | PGMN | PGMNAME | PPTDBG | PROCESS | PROLOG
   | QUOTE
   | RENT | REPLACING | RMODE
   | SEQ | SEQUENCE | SEP | SEPARATE | SHORT | SIZE | SOURCE | SP | SPACE | SPIE | SQL | SQLC | SQLCCSID | SS | SSR | SSRANGE | STD | SYSEIB | SZ
   | TERM | TERMINAL | TEST | THREAD | TITLE | TRIG | TRUNC
   | UE | UPPER
   | VBREF
   | WD
   | XMLPARSE | XMLSS | XOPTS | XREF
   | YEARWINDOW | YW
   | ZWB
   | C_CHAR | D_CHAR | E_CHAR | F_CHAR | H_CHAR | I_CHAR | M_CHAR | N_CHAR | Q_CHAR | S_CHAR | U_CHAR | W_CHAR | X_CHAR
   ;

// keywords
ACCEPT: A C C E P T;
ADATA : A D A T A;
ADV : A D V;
ADD: A D D;
ALIAS : A L I A S;
ALTER: A L T E R;
ANSI : A N S I;
ANY : A N Y;
APOST : A P O S T;
AR : A R;
ARE : A R E;
ARITH : A R I T H;
AUTO : A U T O;
AWO : A W O;
BIN : B I N;
BLOCK0 : B L O C K '0';
BUF : B U F;
BUFSIZE : B U F S I Z E;
BY : B Y;
CALL: C A L L;
CANCEL: C A N C E L;
CBL : C B L;
CBLCARD : C B L C A R D;
CHAINING: C H A I N I N G;
CLOSE: C L O S E;
CICS : C I C S;
CO : C O;
COMPUTE: C O M P U T E;
CONTINUE: C O N T I N U E;
COBOL2 : C O B O L '2';
COBOL3 : C O B O L '3';
CODEPAGE : C O D E P A G E;
COMPAT : C O M P A T;
COMPILE : C O M P I L E;
COPY : C O P Y;
CP : C P;
CPP : C P P;
CPSM : C P S M;
CS : C S;
CURR : C U R R;
CURRENCY : C U R R E N C Y;
DATA : D A T A;
DATEPROC : D A T E P R O C;
DBCS : D B C S;
DD : D D;
DEBUG : D E B U G;
DECLARATIVES: D E C L A R A T I V E S;
DECK : D E C K;
DELETE: D E L E T E;
DIAGTRUNC : D I A G T R U N C;
DIVISION: D I V I S I O N;
DISABLE: D I S A B L E;
DISPLAY: D I S P L A Y;
DIVIDE: D I V I D E;
DLI : D L I;
DLL : D L L;
DP : D P;
DTR : D T R;
DU : D U;
DUMP : D U M P;
DYN : D Y N;
DYNAM : D Y N A M;
EDF : E D F;
EJECT: E J E C T;
ENABLE: E N A B L E;
END: E N D;
ENTRY: E N T R Y;
EVALUATE : E V A L U A T E;
EJPD : E J P D;
EN : E N;
ENGLISH : E N G L I S H;
END_EXEC : E N D '-' E X E C;
EPILOG : E P I L O G;
EXCI : E X C I;
EXEC : E X E C;
EXIT : E X I T;
EXP : E X P;
EXPORTALL : E X P O R T A L L;
EXTEND : E X T E N D;
FASTSRT : F A S T S R T;
FEPI : F E P I;
FILLER: F I L L E R;
FLAG : F L A G;
FLAGSTD : F L A G S T D;
FSRT : F S R T;
FULL : F U L L;
GENERATE : G E N E R A T E;
GIVING: G I V I N G;
GOBACK : G O B A C K;
GDS : G D S;
GO: G O;
GRAPHIC : G R A P H I C;
HOOK : H O O K;
IN : I N;
IF: I F;
IDENTIFICATION: I D E N T I F I C A T I O N;
INITIALIZE : I N I T I A L I Z E;
INITIATE : I N I T I A T E;
INSPECT : I N S P E C T;
INTDATE : I N T D A T E;
IS: I S;
JA : J A;
JP : J P;
KA : K A;
LANG : L A N G;
LANGUAGE : L A N G U A G E;
LC : L C;
LEASM : L E A S M;
LENGTH : L E N G T H;
LIB : L I B;
LILIAN : L I L I A N;
LIN : L I N;
LINECOUNT : L I N E C O U N T;
LINKAGE : L I N K A G E;
LIST : L I S T;
LM : L M;
LONGMIXED : L O N G M I X E D;
LONGUPPER : L O N G U P P E R;
LPARENCHAR : '(';
LU : L U;
MAP : M A P;
MARGINS : M A R G I N S;
MAX : M A X;
MD : M D;
MDECK : M D E C K;
MIG : M I G;
MERGE : M E R G E;
MULTIPLY : M U L T I P L Y;
MIXED : M I X E D;
MOVE: M O V E;
NAME : N A M E;
NAT : N A T;
NATIONAL : N A T I O N A L;
NATLANG : N A T L A N G;
NN : N N;
NO : N O;
NOADATA : N O A D A T A;
NOADV : N O A D V;
NOALIAS : N O A L I A S;
NOAWO : N O A W O;
NOBLOCK0 : N O B L O C K '0';
NOC : N O C;
NOCBLCARD : N O C B L C A R D;
NOCICS : N O C I C S;
NOCMPR2 : N O C M P R '2';
NOCOMPILE : N O C O M P I L E;
NOCPSM : N O C P S M;
NOCURR : N O C U R R;
NOCURRENCY : N O C U R R E N C Y;
NOD : N O D;
NODATEPROC : N O D A T E P R O C;
NODBCS : N O D B C S;
NODE : N O D E;
NODEBUG : N O D E B U G;
NODECK : N O D E C K;
NODIAGTRUNC : N O D I A G T R U N C;
NODLL : N O D L L;
NODU : N O D U;
NODUMP : N O D U M P;
NODP : N O D P;
NODTR : N O D T R;
NODYN : N O D Y N;
NODYNAM : N O D Y N A M;
NOEDF : N O E D F;
NOEJPD : N O E J P D;
NOEPILOG : N O E P I L O G;
NOEXIT : N O E X I T;
NOEXP : N O E X P;
NOEXPORTALL : N O E X P O R T A L L;
NOF : N O F;
NOFASTSRT : N O F A S T S R T;
NOFEPI : N O F E P I;
NOFLAG : N O F L A G;
NOFLAGMIG : N O F L A G M I G;
NOFLAGSTD : N O F L A G S T D;
NOFSRT : N O F S R T;
NOGRAPHIC : N O G R A P H I C;
NOHOOK : N O H O O K;
NOLENGTH : N O L E N G T H;
NOLIB : N O L I B;
NOLINKAGE : N O L I N K A G E;
NOLIST : N O L I S T;
NOMAP : N O M A P;
NOMD : N O M D;
NOMDECK : N O M D E C K;
NONAME : N O N A M E;
NONUM : N O N U M;
NONUMBER : N O N U M B E R;
NOOBJ : N O O B J;
NOOBJECT : N O O B J E C T;
NOOFF : N O O F F;
NOOFFSET : N O O F F S E T;
NOOPSEQUENCE : N O O P S E Q U E N C E;
NOOPT : N O O P T;
NOOPTIMIZE : N O O P T I M I Z E;
NOOPTIONS : N O O P T I O N S;
NOP : N O P;
NOPFD : N O P F D;
NOPROLOG : N O P R O L O G;
NORENT : N O R E N T;
NOS : N O S;
NOSEP : N O S E P;
NOSEPARATE : N O S E P A R A T E;
NOSEQ : N O S E Q;
NOSOURCE : N O S O U R C E;
NOSPIE : N O S P I E;
NOSQL : N O S Q L;
NOSQLC : N O S Q L C;
NOSQLCCSID : N O S Q L C C S I D;
NOSSR : N O S S R;
NOSSRANGE : N O S S R A N G E;
NOSTDTRUNC : N O S T D T R U N C;
NOSEQUENCE : N O S E Q U E N C E;
NOTERM : N O T E R M;
NOTERMINAL : N O T E R M I N A L;
NOTEST : N O T E S T;
NOTHREAD : N O T H R E A D;
NOTRIG : N O T R I G;
NOVBREF : N O V B R E F;
NOWD : N O W D;
NOWORD : N O W O R D;
NOX : N O X;
NOXREF : N O X R E F;
NOZWB : N O Z W B;
NS : N S;
NSEQ : N S E Q;
NSYMBOL : N S Y M B O L;
NUM : N U M;
NUMBER : N U M B E R;
NUMPROC : N U M P R O C;
OBJ : O B J;
OBJECT : O B J E C T;
OF : O F;
OFF : O F F;
OFFSET : O F F S E T;
ON : O N;
OP : O P;
OPEN : O P E N;
OPMARGINS : O P M A R G I N S;
OPSEQUENCE : O P S E Q U E N C E;
OPT : O P T;
OPTIONAL: O P T I O N A L;
OPTFILE : O P T F I L E;
OPTIMIZE : O P T I M I Z E;
OPTIONS : O P T I O N S;
OUT : O U T;
OUTDD : O U T D D;
PERFORM : P E R F O R M;
PURGE : P U R G E;
PIC : P I C;
PICTURE : P I C T U R E;
PFD : P F D;
PPTDBG : P P T D B G;
PGMN : P G M N;
PGMNAME : P G M N A M E;
PROCEDURE: P R O C E D U R E;
PROCESS : P R O C E S S;
PROLOG : P R O L O G;
QUOTE : Q U O T E;
READ : R E A D;
REFERENCE: R E F E R E N C E;
RENAMES : R E N A M E S;
RENT : R E N T;
REPLACE : R E P L A C E;
REPLACING : R E P L A C I N G;
RETURNING: R E T U R N I N G;
RMODE : R M O D E;
RPARENCHAR : ')';
RECEIVE : R E C E I V E;
RELEASE : R E L E A S E;
RETURN : R E T U R N;
REWRITE : R E W R I T E;
SECTION: S E C T I O N;
SEP : S E P;
SEARCH : S E A R C H;
SEND : S E N D;
SET: S E T;
SORT : S O R T;
START : S T A R T;
STOP : S T O P;
STRING : S T R I N G;
SUBTRACT : S U B T R A C T;
SEPARATE : S E P A R A T E;
SEQ : S E Q;
SEQUENCE : S E Q U E N C E;
SHORT : S H O R T;
SIZE : S I Z E;
SOURCE : S O U R C E;
SP : S P;
SPACE : S P A C E;
SPIE : S P I E;
SQL : S Q L;
SQLC : S Q L C;
SQLCCSID : S Q L C C S I D;
SQLIMS : S Q L I M S;
SKIP1 : S K I P '1';
SKIP2 : S K I P '2';
SKIP3 : S K I P '3';
SS : S S;
SSR : S S R;
SSRANGE : S S R A N G E;
STD : S T D;
SUPPRESS : S U P P R E S S;
SYSEIB : S Y S E I B;
SZ : S Z;
TERM : T E R M;
TERMINAL : T E R M I N A L;
TEST : T E S T;
TERMINATE : T E R M I N A T E;
THREAD : T H R E A D;
THROUGH : T H R O U G H;
THRU : T H R U;
TITLE : T I T L E;
TO: T O;
TRIG : T R I G;
TRUNC : T R U N C;
UE : U E;
UNSTRING : U N S T R I N G;
USE : U S E;
USING: U S I N G;
UPPER : U P P E R;
VALUE : V A L U E;
VALUES : V A L U E S;
VBREF : V B R E F;
WD : W D;
WORD : W O R D;
WORKING_STORAGE: W O R K I N G MINUSCHAR S T O R A G E;
WRITE : W R I T E;
XML : X M L;
XMLPARSE : X M L P A R S E;
XMLSS : X M L S S;
XOPTS: X O P T S;
XP : X P;
XREF : X R E F;
YEARWINDOW : Y E A R W I N D O W;
YW : Y W;
ZWB : Z W B;

C_CHAR : C;
D_CHAR : D;
E_CHAR : E;
F_CHAR : F;
H_CHAR : H;
I_CHAR : I;
M_CHAR : M;
N_CHAR : N;
Q_CHAR : Q;
S_CHAR : S;
U_CHAR : U;
W_CHAR : W;
X_CHAR : X;


// symbols
EXECCICSTAG : '*>EXECCICS';
EXECSQLTAG : '*>EXECSQL';
EXECSQLIMSTAG : '*>EXECSQLIMS';
COMMENTTAG : '*>';
COMMENTENTRYTAG : '*>CE';
COMMACHAR : ',';
DOT_FS : '.' ('\r' | '\n' | '\f' | '\t' | ' ')+ | '.' EOF;
DOT : '.';
DOUBLEEQUALCHAR : '==';
MINUSCHAR : '-';

// literals
NONNUMERICLITERAL : STRINGLITERAL | HEXNUMBER;
NUMERICLITERAL : [0-9]+;

fragment HEXNUMBER :
	X '"' [0-9A-F]+ '"'
	| X '\'' [0-9A-F]+ '\''
;

fragment STRINGLITERAL :
	'"' (~["\n\r] | '""' | '\'')* '"'
	| '\'' (~['\n\r] | '\'\'' | '"')* '\''
;

IDENTIFIER : [a-zA-Z0-9#@$]+ ([-_]+ [a-zA-Z0-9#@$]+)*;
FILENAME : [a-zA-Z0-9]+ '.' [a-zA-Z0-9]+;


// whitespace, line breaks, comments, ...
NEWLINE : '\r'? '\n' -> channel(HIDDEN);
COMMENTLINE : COMMENTTAG WS ~('\n' | '\r')* -> channel(HIDDEN);
COMMENTENTRYLINE : COMMENTENTRYTAG WS ~('\n' | '\r')*;
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