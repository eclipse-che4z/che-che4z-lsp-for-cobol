/*
* Copyright (C) 2017, Ulrich Wolffgang <ulrich.wolffgang@proleap.io>
* All rights reserved.
*
* This software may be modified and distributed under the terms
* of the MIT license. See the LICENSE file for details.
*/

parser grammar CobolParser;
options {tokenVocab = CobolLexer;  superClass = MessageServiceParser;}

import CICSParser;

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
   : (PROCESS | CBL) (COMMACHAR? compilerOption | compilerXOpts)+
   ;

compilerXOpts
   : XOPTS LPARENCHAR compilerOption (COMMACHAR? compilerOption)* RPARENCHAR
   ;

compilerOption
   : ADATA | ADV | APOST | AWO
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
   | RENT | RES | RMODE LPARENCHAR (ANY | AUTO | literal) RPARENCHAR
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

// --- identification division --------------------------------------------------------------------

identificationDivision
   : (IDENTIFICATION | ID) DIVISION DOT_FS programIdParagraph identificationDivisionBody*
   ;

identificationDivisionBody
   : authorParagraph | installationParagraph | dateWrittenParagraph | dateCompiledParagraph | securityParagraph
   ;

// - program id paragraph ----------------------------------

programIdParagraph
   : PROGRAM_ID DOT_FS programName (IS? (COMMON | INITIAL | LIBRARY | DEFINITION | RECURSIVE) PROGRAM?)? DOT_FS? commentEntry?
   ;

// - author paragraph ----------------------------------

authorParagraph
   : AUTHOR DOT_FS commentEntry?
   ;

// - installation paragraph ----------------------------------

installationParagraph
   : INSTALLATION DOT_FS commentEntry?
   ;

// - date written paragraph ----------------------------------

dateWrittenParagraph
   : DATE_WRITTEN DOT_FS commentEntry?
   ;

// - date compiled paragraph ----------------------------------

dateCompiledParagraph
   : DATE_COMPILED DOT_FS commentEntry?
   ;

// - security paragraph ----------------------------------

securityParagraph
   : SECURITY DOT_FS commentEntry?
   ;

// --- environment division --------------------------------------------------------------------

environmentDivision
   : ENVIRONMENT DIVISION DOT_FS environmentDivisionBody*
   ;

environmentDivisionBody
   : configurationSection | specialNamesParagraph | inputOutputSection | idmsControlSection
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
   : PROGRAM? COLLATING? SEQUENCE (IS? alphabetName+) collatingSequenceClauseAlphanumeric? collatingSequenceClauseNational?
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
   | defaultDisplaySignClause | defaultComputationalSignClause | reserveNetworkClause
   ;

alphabetClause
   : alphabetClauseFormat1 | alphabetClauseFormat2
   ;

alphabetClauseFormat1
   : ALPHABET alphabetName (FOR ALPHANUMERIC)? IS? (EBCDIC | ASCII | STANDARD_1 | STANDARD_2 | NATIVE | cobolWord | alphabetLiterals+)
   ;

alphabetLiterals
   : literal (alphabetThrough | alphabetAlso+)?
   ;

alphabetThrough
   : (THROUGH | THRU) literal
   ;

alphabetAlso
   : ALSO literal+
   ;

alphabetClauseFormat2
   : ALPHABET alphabetName FOR? NATIONAL IS? (NATIVE | CCSVERSION literal)
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
   : environmentName IS? mnemonicName environmentSwitchNameSpecialNamesStatusPhrase? | environmentSwitchNameSpecialNamesStatusPhrase
   ;

environmentSwitchNameSpecialNamesStatusPhrase
   : ON STATUS? IS? condition (OFF STATUS? IS? condition)? | OFF STATUS? IS? condition (ON STATUS? IS? condition)?
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
   : FILE_CONTROL? (DOT_FS? fileControlEntry)* DOT_FS
   ;

fileControlEntry
   : selectClause fileControlClause*
   ;

selectClause
   : SELECT OPTIONAL? fileName
   ;

fileControlClause
   : assignClause | reserveClause | organizationClause | paddingCharacterClause | recordDelimiterClause | accessModeClause | recordKeyClause | alternateRecordKeyClause | fileStatusClause | passwordClause | relativeKeyClause
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

recordDelimiterClause
   : RECORD DELIMITER IS? (STANDARD_1 | IMPLICIT | assignmentName)
   ;

accessModeClause
   : ACCESS MODE? IS? (SEQUENTIAL | RANDOM | DYNAMIC | EXCLUSIVE)
   ;

recordKeyClause
   : RECORD KEY? IS? qualifiedDataName passwordClause? (WITH? DUPLICATES)?
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
   : I_O_CONTROL DOT_FS (fileName DOT_FS)? (ioControlClause* DOT_FS)?
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
   : protocolParagraph (ssNamesLengthParagraph | idmsRecordLocationParagraph)*
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
       : {if(!_input.LT(1).getText().matches("16|18")) { notifyError("cobolParser.subSchemaNameLength", _input.LT(1).getText());}}
       LEVEL_NUMBER
       ;

// --- data division --------------------------------------------------------------------

dataDivision
   : DATA DIVISION DOT_FS dataDivisionSection*
   ;

dataDivisionSection
   : fileSection | workingStorageSection | linkageSection | localStorageSection | schemaSection | mapSection
   ;

// -- file section ----------------------------------

fileSection
   : FILE SECTION DOT_FS fileSectionParagraph*
   ;

fileSectionParagraph
    : (fileDescriptionEntry | copyIdmsFileEntry)+
    ;

fileDescriptionEntry
   : (FD | SD) fileName (DOT_FS? fileDescriptionEntryClause)* DOT_FS dataDescriptionEntry*
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
   : LABEL (RECORD IS? | RECORDS ARE?) (OMITTED | STANDARD | dataName+)
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

copyIdmsFileEntry
    : COPY IDMS FILE idms_copy_entity_name versionClause? DOT_FS?
    ;

// -- working storage section ----------------------------------

workingStorageSection
   : WORKING_STORAGE SECTION DOT_FS dataDescriptionEntry*
   ;

// -- linkage section ----------------------------------

linkageSection
   : LINKAGE SECTION DOT_FS dataDescriptionEntry*
   ;

// -- local storage section ----------------------------------

localStorageSection
   : LOCAL_STORAGE SECTION DOT_FS dataDescriptionEntry*
   ;

dataDescriptionEntry
   : dataDescriptionEntryFormat1
   | dataDescriptionEntryFormat2
   | dataDescriptionEntryFormat1Level77
   | dataDescriptionEntryFormat3
   | dataDescriptionEntryExecSql
   | dataDescriptionEntryCopyIdms
   ;

dataDescriptionEntryFormat1
   : LEVEL_NUMBER entryName? (dataGroupUsageClause | dataRedefinesClause | dataIntegerStringClause
   | dataExternalClause | dataGlobalClause | dataTypeDefClause | dataThreadLocalClause | dataPictureClause
   | dataCommonOwnLocalClause | dataTypeClause | dataUsingClause | dataUsageClause | dataValueClause
   | dataReceivedByClause | dataOccursClause | dataSignClause | dataSynchronizedClause | dataJustifiedClause
   | dataBlankWhenZeroClause | dataWithLowerBoundsClause | dataAlignedClause | dataRecordAreaClause)* (DOT_FS|DOT_FS2)
   ;

dataDescriptionEntryFormat2
   : LEVEL_NUMBER_66 entryName? dataRenamesClause DOT_FS
   ;

dataDescriptionEntryFormat1Level77
   : LEVEL_NUMBER_77 entryName? (dataPictureClause | dataRedefinesClause | dataIntegerStringClause | dataExternalClause
   | dataGlobalClause | dataTypeDefClause | dataThreadLocalClause | dataCommonOwnLocalClause | dataTypeClause
   | dataUsingClause | dataUsageClause | dataValueClause | dataReceivedByClause | dataOccursClause | dataSignClause
   | dataSynchronizedClause | dataJustifiedClause | dataBlankWhenZeroClause | dataWithLowerBoundsClause
   | dataAlignedClause | dataRecordAreaClause)* (DOT_FS|DOT_FS2)
   ;

dataDescriptionEntryFormat3
   : LEVEL_NUMBER_88 entryName? dataValueClause DOT_FS
   ;

entryName
   : (FILLER | dataName1)
   ;

dataDescriptionEntryExecSql
   : execSqlStatement+
   ;

dataGroupUsageClause
   : GROUP_USAGE IS? NATIONAL
   ;

dataAlignedClause
   : ALIGNED
   ;

dataBlankWhenZeroClause
   : BLANK WHEN? (ZERO | ZEROS | ZEROES)
   ;

dataCommonOwnLocalClause
   : COMMON | OWN | LOCAL
   ;

dataExternalClause
   : IS? EXTERNAL (BY literal)?
   ;

dataGlobalClause
   : IS? GLOBAL
   ;

dataIntegerStringClause
   : INTEGER | STRING
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
   : (PICTURE | PIC) IS2? pictureString+
   ;

pictureString
   : charString
   ;

dataReceivedByClause
   : RECEIVED? BY? (CONTENT | REFERENCE | REF)
   ;

dataRecordAreaClause
   : RECORD AREA
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

dataThreadLocalClause
   : IS? THREAD_LOCAL
   ;

dataTypeClause
   : TYPE IS? (SHORT_DATE | LONG_DATE | NUMERIC_DATE | NUMERIC_TIME | LONG_TIME | (CLOB | BLOB | DBCLOB) LPARENCHAR integerLiteral RPARENCHAR)
   ;

dataTypeDefClause
   : IS? TYPEDEF
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

dataUsingClause
   : USING (LANGUAGE | CONVENTION) OF? (cobolWord | dataName)
   ;

dataValueClause
   : ((VALUE | VALUES) (IS | ARE)?) dataValueClauseLiteral
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
   : (THROUGH | THRU) literal
   ;

dataWithLowerBoundsClause
   : WITH? LOWER BOUNDS
   ;

dataDescriptionEntryCopyIdms
    : LEVEL_NUMBER? COPY IDMS (copyIdmsEntity | copyIdmsRecordName | copyIdmsLrName |
    copyIdmsLrCtrl| copyMapName)+
    ;

copyIdmsEntity
    : (SUBSCHEMA_AREANAMES | SUBSCHEMA_CONTROL | SUBSCHEMA_CTRL | SUBSCHEMA_DESCRIPTION |
    SUBSCHEMA_DML_LR_DESCRIPTION | SUBSCHEMA_LR_CONTROL | SUBSCHEMA_LR_DESCRIPTION |
    SUBSCHEMA_LR_NAMES | SUBSCHEMA_LR_RECORDS | SUBSCHEMA_NAMES | SUBSCHEMA_RECNAMES |
    SUBSCHEMA_RECORDS | SUBSCHEMA_SETNAMES | SUBSCHEMA_NAME | MAPS | MAP CONTROLS |
    MAP RECORDS) DOT_FS?
    ;

copyIdmsRecordName
    : RECORD? idms_copy_entity_name (versionClause | dataRedefinesClause)* DOT_FS?
    ;

copyIdmsLrName
    : LR idms_copy_entity_name dataRedefinesClause? DOT_FS?
    ;

copyIdmsLrCtrl
    : SUBSCHEMA_LR_CTRL (SIZE IS? integerLiteral)? DOT_FS?
    ;

copyMapName
    : MAP (CONTROL idms_copy_entity_name | idms_copy_entity_name) DOT_FS?
    ;
//TODO: Throw an error if the rules is triggered on the COPY IDMS MAP without data name specified".
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
    : MAP idms_map_name versionClause? (TYPE IS? (STANDARD | EXTENDED) PAGING?)? DOT_FS?
    ;

versionClause
    : VERSION integerLiteral
    ;

// --- procedure division --------------------------------------------------------------------

procedureDivision
   : PROCEDURE DIVISION procedureDivisionUsingClause? procedureDivisionGivingClause? DOT_FS procedureDeclaratives? procedureDivisionBody
   ;

procedureDivisionUsingClause
   : (USING | CHAINING) procedureDivisionUsingParameter+
   ;

procedureDivisionGivingClause
   : (GIVING | RETURNING) dataName
   ;

procedureDivisionUsingParameter
   : procedureDivisionByReferencePhrase | procedureDivisionByValuePhrase
   ;

procedureDivisionByReferencePhrase
   : (BY? REFERENCE)? procedureDivisionByReference+
   ;

procedureDivisionByReference
   : (OPTIONAL? (fileName | generalIdentifier)) | ANY
   ;

procedureDivisionByValuePhrase
   : BY? VALUE procedureDivisionByValue+
   ;

procedureDivisionByValue
   : literal | generalIdentifier | ANY
   ;

procedureDeclaratives
   : DECLARATIVES DOT_FS procedureDeclarative+ END DECLARATIVES DOT_FS
   ;

procedureDeclarative
     : procedureSectionHeader DOT_FS (useStatement DOT_FS | copyIdmsModule) paragraphs |
     copyIdmsModule
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
   : paragraphName DOT_FS (alteredGoTo | sentence*)
   ;

sentence
   : (statement* DOT_FS | idmsStatements endClause?)+
   ;

statement
   : acceptStatement | addStatement | alterStatement | callStatement | cancelStatement | closeStatement | computeStatement | continueStatement | deleteStatement |
    disableStatement | displayStatement | divideStatement | enableStatement | entryStatement | evaluateStatement | exhibitStatement | execCicsStatement |
    execSqlStatement | execSqlImsStatement | exitStatement | generateStatement | gobackStatement | goToStatement | ifStatement | initializeStatement |
    initiateStatement | inspectStatement | mergeStatement | moveStatement | multiplyStatement | openStatement | performStatement | purgeStatement |
    readStatement | receiveStatement | releaseStatement | returnStatement | rewriteStatement | searchStatement | sendStatement | serviceReloadStatement |
    serviceLabelStatement | setStatement | sortStatement | startStatement | stopStatement | stringStatement | subtractStatement | terminateStatement | unstringStatement |
    writeStatement | xmlStatement
   ;

idmsStatements
    : copyIdmsBinds | copyIdmsModule | abendCodeStatement | attachTaskCodeStatement | bindStatement | changePriorityStatement | checkTerminalStatement | commitStatement |
     connectStatement | dcStatement | dequeueStatement | disconnectStatement | endStatement | endpageStatement | enqueueStatement | eraseStatement | findStatement |
     finishStatement | getStatement | keepStatement | loadStatement | modifyStatement | obtainStatement | postStatement | putStatement | readyStatement |rollbackStatement |
     storeStatement
    ;

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
   : ACCEPT (acceptIdmsDcClause | acceptIdmsDbClause |
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
   : addFrom+ TO addTo+
   ;

addToGivingStatement
   : addFrom+ (TO addToGiving+)? GIVING addGiving+
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
    : ATTACH TASK CODE (generalIdentifier | literal) attachTaskCodePriorityClause? attachTaskCodeWaitClause?
    ;

attachTaskCodePriorityClause
    : PRIORITY (integerLiteral | generalIdentifier)
    ;

attachTaskCodeWaitClause
    : (WAIT | NOWAIT)
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
   : CALL (generalIdentifier | literal) callUsingPhrase? callGivingPhrase? onOverflowPhrase? onExceptionClause? notOnExceptionClause? END_CALL?
   ;

callUsingPhrase
   : USING callUsingParameter (COMMACHAR? callUsingParameter)*
   ;

callUsingParameter
   : callByReferencePhrase | callByValuePhrase | callByContentPhrase
   ;

callByReferencePhrase
   : (BY? REFERENCE)? callByReference+
   ;

callByReference
   : ((ADDRESS OF | INTEGER | STRING)? literal | generalIdentifier | fileName) | OMITTED
   ;

callByValuePhrase
   : BY? VALUE callByValue+
   ;

callByValue
   : (ADDRESS OF | LENGTH OF?)? (literal | generalIdentifier)
   ;

callByContentPhrase
   : BY? CONTENT callByContent+
   ;

callByContent
   : (ADDRESS OF | LENGTH OF?)? literal | generalIdentifier | OMITTED
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
    : MAX LENGTH (generalIdentifier | idms_quoted_number)
    ;

checkTerminalReturnLengthClause
    : RETURN LENGTH INTO? generalIdentifier
    ;

// close statement

closeStatement
   : CLOSE closeFile+
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
   : COMPUTE computeStore+ (EQUALCHAR | EQUAL) arithmeticExpression onSizeErrorPhrase? notOnSizeErrorPhrase? END_COMPUTE?
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

// copy idms statement in procedure section
copyIdmsBinds
    : COPY IDMS (SUBSCHEMA_BINDS | SUBSCHEMA_RECORD_BINDS | MAP_BINDS ) endClause?
    ;

copyIdmsModule
    : COPY IDMS MODULE? idms_copy_entity_name versionClause? endClause?
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
   : DELETE (deleteFilenameClause | deleteQueueClause | deleteScratchClause)
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
   : DISPLAY displayOperand+ displayAt? displayUpon? displayWith?
   ;

displayOperand
   : literal | generalIdentifier
   ;

displayAt
   : AT (literal | generalIdentifier)
   ;

displayUpon
   : UPON (mnemonicName | environmentName)
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
   : LINE TERMINAL SESSION
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
   : ENTRY literal (USING generalIdentifier+)?
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
   : literal | arithmeticExpression | condition | generalIdentifier
   ;

evaluateAlsoSelect
   : ALSO evaluateSelect
   ;

evaluateWhenPhrase
   : evaluateWhen+ statement*
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
   : WHEN OTHER statement*
   ;

evaluateValue
   : literal | arithmeticExpression | generalIdentifier
   ;

// exec cics statement
execCicsStatement
   : EXEC CICS allCicsRules END_EXEC DOT_FS?
   ;

// exec sql statement
execSqlStatement
   : EXEC_SQL allSqlRules END_EXEC DOT_FS?
   | (EXEC | SQL) {notifyError("cobolParser.missingSqlKeyword");} allSqlRules END_EXEC DOT_FS?
   ;

// exec sql ims statement

execSqlImsStatement
   : EXEC SQLIMS ~END_EXEC*? END_EXEC DOT_FS?
   ;

// exhibit statement

exhibitStatement
   : EXHIBIT NAMED? CHANGED? exhibitOperand+
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
    : (orderClause | (integerLiteral | generalIdentifier)) idms_db_entity_name? WITHIN idms_db_entity_name
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
    : GET (idms_db_entity_name | getQueueClause | getScratchClause | getStorageClause | getTimeClause)?
    ;

getQueueClause
    : QUEUE (ID (generalIdentifier | literal))? getQueueTypeClause? getStatClause? getQueueLockClause?  getWaitClause? INTO generalIdentifier getLengthClause getReturnClause?
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

getWaitClause
    : (WAIT | NOWAIT)
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
    : STORAGE FOR generalIdentifier (TO generalIdentifier)? (LENGTH generalIdentifier)? (POINTER generalIdentifier)? getWaitClause? KEEP? (LONG | SHORT)? (USER | SHARED)? (STGID (generalIdentifier | literal))? getStorageValueClause? getStorageLocClause?
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
   : GO TO? (goToStatementSimple | goToDependingOnStatement)
   ;

goToStatementSimple
   : procedureName
   ;

goToDependingOnStatement
   : procedureName+ (DEPENDING ON? generalIdentifier)? | MORE_LABELS
   ;

// if statement

ifStatement
   : IF (idmsIfCondition | condition) ifThen ifElse? END_IF?
   ;

ifThen
   : THEN? (NEXT SENTENCE | statement+?)
   ;

ifElse
   : ELSE (NEXT SENTENCE | statement+?)
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
   : INITIALIZE generalIdentifier+ initializeReplacingPhrase?
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
    : LOAD TABLE (generalIdentifier | idms_program_name) INTO generalIdentifier loadLocationClause loadDictnodeClause? loadDictnameClause? loadLoadlibClause? (WAIT | NOWAIT)
    ;

loadLocationClause
    : (TO | POINTER) generalIdentifier
    ;

loadDictnodeClause
    : DICTNODE (generalIdentifier | literal)
    ;

loadDictnameClause
    : DICTNAME (generalIdentifier | literal)
    ;

loadLoadlibClause
    : LOADLIB (generalIdentifier | literal)
    ;

// merge statement

mergeStatement
   : MERGE fileName mergeOnKeyClause+ mergeCollatingSequencePhrase? mergeUsing* mergeOutputProcedurePhrase? mergeGivingPhrase*
   ;

mergeOnKeyClause
   : ON? (ASCENDING | DESCENDING) KEY? qualifiedDataName+
   ;

mergeCollatingSequencePhrase
   : COLLATING? SEQUENCE IS? alphabetName+ mergeCollatingAlphanumeric? mergeCollatingNational?
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
   : GIVING mergeGiving+
   ;

mergeGiving
   : fileName (LOCK | SAVE | NO REWIND | CRUNCH | RELEASE | WITH REMOVE CRUNCH)?
   ;

// modify statement
modifyStatement
    : MODIFY idms_db_entity_name
    ;

// move statement

moveStatement
   : MOVE ALL? (moveToStatement | moveCorrespondingToStatement)
   ;

moveToStatement
   : moveToSendingArea TO generalIdentifier+
   ;

moveToSendingArea
   : literal | generalIdentifier
   ;

moveCorrespondingToStatement
   : (CORRESPONDING | CORR) moveCorrespondingToSendingArea TO generalIdentifier+
   ;

moveCorrespondingToSendingArea
   : generalIdentifier
   ;

// multiply statement

multiplyStatement
   : MULTIPLY (literal | generalIdentifier) BY (multiplyRegular | multiplyGiving) onSizeErrorPhrase? notOnSizeErrorPhrase? END_MULTIPLY?
   ;

multiplyRegular
   : multiplyRegularOperand+
   ;

multiplyRegularOperand
   : generalIdentifier ROUNDED?
   ;

multiplyGiving
   : multiplyGivingOperand GIVING multiplyGivingResult+
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
   : INPUT openInput+
   ;

openInput
   : fileName (REVERSED | WITH? NO REWIND)?
   ;

openOutputStatement
   : OUTPUT openOutput+
   ;

openOutput
   : fileName (WITH? NO REWIND)?
   ;

openIOStatement
   : I_O fileName+
   ;

openExtendStatement
   : EXTEND fileName+
   ;

// perform statement

performStatement
   : PERFORM (performInlineStatement | performProcedureStatement)
   ;

performInlineStatement
   : performType? statement* END_PERFORM
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
   : QUEUE (ID (generalIdentifier | literal))? (FIRST | LAST)? FROM generalIdentifier putQueueLengthClause putReturnClause? putRetentionClause?
   ;

putQueueLengthClause
   : ((TO generalIdentifier) | (LENGTH (generalIdentifier | integerLiteral)))
   ;

putReturnClause
   : RETURN RECORD ID INTO generalIdentifier?
   ;

putRetentionClause
   : RETENTION (generalIdentifier | integerLiteral)
   ;

putScratchClause
   : SCRATCH putAreaIdClause? FROM generalIdentifier putScratchLengthClause putRecordClause? putReturnClause
   ;

putAreaIdClause
   : AREA ID (generalIdentifier | literal)
   ;

putScratchLengthClause
   : (TO generalIdentifier) | (LENGTH (generalIdentifier | integerLiteral))
   ;

putRecordClause
   : RECORD ID (generalIdentifier | integerLiteral) REPLACE?
   ;

// read statement

readStatement
   : READ (readFilenameClause | readTerminalClause)
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
   : TERMINAL (WAIT | NOWAIT)? (BUFFER | (MODIFIED FROM POSITION (generalIdentifier | literal)))? (GET STORAGE)? INTO? generalIdentifier ((TO generalIdentifier) | (MAX LENGTH (generalIdentifier | integerLiteral))) (RETURN LENGTH INTO? generalIdentifier)?
   ;

// ready statement
readyStatement
    : READY idms_db_entity_name? (USAGE_MODE IS? (PROTECTED | EXCLUSIVE)? (RETRIEVAL | UPDATE))?
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
   : NO DATA statement*
   ;

receiveWithData
   : WITH DATA statement*
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
   : RETURN (cobolReturn | idmsReturn)
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
   : WHEN condition (NEXT SENTENCE | statement*)
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
   : MESSAGE (ONLY | ALWAYS)? TO sendIdmsToClause FROM generalIdentifier sendIdmsLengthClause
   ;

sendIdmsToClause
   : (DEST ID (generalIdentifier | literal)) | (USER ID generalIdentifier) | (LTERM ID (generalIdentifier | literal))
   ;

sendIdmsLengthClause
   : (TO generalIdentifier) | (LENGTH (generalIdentifier | integerLiteral))
   ;

// set statement

setStatement
   : SET (setToStatement+ | setUpDownByStatement | setAbendExitStatement | setTimerStatement)
   ;

setToStatement
   : setTo+ TO setToValue+
   ;

setUpDownByStatement
   : setTo+ (UP BY | DOWN BY) setByValue
   ;

setTo
   : generalIdentifier
   ;

setToValue
   : ON | OFF | ENTRY (literal | generalIdentifier) | literal | generalIdentifier
   ;

setByValue
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
   : DATA FROM generalIdentifier ((TO generalIdentifier) | (LENGTH (generalIdentifier | integerLiteral)))
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
   : ON? (ASCENDING | DESCENDING) KEY? qualifiedDataName+
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
   : USING fileName+
   ;

sortOutputProcedurePhrase
   : OUTPUT PROCEDURE IS? procedureName sortOutputThrough?
   ;

sortOutputThrough
   : (THROUGH | THRU) procedureName
   ;

sortGivingPhrase
   : GIVING sortGiving+
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

// store statement
storeStatement
    : STORE idms_db_entity_name
    ;

// string statement

stringStatement
   : STRING stringSendingPhrase+ stringIntoPhrase stringWithPointerPhrase? onOverflowPhrase? notOnOverflowPhrase? END_STRING?
   ;

stringSendingPhrase
   : stringSending (COMMACHAR? stringSending)* (stringDelimitedByPhrase | stringForPhrase)
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
   :  subtractSubtrahend+ FROM subtractMinuend+
   ;

subtractFromGivingStatement
   : subtractSubtrahend+ FROM subtractMinuendGiving GIVING subtractGiving+
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
   : UNSTRING unstringSendingPhrase unstringIntoPhrase unstringWithPointerPhrase? unstringTallyingPhrase? onOverflowPhrase? notOnOverflowPhrase? END_UNSTRING?
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
   : INTO unstringInto+
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
   : INPUT | OUTPUT | I_O | EXTEND | fileName+
   ;

useDebugClause
   : FOR? DEBUGGING ON? useDebugOn+
   ;

useDebugOn
   : ALL PROCEDURES | ALL REFERENCES? OF? generalIdentifier | procedureName | fileName
   ;

// write statement

writeStatement
   : WRITE recordName writeFromPhrase? writeAdvancingPhrase? writeAtEndOfPagePhrase? writeNotAtEndOfPagePhrase? invalidKeyPhrase? notInvalidKeyPhrase? END_WRITE?
   ;

writeFromPhrase
   : FROM (literal | generalIdentifier)
   ;

writeAdvancingPhrase
   : (BEFORE | AFTER) ADVANCING? (writeAdvancingPage | writeAdvancingLines | writeAdvancingMnemonic)
   ;

writeAdvancingPage
   : PAGE
   ;

writeAdvancingLines
   : (literal | generalIdentifier) (LINE | LINES)?
   ;

writeAdvancingMnemonic
   : mnemonicName
   ;

writeAtEndOfPagePhrase
   : AT? (END_OF_PAGE | EOP) statement*
   ;

writeNotAtEndOfPagePhrase
   : NOT AT? (END_OF_PAGE | EOP) statement*
   ;

// xml statement

xmlStatement
   : XML PARSE generalIdentifier xmlEncoding?  xmlNational?  xmlValidating? xmlProcessinProcedure xmlThru?  onExceptionClause?  notOnExceptionClause? END_XML?
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
   : AT? END statement*
   ;

notAtEndPhrase
   : NOT AT? END statement*
   ;

invalidKeyPhrase
   : INVALID KEY? statement*
   ;

notInvalidKeyPhrase
   : NOT INVALID KEY? statement*
   ;

onOverflowPhrase
   : ON? OVERFLOW statement*
   ;

notOnOverflowPhrase
   : NOT ON? OVERFLOW statement*
   ;

onSizeErrorPhrase
   : ON? SIZE ERROR statement*
   ;

notOnSizeErrorPhrase
   : NOT ON? SIZE ERROR statement*
   ;

// statement clauses ----------------------------------

onExceptionClause
   : ON? EXCEPTION statement*
   ;

notOnExceptionClause
   : NOT ON? EXCEPTION statement*
   ;

// condition ----------------------------------

condition
   : combinableCondition andOrCondition*
   ;

andOrCondition
   : (AND | OR) (combinableCondition | abbreviation+)
   ;

combinableCondition
   : NOT? simpleCondition
   ;

simpleCondition
   : LPARENCHAR condition RPARENCHAR | relationCondition | classCondition | conditionNameReference
   ;

classCondition
   : generalIdentifier IS? NOT? (NUMERIC | ALPHABETIC | ALPHABETIC_LOWER | ALPHABETIC_UPPER | DBCS | KANJI | className)
   ;

conditionNameReference
   : conditionName (inData* inFile? conditionNameSubscriptReference* | inMnemonic*)
   ;

conditionNameSubscriptReference
   : LPARENCHAR subscript (COMMACHAR? subscript)* RPARENCHAR
   ;

// relation ----------------------------------

relationCondition
   : relationSignCondition | relationArithmeticComparison | relationCombinedComparison
   ;

relationSignCondition
   : arithmeticExpression IS? NOT? (POSITIVE | NEGATIVE | ZERO)
   ;

relationArithmeticComparison
   : arithmeticExpression relationalOperator arithmeticExpression
   ;

relationCombinedComparison
   : arithmeticExpression relationalOperator LPARENCHAR relationCombinedCondition RPARENCHAR
   ;

relationCombinedCondition
   : arithmeticExpression ((AND | OR) arithmeticExpression)+
   ;

relationalOperator
   : (IS | ARE)? (NOT? (GREATER THAN? | MORETHANCHAR | LESS THAN? | LESSTHANCHAR | EQUAL TO? | EQUALCHAR) | NOTEQUALCHAR | GREATER THAN? OR EQUAL TO? | MORETHANOREQUAL | LESS THAN? OR EQUAL TO? | LESSTHANOREQUAL)
   ;

abbreviation
   : NOT? relationalOperator? (arithmeticExpression | LPARENCHAR arithmeticExpression abbreviation RPARENCHAR)
   ;

// comment entry
commentEntry
   : COMMENTENTRYLINE+
   ;

idms_map_name
    : T=dataName {validateLength($T.text, "map name", 8);}
    ;

idms_copy_entity_name
    : T=dataName {validateLength($T.text, "copy entity name", 32);}
    ;

idms_db_entity_name
    : T=dataName {validateLength($T.text, "db entity name", 16);}
    ;

idms_procedure_name
    : T=dataName {validateLength($T.text, "procedure name", 8);}
    ;

idms_schema_name
    : T=dataName {validateLength($T.text, "schema name", 8);}
    ;

idms_subschema_name
    : T=dataName {validateLength($T.text, "subschema name", 8);}
    ;

idms_program_name
    : T=literal {validateLength($T.text.substring(1, $T.text.length() -1), "program name", 8);}
    ;

idms_quoted_number
    : {_input.LT(1).getText().matches("'\\d+'")}? NONNUMERICLITERAL
    ;

