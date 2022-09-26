/*
* Copyright (C) 2017, Ulrich Wolffgang <ulrich.wolffgang@proleap.io>
* All rights reserved.
*
* This software may be modified and distributed under the terms
* of the MIT license. See the LICENSE file for details.
*/

parser grammar CobolParser;
options {tokenVocab = CobolLexer; superClass = MessageServiceParser;}

startRule : compilationUnit EOF;

compilationUnit
   : programUnit+
   ;

programUnit
   : compilerOptions* identificationDivision environmentDivision? dataDivision? procedureDivision? programUnit* endProgramStatement?
   ;

endProgramStatement
   : END PROGRAM programName DOT_FS
   ;

// compiler options
compilerOptions
   : (PROCESS | CBL) (commaSeparator? compilerOption)+
   ;

// https://www.ibm.com/docs/en/cobol-zos/6.3?topic=program-compiler-options
compilerOption
   : ADATA | NOADATA
   | ADV | NOADV
   | AFP LPARENCHAR (NOVOLATILE | VOLATILE) RPARENCHAR
   | APOST | QUOTE | Q_CHAR
   | ARCH LPARENCHAR integerLiteral RPARENCHAR
   | (ARITH | AR) LPARENCHAR (EXTEND | E_CHAR | COMPAT | C_CHAR) RPARENCHAR
   | AWO | NOAWO
   | BLOCK0 | NOBLOCK0
   | (BUFSIZE | BUF) LPARENCHAR (integerLiteral | INTEGERLITERAL_WITH_K) RPARENCHAR
   | CICS (LPARENCHAR literal RPARENCHAR)? | NOCICS
   | (CODEPAGE | CP) LPARENCHAR integerLiteral RPARENCHAR
   | COMPILE | C_CHAR | (NOCOMPILE | NOC) (LPARENCHAR (S_CHAR | E_CHAR | W_CHAR) RPARENCHAR)?
   | (COPYLOC | CPLC) LPARENCHAR ((SYSLIB | dataName) commaSeparator)? (DSN | PATH) LPARENCHAR (literal | dataSetName) RPARENCHAR RPARENCHAR
   | NOCOPYLOC | NOCPLC
   | (COPYRIGHT | CPYR) LPARENCHAR literal RPARENCHAR | NOCOPYRIGHT | NOCPYR
   | (CURRENCY | CURR) LPARENCHAR CURRENCY_SYMBOL RPARENCHAR | NOCURRENCY | NOCURR
   | DATA LPARENCHAR integerLiteral RPARENCHAR
   | DBCS | NODBCS
   | DECK | D_CHAR | NODECK | NOD
   | (DEFINE | DEF) LPARENCHAR dataName ((commaSeparator | EQUALCHAR) dataName)? RPARENCHAR | NODEFINE | NODEF
   | DIAGTRUNC | DTR | NODIAGTRUNC | NODTR
   | (DISPSIGN | DS) LPARENCHAR (COMPAT | SEP | C_CHAR | S_CHAR) RPARENCHAR
   | DLL | NODLL
   | DUMP | DU | NODUMP | NODU
   | DYNAM | DYN | NODYNAM | NODYN
   | (EXIT | EX) LPARENCHAR (
        ((INEXIT | INX | LIBEXIT | LIBX | PRTEXIT | PRTX | ADEXIT | ADX | MSGEXIT | MSGX)
            LPARENCHAR dataName (commaSeparator dataName)? RPARENCHAR)
        | (NOINEXIT | NOINX | NOLIBEXIT | NOLIBX | NOPRTEXIT | NOPRTX | NOADEXIT | NOADX | NOMSGEXIT | NOMSGX)
      )* RPARENCHAR
   | NOEXIT | NOEX
   | EXPORTALL | EXP | NOEXPORTALL | NOEXP
   | FASTSRT | FSRT | NOFASTSRT | NOFSRT
   | (FLAG | F_CHAR) LPARENCHAR (E_CHAR | I_CHAR | S_CHAR | U_CHAR | W_CHAR) (commaSeparator (E_CHAR | I_CHAR | S_CHAR | U_CHAR | W_CHAR))? RPARENCHAR
   | NOFLAG | NOF
   | FLAGSTD LPARENCHAR (M_CHAR | I_CHAR | H_CHAR) (D_CHAR | N_CHAR | S_CHAR | DN | DS | ND | NS | SD | SN)? (commaSeparator O_CHAR)? RPARENCHAR
   | NOFLAGSTD
   | HGPR LPARENCHAR (PRESERVE | NOPRESERVE) RPARENCHAR
   | (INITCHECK | IC) (LPARENCHAR (LAX | STRICT)? RPARENCHAR)? | NOINITCHECK | NOIC
   | INITIAL | NOINITIAL
   | INLINE | INL | NOINLINE | NOINL
   | INTDATE LPARENCHAR (ANSI | LILIAN) RPARENCHAR
   | (INVDATA | INVD) (LPARENCHAR invdataSuboptions (commaSeparator invdataSuboptions)* RPARENCHAR)? | NOINVDATA | NOINVD
   | (LANGUAGE | LANG) LPARENCHAR (ENGLISH | EN | JAPANESE | JA | JP | UENGLISH | UE) RPARENCHAR
   | (LINECOUNT | LC) LPARENCHAR integerLiteral RPARENCHAR
   | LIST | NOLIST
   | LP LPARENCHAR integerLiteral RPARENCHAR
   | MAP (LPARENCHAR (HEX | DEC) RPARENCHAR)? | NOMAP
   | MAXPCF LPARENCHAR integerLiteral RPARENCHAR
   | (MDECK | MD) (LPARENCHAR (C_CHAR | COMPILE | NOC | NOCOMPILE) RPARENCHAR)? | NOMDECK | NOMD
   | NAME (LPARENCHAR (ALIAS | NOALIAS) RPARENCHAR)? | NONAME
   | (NSYMBOL | NS) LPARENCHAR (NATIONAL | NAT | DBCS) RPARENCHAR
   | NUMBER | NUM | NONUMBER | NONUM
   | (NUMCHECK | NC) (LPARENCHAR numcheckSuboptions (commaSeparator numcheckSuboptions)* RPARENCHAR)? | NONUMCHECK | NONC
   | NUMPROC LPARENCHAR (NOPFD | PFD) RPARENCHAR
   | OBJECT | OBJ | NOOBJECT | NOOBJ
   | OFFSET | OFF | NOOFFSET | NOOFF
   | OPTFILE
   | (OPTIMIZE | OPT) (LPARENCHAR integerLiteral RPARENCHAR)
   | (OUTDD | OUT) LPARENCHAR dataSetName RPARENCHAR
   | (PARMCHECK | PC) (LPARENCHAR (MSG | ABD) (commaSeparator integerLiteral)? RPARENCHAR)? | NOPARMCHECK | NOPC
   | (PGMNAME | PGMN) LPARENCHAR (CO | COMPAT | LM | LONGMIXED | LONGUPPER | LU | M_CHAR | MIXED | U_CHAR | UPPER) RPARENCHAR
   | (QUALIFY | QUA) LPARENCHAR (COMPAT | C_CHAR | EXTEND | E_CHAR) RPARENCHAR
   | RENT | NORENT
   | RMODE LPARENCHAR (ANY | AUTO | integerLiteral) RPARENCHAR
   | RULES LPARENCHAR rulesSuboptions (commaSeparator rulesSuboptions)* RPARENCHAR | NORULES
   | SEQUENCE | SEQ | NOSEQUENCE | NOSEQ
   | (SERVICE | SERV) LPARENCHAR literal RPARENCHAR | NOSERVICE | NOSERV
   | (SOURCE | S_CHAR) (LPARENCHAR (HEX | DEC) RPARENCHAR)? | NOSOURCE | NOS
   | SPACE LPARENCHAR integerLiteral RPARENCHAR
   | SQL (LPARENCHAR literal RPARENCHAR)? | NOSQL
   | SQLCCSID | SQLC | NOSQLCCSID | NOSQLC
   | SQLIMS (LPARENCHAR literal RPARENCHAR)? | NOSQLIMS
   | (SSRANGE | SSR) LPARENCHAR (ssrangeSuboptions (commaSeparator ssrangeSuboptions)*)? RPARENCHAR | (NOSSRANGE | NOSSR)
   | STGOPT | SO | NOSTGOPT | NOSO
   | SUPPRESS | SUPP | NOSUPPRESS | NOSUPP
   | TERMINAL | TERM | NOTERMINAL | NOTERM
   | (TEST | NOTEST) (LPARENCHAR (testSuboptions (commaSeparator testSuboptions)*)? RPARENCHAR)?
   | THREAD | NOTHREAD
   | TRUNC LPARENCHAR (BIN | OPT | STD) RPARENCHAR
   | TUNE LPARENCHAR integerLiteral RPARENCHAR
   | VBREF | NOVBREF
   | VLR LPARENCHAR (STANDARD | S_CHAR | COMPAT | C_CHAR) RPARENCHAR
   | (VSAMOPENFS | VS) LPARENCHAR (SUCC | S_CHAR | COMPAT | C_CHAR) RPARENCHAR
   | (WORD | WD) LPARENCHAR (integerLiteral | cobolWord) RPARENCHAR | NOWORD | NOWD
   | (XMLPARSE | XP) LPARENCHAR (COMPAT | C_CHAR | XMLSS | X_CHAR) RPARENCHAR
   | (XREF | X_CHAR) (LPARENCHAR (FULL | SHORT) RPARENCHAR)? | NOXREF | NOX
   | (ZONECHECK | ZC) LPARENCHAR (MSG | ABD) RPARENCHAR | NOZONECHECK | NOZC
   | (ZONEDATA | ZD) LPARENCHAR (PFD | MIG | NOPFD) RPARENCHAR
   | ZWB | NOZWB
   ;

commaSeparator: COMMACHAR | COMMASEPARATOR;

invdataSuboptions
   : CLEANSIGN | CS | NOCLEANSIGN | NOCS | FORCENUMCMP | FNC | NOFORCENUMCMP | NOFNC
   ;

numcheckSuboptions
   : ZON (LPARENCHAR numcheckZonSuboptions (commaSeparator numcheckZonSuboptions)* RPARENCHAR)? | NOZON
   | PAC | NOPAC
   | BIN (LPARENCHAR (TRUNCBIN | NOTRUNCBIN) RPARENCHAR)? | NOBIN
   | MSG | ABD
   ;

numcheckZonSuboptions
   : ALPHNUM | NOALPHNUM | LAX | STRICT
   ;

rulesSuboptions
   : ENDPERIOD | ENDP | NOENDPERIOD
   | EVENPACK | EVENP | NOEVENPACK
   | LAXPERF | LXPRF | NOLAXPERF
   | SLACKBYTES | SLCKB | NOSLACKBYTES
   | OMITODOMIN | OOM | NOOMITODOMIN
   | UNREF | NOUNREFALL | NOUNRA | NOUNREFSOURCE | NOUNRS
   | LAXREDEF | LXRDF | NOLAXREDEF
   ;

ssrangeSuboptions
   : NOZLEN | ZLEN | ABD | MSG
   ;

testSuboptions
   : DWARF | NODWARF
   | EJPD | NOEJPD
   | (SEPARATE | SEP) (LPARENCHAR (DSNAME | NODSNAME) RPARENCHAR)? | NOSEPARATE | NOSEP
   | SOURCE | SO | NOSOURCE | NOSO
   ;

// --- identification division --------------------------------------------------------------------

identificationDivision
   : (IDENTIFICATION | ID) DIVISION DOT_FS programIdParagraph identificationDivisionBody*
   ;

identificationDivisionBody
   : authorParagraph | installationParagraph | dateWrittenParagraph | dateCompiledParagraph | securityParagraph | remarksParagraph
   ;

// - program id paragraph ----------------------------------

programIdParagraph
   : PROGRAM_ID DOT_FS programName (IS? (COMMON | INITIAL | LIBRARY | DEFINITION | RECURSIVE) PROGRAM?)? DOT_FS?
   ;

// - author paragraph ----------------------------------

authorParagraph
   : AUTHOR DOT_FS? optionalParagraphTermination
   ;

// - installation paragraph ----------------------------------

installationParagraph
   : INSTALLATION DOT_FS? optionalParagraphTermination
   ;

// - date written paragraph ----------------------------------

dateWrittenParagraph
   : DATE_WRITTEN DOT_FS? optionalParagraphTermination
   ;

// - date compiled paragraph ----------------------------------

dateCompiledParagraph
   : DATE_COMPILED DOT_FS? optionalParagraphTermination
   ;

// - security paragraph ----------------------------------

securityParagraph
   : SECURITY DOT_FS? optionalParagraphTermination
   ;

// remarks paragraph

remarksParagraph
   : REMARKS DOT_FS? optionalParagraphTermination
   ;

// - end of comment entry
optionalParagraphTermination
   : ~(AUTHOR | CBL| DATE_COMPILED | DATE_WRITTEN | IDENTIFICATION | INSTALLATION
   | END | ENVIRONMENT | ID | PROCEDURE | PROCESS | PROGRAM_ID | SECURITY | REMARKS)*?
   ;

// --- environment division --------------------------------------------------------------------

environmentDivision
   : ENVIRONMENT DIVISION DOT_FS environmentDivisionBody*
   ;

environmentDivisionBody
   : configurationSection | inputOutputSection | dialectSection | dacoControlSection
   ;

// -- configuration section ----------------------------------

configurationSection
   : CONFIGURATION SECTION DOT_FS configurationSectionParagraph*
   ;

// - configuration section paragraph ----------------------------------

configurationSectionParagraph
   : sourceComputerParagraph | objectComputerParagraph | specialNamesParagraph
   // strictly, specialNamesParagraph does not belong into configurationSectionParagraph, but IBM-COBOL allows this
   ;

// - source computer paragraph ----------------------------------

sourceComputerParagraph
   : SOURCE_COMPUTER DOT_FS (computerName (WITH? DEBUGGING MODE)? DOT_FS)?
   ;

// - object computer paragraph ----------------------------------

objectComputerParagraph
   : OBJECT_COMPUTER DOT_FS (computerName objectComputerClause* DOT_FS)?
   ;

objectComputerClause
   : memorySizeClause | diskSizeClause | collatingSequenceClause | segmentLimitClause | characterSetClause
   ;

memorySizeClause
   : MEMORY SIZE? (integerLiteral | cobolWord) (WORDS | CHARACTERS | MODULES)?
   ;

diskSizeClause
   : DISK SIZE? IS? (integerLiteral | cobolWord) (WORDS | MODULES)?
   ;

collatingSequenceClause
   : PROGRAM? COLLATING? SEQUENCE IS? alphabetName+ collatingSequenceClauseAlphanumeric? collatingSequenceClauseNational?
   ;

collatingSequenceClauseAlphanumeric
   : FOR? ALPHANUMERIC IS? alphabetName
   ;

collatingSequenceClauseNational
   : FOR? NATIONAL IS? alphabetName
   ;

segmentLimitClause
   : SEGMENT_LIMIT IS? integerLiteral
   ;

characterSetClause
   : CHARACTER SET DOT_FS
   ;

// - special names paragraph ----------------------------------

specialNamesParagraph
   : SPECIAL_NAMES DOT_FS (specialNameClause+ DOT_FS)?
   ;

specialNameClause
   : channelClause | odtClause | alphabetClause | classClause | currencySignClause
   | decimalPointClause | symbolicCharactersClause | environmentSwitchNameClause
   | environmentSwitchNameSpecialNamesStatusPhrase | defaultDisplaySignClause | defaultComputationalSignClause
   | reserveNetworkClause
   ;

alphabetClause
   : ALPHABET (alphabetClauseFormat1 | alphabetClauseFormat2)
   ;

alphabetClauseFormat1
   : alphabetName (FOR ALPHANUMERIC)? IS? (EBCDIC | ASCII | STANDARD_1 | STANDARD_2 | NATIVE | cobolWord | alphabetLiterals+)
   ;

alphabetLiterals
   : literal (alphabetThrough | (ALSO? literal)+)?
   ;

alphabetThrough
   : (THROUGH | THRU) literal
   ;

alphabetClauseFormat2
   : alphabetName FOR? NATIONAL IS? (NATIVE | CCSVERSION literal)
   ;

channelClause
   : CHANNEL integerLiteral IS? mnemonicName
   ;

classClause
   : CLASS className (FOR? (ALPHANUMERIC | NATIONAL))? IS? classClauseThrough+
   ;

classClauseThrough
   : classClauseFrom ((THROUGH | THRU) classClauseTo)?
   ;

classClauseFrom
   : literal | generalIdentifier
   ;

classClauseTo
   : literal | generalIdentifier
   ;

currencySignClause
   : CURRENCY SIGN? IS? literal (WITH? PICTURE SYMBOL literal)?
   ;

decimalPointClause
   : DECIMAL_POINT IS? COMMA
   ;

defaultComputationalSignClause
   : DEFAULT (COMPUTATIONAL | COMP)? (SIGN IS?)? (LEADING | TRAILING)? (SEPARATE CHARACTER?)
   ;

defaultDisplaySignClause
   : DEFAULT_DISPLAY (SIGN IS?)? (LEADING | TRAILING) (SEPARATE CHARACTER?)?
   ;

environmentSwitchNameClause
   : environmentName IS? mnemonicName
   ;

environmentSwitchNameSpecialNamesStatusPhrase
   : (ON | OFF) STATUS? IS? condition
   ;

odtClause
   : ODT IS? mnemonicName
   ;

reserveNetworkClause
   : RESERVE WORDS? LIST? IS? NETWORK CAPABLE?
   ;

symbolicCharactersClause
   : SYMBOLIC CHARACTERS? (FOR? (ALPHANUMERIC | NATIONAL))? symbolicCharacters+ (IN alphabetName)?
   ;

symbolicCharacters
   : symbolicCharacter+ (IS | ARE)? integerLiteral+
   ;

// -- input output section ----------------------------------

inputOutputSection
   : INPUT_OUTPUT SECTION DOT_FS inputOutputSectionParagraph*
   ;

// - input output section paragraph ----------------------------------

inputOutputSectionParagraph
   : fileControlParagraph | ioControlParagraph
   ;

// - file control paragraph ----------------------------------

fileControlParagraph
   : FILE_CONTROL DOT_FS fileControlEntry*
   ;

fileControlEntry
   : selectClause fileControlClauses DOT_FS
   ;

fileControlClauses
   : fileControlClause*
   ;

selectClause
   : SELECT OPTIONAL? fileName
   ;

fileControlClause
   : assignClause | reserveClause | organizationClause | paddingCharacterClause | accessModeClause | recordClause | alternateRecordKeyClause | fileStatusClause | passwordClause | relativeKeyClause
   ;

assignClause
   : ASSIGN TO? (DISK | DISPLAY | KEYBOARD | PORT | PRINTER | READER | REMOTE | TAPE | VIRTUAL | (DYNAMIC | EXTERNAL | VARYING)? assignmentName | literal)+
   ;

reserveClause
   : RESERVE (NO | integerLiteral) ALTERNATE? (AREA | AREAS)?
   ;

organizationClause
   : (ORGANIZATION IS?)? (LINE | RECORD BINARY | RECORD | BINARY)? (SEQUENTIAL | RELATIVE | INDEXED)
   ;

paddingCharacterClause
   : PADDING CHARACTER? IS? (qualifiedDataName | literal)
   ;

recordClause
   : RECORD (recordDelimiterClause | recordKeyClause)
   ;

recordDelimiterClause
   : DELIMITER IS? (STANDARD_1 | IMPLICIT | assignmentName)
   ;

accessModeClause
   : ACCESS MODE? IS? (SEQUENTIAL | RANDOM | DYNAMIC | EXCLUSIVE)
   ;

recordKeyClause
   : KEY? IS? qualifiedDataName passwordClause? (WITH? DUPLICATES)?
   ;

alternateRecordKeyClause
   : ALTERNATE RECORD KEY? IS? qualifiedDataName passwordClause? (WITH? DUPLICATES)?
   ;

passwordClause
   : PASSWORD IS? dataName
   ;

fileStatusClause
   : FILE? STATUS IS? qualifiedDataName qualifiedDataName?
   ;

relativeKeyClause
   : RELATIVE KEY? IS? qualifiedDataName
   ;

// - io control paragraph ----------------------------------

ioControlParagraph
   : I_O_CONTROL DOT_FS (fileName DOT_FS)? (ioControlClause+ DOT_FS)?
   ;

ioControlClause
   : rerunClause | sameClause | multipleFileClause | commitmentControlClause | applyWriteOnlyClause
   ;

rerunClause
   : RERUN (ON (assignmentName | fileName))? EVERY (rerunEveryRecords | rerunEveryOf | rerunEveryClock)
   ;

rerunEveryRecords
   : integerLiteral RECORDS
   ;

rerunEveryOf
   : END? OF? (REEL | UNIT) OF fileName
   ;

rerunEveryClock
   : integerLiteral CLOCK_UNITS?
   ;

sameClause
   : SAME (RECORD | SORT | SORT_MERGE)? AREA? FOR? fileName+
   ;

multipleFileClause
   : MULTIPLE FILE TAPE? CONTAINS? multipleFilePosition+
   ;

multipleFilePosition
   : fileName (POSITION integerLiteral)?
   ;

applyWriteOnlyClause
   : APPLY WRITE_ONLY (ON)? fileName+
   ;

commitmentControlClause
   : COMMITMENT CONTROL FOR? fileName
   ;

endClause
    : DOT_FS
    ;

// --- data division --------------------------------------------------------------------

dataDivision
   : DATA DIVISION DOT_FS dataDivisionSection*
   ;

dataDivisionSection
   : fileSection | workingStorageSection | linkageSection | localStorageSection
   | execSqlStatementInDataDivision | dialectSection
   ;

dialectSection
   : dialectNodeFiller
   ;

// -- file section ----------------------------------

fileSection
   : FILE SECTION DOT_FS fileDescriptionEntry*
   ;

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

blockContainsTo
   : TO integerLiteral
   ;

recordContainsClause
   : RECORD (recordContainsClauseFormat1 | recordContainsClauseFormat2 | recordContainsClauseFormat3)
   ;

recordContainsClauseFormat1
   : CONTAINS? integerLiteral CHARACTERS?
   ;

recordContainsClauseFormat2
   : IS? VARYING IN? SIZE? ((FROM? integerLiteral)? recordContainsTo? CHARACTERS?)? (DEPENDING ON? qualifiedDataName)?
   ;

recordContainsClauseFormat3
   : CONTAINS? integerLiteral recordContainsTo CHARACTERS?
   ;

recordContainsTo
   : TO integerLiteral
   ;

labelRecordsClause
   : LABEL (RECORD IS? | RECORDS ARE?) (OMITTED | STANDARD | dataName*)
   ;

valueOfClause
   : VALUE OF valuePair+
   ;

valuePair
   : systemName IS? (qualifiedDataName | literal)
   ;

dataRecordsClause
   : DATA (RECORD IS? | RECORDS ARE?) qualifiedDataName+
   ;

linageClause
   : LINAGE IS? (dataName | integerLiteral) LINES? linageAt*
   ;

linageAt
   : linageFootingAt | linageLinesAtTop | linageLinesAtBottom
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

recordingModeClause
   : RECORDING MODE? IS? modeStatement
   ;

modeStatement
   : cobolWord
   ;

codeSetClause
   : CODE_SET IS? alphabetName
   ;

reportClause
   : (REPORT IS? | REPORTS ARE?) reportName+
   ;

// -- working storage section ----------------------------------

workingStorageSection
   : WORKING_STORAGE SECTION DOT_FS  dataDescriptionEntryForWorkingStorageSection*
   ;
// -- linkage section ----------------------------------

linkageSection
   : LINKAGE SECTION DOT_FS dataDescriptionEntryForWorkingStorageAndLinkageSection*
   ;

// -- local storage section ----------------------------------

localStorageSection
   : LOCAL_STORAGE SECTION DOT_FS dataDescriptionEntries
   ;

dataDescriptionEntries
   : dataDescriptionEntry*
   ;

dataDescriptionEntryForWorkingStorageSection
   : execSqlStatementInWorkingStorage
   | dataDescriptionEntryForWorkingStorageAndLinkageSection
   ;

dataDescriptionEntryForWorkingStorageAndLinkageSection
   : execSqlStatementInWorkingStorageAndLinkageSection
   | dataDescriptionEntry
   ;

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

levelNumber
   : LEVEL_NUMBER
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


dataDescriptionEntryFormat3
   : LEVEL_NUMBER_88 entryName? dataValueClause DOT_FS
   ;

dialectDescriptionEntry
   : dialectNodeFiller
   ;

entryName
   : (FILLER | dataName)
   ;

dataGroupUsageClause
   : GROUP_USAGE IS? (NATIONAL | UTF_8)
   ;

dataBlankWhenZeroClause
   : BLANK WHEN? (ZERO | ZEROS | ZEROES)
   ;

dataExternalClause
   : IS? EXTERNAL (BY literal)?
   ;

dataGlobalClause
   : IS? GLOBAL
   ;

dataJustifiedClause
   : (JUSTIFIED | JUST) RIGHT?
   ;

dataOccursClause
   : OCCURS integerLiteral dataOccursTo? TIMES? (DEPENDING ON? qualifiedDataName)? dataOccursSort* (INDEXED BY? LOCAL? indexName+)?
   ;

dataOccursTo
   : TO integerLiteral
   ;

dataOccursSort
   : (ASCENDING | DESCENDING) KEY? IS? qualifiedDataName+
   ;

dataPictureClause
   : (PICTURE | PIC) PICTUREIS? pictureString+
   ;

pictureString
   : charString
   ;

dataDynamicLengthClause
   : DYNAMIC LENGTH? (LIMIT IS? integerLiteral)?
   ;

dataVolatileClause
   : VOLATILE
   ;

dataRedefinesClause
   : REDEFINES dataName
   ;

dataRenamesClause
   : RENAMES qualifiedVariableDataName thruDataName?
   ;

thruDataName
   : (THROUGH | THRU) qualifiedVariableDataName
   ;

qualifiedVariableDataName
   : (dataName (IN | OF))? dataName
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

dataValueClause
   : valueIsToken dataValueClauseLiteral
   ;

valueIsToken
   : valueToken isAreToken?
   ;

valueToken
   : VALUE | VALUES
   ;

isAreToken
   : IS | ARE
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

thruToken
   : (THROUGH | THRU)
   ;

// --- procedure division --------------------------------------------------------------------

procedureDivision
   : PROCEDURE DIVISION procedureDivisionUsingClause? procedureDivisionGivingClause? DOT_FS procedureDeclaratives? procedureDivisionBody
   ;

procedureDivisionUsingClause
   : (USING | CHAINING) procedureDivisionUsingParameter (COMMACHAR? procedureDivisionUsingParameter)*
   ;

procedureDivisionGivingClause
   : RETURNING dataName
   ;

procedureDivisionUsingParameter
   : BY? (REFERENCE | VALUE)? generalIdentifier
   ;

procedureDeclaratives
   : DECLARATIVES DOT_FS procedureDeclarative+ END DECLARATIVES DOT_FS
   ;

procedureDeclarative
   : procedureSectionHeader DOT_FS (useStatement DOT_FS) paragraphs
   ;

procedureSectionHeader
   : sectionName SECTION integerLiteral?
   ;

procedureDivisionBody
   : paragraphs procedureSection*
   ;

// -- procedure section ----------------------------------

procedureSection
   : procedureSectionHeader DOT_FS paragraphs
   ;

paragraphs
   : sentence* paragraph*
   ;

paragraph
   : paragraphDefinitionName DOT_FS (alteredGoTo | sentence*)
   ;

sentence
   : statement* (endClause | dialectStatement)
   ;

conditionalStatementCall
   : statement | dialectStatement
   ;

statement
   : acceptStatement | addStatement | alterStatement | callStatement | cancelStatement | closeStatement | computeStatement | continueStatement | deleteStatement |
    disableStatement | displayStatement | divideStatement | enableStatement | entryStatement | evaluateStatement | exhibitStatement | execCicsStatement |
    execSqlStatementInProcedureDivision | execSqlImsStatement | exitStatement | generateStatement | gobackStatement | goToStatement | ifStatement | initializeStatement |
    initiateStatement | inspectStatement | mergeStatement | moveStatement | multiplyStatement | openStatement | performStatement | purgeStatement |
    readStatement | readyResetTraceStatement | receiveStatement | releaseStatement | returnStatement | rewriteStatement | searchStatement | sendStatement |
    serviceReloadStatement | serviceLabelStatement | setStatement | sortStatement | startStatement | stopStatement | stringStatement | subtractStatement |
    terminateStatement | unstringStatement | writeStatement | xmlStatement
   ;

dialectStatement
   : dialectNodeFiller | dialectIfStatment
   ;

// DAF DaCo Statements

dacoControlSection
    : DACO_CONTROL SECTION
    ;

// End of DaCo Statements

// accept statement

acceptStatement
   : ACCEPT generalIdentifier (acceptFromDateStatement | acceptFromEscapeKeyStatement | acceptFromMnemonicStatement | acceptMessageCountStatement)? onExceptionClause? notOnExceptionClause? END_ACCEPT?
   ;

acceptFromDateStatement
   : FROM (DATE YYYYMMDD? | DAY YYYYDDD? | DAY_OF_WEEK | TIME | TIMER | TODAYS_DATE MMDDYYYY? | TODAYS_NAME | YEAR | YYYYMMDD | YYYYDDD)
   ;

acceptFromMnemonicStatement
   : FROM mnemonicName
   ;

acceptFromEscapeKeyStatement
   : FROM ESCAPE KEY
   ;

acceptMessageCountStatement
   : MESSAGE? COUNT
   ;

// add statement

addStatement
   : ADD (addToStatement | addToGivingStatement | addCorrespondingStatement) onSizeErrorPhrase? notOnSizeErrorPhrase? END_ADD?
   ;

addToStatement
   : addFrom (COMMACHAR? addFrom)* TO addTo (COMMACHAR? addTo)*?
   ;

addToGivingStatement
   : addFrom (COMMACHAR? addFrom)* (TO addToGiving (COMMACHAR? addToGiving)*)? GIVING addGiving (COMMACHAR? addGiving)*?
   ;

addCorrespondingStatement
   : (CORRESPONDING | CORR) generalIdentifier TO addTo
   ;

addFrom
   : literal | generalIdentifier
   ;

addTo
   : generalIdentifier ROUNDED?
   ;

addToGiving
   : literal | generalIdentifier
   ;

addGiving
   : generalIdentifier ROUNDED?
   ;

// altered go to statement

alteredGoTo
   : GO TO? DOT_FS
   ;

// alter statement

alterStatement
   : ALTER alterProceedTo+
   ;

alterProceedTo
   : procedureName TO (PROCEED TO)? procedureName
   ;

// call statement

callStatement
   : CALL (generalIdentifier | constantName) callUsingPhrase? callGivingPhrase? onOverflowPhrase? onExceptionClause? notOnExceptionClause? END_CALL?
   ;

constantName
   : literal
   ;

callUsingPhrase
   : USING callUsingParameter (COMMACHAR? callUsingParameter)*
   ;

callUsingParameter
   : callByReferencePhrase | callByValuePhrase | callByContentPhrase
   ;

callByReferencePhrase
   : (BY? REFERENCE)? callByReference
   ;

callByReference
   : ((INTEGER | STRING)? literal | generalIdentifier) | OMITTED
   ;

callByValuePhrase
   : BY? VALUE (literal | generalIdentifier)
   ;

callByContentPhrase
   : BY? CONTENT (literal | generalIdentifier | OMITTED)
   ;

callGivingPhrase
   : (GIVING | RETURNING) generalIdentifier
   ;

// cancel statement

cancelStatement
   : CANCEL cancelCall+
   ;

cancelCall
   : libraryName (BYTITLE | BYFUNCTION) | literal | generalIdentifier
   ;

// close statement

closeStatement
   : CLOSE closeFile (COMMACHAR? closeFile)*?
   ;

closeFile
   : fileName (closeReelUnitStatement | closeRelativeStatement | closePortFileIOStatement)?
   ;

closeReelUnitStatement
   : (REEL | UNIT) (FOR? REMOVAL)? (WITH? (NO REWIND | LOCK))?
   ;

closeRelativeStatement
   : WITH? (NO REWIND | LOCK)
   ;

closePortFileIOStatement
   : (WITH? NO WAIT | WITH WAIT) (USING closePortFileIOUsing+)?
   ;

closePortFileIOUsing
   : closePortFileIOUsingCloseDisposition | closePortFileIOUsingAssociatedData | closePortFileIOUsingAssociatedDataLength
   ;

closePortFileIOUsingCloseDisposition
   : CLOSE_DISPOSITION OF? (ABORT | ORDERLY)
   ;

closePortFileIOUsingAssociatedData
   : ASSOCIATED_DATA (integerLiteral | generalIdentifier)
   ;

closePortFileIOUsingAssociatedDataLength
   : ASSOCIATED_DATA_LENGTH OF? (integerLiteral | generalIdentifier)
   ;

// compute statement

computeStatement
   : COMPUTE computeStore+ (EQUALCHAR | EQUAL) COMMACHAR? arithmeticExpression COMMACHAR? onSizeErrorPhrase?
   COMMACHAR? notOnSizeErrorPhrase? END_COMPUTE?
   ;

computeStore
   : generalIdentifier ROUNDED?
   ;

// continue statement

continueStatement
   : CONTINUE
   ;

// delete statement

deleteStatement
   : DELETE deleteFilenameClause
   ;

deleteFilenameClause
   : fileName RECORD? invalidKeyPhrase? notInvalidKeyPhrase? END_DELETE?
   ;

// disable statement

disableStatement
   : DISABLE (INPUT TERMINAL? | I_O TERMINAL | OUTPUT) cdName WITH? KEY (literal | generalIdentifier)
   ;

// display statement

displayStatement
   : DISPLAY displayOperand (COMMACHAR? displayOperand)*? displayAt? displayUpon? displayWith?
   ;

displayOperand
   : literal | generalIdentifier
   ;

displayAt
   : AT (literal | generalIdentifier)
   ;

displayUpon
   : UPON cobolWord
   ;

displayWith
   : WITH? NO ADVANCING
   ;

// divide statement

divideStatement
   : DIVIDE (literal | generalIdentifier) (divideIntoStatement | divideIntoGivingStatement | divideByGivingStatement) divideRemainder? onSizeErrorPhrase? notOnSizeErrorPhrase? END_DIVIDE?
   ;

divideIntoStatement
   : INTO divideInto+
   ;

divideIntoGivingStatement
   : INTO (literal | generalIdentifier) divideGivingPhrase?
   ;

divideByGivingStatement
   : BY (literal | generalIdentifier) divideGivingPhrase?
   ;

divideGivingPhrase
   : GIVING divideGiving+
   ;

divideInto
   : generalIdentifier ROUNDED?
   ;

divideGiving
   : generalIdentifier ROUNDED?
   ;

divideRemainder
   : REMAINDER generalIdentifier
   ;

// enable statement

enableStatement
   : ENABLE (INPUT TERMINAL? | I_O TERMINAL | OUTPUT) cdName WITH? KEY (literal | generalIdentifier)
   ;

// entry statement

entryStatement
   : ENTRY literal (USING generalIdentifier (COMMACHAR? generalIdentifier)*?)?
   ;

// evaluate statement

evaluateStatement
   : EVALUATE evaluateSelect evaluateAlsoSelect* evaluateWhenPhrase+ evaluateWhenOther? END_EVALUATE?
   ;

evaluateSelect
   : arithmeticExpression | condition
   ;

evaluateAlsoSelect
   : ALSO evaluateSelect
   ;

evaluateWhenPhrase
   : evaluateWhen+ (COMMACHAR? conditionalStatementCall)*
   ;

evaluateWhen
   : WHEN evaluateCondition evaluateAlsoCondition*
   ;

evaluateCondition
   : ANY | NOT? evaluateValue evaluateThrough? | condition | booleanLiteral
   ;

evaluateThrough
   : (THROUGH | THRU) evaluateValue
   ;

evaluateAlsoCondition
   : ALSO evaluateCondition
   ;

evaluateWhenOther
   : WHEN OTHER (COMMACHAR? conditionalStatementCall)*
   ;

evaluateValue
   : arithmeticExpression
   ;

// exec cics statement
execCicsStatement
   : EXEC CICS cicsRules END_EXEC
   ;

cicsRules
   : ~END_EXEC*?
   ;

// exec sql statement for specific divisions or sections of COBOL program
execSqlStatementInProcedureDivision
   : execSqlStatement
   ;

execSqlStatementInWorkingStorage
   : execSqlStatement DOT_FS?
   ;

execSqlStatementInWorkingStorageAndLinkageSection
   : execSqlStatement DOT_FS?
   ;

execSqlStatementInDataDivision
   : execSqlStatement DOT_FS?
   ;

execSqlStatement
   : EXEC SQL sqlCode END_EXEC
   ;

sqlCode
   : ~END_EXEC*?
   ;

// exec sql ims statement

execSqlImsStatement
   : EXEC SQLIMS ~END_EXEC*? END_EXEC DOT_FS?
   ;

// exhibit statement

exhibitStatement
   : EXHIBIT NAMED? CHANGED? exhibitOperand+?
   ;

exhibitOperand
   : literal | generalIdentifier
   ;

// exit statement

exitStatement
   : EXIT (PROGRAM | SECTION | PARAGRAPH)?
   ;

// generate statement

generateStatement
   : GENERATE reportName
   ;

// goback statement

gobackStatement
   : GOBACK
   ;

// goto statement

goToStatement
   : GO TO? procedureName+ (DEPENDING ON? generalIdentifier)?
   ;

// if statement

dialectIfStatment
   : DIALECT_IF dialectNodeFiller* ifThen ifElse? END_IF?
   ;

ifStatement
   : IF (condition | dialectNodeFiller*) ifThen ifElse? END_IF?
   ;

ifThen
   : THEN? (NEXT SENTENCE | conditionalStatementCall+)
   ;

ifElse
   : ELSE (NEXT SENTENCE | conditionalStatementCall+)
   ;

// initialize statement

initializeStatement
   : INITIALIZE generalIdentifier (COMMACHAR? generalIdentifier)*? initializeReplacingPhrase?
   ;

initializeReplacingPhrase
   : REPLACING initializeReplacingBy+
   ;

initializeReplacingBy
   : (ALPHABETIC | ALPHANUMERIC | ALPHANUMERIC_EDITED | NATIONAL | NATIONAL_EDITED | NUMERIC | NUMERIC_EDITED | DBCS | EGCS) DATA? BY (literal | generalIdentifier)
   ;

// initiate statement

initiateStatement
   : INITIATE reportName+
   ;

// inspect statement

inspectStatement
   : INSPECT generalIdentifier (inspectTallyingPhrase | inspectReplacingPhrase | inspectTallyingReplacingPhrase | inspectConvertingPhrase)
   ;

inspectTallyingPhrase
   : TALLYING inspectFor+
   ;

inspectReplacingPhrase
   : REPLACING (inspectReplacingCharacters | inspectReplacingAllLeadings)+
   ;

inspectTallyingReplacingPhrase
   : TALLYING inspectFor+ inspectReplacingPhrase+
   ;

inspectConvertingPhrase
   : CONVERTING (literal | generalIdentifier) inspectTo inspectBeforeAfter*
   ;

inspectFor
   : generalIdentifier FOR (inspectCharacters | inspectAllLeadings)+
   ;

inspectCharacters
   : CHARACTERS inspectBeforeAfter*
   ;

inspectReplacingCharacters
   : CHARACTERS inspectBy inspectBeforeAfter*
   ;

inspectAllLeadings
   : (ALL | LEADING) inspectAllLeading+
   ;

inspectReplacingAllLeadings
   : (ALL | LEADING | FIRST) inspectReplacingAllLeading+
   ;

inspectAllLeading
   : (literal | generalIdentifier) inspectBeforeAfter*
   ;

inspectReplacingAllLeading
   : (literal | generalIdentifier) inspectBy inspectBeforeAfter*
   ;

inspectBy
   : BY (literal | generalIdentifier)
   ;

inspectTo
   : TO (literal | generalIdentifier)
   ;

inspectBeforeAfter
   : (BEFORE | AFTER) INITIAL? (literal | generalIdentifier)
   ;

// merge statement

mergeStatement
   : MERGE fileName mergeOnKeyClause+ mergeCollatingSequencePhrase? mergeUsing* mergeOutputProcedurePhrase? mergeGivingPhrase*
   ;

mergeOnKeyClause
   : ON? (ASCENDING | DESCENDING) KEY? qualifiedDataName+?
   ;

mergeCollatingSequencePhrase
   : COLLATING? SEQUENCE IS? alphabetName+? mergeCollatingAlphanumeric? mergeCollatingNational?
   ;

mergeCollatingAlphanumeric
   : FOR? ALPHANUMERIC IS alphabetName
   ;

mergeCollatingNational
   : FOR? NATIONAL IS? alphabetName
   ;

mergeUsing
   : USING fileName+
   ;

mergeOutputProcedurePhrase
   : OUTPUT PROCEDURE IS? procedureName mergeOutputThrough?
   ;

mergeOutputThrough
   : (THROUGH | THRU) procedureName
   ;

mergeGivingPhrase
   : GIVING mergeGiving+?
   ;

mergeGiving
   : fileName (LOCK | SAVE | NO REWIND | CRUNCH | RELEASE | WITH REMOVE CRUNCH)?
   ;

// move statement

moveStatement
   : MOVE ALL? (moveToStatement | moveCorrespondingToStatement)
   ;

moveToStatement
   : moveToSendingArea TO generalIdentifier (COMMACHAR? generalIdentifier)*?
   ;

moveToSendingArea
   : literal | generalIdentifier
   ;

moveCorrespondingToStatement
   : (CORRESPONDING | CORR) moveCorrespondingToSendingArea TO generalIdentifier (COMMACHAR? generalIdentifier)*?
   ;

moveCorrespondingToSendingArea
   : generalIdentifier
   ;

// multiply statement

multiplyStatement
   : MULTIPLY (literal | generalIdentifier) BY (multiplyRegular | multiplyGiving) onSizeErrorPhrase? notOnSizeErrorPhrase? END_MULTIPLY?
   ;

multiplyRegular
   : multiplyRegularOperand+?
   ;

multiplyRegularOperand
   : generalIdentifier ROUNDED?
   ;

multiplyGiving
   : multiplyGivingOperand GIVING multiplyGivingResult+?
   ;

multiplyGivingOperand
   : literal | generalIdentifier
   ;

multiplyGivingResult
   : generalIdentifier ROUNDED?
   ;

// open statement

openStatement
   : OPEN (openInputStatement | openOutputStatement | openIOStatement | openExtendStatement)+
   ;

openInputStatement
   : INPUT openInput (COMMACHAR? openInput)*?
   ;

openInput
   : fileName (REVERSED | WITH? NO REWIND)?
   ;

openOutputStatement
   : OUTPUT openOutput (COMMACHAR? openOutput)*?
   ;

openOutput
   : fileName (WITH? NO REWIND)?
   ;

openIOStatement
   : I_O fileName (COMMACHAR? fileName)*?
   ;

openExtendStatement
   : EXTEND fileName (COMMACHAR? fileName)*?
   ;

// perform statement

performStatement
   : PERFORM (performProcedureStatement | performInlineStatement)
   ;

performInlineStatement
   : performType? conditionalStatementCall*? (EXIT PERFORM CYCLE?)? END_PERFORM
   ;

performProcedureStatement
   : procedureName ((THROUGH | THRU) procedureName)? performType?
   ;

performType
   : performTimes | performUntil | performVarying
   ;

performTimes
   : (integerLiteral | generalIdentifier) TIMES
   ;

performUntil
   : performTestClause? UNTIL condition
   ;

performVarying
   : performTestClause performVaryingClause | performVaryingClause performTestClause?
   ;

performVaryingClause
   : VARYING performVaryingPhrase performAfter*
   ;

performVaryingPhrase
   : (literal | generalIdentifier) performFrom performBy performUntil
   ;

performAfter
   : AFTER performVaryingPhrase
   ;

performFrom
   : FROM (literal | generalIdentifier)
   ;

performBy
   : BY (literal | generalIdentifier)
   ;

performTestClause
   : WITH? TEST (BEFORE | AFTER)
   ;

// purge statement

purgeStatement
   : PURGE cdName+
   ;

// read statement

readStatement
   : READ readFilenameClause
   ;

readFilenameClause
   : fileName NEXT? RECORD? readInto? readWith? readKey? invalidKeyPhrase? notInvalidKeyPhrase? atEndPhrase? notAtEndPhrase? END_READ?
   ;

readInto
   : INTO generalIdentifier
   ;

readWith
   : WITH? ((KEPT | NO) LOCK | WAIT)
   ;

readKey
   : KEY IS? qualifiedDataName
   ;

// READY/RESET TRACE statement
readyResetTraceStatement
    : (READY | RESET) TRACE
    ;

// receive statement

receiveStatement
   : RECEIVE (receiveFromStatement | receiveIntoStatement) onExceptionClause? notOnExceptionClause? END_RECEIVE?
   ;

receiveFromStatement
   : dataName FROM receiveFrom (receiveBefore | receiveWith | receiveThread | receiveSize | receiveStatus)*
   ;

receiveFrom
   : THREAD dataName | LAST THREAD | ANY THREAD
   ;

receiveIntoStatement
   : cdName (MESSAGE | SEGMENT) INTO? generalIdentifier receiveNoData? receiveWithData?
   ;

receiveNoData
   : NO DATA conditionalStatementCall (COMMACHAR? conditionalStatementCall)*?
   ;

receiveWithData
   : WITH DATA conditionalStatementCall (COMMACHAR? conditionalStatementCall)*?
   ;

receiveBefore
   : BEFORE TIME? (numericLiteral | generalIdentifier)
   ;

receiveWith
   : WITH? NO WAIT
   ;

receiveThread
   : THREAD IN? dataName
   ;

receiveSize
   : SIZE IN? (numericLiteral | generalIdentifier)
   ;

receiveStatus
   : STATUS IN? (generalIdentifier)
   ;

// release statement

releaseStatement
   : RELEASE recordName (FROM qualifiedDataName)?
   ;

// return statement

returnStatement
   : RETURN cobolReturn
   ;

cobolReturn
   : fileName RECORD? returnInto? atEndPhrase notAtEndPhrase? END_RETURN?
   ;

returnInto
   : INTO qualifiedDataName
   ;

// rewrite statement

rewriteStatement
   : REWRITE recordName rewriteFrom? invalidKeyPhrase? notInvalidKeyPhrase? END_REWRITE?
   ;

rewriteFrom
   : FROM generalIdentifier
   ;

// search statement

searchStatement
   : SEARCH ALL? qualifiedDataName searchVarying? atEndPhrase? searchWhen+ END_SEARCH?
   ;

searchVarying
   : VARYING qualifiedDataName
   ;

searchWhen
   : WHEN condition (NEXT SENTENCE | conditionalStatementCall (COMMACHAR? conditionalStatementCall)*?)
   ;

// send statement

sendStatement
   : SEND (sendStatementSync | sendStatementAsync) onExceptionClause? notOnExceptionClause?
   ;

sendStatementSync
   : (literal | generalIdentifier) sendFromPhrase? sendWithPhrase? sendReplacingPhrase? sendAdvancingPhrase?
   ;

sendStatementAsync
   : TO (TOP | BOTTOM) generalIdentifier
   ;

sendFromPhrase
   : FROM generalIdentifier
   ;

sendWithPhrase
   : WITH (EGI | EMI | ESI | generalIdentifier)
   ;

sendReplacingPhrase
   : REPLACING LINE?
   ;

sendAdvancingPhrase
   : (BEFORE | AFTER) ADVANCING? (sendAdvancingPage | sendAdvancingLines | sendAdvancingMnemonic)
   ;

sendAdvancingPage
   : PAGE
   ;

sendAdvancingLines
   : (literal | generalIdentifier) (LINE | LINES)?
   ;

sendAdvancingMnemonic
   : mnemonicName
   ;

// set statement

setStatement
   : SET (setToOnOff+ | setToBoolean | setToStatement | setUpDownByStatement | setToEntry )
   ;

setToStatement
   : receivingField+ TO sendingField
   ;

setUpDownByStatement
   : receivingField+ (UP BY | DOWN BY) sendingField
   ;

setToBoolean
   : receivingField+ TO booleanLiteral
   ;

setToOnOff
   : receivingField+ TO (ON | OFF)
   ;

setToEntry
   : receivingField+ TO ENTRY sendingField
   ;

receivingField
   : generalIdentifier
   ;

sendingField
   : literal | generalIdentifier
   ;

// service statement

serviceLabelStatement
   : SERVICE LABEL
   ;

serviceReloadStatement
   : SERVICE RELOAD generalIdentifier
   ;

// sort statement

sortStatement
   : SORT fileName sortOnKeyClause+ sortDuplicatesPhrase? sortCollatingSequencePhrase? sortInputProcedurePhrase? sortUsing* sortOutputProcedurePhrase? sortGivingPhrase*
   ;

sortOnKeyClause
   : ON? (ASCENDING | DESCENDING) KEY? qualifiedDataName+?
   ;

sortDuplicatesPhrase
   : WITH? DUPLICATES IN? ORDER?
   ;

sortCollatingSequencePhrase
   : COLLATING? SEQUENCE IS? alphabetName+ sortCollatingAlphanumeric? sortCollatingNational?
   ;

sortCollatingAlphanumeric
   : FOR? ALPHANUMERIC IS alphabetName
   ;

sortCollatingNational
   : FOR? NATIONAL IS? alphabetName
   ;

sortInputProcedurePhrase
   : INPUT PROCEDURE IS? procedureName sortInputThrough?
   ;

sortInputThrough
   : (THROUGH | THRU) procedureName
   ;

sortUsing
   : USING fileName+?
   ;

sortOutputProcedurePhrase
   : OUTPUT PROCEDURE IS? procedureName sortOutputThrough?
   ;

sortOutputThrough
   : (THROUGH | THRU) procedureName
   ;

sortGivingPhrase
   : GIVING sortGiving+?
   ;

sortGiving
   : fileName (LOCK | SAVE | NO REWIND | CRUNCH | RELEASE | WITH REMOVE CRUNCH)?
   ;

// startPosition statement

startStatement
   : START fileName startKey? invalidKeyPhrase? notInvalidKeyPhrase? END_START?
   ;

startKey
   : KEY IS? (EQUAL TO? | EQUALCHAR | GREATER THAN? | MORETHANCHAR | NOT LESS THAN? | NOT LESSTHANCHAR | GREATER THAN? OR EQUAL TO? | MORETHANOREQUAL) qualifiedDataName
   ;

// stopPosition statement

stopStatement
   : STOP (RUN | literal | stopStatementGiving)
   ;

stopStatementGiving
   : RUN (GIVING | RETURNING) (integerLiteral | generalIdentifier)
   ;

// string statement

stringStatement
   : STRING stringSendingPhrase+ stringIntoPhrase stringWithPointerPhrase? onOverflowPhrase? notOnOverflowPhrase? END_STRING?
   ;

stringSendingPhrase
   : stringSending (COMMACHAR? stringSending)*? (stringDelimitedByPhrase | stringForPhrase)
   ;

stringSending
   : literal | generalIdentifier
   ;

stringDelimitedByPhrase
   : DELIMITED BY? (SIZE | literal | generalIdentifier)
   ;

stringForPhrase
   : FOR (literal | generalIdentifier)
   ;

stringIntoPhrase
   : INTO generalIdentifier
   ;

stringWithPointerPhrase
   : WITH? POINTER qualifiedDataName
   ;

// subtract statement

subtractStatement
   : SUBTRACT (subtractFromStatement | subtractFromGivingStatement | subtractCorrespondingStatement) onSizeErrorPhrase? notOnSizeErrorPhrase? END_SUBTRACT?
   ;

subtractFromStatement
   : subtractSubtrahend (COMMACHAR? subtractSubtrahend)* FROM subtractMinuend (COMMACHAR? subtractMinuend)*?
   ;

subtractFromGivingStatement
   : subtractSubtrahend (COMMACHAR? subtractSubtrahend)* FROM subtractMinuendGiving GIVING subtractGiving (COMMACHAR? subtractGiving)*?
   ;

subtractCorrespondingStatement
   : (CORRESPONDING | CORR) qualifiedDataName FROM subtractMinuendCorresponding
   ;

subtractSubtrahend
   : literal | generalIdentifier
   ;

subtractMinuend
   : generalIdentifier ROUNDED?
   ;

subtractMinuendGiving
   : literal | generalIdentifier
   ;

subtractGiving
   : generalIdentifier ROUNDED?
   ;

subtractMinuendCorresponding
   : qualifiedDataName ROUNDED?
   ;

// terminate statement

terminateStatement
   : TERMINATE reportName
   ;

// unstring statement

unstringStatement
   : UNSTRING unstringSendingPhrase COMMACHAR? unstringIntoPhrase COMMACHAR? unstringWithPointerPhrase?
   COMMACHAR? unstringTallyingPhrase? COMMACHAR? onOverflowPhrase? COMMACHAR? notOnOverflowPhrase? END_UNSTRING?
   ;

unstringSendingPhrase
   : generalIdentifier (unstringDelimitedByPhrase unstringOrAllPhrase*)?
   ;

unstringDelimitedByPhrase
   : DELIMITED BY? ALL? (literal | generalIdentifier)
   ;

unstringOrAllPhrase
   : OR ALL? (literal | generalIdentifier)
   ;

unstringIntoPhrase
   : INTO unstringInto (COMMACHAR? unstringInto)*?
   ;

unstringInto
   : generalIdentifier unstringDelimiterIn? unstringCountIn?
   ;

unstringDelimiterIn
   : DELIMITER IN? generalIdentifier
   ;

unstringCountIn
   : COUNT IN? generalIdentifier
   ;

unstringWithPointerPhrase
   : WITH? POINTER qualifiedDataName
   ;

unstringTallyingPhrase
   : TALLYING IN? qualifiedDataName
   ;

// use statement

useStatement
   : USE (useAfterClause | useDebugClause)
   ;

useAfterClause
   : GLOBAL? AFTER STANDARD? (EXCEPTION | ERROR) PROCEDURE ON? useAfterOn
   ;

useAfterOn
   : INPUT | OUTPUT | I_O | EXTEND | fileName (COMMACHAR? fileName)*?
   ;

useDebugClause
   : FOR? DEBUGGING ON? useDebugOn (COMMACHAR? useDebugOn)*
   ;

useDebugOn
   : ALL PROCEDURES | ALL REFERENCES? OF? generalIdentifier | procedureName
   ;

// write statement

writeStatement
  : WRITE writeStatementClause
  ;

writeStatementClause
   : recordName writeFromPhrase? writeAdvancingPhrase? writeAtEndOfPagePhrase? writeNotAtEndOfPagePhrase? invalidKeyPhrase? notInvalidKeyPhrase? END_WRITE?
   ;

writeFromPhrase
   : FROM (literal | generalIdentifier)
   ;

writeAdvancingPhrase
   : (BEFORE | AFTER) ADVANCING? (writeAdvancingPage | writeAdvancingLines)
   ;

writeAdvancingPage
   : PAGE
   ;

writeAdvancingLines
   : (literal | generalIdentifier) (LINE | LINES)?
   ;

writeAtEndOfPagePhrase
   : AT? (END_OF_PAGE | EOP) conditionalStatementCall (COMMACHAR? conditionalStatementCall)*
   ;

writeNotAtEndOfPagePhrase
   : NOT AT? (END_OF_PAGE | EOP) conditionalStatementCall (COMMACHAR? conditionalStatementCall)*
   ;

// xml statement

xmlStatement
   : XML PARSE generalIdentifier xmlEncoding? xmlNational? xmlValidating? xmlProcessinProcedure xmlThru? onExceptionClause? notOnExceptionClause? END_XML?
   ;

xmlEncoding
   : WITH? ENCODING  integerLiteral
   ;

xmlNational
   : RETURNING NATIONAL
   ;

xmlValidating
   : VALIDATING WITH? (generalIdentifier | FILE literal)
   ;

xmlThru
   : (THROUGH | THRU) procedureName
   ;

xmlProcessinProcedure
   : PROCESSING PROCEDURE IS? procedureName
   ;

// statement phrases ----------------------------------

atEndPhrase
   : AT? END (COMMACHAR? conditionalStatementCall)+
   ;

notAtEndPhrase
   : NOT AT? END (COMMACHAR? conditionalStatementCall)+
   ;

invalidKeyPhrase
   : INVALID KEY? (COMMACHAR? conditionalStatementCall)+
   ;

notInvalidKeyPhrase
   : NOT INVALID KEY? (COMMACHAR? conditionalStatementCall)+
   ;

onOverflowPhrase
   : ON? OVERFLOW (COMMACHAR? conditionalStatementCall)+
   ;

notOnOverflowPhrase
   : NOT ON? OVERFLOW (COMMACHAR? conditionalStatementCall)+
   ;

onSizeErrorPhrase
   : ON? SIZE ERROR (COMMACHAR? conditionalStatementCall)+
   ;

notOnSizeErrorPhrase
   : NOT ON? SIZE ERROR (COMMACHAR? conditionalStatementCall)+
   ;

// statement clauses ----------------------------------

onExceptionClause
   : ON? EXCEPTION (COMMACHAR? conditionalStatementCall)+
   ;

notOnExceptionClause
   : NOT ON? EXCEPTION (COMMACHAR? conditionalStatementCall)+
   ;

// condition ----------------------------------

condition
   : NOT? (simpleCondition | nestedCondition | dialectNodeFiller+)
    ((AND | OR) NOT? (simpleCondition | nestedCondition | relationCombinedComparison | dialectNodeFiller+))*
   ;

simpleCondition
   : arithmeticExpression (relationCombinedComparison | fixedComparison)?
   ;

nestedCondition
   : LPARENCHAR condition RPARENCHAR
   ;

relationCombinedComparison
   : relationalOperator (arithmeticExpression
   | LPARENCHAR arithmeticExpression ((AND | OR) arithmeticExpression)+ RPARENCHAR)
   ;

fixedComparison
   : IS? NOT? (NUMERIC | ALPHABETIC | ALPHABETIC_LOWER | ALPHABETIC_UPPER | DBCS | KANJI | POSITIVE | NEGATIVE | ZERO
   | className)
   ;

relationalOperator
   : (IS | ARE)? (NOT? (GREATER THAN? | MORETHANCHAR | LESS THAN? | LESSTHANCHAR | EQUAL TO? | EQUALCHAR)
   | NOTEQUALCHAR | GREATER THAN? OR EQUAL TO? | MORETHANOREQUAL | LESS THAN? OR EQUAL TO? | LESSTHANOREQUAL)
   ;

// identifier ----------------------------------

generalIdentifier
   : specialRegister | qualifiedDataName | functionCall
   ;

functionCall
   : FUNCTION functionName (LPARENCHAR argument (COMMACHAR? argument)* RPARENCHAR)* referenceModifier?
   ;

referenceModifier
   : LPARENCHAR characterPosition COLONCHAR length? RPARENCHAR
   ;

characterPosition
   : arithmeticExpression
   ;

length
   : arithmeticExpression
   ;

argument
   : arithmeticExpression
   ;

// qualified data name ----------------------------------

qualifiedDataName
   : variableUsageName tableCall? referenceModifier? inData*
   ;

tableCall
   : LPARENCHAR (ALL | arithmeticExpression) (COMMACHAR? (ALL | arithmeticExpression))* RPARENCHAR
   ;

specialRegister
   : ADDRESS OF generalIdentifier
   | LENGTH OF? generalIdentifier | LINAGE_COUNTER
   ;

// in ----------------------------------

inData
   : (IN | OF) variableUsageName tableCall? referenceModifier?
   ;

inSection
   : (IN | OF) sectionName
   ;

// names ----------------------------------

alphabetName
   : cobolWord
   ;

assignmentName
   : systemName
   ;

cdName
   : cobolWord
   ;

className
   : cobolWord
   ;

computerName
   : systemName
   ;

dataName
   : cobolWord
   ;

dataSetName
   : cobolWord | FILENAME (DOT_FS cobolWord)*
   ;

variableUsageName
   : cobolWord
   ;

environmentName
   : systemName
   ;

fileName
   : cobolWord
   ;

functionName
   : INTEGER | LENGTH | RANDOM | SUM | MAX | WHEN_COMPILED | cobolWord
   ;

indexName
   : cobolWord
   ;

libraryName
   : cobolWord
   ;

mnemonicName
   : cobolWord
   ;

paragraphName
   : cobolWord | integerLiteral
   ;

paragraphDefinitionName
   : cobolWord | integerLiteral
   ;

procedureName
   : paragraphName inSection?
   ;

programName
   : literal | cobolWord | OR | AND
   ;

recordName
   : qualifiedDataName
   ;

reportName
   : qualifiedDataName
   ;

sectionName
   : cobolWord | integerLiteral
   ;

systemName
   : cobolWord
   ;

symbolicCharacter
   : cobolWord
   ;

figurativeConstant
   : ALL literal | HIGH_VALUE | HIGH_VALUES | LOW_VALUE | LOW_VALUES | NULL | NULLS | QUOTE | QUOTES | SPACE | SPACES | ZEROS | ZEROES
   ;

booleanLiteral
   : TRUE | FALSE
   ;

numericLiteral
   : NUMERICLITERAL | ZERO | integerLiteral
   ;

integerLiteral
   : INTEGERLITERAL | LEVEL_NUMBER | LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88
   ;

cicsDfhRespLiteral
   : DFHRESP LPARENCHAR (cics_conditions | cobolWord | literal) RPARENCHAR
   ;

cicsDfhValueLiteral
   : DFHVALUE LPARENCHAR (cics_conditions | cobolWord | literal) RPARENCHAR
   ;

cics_conditions: EOC | EODS | INVMPSZ | INVPARTN | INVREQ | MAPFAIL | PARTNFAIL | RDATT | UNEXPIN;

literal
   : NONNUMERICLITERAL | figurativeConstant | numericLiteral | booleanLiteral | charString | cicsDfhRespLiteral | cicsDfhValueLiteral
   ;

charString
   : FINALCHARSTRING
   ;

// arithmetic expression ----------------------------------

arithmeticExpression
   : multDivs plusMinus*
   ;

plusMinus
   : (PLUSCHAR | MINUSCHAR) multDivs
   ;

multDivs
   : powers multDiv*
   ;

multDiv
   : (ASTERISKCHAR | SLASHCHAR) powers
   ;

powers
   : (PLUSCHAR | MINUSCHAR)? basis power*
   ;

power
   : DOUBLEASTERISKCHAR basis
   ;

basis
   : generalIdentifier | literal | LPARENCHAR arithmeticExpression RPARENCHAR
   ;

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

dialectNodeFiller
    : ZERO_WIDTH_SPACE+
    ;
