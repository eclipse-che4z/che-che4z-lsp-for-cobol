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

parser grammar IdmsCopyParser;
options {tokenVocab = IdmsCopyLexer;  superClass = MessageServiceParser;}

startRule: .*? idmsCopybookRules* EOF;
idmsCopybookRules: (dataDescriptionEntry | copyIdmsStatement | fileDescriptionEntry) .*?;

dataDescriptionEntry
   : dataDescriptionEntryFormat1
   | dataDescriptionEntryFormat2
   | dataDescriptionEntryFormat1Level77
   | dataDescriptionEntryFormat3
   | dialectDescriptionEntry
   ;

dataDescriptionEntryFormat1
    : levelNumber entryName? (dataGroupUsageClause | dataRedefinesClause | dataExternalClause
    | dataGlobalClause | dataPictureClause | dataUsageClause | dataValueClause
    | dataOccursClause | dataSignClause | dataSynchronizedClause
    | dataJustifiedClause | dataBlankWhenZeroClause | dataDynamicLengthClause | dataVolatileClause)*
    DOT_FS
    ;

dataDescriptionEntryFormat2
    : LEVEL_NUMBER_66 entryName? dataRenamesClause DOT_FS
    ;

dataDescriptionEntryFormat1Level77
    : LEVEL_NUMBER_77 entryName? (dataGroupUsageClause | dataRedefinesClause | dataExternalClause
      | dataGlobalClause | dataPictureClause | dataUsageClause | dataValueClause
      | dataOccursClause | dataSignClause | dataSynchronizedClause
      | dataJustifiedClause | dataBlankWhenZeroClause | dataDynamicLengthClause | dataVolatileClause)*
      DOT_FS
    ;

// -- copy section ----------------------------------

copyIdmsStatement
    : LEVEL_NUMBER? COPY IDMS copyIdmsOptions (DOT_FS | SEMICOLON_FS)?
    ;

copyIdmsOptions
    : (RECORD copyIdmsSource versionClause? (REDEFINES cobolWord)?) |
    (FILE copyIdmsSource versionClause?) |
    ((MAP | MAP_CONTROL) copyIdmsSource) |
    (MODULE? copyIdmsSource versionClause?)
    ;

copyIdmsSource
    : copySource
    ;

copySource
   : (literal | cobolWord | SUBSCHEMA_NAMES) ((OF | IN) copyLibrary)?
   ;

copyLibrary
   : literal | cobolWord
   ;

/////////////////////////////////////////////////////////////////////////////////////////////////////////

argument
   : arithmeticExpression
   ;

arithmeticExpression
   : multDivs plusMinus*
   ;

basis
   : generalIdentifier | literal | LPARENCHAR arithmeticExpression RPARENCHAR
   ;

booleanLiteral
   : TRUE | FALSE
   ;

characterPosition
   : arithmeticExpression
   ;

charString
   : FINALCHARSTRING
   ;

cicsDfhRespLiteral
   : DFHRESP LPARENCHAR (cics_conditions | cobolWord | literal) RPARENCHAR
   ;

cicsDfhValueLiteral
   : DFHVALUE LPARENCHAR (cics_conditions | cobolWord | literal) RPARENCHAR
   ;

cics_conditions: EOC | EODS | INVMPSZ | INVPARTN | INVREQ | MAPFAIL | PARTNFAIL | RDATT | UNEXPIN;

cobolWord
   : IDENTIFIER | cobolCompilerDirectivesKeywords | cobolKeywords
   ;

cobolKeywords
   : ADDRESS | BOTTOM | COUNT | CR | FIELD | FIRST | MMDDYYYY | PRINTER | DAY | TIME | DATE | DAY_OF_WEEK
   | REMARKS | RESUME | TIMER | TODAYS_DATE | TODAYS_NAME | TOP | YEAR | YYYYDDD | YYYYMMDD | WHEN_COMPILED
   ;

cobolCompilerDirectivesKeywords
    : ABD | ADATA | ADEXIT | ADV | ADX | AFP | ALIAS | ALPHNUM | ANSI | ANY | APOST | AR | ARCH | ARITH | AUTO | AWO
    | BIN | BLOCK0 | BUF | BUFSIZE
    | C_CHAR | CICS | CLEANSIGN | CO | CODEPAGE | COMPAT | COMPILE | COPYLOC | COPYRIGHT | CP | CPLC | CPYR | CS | CURR | CURRENCY
    | D_CHAR | DATA | DBCS | DEC | DECK | DEF | DEFINE | DIAGTRUNC | DISPSIGN | DLL | DN | DS | DSN | DSNAME | DTR | DU | DUMP | DWARF | DYN | DYNAM
    | E_CHAR | EJPD | EN | ENDP | ENDPERIOD | ENGLISH | EVENP | EVENPACK | EX | EXIT | EXP | EXPORTALL | EXTEND
    | F_CHAR | FASTSRT | FLAG | FLAGSTD | FNC | FORCENUMCMP | FSRT | FULL
    | H_CHAR | HEX | HGPR
    | I_CHAR | IC
    | INEXIT | INITCHECK | INITIAL | INL | INLINE | INTDATE | INVD | INVDATA | INX
    | JA | JAPANESE | JP
    | LANG | LANGUAGE | LAX | LAXPERF | LAXREDEF | LC | LIBEXIT | LIBX | LILIAN | LINECOUNT | LIST | LM | LONGMIXED
    | LONGUPPER | LP | LU | LXPRF | LXRDF
    | M_CHAR | MAP | MAXPCF | MD | MDECK | MIG | MIXED | MSG | MSGEXIT | MSGX
    | N_CHAR | NAME | NAT | NATIONAL | NC | ND | NOADATA | NOADEXIT | NOADV | NOADX | NOALIAS | NOALPHNUM | NOAWO | NOBIN
    | NOBLOCK0 | NOC | NOCICS | NOCLEANSIGN | NOCOMPILE | NOCOPYLOC | NOCOPYRIGHT | NOCPLC | NOCPYR | NOCS | NOCURR
    | NOCURRENCY | NOD | NODBCS | NODECK | NODEF | NODEFINE | NODIAGTRUNC | NODLL | NODSNAME | NODTR | NODU | NODUMP
    | NODWARF | NODYN | NODYNAM | NOEJPD | NOENDPERIOD | NOEVENPACK | NOEX | NOEXIT | NOEXP | NOEXPORTALL | NOF
    | NOFASTSRT | NOFLAG | NOFLAGSTD | NOFNC | NOFORCENUMCMP | NOFSRT | NOIC | NOINEXIT | NOINITCHECK | NOINITIAL
    | NOINL | NOINLINE | NOINVD | NOINVDATA | NOINX | NOLAXPERF | NOLAXREDEF | NOLIBEXIT | NOLIBX | NOLIST | NOMAP
    | NOMD | NOMDECK | NOMSGEXIT | NOMSGX | NONAME | NONC | NONUM | NONUMBER | NONUMCHECK | NOOBJ | NOOBJECT | NOOFF
    | NOOFFSET | NOOMITODOMIN | NOPAC | NOPARMCHECK | NOPC | NOPFD | NOPRESERVE | NOPRTEXIT | NOPRTX | NORENT | NORULES
    | NOS | NOSEP | NOSEPARATE | NOSEQ | NOSEQUENCE | NOSERV | NOSERVICE | NOSLACKBYTES | NOSO | NOSOURCE | NOSQL
    | NOSQLC | NOSQLCCSID | NOSQLIMS | NOSSR | NOSSRANGE | NOSTGOPT | NOSUPP | NOSUPPRESS | NOTERM | NOTERMINAL | NOTEST
    | NOTHREAD | NOTRUNCBIN | NOUNRA | NOUNREFALL | NOUNREFSOURCE | NOUNRS | NOVBREF | NOVOLATILE | NOWD | NOWORD | NOX
    | NOXREF | NOZC | NOZLEN | NOZON | NOZONECHECK | NOZWB | NS | NSYMBOL | NUM | NUMBER | NUMCHECK | NUMPROC
    | O_CHAR | OBJ | OBJECT | OFF | OFFSET | OMITODOMIN | OOM | OPT | OPTFILE | OPTIMIZE | OUT | OUTDD
    | PAC | PARMCHECK | PATH | PC | PFD | PGMN | PGMNAME | PRESERVE | PRTEXIT | PRTX
    | Q_CHAR | QUA | QUALIFY | QUOTE
    | RENT | RMODE | RULES
    | S_CHAR | SEP | SEPARATE | SEQ | SEQUENCE | SERV | SERVICE | SHORT | SLACKBYTES | SLCKB | SN | SO | SOURCE
    | SQL | SQLC | SQLCCSID | SQLIMS | SSR | SSRANGE | STANDARD | STD | STGOPT | STRICT | SUCC | SUPP | SUPPRESS | SYSLIB
    | TERM | TERMINAL | TEST | THREAD | TRUNC | TRUNCBIN | TUNE
    | U_CHAR | UE | UENGLISH | UNREF | UPPER
    | VBREF | VLR | VOLATILE | VS | VSAMOPENFS
    | W_CHAR | WD | WORD
    | X_CHAR | XMLPARSE | XMLSS | XP | XREF
    | ZC | ZD | ZLEN | ZON | ZONECHECK | ZONEDATA | ZWB
    ;

dataBlankWhenZeroClause
   : BLANK WHEN? (ZERO | ZEROS | ZEROES)
   ;

dataDescriptionEntryFormat3
    : LEVEL_NUMBER_88 entryName? dataValueClause DOT_FS
    ;

dataDynamicLengthClause
   : DYNAMIC LENGTH? (LIMIT IS? integerLiteral)?
   ;

dataExternalClause
   : IS? EXTERNAL (BY literal)?
   ;

dataGlobalClause
   : IS? GLOBAL
   ;

dataGroupUsageClause
   : GROUP_USAGE IS? (NATIONAL | UTF_8)
   ;

dataJustifiedClause
   : (JUSTIFIED | JUST) RIGHT?
   ;

dataName
   : cobolWord
   ;

dataOccursClause
   : OCCURS integerLiteral dataOccursTo? TIMES? (DEPENDING ON? qualifiedDataName)? dataOccursSort* (INDEXED BY? LOCAL? indexName+)?
   ;

dataOccursSort
   : (ASCENDING | DESCENDING) KEY? IS? qualifiedDataName+
   ;

dataPictureClause
   : (PICTURE | PIC) PICTUREIS? pictureString+
   ;

dataRedefinesClause
   : REDEFINES dataName
   ;

dataRenamesClause
   : RENAMES qualifiedVariableDataName  thruDataName?
   ;

dataOccursTo
   : TO integerLiteral
   ;

dataSignClause
   : (SIGN IS?)? (LEADING | TRAILING) (SEPARATE CHARACTER?)?
   ;

dataSynchronizedClause
   : (SYNCHRONIZED | SYNC) (LEFT | RIGHT)?
   ;

dataUsageClause
   : (USAGE IS?)? usageFormat
   ;

dataValueClause
   : valueIsToken dataValueClauseLiteral
   ;

dataValueClauseLiteral
   : dataValueInterval (COMMACHAR? dataValueInterval)*
   ;

dataValueInterval
   : dataValueIntervalFrom dataValueIntervalTo?
   ;

dataValueIntervalFrom
   : literal | cobolWord
   ;

dataValueIntervalTo
   : thruToken literal
   ;

dataVolatileClause
   : VOLATILE
   ;

entryName
   : (FILLER | dataName)
   ;

figurativeConstant
   : ALL literal | HIGH_VALUE | HIGH_VALUES | LOW_VALUE | LOW_VALUES | NULL | NULLS | QUOTE | QUOTES | SPACE | SPACES | ZEROS | ZEROES
   ;

functionCall
   : FUNCTION functionName (LPARENCHAR argument (COMMACHAR? argument)* RPARENCHAR)* referenceModifier?
   ;

functionName
   : INTEGER | LENGTH | RANDOM | SUM | WHEN_COMPILED | cobolWord
   ;

generalIdentifier
   : specialRegister | qualifiedDataName | functionCall
   ;

inData
   : (IN | OF) variableUsageName tableCall? referenceModifier?
   ;

indexName
   : cobolWord
   ;

integerLiteral
   : INTEGERLITERAL | LEVEL_NUMBER | LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88
   ;

isAreToken
   : IS | ARE
   ;

length
   : arithmeticExpression
   ;

levelNumber
   : LEVEL_NUMBER
   ;

literal
   : NONNUMERICLITERAL | figurativeConstant | numericLiteral | booleanLiteral | charString | cicsDfhRespLiteral | cicsDfhValueLiteral
   ;

multDivs
   : powers multDiv*
   ;

multDiv
   : (ASTERISKCHAR | SLASHCHAR) powers
   ;

numericLiteral
   : NUMERICLITERAL | ZERO | integerLiteral
   ;

pictureString
   : charString
   ;

plusMinus
   : (PLUSCHAR | MINUSCHAR) multDivs
   ;

powers
   : (PLUSCHAR | MINUSCHAR)? basis power*
   ;

power
   : DOUBLEASTERISKCHAR basis
   ;

qualifiedDataName
   : variableUsageName tableCall? referenceModifier? inData*
   ;

referenceModifier
   : LPARENCHAR characterPosition COLONCHAR length? RPARENCHAR
   ;

specialRegister
   : ADDRESS OF generalIdentifier
   | LENGTH OF? generalIdentifier | LINAGE_COUNTER
   ;

tableCall
   : LPARENCHAR (ALL | arithmeticExpression) (COMMACHAR? (ALL | arithmeticExpression))* RPARENCHAR
   ;

thruDataName
   : (THROUGH | THRU) qualifiedVariableDataName
   ;

qualifiedVariableDataName
   : (dataName (IN | OF))? dataName
   ;

thruToken
   : (THROUGH | THRU)
   ;

usageFormat
   : BINARY NATIVE?
   | COMP NATIVE?
   | COMP_1 NATIVE?
   | COMP_2 NATIVE?
   | COMP_3 NATIVE?
   | COMP_4 NATIVE?
   | COMP_5 NATIVE?
   | COMPUTATIONAL NATIVE?
   | COMPUTATIONAL_1 NATIVE?
   | COMPUTATIONAL_2 NATIVE?
   | COMPUTATIONAL_3 NATIVE?
   | COMPUTATIONAL_4 NATIVE?
   | COMPUTATIONAL_5 NATIVE?
   | DISPLAY NATIVE?
   | DISPLAY_1 NATIVE?
   | INDEX
   | NATIONAL NATIVE?
   | UTF_8 NATIVE?
   | OBJECT REFERENCE cobolWord?
   | PACKED_DECIMAL NATIVE?
   | POINTER
   | POINTER_32
   | PROCEDURE_POINTER
   | FUNCTION_POINTER
   ;

valueIsToken
   : valueToken isAreToken?
   ;

valueToken
   : VALUE | VALUES
   ;

variableUsageName
   : cobolWord
   ;

dialectDescriptionEntry
   : dialectNodeFiller
   ;

dialectNodeFiller
    : ZERO_WIDTH_SPACE+
    ;


// -- file section ----------------------------------

fileDescriptionEntry
   : (fileDescriptionEntryClauses dataDescriptionEntry* | dialectNodeFiller)
   ;

fileDescriptionEntryClauses
   : (FD | SD) cobolWord (DOT_FS? fileDescriptionEntryClause)* DOT_FS
   ;

fileDescriptionEntryClause
   : externalClause | globalClause | blockContainsClause | recordContainsClause | labelRecordsClause | valueOfClause | dataRecordsClause | linageClause | codeSetClause | reportClause | recordingModeClause
   ;

externalClause
   : IS? EXTERNAL
   ;

globalClause
   : IS? GLOBAL
   ;

blockContainsClause
   : BLOCK CONTAINS? integerLiteral blockContainsTo? (RECORDS | CHARACTERS)?
   ;

recordContainsClause
   : RECORD (recordContainsClauseFormat1 | recordContainsClauseFormat2 | recordContainsClauseFormat3)
   ;

labelRecordsClause
   : LABEL (RECORD IS? | RECORDS ARE?) (OMITTED | STANDARD | dataName*)
   ;

valueOfClause
   : VALUE OF valuePair+
   ;

dataRecordsClause
   : DATA (RECORD IS? | RECORDS ARE?) dataName+
   ;

linageClause
   : LINAGE IS? (dataName | integerLiteral) LINES? linageAt*
   ;

codeSetClause
   : CODE_SET IS? alphabetName
   ;

reportClause
   : (REPORT IS? | REPORTS ARE?) reportName+
   ;

recordingModeClause
   : RECORDING MODE? IS? modeStatement
   ;

blockContainsTo
   : TO integerLiteral
   ;

recordContainsClauseFormat1
   : CONTAINS? integerLiteral CHARACTERS?
   ;

recordContainsClauseFormat2
   : IS? VARYING IN? SIZE? (FROM? integerLiteral recordContainsTo? CHARACTERS?)? (DEPENDING ON? qualifiedDataName)?
   ;

recordContainsClauseFormat3
   : CONTAINS? integerLiteral recordContainsTo CHARACTERS?
   ;

valuePair
   : systemName IS? (qualifiedDataName | literal)
   ;

linageAt
   : linageFootingAt | linageLinesAtTop | linageLinesAtBottom
   ;

alphabetName
   : cobolWord
   ;

reportName
   : qualifiedDataName
   ;

modeStatement
   : cobolWord
   ;

recordContainsTo
   : TO integerLiteral
   ;

systemName
   : cobolWord
   ;

linageFootingAt
   : WITH? FOOTING AT? (dataName | integerLiteral)
   ;

linageLinesAtTop
   : LINES? AT? TOP (dataName | integerLiteral)
   ;

linageLinesAtBottom
   : LINES? AT? BOTTOM (dataName | integerLiteral)
   ;

versionClause
    : VERSION integerLiteral
    ;
