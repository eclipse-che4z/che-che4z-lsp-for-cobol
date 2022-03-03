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
   : (PROCESS | CBL) (COMMACHAR? compilerOption)+
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
   | (COPYLOC | CPLC) LPARENCHAR ((SYSLIB | dataName) COMMACHAR)? (DSN | PATH) LPARENCHAR (literal | dataSetName) RPARENCHAR RPARENCHAR
   | NOCOPYLOC | NOCPLC
   | (COPYRIGHT | CPYR) LPARENCHAR literal RPARENCHAR | NOCOPYRIGHT | NOCPYR
   | (CURRENCY | CURR) LPARENCHAR CURRENCY_SYMBOL RPARENCHAR | NOCURRENCY | NOCURR
   | DATA LPARENCHAR integerLiteral RPARENCHAR
   | DBCS | NODBCS
   | DECK | D_CHAR | NODECK | NOD
   | (DEFINE | DEF) LPARENCHAR dataName ((COMMACHAR | EQUALCHAR) dataName)? RPARENCHAR | NODEFINE | NODEF
   | DIAGTRUNC | DTR | NODIAGTRUNC | NODTR
   | (DISPSIGN | DS) LPARENCHAR (COMPAT | SEP | C_CHAR | S_CHAR) RPARENCHAR
   | DLL | NODLL
   | DUMP | DU | NODUMP | NODU
   | DYNAM | DYN | NODYNAM | NODYN
   | (EXIT | EX) LPARENCHAR (
        ((INEXIT | INX | LIBEXIT | LIBX | PRTEXIT | PRTX | ADEXIT | ADX | MSGEXIT | MSGX)
            LPARENCHAR dataName (COMMACHAR dataName)? RPARENCHAR)
        | (NOINEXIT | NOINX | NOLIBEXIT | NOLIBX | NOPRTEXIT | NOPRTX | NOADEXIT | NOADX | NOMSGEXIT | NOMSGX)
      )* RPARENCHAR
   | NOEXIT | NOEX
   | EXPORTALL | EXP | NOEXPORTALL | NOEXP
   | FASTSRT | FSRT | NOFASTSRT | NOFSRT
   | (FLAG | F_CHAR) LPARENCHAR (E_CHAR | I_CHAR | S_CHAR | U_CHAR | W_CHAR) (COMMACHAR (E_CHAR | I_CHAR | S_CHAR | U_CHAR | W_CHAR))? RPARENCHAR
   | NOFLAG | NOF
   | FLAGSTD LPARENCHAR (M_CHAR | I_CHAR | H_CHAR) (D_CHAR | N_CHAR | S_CHAR | DN | DS | ND | NS | SD | SN)? (COMMACHAR O_CHAR)? RPARENCHAR
   | NOFLAGSTD
   | HGPR LPARENCHAR (PRESERVE | NOPRESERVE) RPARENCHAR
   | (INITCHECK | IC) (LPARENCHAR (LAX | STRICT)? RPARENCHAR)? | NOINITCHECK | NOIC
   | INITIAL | NOINITIAL
   | INLINE | INL | NOINLINE | NOINL
   | INTDATE LPARENCHAR (ANSI | LILIAN) RPARENCHAR
   | (INVDATA | INVD) (LPARENCHAR invdataSuboptions (COMMACHAR invdataSuboptions)* RPARENCHAR)? | NOINVDATA | NOINVD
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
   | (NUMCHECK | NC) (LPARENCHAR numcheckSuboptions (COMMACHAR numcheckSuboptions)* RPARENCHAR)? | NONUMCHECK | NONC
   | NUMPROC LPARENCHAR (NOPFD | PFD) RPARENCHAR
   | OBJECT | OBJ | NOOBJECT | NOOBJ
   | OFFSET | OFF | NOOFFSET | NOOFF
   | OPTFILE
   | (OPTIMIZE | OPT) (LPARENCHAR integerLiteral RPARENCHAR)
   | (OUTDD | OUT) LPARENCHAR dataSetName RPARENCHAR
   | (PARMCHECK | PC) (LPARENCHAR (MSG | ABD) (COMMACHAR integerLiteral)? RPARENCHAR)? | NOPARMCHECK | NOPC
   | (PGMNAME | PGMN) LPARENCHAR (CO | COMPAT | LM | LONGMIXED | LONGUPPER | LU | M_CHAR | MIXED | U_CHAR | UPPER) RPARENCHAR
   | (QUALIFY | QUA) LPARENCHAR (COMPAT | C_CHAR | EXTEND | E_CHAR) RPARENCHAR
   | RENT | NORENT
   | RMODE LPARENCHAR (ANY | AUTO | integerLiteral) RPARENCHAR
   | RULES LPARENCHAR rulesSuboptions (COMMACHAR rulesSuboptions)* RPARENCHAR | NORULES
   | SEQUENCE | SEQ | NOSEQUENCE | NOSEQ
   | (SERVICE | SERV) LPARENCHAR literal RPARENCHAR | NOSERVICE | NOSERV
   | (SOURCE | S_CHAR) (LPARENCHAR (HEX | DEC) RPARENCHAR)? | NOSOURCE | NOS
   | SPACE LPARENCHAR integerLiteral RPARENCHAR
   | SQL (LPARENCHAR literal RPARENCHAR)? | NOSQL
   | SQLCCSID | SQLC | NOSQLCCSID | NOSQLC
   | SQLIMS (LPARENCHAR literal RPARENCHAR)? | NOSQLIMS
   | (SSRANGE | SSR) LPARENCHAR (ssrangeSuboptions (COMMACHAR ssrangeSuboptions)*)? RPARENCHAR | (NOSSRANGE | NOSSR)
   | STGOPT | SO | NOSTGOPT | NOSO
   | SUPPRESS | SUPP | NOSUPPRESS | NOSUPP
   | TERMINAL | TERM | NOTERMINAL | NOTERM
   | (TEST | NOTEST) (LPARENCHAR (testSuboptions (COMMACHAR testSuboptions)*)? RPARENCHAR)?
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

invdataSuboptions
   : CLEANSIGN | CS | NOCLEANSIGN | NOCS | FORCENUMCMP | FNC | NOFORCENUMCMP | NOFNC
   ;

numcheckSuboptions
   : ZON (LPARENCHAR numcheckZonSuboptions (COMMACHAR numcheckZonSuboptions)* RPARENCHAR)? | NOZON
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
   | DATA | END | ENVIRONMENT | ID | PROCEDURE | PROCESS | PROGRAM_ID | SECURITY | REMARKS)*?
   ;

// --- environment division --------------------------------------------------------------------

environmentDivision
   : ENVIRONMENT DIVISION DOT_FS environmentDivisionBody*
   ;

environmentDivisionBody
   : configurationSection | inputOutputSection | idmsControlSection
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
   : ASSIGN TO? (DISK | DISPLAY | KEYBOARD | PORT | PRINTER | READER | REMOTE | TAPE | VIRTUAL | (DYNAMIC | EXTERNAL | VARYING)? assignmentName | literal)
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

// -- idms control section ----------------------------------

idmsControlSection
   : IDMS_CONTROL SECTION DOT_FS idmsControlSectionParagraph
   ;

// - idms control section paragraph ----------------------------------
idmsControlSectionParagraph
   : protocolParagraph (protocolParagraphs COMMACHAR?)*
   ;

protocolParagraphs
   : ssNamesLengthParagraph | idmsRecordLocationParagraph
   ;

protocolParagraph
   : PROTOCOL DOT_FS? protocolEntry? 
   ;

protocolEntry
   : modeClause DEBUG? endClause?
   ;

modeClause
   : MODE IS? dataName
   ;

ssNamesLengthParagraph
   : SUBSCHEMA_NAMES LENGTH IS? ss_names_length endClause?
   ;

idmsRecordLocationParagraph
   : IDMS_RECORDS withinClause endClause?
   ;

withinClause
   : (withinEntry | MANUAL) levelsClause?
   ;

withinEntry
   : WITHIN (WORKING_STORAGE | LINKAGE) SECTION?
   ;

levelsClause
   : LEVELS? INCREMENTED BY? LEVEL_NUMBER
   ;

endClause
    : (DOT_FS | SEMICOLON_FS)
    ;

ss_names_length
    : {validateSubSchemaNameLength(_input.LT(1).getText());} LEVEL_NUMBER
    ;

// --- data division --------------------------------------------------------------------

dataDivision
   : DATA DIVISION DOT_FS dataDivisionSection*
   ;

dataDivisionSection
   : fileSection | workingStorageSection | linkageSection | localStorageSection | schemaSection | mapSection
   | execSqlStatementInDataDivision
   ;

// -- file section ----------------------------------

fileSection
   : FILE SECTION DOT_FS fileDescriptionEntry*
   ;

fileDescriptionEntry
   : fileDescriptionEntryClauses dataDescriptionEntry*
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
   : IS? VARYING IN? SIZE? (FROM? integerLiteral recordContainsTo? CHARACTERS?)? (DEPENDING ON? qualifiedDataName)?
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
   : DATA (RECORD IS? | RECORDS ARE?) dataName+
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
   : (PICTURE | PIC) IS? pictureString+
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
   : RENAMES dataName thruDataName?
   ;

thruDataName
   : (THROUGH | THRU) dataName
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

// -- schema section ----------------------------------

schemaSection
   : SCHEMA SECTION DOT_FS schemaDBEntry
   ;

schemaDBEntry
   : DB idms_subschema_name WITHIN idms_schema_name versionClause? DOT_FS
   ;

// -- map section ----------------------------------

mapSection
   : MAP SECTION DOT_FS maxFieldListClause? mapClause+
   ;

maxFieldListClause
   :  MAX FIELD LIST IS? integerLiteral DOT_FS?
   ;

mapClause
    : MAP idms_map_name_definition versionClause? (TYPE IS? (STANDARD | EXTENDED) PAGING?)? DOT_FS?
    ;

versionClause
    : VERSION integerLiteral
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
   : idmsStmtsMandTermOn (SEMICOLON_FS idmsOnClause? | DOT_FS) |
    ((idmsStmtsOptTermOn endClause? idmsOnClause? | statement | dafStatements)* endClause)
   ;

conditionalStatementCall
   : (statement | idmsStatements | dafStatements) SEMICOLON_FS?
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

idmsStatements
    : idmsStmtsOptTermOn endClause? idmsOnClause? | idmsStmtsMandTermOn (SEMICOLON_FS idmsOnClause? | DOT_FS)
    ;

idmsStmtsOptTermOn
    : abendCodeStatement | attachTaskCodeStatement | bindStatement | changePriorityStatement | checkTerminalStatement | commitStatement |
     connectStatement | dcStatement | dequeueStatement | disconnectStatement | endStatement | endpageStatement | enqueueStatement | eraseStatement | findStatement |
     finishStatement | freeStatement | getStatement | inquireMapStatement | keepStatement | loadStatement | mapStatement | modifyStatement | obtainStatement |
     postStatement | putStatement | readyStatement |rollbackStatement | snapStatement | startpageStatement | storeStatement | waitStatement
    ;

idmsStmtsMandTermOn
    : transferStatement
    ;

idmsOnClause
    : ON generalIdentifier
    ;

// DAF DaCo Statements

dafStatements
    : readTransactionStatement | writeTransactionStatement | writeReportStatement
    | openPacketStatement | getMetaInfoStatement | messageHandlingStatement
    | tableRowRetrievalStatement | tableRowUpdateStatement | tableDMLStatement
    | fileDMLStatement | stringDMLStatement
    ;

readTransactionStatement
    : READ TRANSACTION daf_task_name?
    ;

writeTransactionStatement
    : WRITE TRANSACTION daf_task_name
        (LENGTH ({validateIntegerRange(_input.LT(1).getText(), 4, 2048);} integerLiteral))?
        (TO ({validateLength(_input.LT(1).getText(), "dbu", 19);} (cobolWord | integerLiteral)))?
    ;

writeReportStatement
    : writeReportStatementWithName | endWriteReportStatement | autoWriteReportStatement
    ;

writeReportStatementWithName
    : WRITE REPORT daf_report_name
        FROM qualifiedDataName
        (TO qualifiedDataName)?
        (LENGTH ({validateIntegerRange(_input.LT(1).getText(), 80, 200);} integerLiteral))?
        (AFTER ((integerLiteral LINES) | PAGE | qualifiedDataName))?
    ;

endWriteReportStatement
    : WRITE REPORT daf_report_name ENDRPT
    ;

autoWriteReportStatement
    : WRITE REPORT AUTO qualifiedDataName
        (END qualifiedDataName)?
    ;

openPacketStatement
    : OPEN PACKET daf_task_name
           (FOR (qualifiedDataName | {validateExactLength(trimQuotes(_input.LT(1).getText()), "receiver packet", 3);}
           NONNUMERICLITERAL))
           (SORT qualifiedDataName)?
           (VERSION (qualifiedDataName | integerLiteral))?
    ;

getMetaInfoStatement
    : GET (getEntityStatement | getUserStatement | getItemStatements
         | getTaskStatement | getOdetteOrJobOrNetworkStatement)
    ;

getEntityStatement
    : ENTITY (getEntityNameAndDescriptionStatement | getEntityDescriptionForDomainStatement)
    ;

getEntityNameAndDescriptionStatement
    :  (qualifiedDataName |  {validateStringLengthRange(trimQuotes(_input.LT(1).getText()), 3, 4);}
            NONNUMERICLITERAL)
            (qualifiedDataName | {validateStringLengthRange(trimQuotes(_input.LT(1).getText()), 3, 16);}
            NONNUMERICLITERAL)
            ( ( daf_entity_role |
                {validateAllowedValues(trimQuotes(_input.LT(1).getText()),
                  "OWNER","OWN","DESIGNER","AVG","ANALIST","ANA");} NONNUMERICLITERAL
              )
            | ( DESCRIPTION
                ( qualifiedDataName |
                  {validateExactLength(trimQuotes(_input.LT(1).getText()), "tal", 2);} NONNUMERICLITERAL)
              )
            )
    ;

getEntityDescriptionForDomainStatement
    : (DOM | {validateAllowedValues(trimQuotes(_input.LT(1).getText()), "DOM");} NONNUMERICLITERAL)
      qualifiedDataName DESCRIPTION
    ;


getUserStatement
    : USER (NEXT | getUserOptions)
    ;

getUserOptions
    : (qualifiedDataName |  {validateExactLength(trimQuotes(_input.LT(1).getText()),"kls", 3);}
                 NONNUMERICLITERAL)
                (qualifiedDataName | NONNUMERICLITERAL)
    ;

getItemStatements
    : ITEM (getItemAnyStatement | getItemSeqStatement | getItemGrsStatement)
    ;

getItemAnyStatement
    : ANY (qualifiedDataName | NONNUMERICLITERAL)
                   (qualifiedDataName | NONNUMERICLITERAL)
                   (qualifiedDataName | NONNUMERICLITERAL)
    ;

getItemSeqStatement
    : SEQ (qualifiedDataName | NONNUMERICLITERAL)
                   (qualifiedDataName | NONNUMERICLITERAL)?
    ;

getItemGrsStatement
    : GRS (qualifiedDataName | NONNUMERICLITERAL)
                   (qualifiedDataName | NONNUMERICLITERAL)
                   (qualifiedDataName | NONNUMERICLITERAL)?
    ;


getTaskStatement
    : TASK (qualifiedDataName | {validateExactLength(trimQuotes(_input.LT(1).getText()), "task name", 4);}
                NONNUMERICLITERAL)
    ;

getOdetteOrJobOrNetworkStatement
    : (ODETTE | JOB | NETWORK) (qualifiedDataName | NONNUMERICLITERAL)
    ;

messageHandlingStatement
    : showDMLMessageStatement | returnStatusStatement
    ;

showDMLMessageStatement
    : SHOW (showMessageStatement | showResultStatement | showErrorMessageStatement)
    ;
showMessageStatement
    : STD? daf_message_types
     ({validateExactLength(_input.LT(1).getText(), "message code", 3);} integerLiteral)
     (qualifiedDataName | NONNUMERICLITERAL)?
     (qualifiedDataName | NONNUMERICLITERAL)?
     (qualifiedDataName | NONNUMERICLITERAL)?
    ;

returnStatusStatement
    : RETURN daf_message_types
      ({validateExactLength(_input.LT(1).getText(), "message code", 3);} integerLiteral)
      (qualifiedDataName | NONNUMERICLITERAL)?
    ;

showResultStatement
    : RESULT daf_task_name
    ;

showErrorMessageStatement
    : MESSAGE (({validateExactLength(trimQuotes(_input.LT(1).getText()), "language code", 2);} NONNUMERICLITERAL)
      | (qualifiedDataName | NONNUMERICLITERAL))?
    ;

tableRowRetrievalStatement
    : ROW (rowStartStatement | rowSaveStatement | rowRestoreStatement
      | rowGetStatement | rowNextStatement | rowPriorStatement
      | rowAnyStatement | rowMatchStatement)
    ;

rowStartStatement
    : START daf_table_name
    ;

rowSaveStatement
    : SAVE daf_table_name
      IN (qualifiedDataName | literal)
    ;

rowRestoreStatement
    : RESTORE daf_table_name
      FROM (qualifiedDataName | literal)
    ;

rowGetStatement
    : GET daf_table_name
      (ON (qualifiedDataName | literal))?
      (TO qualifiedDataName)?
    ;

rowNextStatement
    : NEXT daf_table_name
      (TO qualifiedDataName)?
    ;

rowPriorStatement
    : PRIOR daf_table_name
      (TO qualifiedDataName)?
    ;

rowAnyStatement
    : ANY daf_table_name
      USING qualifiedDataName
    ;

rowMatchStatement
    : MATCH daf_table_name
      USING qualifiedDataName
    ;

tableRowUpdateStatement
    : ROW (rowDeleteStatement | rowAddStatement | rowInsertStatement |
      rowModifyStatement | rowSortStatement | rowSingleStatement |
      rowDuplicateStatement | rowInvertStatement)
    ;

rowDeleteStatement
    : DELETE daf_table_name
    ;

rowAddStatement
    : ADD daf_table_name
      WITH qualifiedDataName
    ;

rowInsertStatement
    : INSERT daf_table_name
      WITH qualifiedDataName
    ;

rowModifyStatement
    : MODIFY daf_table_name
      ON (qualifiedDataName | literal)
      WITH qualifiedDataName
    ;

rowSortStatement
    : SORT daf_table_name (ASC | DES)
      ON qualifiedDataName
    ;

rowSingleStatement
    : SINGLE daf_table_name
      ON qualifiedDataName
    ;

rowDuplicateStatement
    : DUPLICATE daf_table_name
      ON qualifiedDataName
    ;

rowInvertStatement
    : INVERT daf_table_name
    ;

tableDMLStatement
    : getTableStatement | sortTableStatement
    ;

getTableStatement
    : GET TABLE (ANY | SEQ)
      {validateExactLength(_input.LT(1).getText(), "table reference", 4);} cobolWord
    ;

sortTableStatement
    : SORT TABLE qualifiedDataName TO qualifiedDataName
      LENGTH (qualifiedDataName | integerLiteral)
      (ASCENDING | DESCENDING)
    ;

fileDMLStatement
    : openFileStatement | readFileStatement | writeFileStatement
     | closeFileStatement | getFileStatement
    ;

openFileStatement
    : OPEN FILE cobolWord (MAX LENGTH (integerLiteral | LAYOUT))?
    ;

readFileStatement
    : READ FILE cobolWord (MAX LENGTH (integerLiteral | LAYOUT))?
    ;

writeFileStatement
    : WRITE FILE cobolWord (LENGTH integerLiteral)?
    ;

closeFileStatement
    : CLOSE FILE (INPUT | OUTPUT) (cobolWord | ALL)
    ;

getFileStatement
    : GET FILE (qualifiedDataName | NONNUMERICLITERAL) INTO qualifiedDataName
      VOLSER INTO qualifiedDataName
    ;

stringDMLStatement
    : STRING (stringFindStatement | stringGetStatement | stringNextStatement
    | stringMatchStatement | stringCheckStatement | stringUpdateStatement
    | stringReplaceStatement | stringDeleteStatement)
    ;

stringFindStatement
    : FIND qualifiedDataName daf_string_identifier
    ;

stringGetStatement
    : GET qualifiedDataName
    ;

stringNextStatement
    : NEXT qualifiedDataName (DELIMITER qualifiedDataName)?
    ;

stringMatchStatement
    : MATCH daf_string_identifier daf_string_identifier daf_string_identifier
    ;

stringCheckStatement
    : CHECK daf_string_command daf_string_identifier
    ;

stringUpdateStatement
    : (ADD | INSERT | FILL) qualifiedDataName daf_string_identifier
      LENGTH daf_string_identifier
    ;

stringReplaceStatement
    : REPLACE ALL? qualifiedDataName daf_string_identifier
      BY daf_string_identifier
    ;

stringDeleteStatement
    : DELETE ALL? qualifiedDataName daf_string_identifier
    ;

// End of DaCo Statements

// abend code statement

abendCodeStatement
    : ABEND CODE (literal | generalIdentifier) abendCodeDumpClause? abendCodeExitClause?
    ;

abendCodeDumpClause
    : (DUMP | NODUMP)
    ;

abendCodeExitClause
    : EXITS (INVOKED | IGNORED)
    ;

// accept statement

acceptStatement
   : ACCEPT (acceptIdmsDcClause idmsOnClause? | acceptIdmsDbClause idmsOnClause? |
   (generalIdentifier (acceptFromDateStatement | acceptFromEscapeKeyStatement | acceptFromMnemonicStatement | acceptMessageCountStatement)? onExceptionClause? notOnExceptionClause? END_ACCEPT?))
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

acceptIdmsDcClause
   : acceptTransactionStatisticsClause | ((LTERM ID | PTERM ID | SCREENSIZE | SYSTEM ID | SYSVERSION | TASK CODE | TASK ID | USER ID) INTO generalIdentifier)
   ;

acceptMessageCountStatement
   : MESSAGE? COUNT
   ;

acceptTransactionStatisticsClause
    : TRANSACTION STATISTICS acceptTransactionStatisticsWriteClause? acceptTransactionStatisticsIntoClause? acceptTransactionStatisticsLengthClause?
    ;

acceptTransactionStatisticsWriteClause
    : (WRITE | NOWRITE)
    ;

acceptTransactionStatisticsIntoClause
    : INTO generalIdentifier
    ;

acceptTransactionStatisticsLengthClause
    : LENGTH (integerLiteral | generalIdentifier)
    ;

acceptIdmsDbClause
    : generalIdentifier ((FROM acceptIdmsDbOptions) | FOR idms_db_entity_name)
    ;

acceptIdmsDbOptions
    : (idms_procedure_name PROCEDURE) | currencyPageInfo | (idms_db_entity_name acceptIdmsTypes) |
     (IDMS_STATISTICS (EXTENDED generalIdentifier)?)
    ;

acceptIdmsTypes
    : (BIND | ((NEXT | PRIOR |OWNER)? currencyPageInfo))
    ;

currencyPageInfo
    : CURRENCY (PAGE_INFO generalIdentifier)?
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

// accept transaction statistics statement

attachTaskCodeStatement
    : ATTACH TASK CODE (generalIdentifier | literal) attachTaskCodePriorityClause? idmsWaitNowaitClause?
    ;

attachTaskCodePriorityClause
    : PRIORITY (integerLiteral | generalIdentifier)
    ;

// bind statement

bindStatement
    : BIND (bindTaskClause | bindTransactionClause | bindRunUnitClause | bindMapClause | bindProcedureClause |bindRecordClause)
    ;

bindMapClause
    : MAP idms_map_name (RECORD idms_db_entity_name (TO (NULL | generalIdentifier))?)?
    ;

bindProcedureClause
    : PROCEDURE FOR idms_procedure_name TO generalIdentifier
    ;

bindTaskClause
    : TASK bindTaskStatementNodenameClause?
    ;

bindTaskStatementNodenameClause
    : NODENAME (generalIdentifier | literal)
    ;

bindTransactionClause
    : TRANSACTION STATISTICS
    ;

bindRunUnitClause
    : RUN_UNIT (FOR generalIdentifier)? (DBNODE bindDbNodeName)? (DBNAME bindDbNodeName)? (DICTNODE bindDbNodeName)? (DICTNAME bindDbNodeName)?
    ;

bindRecordClause
    : (idms_db_entity_name (TO generalIdentifier)?) | (generalIdentifier WITH idms_db_entity_name)
    ;

bindDbNodeName
    : literal | generalIdentifier
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

// change priority statement

changePriorityStatement
    : CHANGE PRIORITY TO? (integerLiteral | generalIdentifier)
    ;

// check terminal statement

checkTerminalStatement
    : CHECK TERMINAL checkTerminalGetStorageClause? INTO generalIdentifier (checkTerminalIntoClause | checkTerminalMaxLengthClause) checkTerminalReturnLengthClause?
    ;

checkTerminalGetStorageClause
    : GET STORAGE
    ;

checkTerminalIntoClause
    : TO generalIdentifier
    ;

checkTerminalMaxLengthClause
    : MAX LENGTH (generalIdentifier | integerLiteral)
    ;

checkTerminalReturnLengthClause
    : RETURN LENGTH INTO? generalIdentifier
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

// commit statement

commitStatement
   : COMMIT TASK? ALL?
   ;

// compute statement

computeStatement
   : COMPUTE computeStore+ (EQUALCHAR | EQUAL) COMMACHAR? arithmeticExpression COMMACHAR? onSizeErrorPhrase?
   COMMACHAR? notOnSizeErrorPhrase? END_COMPUTE?
   ;

computeStore
   : generalIdentifier ROUNDED?
   ;

// connect statement

connectStatement
   : CONNECT idms_db_entity_name TO idms_db_entity_name
   ;

// continue statement

continueStatement
   : CONTINUE
   ;

// dc statement

dcStatement
    : DC RETURN dcNextTaskCodeClause? dcOptionClause? dcTimeoutClause? dcNextTaskIntervalClause?
    ;

dcNextTaskCodeClause
    : NEXT TASK CODE (generalIdentifier | literal)
    ;

dcOptionClause
    : (NORMAL | ABORT | CONTINUE | IMMEDIATE)
    ;

dcTimeoutClause
    : TIMEOUT (dcIntervalClause | dcProgramClause)*
    ;

dcNextTaskIntervalClause
    : NEXT TASK INTERVAL (generalIdentifier | integerLiteral) EVENT TYPE (INTERNAL | EXTERNAL) dcEventClause?
    ;

dcIntervalClause
    : INTERVAL (generalIdentifier | integerLiteral)
    ;

dcProgramClause
    : PROGRAM (generalIdentifier | literal)
    ;

dcEventClause
    : (EVENT generalIdentifier) | (EVENT NAME (generalIdentifier | literal))
    ;

// delete statement

deleteStatement
   : DELETE (deleteFilenameClause | deleteIdmsDCStatement idmsOnClause?)
   ;

deleteIdmsDCStatement
   : deleteQueueClause | deleteScratchClause | deleteTableClause
   ;

deleteFilenameClause
   : fileName RECORD? invalidKeyPhrase? notInvalidKeyPhrase? END_DELETE?
   ;

deleteQueueClause
   : QUEUE deleteQueueIdClause? (CURRENT | ALL)?
   ;

deleteQueueIdClause
   : ID (generalIdentifier | literal)
   ;

deleteScratchClause
   : SCRATCH deleteScratchIdClause? (CURRENT | FIRST | LAST | NEXT | PRIOR | ALL | RECORD ID generalIdentifier)? (RETURN RECORD ID INTO? generalIdentifier)?
   ;

deleteScratchIdClause
   : AREA ID (generalIdentifier | literal)
   ;

deleteTableClause
   : TABLE FROM? (generalIdentifier | idms_table_name) idmsDictnodeClause? idmsDictnameClause? (LOADLIB (generalIdentifier | literal))?
   ;

// dequeue statement

dequeueStatement
    : DEQUEUE (ALL | dequeueNameStatement+)
    ;

dequeueNameStatement
    : NAME generalIdentifier LENGTH (generalIdentifier | integerLiteral)
    ;

// disable statement

disableStatement
   : DISABLE (INPUT TERMINAL? | I_O TERMINAL | OUTPUT) cdName WITH? KEY (literal | generalIdentifier)
   ;

// disconnect statement

disconnectStatement
   : DISCONNECT idms_db_entity_name FROM idms_db_entity_name
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

// end statement

endStatement
   : END (endLineClause | endTransactionClause)
   ;

endLineClause
   : LINE TERMINAL SESSION?
   ;

endTransactionClause
   : TRANSACTION STATISTICS endTransactionWriteClause? endTransactionIntoClause? endTransactionLengthClause?
   ;

endTransactionWriteClause
   : (WRITE | NOWRITE)
   ;

endTransactionIntoClause
   : INTO generalIdentifier
   ;

endTransactionLengthClause
   : LENGTH (generalIdentifier | integerLiteral)
   ;

// endpage statement

endpageStatement
   : ENDPAGE SESSION?
   ;

// enqueue statement

enqueueStatement
   : ENQUEUE (WAIT | NOWAIT | TEST)? enqueueNameClause*
   ;

enqueueNameClause
   : NAME generalIdentifier LENGTH (generalIdentifier | integerLiteral) (EXCLUSIVE | SHARED)?
   ;

// entry statement

entryStatement
   : ENTRY literal (USING generalIdentifier (COMMACHAR? generalIdentifier)*?)?
   ;
// erase statement

eraseStatement
   : ERASE idms_db_entity_name ((PERMANENT | SELECTIVE | ALL) MEMBERS)?
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
   : execSqlStatement DOT_FS
   ;

execSqlStatementInWorkingStorageAndLinkageSection
   : execSqlStatement DOT_FS
   ;

execSqlStatementInDataDivision
   : execSqlStatement DOT_FS
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
   : EXIT PROGRAM?
   ;

// find statement

findStatement
   : FIND keepClause? findObtainClause
   ;

// free statement

freeStatement
    : FREE STORAGE (freeStgidClause | freeForClause)
    ;

freeStgidClause
    : STGID (generalIdentifier | literal)
    ;

freeForClause
    : FOR generalIdentifier (FROM generalIdentifier)?
    ;

keepClause
    : KEEP EXCLUSIVE?
    ;

findObtainClause
    : calcClause | currentClause | ownerClause | recnameClause | dbkeyClause | positionClause
    ;

calcClause
    : (CALC | ANY | DUPLICATE) idms_db_entity_name
    ;

currentClause
    : CURRENT idms_db_entity_name? (WITHIN idms_db_entity_name)?
    ;

ownerClause
    : OWNER WITHIN idms_db_entity_name
    ;

recnameClause
    : idms_db_entity_name (DB_KEY IS? generalIdentifier | WITHIN idms_db_entity_name CURRENT? USING generalIdentifier)
    ;

dbkeyClause
    : DB_KEY IS? generalIdentifier (PAGE_INFO generalIdentifier)?
    ;

positionClause
    : (orderClause | integerLiteral | generalIdentifier) idms_db_entity_name? WITHIN idms_db_entity_name
    ;

orderClause
    : ( NEXT | PRIOR | FIRST | LAST )
    ;

// finish statement

finishStatement
   : FINISH TASK?
   ;

// generate statement

generateStatement
   : GENERATE reportName
   ;

// get statement
getStatement
    : GET (getTimeClause | idms_db_entity_name | getQueueClause | getScratchClause | getStorageClause)?
    ;

getQueueClause
    : QUEUE (ID (generalIdentifier | literal))? getQueueTypeClause? getStatClause? getQueueLockClause?  idmsWaitNowaitClause? INTO generalIdentifier getLengthClause getReturnClause?
    ;

getQueueTypeClause
    : (NEXT | FIRST | LAST | PRIOR | (SEQUENCE (generalIdentifier | integerLiteral)) | (RECORD ID (generalIdentifier | literal)))
    ;

getStatClause
    : (DELETE | KEEP)
    ;

getQueueLockClause
    : (LOCK | NOLOCK)
    ;

getLengthClause
    : ((TO generalIdentifier) | (MAX LENGTH (generalIdentifier | literal)))
    ;

getReturnClause
    : RETURN LENGTH INTO generalIdentifier
    ;

getScratchClause
    : SCRATCH getScratchAreaClause? getScratchNextClause? getStatClause? INTO generalIdentifier getLengthClause getReturnClause?
    ;

getScratchAreaClause
    : AREA ID (generalIdentifier | literal)?
    ;

getScratchNextClause
    : (NEXT | FIRST | LAST | PRIOR | CURRENT | (RECORD ID generalIdentifier))
    ;

getStorageClause
    : STORAGE FOR generalIdentifier (TO generalIdentifier)? (LENGTH generalIdentifier)? (POINTER generalIdentifier)?
    idmsWaitNowaitClause? KEEP? (LONG | SHORT)? (USER | SHARED)? (STGID (generalIdentifier | literal))?
    getStorageValueClause? getStorageLocClause?
    ;

getStorageValueClause
    : VALUE IS (LOW_VALUE | HIGH_VALUE | generalIdentifier)
    ;

getStorageLocClause
    : LOCATION IS? (ANY | BELOW)?
    ;

getTimeClause
    : TIME getTimeIntoClause? (DATE INTO generalIdentifier)?
    ;

getTimeIntoClause
    : INTO generalIdentifier (COMP | COMP_3 | EDIT)
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

ifStatement
   : IF (idmsIfCondition | condition) ifThen ifElse? END_IF?
   ;

ifThen
   : THEN? (NEXT SENTENCE | conditionalStatementCall+)
   ;

ifElse
   : ELSE (NEXT SENTENCE | conditionalStatementCall+)
   ;

idmsIfCondition
   : (idms_db_entity_name idmsIfEmpty) | (idmsIfMember)
   ;

idmsIfEmpty
    : IS? NOT? EMPTY
    ;

idmsIfMember
    : NOT? idms_db_entity_name MEMBER
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

// inquire map statement

inquireMapStatement
   : INQUIRE MAP idms_map_name (MOVE inqMapMovePhrase | IF inqMapIfPhrase)
   ;

inqMapMovePhrase
   : (AID TO generalIdentifier) | (CURSOR TO generalIdentifier generalIdentifier) | (IN LENGTH FOR generalIdentifier TO generalIdentifier)
   ;

inqMapIfPhrase
   : (INPUT (UNFORMATTED | TRUNCATED | CHANGED | EXTRANEOUS) | (CURSOR AT? DFLD generalIdentifier) |
   (inqMapWhichFields | inqMapWhichDflds) inqMapFieldTestPhrase) ifThen ifElse?
   ;

inqMapWhichFields
   : CURRENT | ALL | NONE | ANY | SOME | ALL (BUT | EXCEPT) CURRENT
   ;

inqMapWhichDflds
   : (ALL | NONE | ANY | SOME | ALL (BUT | EXCEPT))? (DFLD generalIdentifier)+?
   ;

inqMapFieldTestPhrase
   : DATA IS? (YES | NO | ERASE | TRUNCATED | IDENTICAL | DIFFERENT) | mapEditPhrase
   ;

mapEditPhrase
   : EDIT IS? (ERROR | CORRECT)
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

// keep statement

keepStatement
    : KEEP (keepCurrentClause | keepLongtermClause)
    ;

keepCurrentClause
    :  EXCLUSIVE? currentClause
    ;

keepLongtermClause
    : LONGTERM (ALL | (generalIdentifier | literal)) keepLongtermRestClause
    ;

keepLongtermRestClause
    : (keepLongtermNotifyClause | keepLongtermLockClause | keepLongtermTestClause | RELEASE)
    ;

keepLongtermNotifyClause
    : NOTIFY CURRENT idms_db_entity_name
    ;

keepLongtermLockClause
    : ((UPGRADE (SHARE | EXCLUSIVE) (RETURN NOTIFICATION INTO? generalIdentifier)) | ((SHARE | EXCLUSIVE) CURRENT idms_db_entity_name)) (WAIT | NOWAIT | NODEADLOCK)?
    ;

keepLongtermTestClause
    : TEST (RETURN NOTIFICATION INTO? generalIdentifier)?
    ;

// load Statement

loadStatement
    : LOAD TABLE (generalIdentifier | idms_table_name) INTO generalIdentifier loadLocationClause idmsDictnodeClause? idmsDictnameClause? loadLoadlibClause? idmsWaitNowaitClause
    ;

loadLocationClause
    : (TO | POINTER) generalIdentifier
    ;

loadLoadlibClause
    : LOADLIB (generalIdentifier | literal)
    ;

// map statement

mapStatement
    : MAP (mapInClause | mapOutClause | mapOutInClause)
    ;

mapInClause
    : IN USING idms_map_name mapIoInputPhrase? mapDetailPhrase?
    ;

mapIoInputPhrase
    : mapInIoPhrase | mapInputPhrase
    ;

mapInIoPhrase
    : (IO mapInputPhrase? | (NOIO DATASTREAM idmsDmlFromClause))
    ;

mapInputPhrase
    : INPUT DATA IS? (YES | NO)
    ;

mapDetailPhrase
    : ((DETAIL mapDetailOptions?) | HEADER ) ((PAGE IS? generalIdentifier) | MODIFIED)*
    ;

mapDetailOptions
    : (NEXT | FIRST | (SEQUENCE NUMBER IS? generalIdentifier) | (KEY IS? generalIdentifier))
    (RETURNKEY IS? generalIdentifier)?
    ;

mapOutClause
    : OUT USING idms_map_name  idmsWaitNowaitClause?  mapOutIoPhrase? mapOutputPhrase? mapMessagePhrase? mapOutDetailPhrase?
    ;

mapOutIoPhrase
    : (IO | (NOIO DATASTREAM mapOutIntoClause))
    ;

mapOutIntoClause
    : INTO? generalIdentifier ((TO generalIdentifier) | (MAX? LENGTH (generalIdentifier | integerLiteral)))
      (RETURN LENGTH INTO? generalIdentifier)?
    ;

mapOutputPhrase
    : OUTPUT ((DATA IS? (YES | NO | ERASE | ATTRIBUTE))? (NEWPAGE | ERASE)? LITERALS?)
    ;

mapMessagePhrase
    : MESSAGE IS? generalIdentifier idmsDmlLengthClause
    ;

mapOutDetailPhrase
    : (DETAIL (NEW | CURRENT)? (KEY IS? generalIdentifier)?) |
      (RESUME (PAGE IS? (CURRENT | NEXT | PRIOR | FIRST | LAST | generalIdentifier))?)
    ;

mapOutInClause
    : OUTIN USING idms_map_name mapOutputPhrase? mapInputPhrase? mapMessagePhrase?
    ;

idmsDictnameClause
    : DICTNAME (generalIdentifier | idms_dictionary_name)
    ;


idmsDictnodeClause
    : DICTNODE (generalIdentifier | idms_node_name)
    ;

idmsDmlFromClause
    : FROM generalIdentifier idmsDmlLengthClause
    ;

idmsDmlLengthClause
   : ((TO generalIdentifier) | (LENGTH (generalIdentifier | integerLiteral)))
   ;

idmsWaitNowaitClause
    : (WAIT | NOWAIT)
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

// modify statement
modifyStatement
    : MODIFY  ((MAP modifyMapClause) | idms_db_entity_name )
    ;
// modify map statement
modifyMapClause
    : idms_map_name (PERMANENT | TEMPORARY)?
     (CURSOR AT? ((DFLD generalIdentifier) | (generalIdentifier | integerLiteral) (generalIdentifier | integerLiteral)))?
     (WCC ((RESETMDT | NOMDT) | (RESETKBD | NOKBD) | (ALARM | NOALARM) | (STARTPRT | NOPRT) |
     (NLCR | FORTYCR | SIXTYFOURCR | EIGHTYCR))+)? (modifyMapForClause modifyMapFieldOptionsClause)?
    ;

modifyMapForClause
    : FOR ((ALL ((BUT | EXCEPT) (CURRENT | (DFLD generalIdentifier)+) | (ERROR | CORRECT)? FIELDS)) |
      (ALL? (DFLD generalIdentifier)+))
    ;

modifyMapFieldOptionsClause
    : (BACKSCAN | NOBACKSCAN)? (OUTPUT DATA IS? (YES | NO | ERASE | ATTRIBUTE))? mapInputPhrase?
    ((RIGHT | LEFT)? JUSTIFY)? (PAD (LOW_VALUE | HIGH_VALUE | (literal | generalIdentifier)))?
    mapEditPhrase? (REQUIRED | OPTIONAL)? (ERROR MESSAGE IS? (ACTIVE | SUPPRESS))? (ATTRIBUTES (attributeList)+)?
    ;

attributeList
    : SKIPCHAR | ALPHANUMERIC | NUMERIC | PROTECTED | UNPROTECTED | DISPLAY | DARK | BRIGHT | DETECT | NOMDT | MDT | BLINK | NOBLINK | REVERSE_VIDEO |
    NORMAL_VIDEO | UNDERSCORE | NOUNDERSCORE | NOCOLOR | BLUE | RED | PINK | GREEN | TURQUOISE | YELLOW | WHITE
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

// obtain statement

obtainStatement
   : OBTAIN keepClause? findObtainClause
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
   : performType? conditionalStatementCall*? END_PERFORM
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

// IDMS post statement

postStatement
   : POST ((EVENT generalIdentifier) | (EVENT NAME (generalIdentifier | literal) CLEAR?))
   ;

// purge statement

purgeStatement
   : PURGE cdName+
   ;

// IDMS put statement

putStatement
   : PUT (putQueueStatement | putScratchClause)
   ;

putQueueStatement
   : QUEUE (ID (generalIdentifier | literal))? (FIRST | LAST)? idmsDmlFromClause putReturnClause? putRetentionClause?
   ;

putReturnClause
   : RETURN RECORD ID INTO generalIdentifier?
   ;

putRetentionClause
   : RETENTION (generalIdentifier | integerLiteral)
   ;

putScratchClause
   : SCRATCH putAreaIdClause? idmsDmlFromClause putRecordClause? putReturnClause
   ;

putAreaIdClause
   : AREA ID (generalIdentifier | literal)
   ;

putRecordClause
   : RECORD ID (generalIdentifier | integerLiteral) REPLACE?
   ;

// read statement

readStatement
   : READ (readFilenameClause | readIdmsDcStatement idmsOnClause?)
   ;

readIdmsDcStatement
   : readLineFromTerminalClause | readTerminalClause
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

readTerminalClause
   : TERMINAL idmsWaitNowaitClause? (BUFFER | (MODIFIED FROM POSITION (generalIdentifier | literal)))?
   (GET STORAGE)? INTO generalIdentifier ((TO generalIdentifier) | (MAX LENGTH (generalIdentifier | integerLiteral)))
   (RETURN LENGTH INTO? generalIdentifier)?
   ;

readLineFromTerminalClause
   : LINE FROM? TERMINAL ECHO? NOBACKPAGE? INTO generalIdentifier ((TO generalIdentifier)
   | (MAX LENGTH (generalIdentifier | integerLiteral))) (RETURN LENGTH INTO? generalIdentifier)?
   ;

// ready statement
readyStatement
    : READY idms_db_entity_name? (USAGE_MODE IS? (PROTECTED | EXCLUSIVE)? (RETRIEVAL | UPDATE))?
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
   : RETURN (cobolReturn | idmsReturn idmsOnClause?)
   ;

cobolReturn
   : fileName RECORD? returnInto? atEndPhrase notAtEndPhrase? END_RETURN?
   ;

returnInto
   : INTO qualifiedDataName
   ;

idmsReturn
    : generalIdentifier FROM idms_db_entity_name (CURRENCY | orderClause CURRENCY? | USING generalIdentifier)
      (KEY INTO? generalIdentifier)?
    ;

// rewrite statement

rewriteStatement
   : REWRITE recordName rewriteFrom? invalidKeyPhrase? notInvalidKeyPhrase? END_REWRITE?
   ;

rewriteFrom
   : FROM generalIdentifier
   ;

// rollback statement
rollbackStatement
    : ROLLBACK TASK? CONTINUE?
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
   : SEND (((sendStatementSync | sendStatementAsync) onExceptionClause? notOnExceptionClause?) | sendIdmsClause)
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

sendIdmsClause
   : MESSAGE (ONLY | ALWAYS)? TO sendIdmsToClause idmsDmlFromClause
   ;

sendIdmsToClause
   : (DEST ID (generalIdentifier | literal)) | (USER ID generalIdentifier) | (LTERM ID (generalIdentifier | literal))
   ;

// set statement

setStatement
   : SET (setToOnOff+ | setToBoolean | setToStatement | setUpDownByStatement | setToEntry | setIdmsDcStatement idmsOnClause?)
   ;

setIdmsDcStatement
   : setAbendExitStatement | setTimerStatement
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

setAbendExitStatement
   : ABEND EXIT ((ON? PROGRAM (generalIdentifier | literal)) | OFF)
   ;

setTimerStatement
   : TIMER (setTimerWaitClause | setTimerPostClause | setTimerStartClause | (CANCEL setTimerIdClause))
   ;

setTimerWaitClause
   : WAIT setTimerIntervalClause
   ;

setTimerPostClause
   : POST setTimerIntervalClause setTimerEventClause? setTimerIdClause?
   ;

setTimerStartClause
   : START setTimerIntervalClause (TASK CODE (generalIdentifier | literal) (PRIORITY (generalIdentifier | integerLiteral))?)? setTimerIdClause? setTimerDataClause?
   ;

setTimerIntervalClause
   : INTERVAL (generalIdentifier | integerLiteral) SECONDS?
   ;

setTimerEventClause
   : EVENT generalIdentifier
   ;

setTimerIdClause
   : TIMER ID generalIdentifier
   ;

setTimerDataClause
   : DATA idmsDmlFromClause
   ;

// service statement

serviceLabelStatement
   : SERVICE LABEL
   ;

serviceReloadStatement
   : SERVICE RELOAD generalIdentifier
   ;

// snap statement

snapStatement
   : SNAP (TITLE IS? generalIdentifier)? (ALL | SYSTEM | TASK)? idmsDmlFromClause*
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

// startpage statement

startpageStatement
    : STARTPAGE SESSION? idms_map_name (WAIT | NOWAIT | RETURN)? (BACKPAGE | NOBACKPAGE)? (UPDATE | BROWSE)?
     (AUTODISPLAY | NOAUTODISPLAY)?
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

// store statement
storeStatement
    : STORE idms_db_entity_name
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

// transfer statement

transferStatement
   : TRANSFER CONTROL? TO? (generalIdentifier | idms_program_name) (RETURN | LINK | NORETURN | XCTL)?
   (USING generalIdentifier (COMMACHAR? generalIdentifier)*?)?
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

// wait statement

waitStatement
   : WAIT (((LONG | SHORT)? (waitEventTypeClause | waitEventListClause (COMMACHAR? waitEventListClause)*))
   | (REDISPATCH (waitEventTypeClause | waitEventListClause (COMMACHAR? waitEventListClause)*)?))
   ;

waitEventTypeClause
   : EVENT NAME (generalIdentifier | literal)
   ;

waitEventListClause
   : EVENT generalIdentifier
   ;

// write statement

writeStatement
  : WRITE (writeStatementClause | writeIdmsDCStatement idmsOnClause?)
  ;

writeIdmsDCStatement
    : writeJournalClause | writeLineClause | writeLogClause | writePrinterClause | writeTerminalClause | writeThenReadClause
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

writeJournalClause
   : JOURNAL idmsWaitNowaitClause? (SPAN | NOSPAN)? idmsDmlFromClause
   ;

writeLineClause
   : LINE TO? TERMINAL idmsWaitNowaitClause? (NEWPAGE | ERASE)? NOBACKPAGE? idmsDmlFromClause (HEADER (generalIdentifier | integerLiteral))?
   ;

writeLogClause
   : LOG MESSAGE ID (generalIdentifier | integerLiteral) writeLogParmsClause? writeLogReplyClause? writeLogMessagePrefixClause? writeLogTextClause?
   ;

writeLogParmsClause
   : PARMS idmsDmlFromClause+
   ;

writeLogReplyClause
   : REPLY INTO generalIdentifier ((TO generalIdentifier) | (MAX LENGTH (generalIdentifier | integerLiteral)))
   ;

writeLogMessagePrefixClause
   : MESSAGE PREFIX IS (generalIdentifier | literal)
   ;

writeLogTextClause
   : TEXT INTO? generalIdentifier ((TO generalIdentifier) | (MAX LENGTH (generalIdentifier | integerLiteral)))
   (MESSAGE? PREFIX IS? (YES | NO))? (TEXT IS? ONLY)?
   ;

writePrinterClause
   : PRINTER (NEWPAGE | ERASE)? ENDRPT? (SCREEN CONTENTS | writePrinterNativeClause)
   (COPIES (generalIdentifier | integerLiteral))? (REPORT ID (generalIdentifier | integerLiteral))?
   writePrinterTypeClause? HOLD? KEEP?
   ;

writePrinterNativeClause
   : NATIVE? idmsDmlFromClause
   ;

writePrinterTypeClause
   : (CLASS (generalIdentifier | integerLiteral)) | (DESTINATION (generalIdentifier | literal) ALL?)
   ;

writeTerminalClause
   : TERMINAL idmsWaitNowaitClause? writeTerminalEraseClause? (FREE STORAGE)? idmsDmlFromClause
   ;

writeTerminalEraseClause
   : NEWPAGE | ERASE | EAU | (ERASE ALL UNPROTECTED)
   ;

writeThenReadClause
   : THEN READ TERMINAL idmsWaitNowaitClause? writeTerminalEraseClause? (FREE STORAGE)?
   idmsDmlFromClause ((MODIFIED | BUFFER) FROM POSITION (generalIdentifier | literal))? (GET STORAGE)?
   INTO generalIdentifier ((TO generalIdentifier) | (MAX LENGTH (generalIdentifier | integerLiteral)))
   (RETURN LENGTH INTO? generalIdentifier)?
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
   : NOT? (simpleCondition | nestedCondition)
    ((AND | OR) NOT? (simpleCondition | nestedCondition | relationCombinedComparison))*
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

idms_map_name
    : {validateLength(_input.LT(1).getText(), "map name", 8);} variableUsageName
    ;

idms_map_name_definition
    : {validateLength(_input.LT(1).getText(), "map name", 8);} dataName
    ;

idms_db_entity_name
    : {validateLength(_input.LT(1).getText(), "db entity name", 16);} variableUsageName
    ;

idms_dictionary_name
    : {validateLength(_input.LT(1).getText().substring(1, _input.LT(1).getText().length() -1),
     "dictionary name", 8);} literal
    ;

idms_node_name
    : {validateLength(_input.LT(1).getText().substring(1, _input.LT(1).getText().length() -1),
           "node name", 8);} literal
    ;

idms_procedure_name
    : {validateLength(_input.LT(1).getText(), "procedure name", 8);} variableUsageName
    ;

idms_program_name
    : {validateLength(_input.LT(1).getText().substring(1, _input.LT(1).getText().length() -1),
           "program name", 8);} literal
    ;

idms_schema_name
    : {validateLength(_input.LT(1).getText(), "schema name", 8);} dataName
    ;

idms_subschema_name
    : {validateLength(_input.LT(1).getText(), "subschema name", 8);} dataName
    ;

idms_table_name
    : {validateLength(_input.LT(1).getText().substring(1, _input.LT(1).getText().length() -1),
           "table name", 8);} literal
    ;

// DAF DaCo Identifiers

daf_task_name
    :{validateExactLength(_input.LT(1).getText(), "task name", 4);
      validateAlphaNumericPattern(_input.LT(1).getText(), "task name");
     }
        (cobolWord | integerLiteral)
    ;

daf_report_name
    :{validateExactLength(_input.LT(1).getText(), "report name", 5);
      validateAlphaNumericPattern(_input.LT(1).getText(), "report name");
      validateStartsWith(_input.LT(1).getText(), "R", "T");
      }
        (cobolWord)
    ;

daf_entity_role
    : (OWNER | DESIGNER | ANALIST | OWN | AVG | ANA)
    ;

daf_message_types
    : ERROR | INFO | WARNING
    ;

daf_table_name
    : { validateStartsWith(_input.LT(1).getText(), "TBL", "TBF"); } qualifiedDataName
    ;

daf_string_command
    : EMA
    ;

daf_string_identifier
    : qualifiedDataName | literal
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
   | DATE | DAY | DAY_OF_WEEK | DEBUG_CONTENTS | DEBUG_ITEM | DEBUG_LINE | DEBUG_NAME | DEBUG_SUB_1 | DEBUG_SUB_2 | DEBUG_SUB_3
   | JNIENVPTR
   | LENGTH OF? generalIdentifier | LINAGE_COUNTER | LINE_COUNTER
   | PAGE_COUNTER
   | RETURN_CODE
   | SHIFT_IN | SHIFT_OUT | SORT_CONTROL | SORT_CORE_SIZE | SORT_FILE_SIZE | SORT_MESSAGE | SORT_MODE_SIZE | SORT_RETURN
   | TALLY | TIME
   | WHEN_COMPILED
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
   : INTEGER | LENGTH | RANDOM | SUM | WHEN_COMPILED | cobolWord
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
   : IDENTIFIER | idms_only_words | cobolCompilerDirectivesKeywords | cobolKeywords
//   | dacoKeywords
   ;

cobolKeywords
   : ABEND | ADDRESS | BOTTOM | BUFFER | CHECK | COUNT | CR | FIELD | FIRST | HEADER | LINK | MMDDYYYY | PRINTER
   | REMARKS | RESUME | TIMER | TODAYS_DATE | TODAYS_NAME | TOP | UPDATE | YEAR | YYYYDDD | YYYYMMDD
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
    | K_CHAR
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

idms_only_words
    : ATTRIBUTE | AUTODISPLAY
    | BACKPAGE | BACKSCAN | BLINK
    | BLUE | BRIGHT | BROWSE | BUT
    | CALC | CONTENTS | COPIES | CORRECT
    | DARK | DATASTREAM
    | DBNAME | DBNODE | DB_KEY
    | DC | DEQUEUE | DEST | DETECT | DFLD
    | DICTNAME | DICTNODE | DIFFERENT | DUPLICATE
    | EAU | ECHO | EDIT | EIGHTYCR | ENDPAGE | ENDRPT
    | ENQUEUE | EXITS | EXTRANEOUS
    | FIELDS | FIND | FORTYCR
    | GREEN
    | IDENTICAL | IDMS | INTERNAL
    | JOURNAL
    | LOADLIB | LOCATION | LOG | LONGTERM
    | MAPS | MDT | MEMBERS
    | MODIFIED | MODIFY
    | NEWPAGE | NOALARM | NOAUTODISPLAY
    | NOBACKPAGE | NOBACKSCAN | NOBLINK | NOCOLOR | NODEADLOCK
    | NODENAME | NOIO | NOKBD | NOLOCK | NOMDT
    | NOPRT | NORETURN | NORMAL
    | NORMAL_VIDEO | NOSPAN | NOTIFICATION | NOTIFY | NOUNDERSCORE
    | OBTAIN | OUTIN | OWNER
    | PAGE_INFO | PARMS | PERMANENT | PINK | PROTECTED
    | RED | REDISPATCH | RESETKBD | RESETMDT | RETENTION | RETRIEVAL | REPLY
    | RETURNKEY | REVERSE_VIDEO | RUN_UNIT
    | SCREEN | SELECTIVE | SHORT | SIXTYFOURCR | SPAN | SCRATCH
    | STARTPAGE | STARTPRT | STGID | STORE | SCHEMA
    | TURQUOISE
    | UNDERSCORE | UNFORMATTED | UNPROTECTED
    | UPGRADE | USAGE_MODE
    | WCC | WHITE | WITHIN | YELLOW
    ;

dacoKeywords
    : ANA | ANALIST | AVG | DESCRIPTION | DESIGNER | DOM | ENTITY | GRS
    | ITEM | JOB | ODETTE | OWN
    ;