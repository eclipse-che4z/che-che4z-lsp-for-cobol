/*
* Copyright (C) 2017, Ulrich Wolffgang <ulrich.wolffgang@proleap.io>
* All rights reserved.
*
* This software may be modified and distributed under the terms
* of the MIT license. See the LICENSE file for details.
*/

parser grammar CobolParser;
options {tokenVocab = CobolLexer;}
import CICSParser;
   
startRule : compilationUnit EOF;

compilationUnit
   : programUnit+
   ;

programUnit
   : identificationDivision environmentDivision? dataDivision? procedureDivision? programUnit* endProgramStatement?
   ;

endProgramStatement
   : END PROGRAM programName DOT_FS
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
   : configurationSection | specialNamesParagraph | inputOutputSection
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
   : channelClause | odtClause | alphabetClause | classClause | currencySignClause | decimalPointClause | symbolicCharactersClause | environmentSwitchNameClause | defaultDisplaySignClause | defaultComputationalSignClause | reserveNetworkClause
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
   : generalIdentifier | literal
   ;

classClauseTo
   : generalIdentifier | literal
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
   : ASSIGN TO? (DISK | DISPLAY | KEYBOARD | PORT | PRINTER | READER | REMOTE | TAPE | VIRTUAL | (DYNAMIC | EXTERNAL)? assignmentName | literal)
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

// --- data division --------------------------------------------------------------------

dataDivision
   : DATA DIVISION DOT_FS dataDivisionSection*
   ;

dataDivisionSection
   : fileSection | dataBaseSection | workingStorageSection | linkageSection | communicationSection | localStorageSection | screenSection | reportSection | programLibrarySection
   ;

// -- file section ----------------------------------

fileSection
   : FILE SECTION DOT_FS fileDescriptionEntry*
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

// -- data base section ----------------------------------

dataBaseSection
   : DATA_BASE SECTION DOT_FS dataBaseSectionEntry*
   ;

dataBaseSectionEntry
   : integerLiteral literal INVOKE literal
   ;

// -- working storage section ----------------------------------

workingStorageSection
   : WORKING_STORAGE SECTION DOT_FS dataDescriptionEntry*
   ;

// -- linkage section ----------------------------------

linkageSection
   : LINKAGE SECTION DOT_FS dataDescriptionEntry*
   ;

// -- communication section ----------------------------------

communicationSection
   : COMMUNICATION SECTION DOT_FS (communicationDescriptionEntry | dataDescriptionEntry)*
   ;

communicationDescriptionEntry
   : communicationDescriptionEntryFormat1 | communicationDescriptionEntryFormat2 | communicationDescriptionEntryFormat3
   ;

communicationDescriptionEntryFormat1
   : CD cdName FOR? INITIAL? INPUT ((symbolicQueueClause | symbolicSubQueueClause | messageDateClause | messageTimeClause | symbolicSourceClause | textLengthClause | endKeyClause | statusKeyClause | messageCountClause) | dataDescName)* DOT_FS
   ;

communicationDescriptionEntryFormat2
   : CD cdName FOR? OUTPUT (destinationCountClause | textLengthClause | statusKeyClause | destinationTableClause | errorKeyClause | symbolicDestinationClause)* DOT_FS
   ;

communicationDescriptionEntryFormat3
   : CD cdName FOR? INITIAL I_O ((messageDateClause | messageTimeClause | symbolicTerminalClause | textLengthClause | endKeyClause | statusKeyClause) | dataDescName)* DOT_FS
   ;

destinationCountClause
   : DESTINATION COUNT IS? dataDescName
   ;

destinationTableClause
   : DESTINATION TABLE OCCURS integerLiteral TIMES (INDEXED BY indexName+)?
   ;

endKeyClause
   : END KEY IS? dataDescName
   ;

errorKeyClause
   : ERROR KEY IS? dataDescName
   ;

messageCountClause
   : MESSAGE? COUNT IS? dataDescName
   ;

messageDateClause
   : MESSAGE DATE IS? dataDescName
   ;

messageTimeClause
   : MESSAGE TIME IS? dataDescName
   ;

statusKeyClause
   : STATUS KEY IS? dataDescName
   ;

symbolicDestinationClause
   : SYMBOLIC? DESTINATION IS? dataDescName
   ;

symbolicQueueClause
   : SYMBOLIC? QUEUE IS? dataDescName
   ;

symbolicSourceClause
   : SYMBOLIC? SOURCE IS? dataDescName
   ;

symbolicTerminalClause
   : SYMBOLIC? TERMINAL IS? dataDescName
   ;

symbolicSubQueueClause
   : SYMBOLIC? (SUB_QUEUE_1 | SUB_QUEUE_2 | SUB_QUEUE_3) IS? dataDescName
   ;

textLengthClause
   : TEXT LENGTH IS? dataDescName
   ;

// -- local storage section ----------------------------------

localStorageSection
   : LOCAL_STORAGE SECTION DOT_FS (LD localName DOT_FS)? dataDescriptionEntry*
   ;

// -- screen section ----------------------------------

screenSection
   : SCREEN SECTION DOT_FS screenDescriptionEntry*
   ;

screenDescriptionEntry
   : INTEGERLITERAL (FILLER | screenName)? (screenDescriptionBlankClause | screenDescriptionBellClause | screenDescriptionBlinkClause | screenDescriptionEraseClause | screenDescriptionLightClause | screenDescriptionGridClause | screenDescriptionReverseVideoClause | screenDescriptionUnderlineClause | screenDescriptionSizeClause | screenDescriptionLineClause | screenDescriptionColumnClause | screenDescriptionForegroundColorClause | screenDescriptionBackgroundColorClause | screenDescriptionControlClause | screenDescriptionValueClause | screenDescriptionPictureClause | (screenDescriptionFromClause | screenDescriptionUsingClause) | screenDescriptionUsageClause | screenDescriptionBlankWhenZeroClause | screenDescriptionJustifiedClause | screenDescriptionSignClause | screenDescriptionAutoClause | screenDescriptionSecureClause | screenDescriptionRequiredClause | screenDescriptionPromptClause | screenDescriptionFullClause | screenDescriptionZeroFillClause)* DOT_FS
   ;

screenDescriptionBlankClause
   : BLANK (SCREEN | LINE)
   ;

screenDescriptionBellClause
   : BELL | BEEP
   ;

screenDescriptionBlinkClause
   : BLINK
   ;

screenDescriptionEraseClause
   : ERASE (EOL | EOS)
   ;

screenDescriptionLightClause
   : HIGHLIGHT | LOWLIGHT
   ;

screenDescriptionGridClause
   : GRID | LEFTLINE | OVERLINE
   ;

screenDescriptionReverseVideoClause
   : REVERSE_VIDEO
   ;

screenDescriptionUnderlineClause
   : UNDERLINE
   ;

screenDescriptionSizeClause
   : SIZE IS? (generalIdentifier | integerLiteral)
   ;

screenDescriptionLineClause
   : LINE (NUMBER? IS? (PLUS | PLUSCHAR | MINUSCHAR))? (generalIdentifier | integerLiteral)
   ;

screenDescriptionColumnClause
   : (COLUMN | COL) (NUMBER? IS? (PLUS | PLUSCHAR | MINUSCHAR))? (generalIdentifier | integerLiteral)
   ;

screenDescriptionForegroundColorClause
   : (FOREGROUND_COLOR | FOREGROUND_COLOUR) IS? (generalIdentifier | integerLiteral)
   ;

screenDescriptionBackgroundColorClause
   : (BACKGROUND_COLOR | BACKGROUND_COLOUR) IS? (generalIdentifier | integerLiteral)
   ;

screenDescriptionControlClause
   : CONTROL IS? generalIdentifier
   ;

screenDescriptionValueClause
   : (VALUE IS?) literal
   ;

screenDescriptionPictureClause
   : (PICTURE | PIC) IS2? pictureString
   ;

screenDescriptionFromClause
   : FROM (generalIdentifier | literal) screenDescriptionToClause?
   ;

screenDescriptionToClause
   : TO generalIdentifier
   ;

screenDescriptionUsingClause
   : USING generalIdentifier
   ;

screenDescriptionUsageClause
   : (USAGE IS?) (DISPLAY | DISPLAY_1)
   ;

screenDescriptionBlankWhenZeroClause
   : BLANK WHEN? ZERO
   ;

screenDescriptionJustifiedClause
   : (JUSTIFIED | JUST) RIGHT?
   ;

screenDescriptionSignClause
   : (SIGN IS?)? (LEADING | TRAILING) (SEPARATE CHARACTER?)?
   ;

screenDescriptionAutoClause
   : AUTO | AUTO_SKIP
   ;

screenDescriptionSecureClause
   : SECURE | NO_ECHO
   ;

screenDescriptionRequiredClause
   : REQUIRED | EMPTY_CHECK
   ;

screenDescriptionPromptClause
   : PROMPT CHARACTER? IS? (generalIdentifier | literal) screenDescriptionPromptOccursClause?
   ;

screenDescriptionPromptOccursClause
   : OCCURS integerLiteral TIMES?
   ;

screenDescriptionFullClause
   : FULL | LENGTH_CHECK
   ;

screenDescriptionZeroFillClause
   : ZERO_FILL
   ;

// -- report section ----------------------------------

reportSection
   : REPORT SECTION DOT_FS reportDescription*
   ;

reportDescription
   : reportDescriptionEntry reportGroupDescriptionEntry+
   ;

reportDescriptionEntry
   : RD reportName reportDescriptionGlobalClause? (reportDescriptionPageLimitClause reportDescriptionHeadingClause? reportDescriptionFirstDetailClause? reportDescriptionLastDetailClause? reportDescriptionFootingClause?)? DOT_FS
   ;

reportDescriptionGlobalClause
   : IS? GLOBAL
   ;

reportDescriptionPageLimitClause
   : PAGE (LIMIT IS? | LIMITS ARE?)? integerLiteral (LINE | LINES)?
   ;

reportDescriptionHeadingClause
   : HEADING integerLiteral
   ;

reportDescriptionFirstDetailClause
   : FIRST DETAIL integerLiteral
   ;

reportDescriptionLastDetailClause
   : LAST DETAIL integerLiteral
   ;

reportDescriptionFootingClause
   : FOOTING integerLiteral
   ;

reportGroupDescriptionEntry
   : reportGroupDescriptionEntryFormat1 | reportGroupDescriptionEntryFormat2 | reportGroupDescriptionEntryFormat3
   ;

reportGroupDescriptionEntryFormat1
   : integerLiteral dataName reportGroupLineNumberClause? reportGroupNextGroupClause? reportGroupTypeClause reportGroupUsageClause? DOT_FS
   ;

reportGroupDescriptionEntryFormat2
   : integerLiteral dataName? reportGroupLineNumberClause? reportGroupUsageClause DOT_FS
   ;

reportGroupDescriptionEntryFormat3
   : integerLiteral dataName? (reportGroupPictureClause | reportGroupUsageClause | reportGroupSignClause | reportGroupJustifiedClause | reportGroupBlankWhenZeroClause | reportGroupLineNumberClause | reportGroupColumnNumberClause | (reportGroupSourceClause | reportGroupValueClause | reportGroupSumClause | reportGroupResetClause) | reportGroupIndicateClause)* DOT_FS
   ;

reportGroupBlankWhenZeroClause
   : BLANK WHEN? ZERO
   ;

reportGroupColumnNumberClause
   : COLUMN NUMBER? IS? integerLiteral
   ;

reportGroupIndicateClause
   : GROUP INDICATE?
   ;

reportGroupJustifiedClause
   : (JUSTIFIED | JUST) RIGHT?
   ;

reportGroupLineNumberClause
   : LINE? NUMBER? IS? (reportGroupLineNumberNextPage | reportGroupLineNumberPlus)
   ;

reportGroupLineNumberNextPage
   : integerLiteral (ON? NEXT PAGE)?
   ;

reportGroupLineNumberPlus
   : PLUS integerLiteral
   ;

reportGroupNextGroupClause
   : NEXT GROUP IS? (integerLiteral | reportGroupNextGroupNextPage | reportGroupNextGroupPlus)
   ;

reportGroupNextGroupPlus
   : PLUS integerLiteral
   ;

reportGroupNextGroupNextPage
   : NEXT PAGE
   ;

reportGroupPictureClause
   : (PICTURE | PIC) IS2? pictureString
   ;

reportGroupResetClause
   : RESET ON? (FINAL | dataName)
   ;

reportGroupSignClause
   : SIGN IS? (LEADING | TRAILING) SEPARATE CHARACTER?
   ;

reportGroupSourceClause
   : SOURCE IS? generalIdentifier
   ;

reportGroupSumClause
   : SUM generalIdentifier (COMMACHAR? generalIdentifier)* (UPON dataName (COMMACHAR? dataName)*)?
   ;

reportGroupTypeClause
   : TYPE IS? (reportGroupTypeReportHeading | reportGroupTypePageHeading | reportGroupTypeControlHeading | reportGroupTypeDetail | reportGroupTypeControlFooting | reportGroupTypePageFooting | reportGroupTypeReportFooting)
   ;

reportGroupTypeReportHeading
   : REPORT HEADING | RH
   ;

reportGroupTypePageHeading
   : PAGE HEADING | PH
   ;

reportGroupTypeControlHeading
   : (CONTROL HEADING | CH) (FINAL | dataName)
   ;

reportGroupTypeDetail
   : DETAIL | DE
   ;

reportGroupTypeControlFooting
   : (CONTROL FOOTING | CF) (FINAL | dataName)
   ;

reportGroupUsageClause
   : (USAGE IS?)? (DISPLAY | DISPLAY_1)
   ;

reportGroupTypePageFooting
   : PAGE FOOTING | PF
   ;

reportGroupTypeReportFooting
   : REPORT FOOTING | RF
   ;

reportGroupValueClause
   : VALUE IS? literal
   ;

// -- program library section ----------------------------------

programLibrarySection
   : PROGRAM_LIBRARY SECTION DOT_FS libraryDescriptionEntry*
   ;

libraryDescriptionEntry
   : libraryDescriptionEntryFormat1 | libraryDescriptionEntryFormat2
   ;

libraryDescriptionEntryFormat1
   : LD libraryName EXPORT libraryAttributeClauseFormat1? libraryEntryProcedureClauseFormat1?
   ;

libraryDescriptionEntryFormat2
   : LB libraryName IMPORT libraryIsGlobalClause? libraryIsCommonClause? (libraryAttributeClauseFormat2 | libraryEntryProcedureClauseFormat2)*
   ;

libraryAttributeClauseFormat1
   : ATTRIBUTE (SHARING IS? (DONTCARE | PRIVATE | SHAREDBYRUNUNIT | SHAREDBYALL))?
   ;

libraryAttributeClauseFormat2
   : ATTRIBUTE libraryAttributeFunction? (LIBACCESS IS? (BYFUNCTION | BYTITLE))? libraryAttributeParameter? libraryAttributeTitle?
   ;

libraryAttributeFunction
   : FUNCTIONNAME IS literal
   ;

libraryAttributeParameter
   : LIBPARAMETER IS? literal
   ;

libraryAttributeTitle
   : TITLE IS? literal
   ;

libraryEntryProcedureClauseFormat1
   : ENTRY_PROCEDURE programName libraryEntryProcedureForClause?
   ;

libraryEntryProcedureClauseFormat2
   : ENTRY_PROCEDURE programName libraryEntryProcedureForClause? libraryEntryProcedureWithClause? libraryEntryProcedureUsingClause? libraryEntryProcedureGivingClause?
   ;

libraryEntryProcedureForClause
   : FOR literal
   ;

libraryEntryProcedureGivingClause
   : GIVING dataName
   ;

libraryEntryProcedureUsingClause
   : USING libraryEntryProcedureUsingName+
   ;

libraryEntryProcedureUsingName
   : dataName | fileName
   ;

libraryEntryProcedureWithClause
   : WITH libraryEntryProcedureWithName+
   ;

libraryEntryProcedureWithName
   : localName | fileName
   ;

libraryIsCommonClause
   : IS? COMMON
   ;

libraryIsGlobalClause
   : IS? GLOBAL
   ;

// data description entry ----------------------------------

// data description utils ----------------------------------


otherLevel: LEVEL
;

// end of data description utils ---------------------------

dataDescriptionEntry
   : dataDescriptionEntryFormat1 | dataDescriptionEntryFormat2 | dataDescriptionEntryFormat3 | dataDescriptionEntryExecSql | dataDescriptionEntryCpy | dataDescriptionExitCpy
   ;

dataDescriptionEntryFormat1
   : otherLevel (FILLER | dataName1)? (dataGroupUsageClause | dataRedefinesClause | dataIntegerStringClause | dataExternalClause | dataGlobalClause | dataTypeDefClause | dataThreadLocalClause | dataPictureClause | dataCommonOwnLocalClause | dataTypeClause | dataUsingClause | dataUsageClause | dataValueClause | dataReceivedByClause | dataOccursClause | dataSignClause | dataSynchronizedClause | dataJustifiedClause | dataBlankWhenZeroClause | dataWithLowerBoundsClause | dataAlignedClause | dataRecordAreaClause)* (DOT_FS|DOT_FS2)
   ;
   
dataDescriptionEntryFormat2
   : LEVEL_NUMBER_66 dataName1 dataRenamesClause DOT_FS
   ;

dataDescriptionEntryFormat3
   : LEVEL_NUMBER_88 dataName1 dataValueClause DOT_FS
   ;

dataDescriptionEntryExecSql
   : execSqlStatement+
   ;

dataDescriptionEntryCpy
   : COPYENTRY
   ;

dataDescriptionExitCpy
   : COPYEXIT
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
   
charString
   : FINALCHARSTRING
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
   : RENAMES qualifiedDataName ((THROUGH | THRU) qualifiedDataName)?
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
   : (USAGE IS?)? (BINARY (TRUNCATED | EXTENDED)? | BIT | COMP | COMP_1 | COMP_2 | COMP_3 | COMP_4 | COMP_5 | COMPUTATIONAL | COMPUTATIONAL_1 | COMPUTATIONAL_2 | COMPUTATIONAL_3 | COMPUTATIONAL_4 | COMPUTATIONAL_5 | CONTROL_POINT | DATE | DISPLAY | DISPLAY_1 | DOUBLE | EVENT | FUNCTION_POINTER | INDEX | KANJI | LOCK | NATIONAL | PACKED_DECIMAL | POINTER | PROCEDURE_POINTER | REAL | SQL | TASK)
   ;

dataUsingClause
   : USING (LANGUAGE | CONVENTION) OF? (cobolWord | dataName)
   ;

dataValueClause
   : ((VALUE | VALUES) (IS | ARE)?) dataValueInterval (COMMACHAR? dataValueInterval)*
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
   : (OPTIONAL? (generalIdentifier | fileName)) | ANY
   ;

procedureDivisionByValuePhrase
   : BY? VALUE procedureDivisionByValue+
   ;

procedureDivisionByValue
   : generalIdentifier | literal | ANY
   ;

procedureDeclaratives
   : DECLARATIVES DOT_FS procedureDeclarative+ END DECLARATIVES DOT_FS
   ;

procedureDeclarative
   : procedureSectionHeader DOT_FS useStatement DOT_FS paragraphs
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
   : (statement* DOT_FS) | skipStatement+ | enterCpy | exitCpy
   ;

statement
   : acceptStatement | addStatement | alterStatement | callStatement | cancelStatement | closeStatement | computeStatement | continueStatement | deleteStatement | disableStatement |
    displayStatement | divideStatement | enableStatement | entryStatement | evaluateStatement | exhibitStatement | execCicsStatement | execSqlStatement | execSqlImsStatement | 
    exitStatement | generateStatement | gobackStatement | goToStatement | ifStatement | initializeStatement | initiateStatement | inspectStatement | mergeStatement | moveStatement | 
    multiplyStatement | openStatement | performStatement | purgeStatement | readStatement | receiveStatement | releaseStatement | returnStatement | rewriteStatement | searchStatement | 
    sendStatement | serviceReloadStatement | serviceLabelStatement | setStatement | sortStatement | startStatement | stopStatement | stringStatement | subtractStatement |
    terminateStatement | titleStatement | unstringStatement | writeStatement | xmlStatement | enterCpy | exitCpy
   ;

enterCpy
   : COPYENTRY
   ;

exitCpy
   : COPYEXIT
   ;

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
   : addFrom+ TO addTo+
   ;

addToGivingStatement
   : addFrom+ (TO addToGiving+)? GIVING addGiving+
   ;

addCorrespondingStatement
   : (CORRESPONDING | CORR) generalIdentifier TO addTo
   ;

addFrom
   : generalIdentifier | literal
   ;

addTo
   : generalIdentifier ROUNDED?
   ;

addToGiving
   : generalIdentifier | literal
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
   : CALL (generalIdentifier | literal) callUsingPhrase? callGivingPhrase? onOverflowPhrase? onExceptionClause? notOnExceptionClause? END_CALL?
   ;

callUsingPhrase
   : USING callUsingParameter+
   ;

callUsingParameter
   : callByReferencePhrase | callByValuePhrase | callByContentPhrase
   ;

callByReferencePhrase
   : (BY? REFERENCE)? callByReference+
   ;

callByReference
   : ((ADDRESS OF | INTEGER | STRING)? generalIdentifier | literal | fileName) | OMITTED
   ;

callByValuePhrase
   : BY? VALUE callByValue+
   ;

callByValue
   : (ADDRESS OF | LENGTH OF?)? (generalIdentifier | literal)
   ;

callByContentPhrase
   : BY? CONTENT callByContent+
   ;

callByContent
   : (ADDRESS OF | LENGTH OF?)? generalIdentifier | literal | OMITTED
   ;

callGivingPhrase
   : (GIVING | RETURNING) generalIdentifier
   ;

// cancel statement

cancelStatement
   : CANCEL cancelCall+
   ;

cancelCall
   : libraryName (BYTITLE | BYFUNCTION) | generalIdentifier | literal
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
   : ASSOCIATED_DATA (generalIdentifier | integerLiteral)
   ;

closePortFileIOUsingAssociatedDataLength
   : ASSOCIATED_DATA_LENGTH OF? (generalIdentifier | integerLiteral)
   ;

// compute statement

computeStatement
   : COMPUTE computeStore+ (EQUALCHAR | EQUAL) arithmeticExpression onSizeErrorPhrase? notOnSizeErrorPhrase? END_COMPUTE?
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
   : DELETE fileName RECORD? invalidKeyPhrase? notInvalidKeyPhrase? END_DELETE?
   ;

// disable statement

disableStatement
   : DISABLE (INPUT TERMINAL? | I_O TERMINAL | OUTPUT) cdName WITH? KEY (generalIdentifier | literal)
   ;

// display statement

displayStatement
   : DISPLAY displayOperand+ displayAt? displayUpon? displayWith?
   ;

displayOperand
   : generalIdentifier | literal
   ;

displayAt
   : AT (generalIdentifier | literal)
   ;

displayUpon
   : UPON (mnemonicName | environmentName)
   ;

displayWith
   : WITH? NO ADVANCING
   ;

// divide statement

divideStatement
   : DIVIDE (generalIdentifier | literal) (divideIntoStatement | divideIntoGivingStatement | divideByGivingStatement) divideRemainder? onSizeErrorPhrase? notOnSizeErrorPhrase? END_DIVIDE?
   ;

divideIntoStatement
   : INTO divideInto+
   ;

divideIntoGivingStatement
   : INTO (generalIdentifier | literal) divideGivingPhrase?
   ;

divideByGivingStatement
   : BY (generalIdentifier | literal) divideGivingPhrase?
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
   : ENTRY literal (USING generalIdentifier+)?
   ;

// evaluate statement

evaluateStatement
   : EVALUATE evaluateSelect evaluateAlsoSelect* evaluateWhenPhrase+ evaluateWhenOther? END_EVALUATE?
   ;

evaluateSelect
   : generalIdentifier | literal | arithmeticExpression | condition
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
   : generalIdentifier | literal | arithmeticExpression
   ;

// exec cics statement
execCicsStatement
   : EXEC CICS allRules resp_options? END_EXEC DOT_FS?
   ;

// exec sql statement

execSqlStatement
   : EXEC SQL ~END_EXEC*? END_EXEC DOT_FS?
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
   : generalIdentifier | literal
   ;

// exit statement

exitStatement
   : EXIT PROGRAM?
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
   : IF condition ifThen ifElse? END_IF?
   ;

ifThen
   : THEN? (NEXT SENTENCE | statement+?)
   ;

ifElse
   : ELSE (NEXT SENTENCE | statement+?)
   ;

// initialize statement

initializeStatement
   : INITIALIZE generalIdentifier+ initializeReplacingPhrase?
   ;

initializeReplacingPhrase
   : REPLACING initializeReplacingBy+
   ;

initializeReplacingBy
   : (ALPHABETIC | ALPHANUMERIC | ALPHANUMERIC_EDITED | NATIONAL | NATIONAL_EDITED | NUMERIC | NUMERIC_EDITED | DBCS | EGCS) DATA? BY (generalIdentifier | literal)
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
   : CONVERTING (generalIdentifier | literal) inspectTo inspectBeforeAfter*
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
   : (generalIdentifier | literal) inspectBeforeAfter*
   ;

inspectReplacingAllLeading
   : (generalIdentifier | literal) inspectBy inspectBeforeAfter*
   ;

inspectBy
   : BY (generalIdentifier | literal)
   ;

inspectTo
   : TO (generalIdentifier | literal)
   ;

inspectBeforeAfter
   : (BEFORE | AFTER) INITIAL? (generalIdentifier | literal)
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

// move statement

moveStatement
   : MOVE ALL? (moveToStatement | moveCorrespondingToStatement)
   ;

moveToStatement
   : moveToSendingArea TO generalIdentifier+
   ;

moveToSendingArea
   : generalIdentifier | literal
   ;

moveCorrespondingToStatement
   : (CORRESPONDING | CORR) moveCorrespondingToSendingArea TO generalIdentifier+
   ;

moveCorrespondingToSendingArea
   : generalIdentifier
   ;

// multiply statement

multiplyStatement
   : MULTIPLY (generalIdentifier | literal) BY (multiplyRegular | multiplyGiving) onSizeErrorPhrase? notOnSizeErrorPhrase? END_MULTIPLY?
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
   : generalIdentifier | literal
   ;

multiplyGivingResult
   : generalIdentifier ROUNDED?
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
   : (generalIdentifier | integerLiteral) TIMES
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
   : (generalIdentifier | literal) performFrom performBy performUntil
   ;

performAfter
   : AFTER performVaryingPhrase
   ;

performFrom
   : FROM (generalIdentifier | indexName | literal)
   ;

performBy
   : BY (generalIdentifier | literal)
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
   : READ fileName NEXT? RECORD? readInto? readWith? readKey? invalidKeyPhrase? notInvalidKeyPhrase? atEndPhrase? notAtEndPhrase? END_READ?
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
   : RETURN fileName RECORD? returnInto? atEndPhrase notAtEndPhrase? END_RETURN?
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
   : WHEN condition (NEXT SENTENCE | statement*)
   ;

// send statement

sendStatement
   : SEND (sendStatementSync | sendStatementAsync) onExceptionClause? notOnExceptionClause?
   ;

sendStatementSync
   : (generalIdentifier | literal) sendFromPhrase? sendWithPhrase? sendReplacingPhrase? sendAdvancingPhrase?
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
   : (generalIdentifier | literal) (LINE | LINES)?
   ;

sendAdvancingMnemonic
   : mnemonicName
   ;

// set statement

setStatement
   : SET (setToStatement+ | setUpDownByStatement)
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
   : ON | OFF | ENTRY (generalIdentifier | literal) | generalIdentifier | literal
   ;

setByValue
   : generalIdentifier | literal
   ;

// service statement

serviceLabelStatement
   : SERVICE LABEL
   ;
   
serviceReloadStatement   
   : SERVICE RELOAD generalIdentifier
   ;
   
// skip statement

skipStatement
   : SKIP1|SKIP2|SKIP3 DOT_FS?
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
   : RUN (GIVING | RETURNING) (generalIdentifier | integerLiteral)
   ;

// string statement

stringStatement
   : STRING stringSendingPhrase+ stringIntoPhrase stringWithPointerPhrase? onOverflowPhrase? notOnOverflowPhrase? END_STRING?
   ;

stringSendingPhrase
   : stringSending (COMMACHAR? stringSending)* (stringDelimitedByPhrase | stringForPhrase)
   ;

stringSending
   : generalIdentifier | literal
   ;

stringDelimitedByPhrase
   : DELIMITED BY? (SIZE | generalIdentifier | literal)
   ;

stringForPhrase
   : FOR (generalIdentifier | literal)
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
   : subtractSubtrahend+ FROM subtractMinuend+
   ;

subtractFromGivingStatement
   : subtractSubtrahend+ FROM subtractMinuendGiving GIVING subtractGiving+
   ;

subtractCorrespondingStatement
   : (CORRESPONDING | CORR) qualifiedDataName FROM subtractMinuendCorresponding
   ;

subtractSubtrahend
   : generalIdentifier | literal
   ;

subtractMinuend
   : generalIdentifier ROUNDED?
   ;

subtractMinuendGiving
   : generalIdentifier | literal
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
   
// title statement

titleStatement
   : TITLE literal DOT_FS?
   ;   

// unstring statement

unstringStatement
   : UNSTRING unstringSendingPhrase unstringIntoPhrase unstringWithPointerPhrase? unstringTallyingPhrase? onOverflowPhrase? notOnOverflowPhrase? END_UNSTRING?
   ;

unstringSendingPhrase
   : generalIdentifier (unstringDelimitedByPhrase unstringOrAllPhrase*)?
   ;

unstringDelimitedByPhrase
   : DELIMITED BY? ALL? (generalIdentifier | literal)
   ;

unstringOrAllPhrase
   : OR ALL? (generalIdentifier | literal)
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
   : FROM (generalIdentifier | literal)
   ;

writeAdvancingPhrase
   : (BEFORE | AFTER) ADVANCING? (writeAdvancingPage | writeAdvancingLines | writeAdvancingMnemonic)
   ;

writeAdvancingPage
   : PAGE
   ;

writeAdvancingLines
   : (generalIdentifier | literal) (LINE | LINES)?
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
   : LPARENCHAR arithmeticExpression RPARENCHAR | generalIdentifier | literal
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

// identifier ----------------------------------

generalIdentifier
   : qualifiedDataName | tableCall | functionCall | specialRegister
   ;

tableCall
   : dataName2 (LPARENCHAR subscript (COMMACHAR? subscript)* RPARENCHAR)* referenceModifier?
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

subscript
   : ALL | integerLiteral | qualifiedDataName integerLiteral? | indexName integerLiteral? | arithmeticExpression
   ;

argument
   : literal | generalIdentifier | qualifiedDataName integerLiteral? | indexName integerLiteral? | arithmeticExpression
   ;

// qualified data name ----------------------------------

qualifiedDataName
   : qualifiedDataNameFormat1 | qualifiedDataNameFormat2 | qualifiedDataNameFormat3 | qualifiedDataNameFormat4
   ;

qualifiedDataNameFormat1
   : dataName (qualifiedInData+ inFile? | inFile)?
   ;

qualifiedDataNameFormat2
   : paragraphName inSection
   ;

qualifiedDataNameFormat3
   : textName inLibrary
   ;

qualifiedDataNameFormat4
   : LINAGE_COUNTER inFile
   ;

qualifiedInData
   : inData | inTable
   ;

// in ----------------------------------

inData
   : (IN | OF) dataName2
   ;

inFile
   : (IN | OF) fileName
   ;

inMnemonic
   : (IN | OF) mnemonicName
   ;

inSection
   : (IN | OF) sectionName
   ;

inLibrary
   : (IN | OF) libraryName
   ;

inTable
   : (IN | OF) tableCall
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

conditionName
   : cobolWord
   ;

dataName
   : cobolWord
   ;

dataName1
   : cobolWord
   ;

dataName2
   : cobolWord
   ;

dataDescName
   : FILLER | CURSOR | dataName
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

languageName
   : systemName
   ;

libraryName
   : cobolWord
   ;

localName
   : cobolWord
   ;

mnemonicName
   : cobolWord
   ;

paragraphName
   : cobolWord | integerLiteral
   ;

paragraphNameUsage
   : cobolWord | integerLiteral
   ;

procedureName
   : paragraphNameUsage inSection?
   ;

programName
   : NONNUMERICLITERAL | cobolWord
   ;

recordName
   : qualifiedDataName
   ;

reportName
   : qualifiedDataName
   ;

screenName
   : cobolWord
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

textName
   : cobolWord
   ;

figurativeConstant
   : ALL literal | HIGH_VALUE | HIGH_VALUES | LOW_VALUE | LOW_VALUES | NULL | NULLS | QUOTE | QUOTES | SPACE | SPACES | ZERO | ZEROS | ZEROES
   ;

specialRegister
   : ADDRESS OF generalIdentifier
   | DATE | DAY | DAY_OF_WEEK | DEBUG_CONTENTS | DEBUG_ITEM | DEBUG_LINE | DEBUG_NAME | DEBUG_SUB_1 | DEBUG_SUB_2 | DEBUG_SUB_3
   | LENGTH OF? generalIdentifier | LINAGE_COUNTER | LINE_COUNTER
   | PAGE_COUNTER
   | RETURN_CODE
   | SHIFT_IN | SHIFT_OUT | SORT_CONTROL | SORT_CORE_SIZE | SORT_FILE_SIZE | SORT_MESSAGE | SORT_MODE_SIZE | SORT_RETURN
   | TALLY | TIME
   | WHEN_COMPILED
   ;

// comment entry
commentEntry
   : COMMENTENTRYLINE+
   ;
   
cobolWord
   : IDENTIFIER | cicsWords
   | ABORT | AS | ASCII | ASSOCIATED_DATA | ASSOCIATED_DATA_LENGTH | ATTRIBUTE | AUTO | AUTO_SKIP
   | BACKGROUND_COLOR | BACKGROUND_COLOUR | BEEP | BELL | BINARY | BIT | BLINK | BLOB | BOUNDS
   | CAPABLE | CCSVERSION | CHANGED | CHANNEL | CLOB | CLOSE_DISPOSITION | COBOL | COMMITMENT | CONTROL_POINT | CONVENTION | CRUNCH | CURSOR
   | DBCLOB | DEFAULT | DEFAULT_DISPLAY | DEFINITION | DFHRESP | DFHVALUE | DISK | DONTCARE | DOUBLE
   | EBCDIC | EMPTY_CHECK | ENTER | ENTRY_PROCEDURE | EOL | EOS | ERASE | ESCAPE | EVENT | EXCLUSIVE | EXPORT | EXTENDED
   | FOREGROUND_COLOR | FOREGROUND_COLOUR | FULL | FUNCTIONNAME | FUNCTION_POINTER
   | GRID
   | HIGHLIGHT
   | IMPLICIT | IMPORT | INTEGER
   | KEPT | KEYBOARD
   | LANGUAGE | LB | LD | LEFTLINE | LENGTH_CHECK | LIBACCESS | LIBPARAMETER | LIBRARY | LIST | LOCAL | LONG_DATE | LONG_TIME | LOWER | LOWLIGHT
   | MMDDYYYY
   | NAMED | NATIONAL | NATIONAL_EDITED | NETWORK | NO_ECHO | NUMERIC_DATE | NUMERIC_TIME
   | ODT | ORDERLY | OVERLINE | OWN
   | PASSWORD | PORT | PRINTER | PRIVATE | PROCESS | PROGRAM | PROMPT
   | READER | REAL | RECEIVED | RECURSIVE | REF | REMOTE | REMOVE | REQUIRED | REVERSE_VIDEO
   | SAVE | SECURE | SHARED | SHAREDBYALL | SHAREDBYRUNUNIT | SHARING | SHORT_DATE | SQL | SYMBOL
   | TASK | THREAD | THREAD_LOCAL | TIMER | TODAYS_DATE | TODAYS_NAME | TRUNCATED | TYPEDEF
   | UNDERLINE
   | VIRTUAL
   | WAIT
   | YEAR | YYYYMMDD | YYYYDDD
   | ZERO_FILL
   ;

booleanLiteral
   : TRUE | FALSE
   ;

numericLiteral
   : NUMERICLITERAL | ZERO | integerLiteral
   ;

cicsDfhRespLiteral
   : DFHRESP LPARENCHAR (cobolWord | literal) RPARENCHAR
   ;

cicsDfhValueLiteral
   : DFHVALUE LPARENCHAR (cobolWord | literal) RPARENCHAR
   ;

integerLiteral
   : INTEGERLITERAL | otherLevel | LEVEL_NUMBER_66 | LEVEL_NUMBER_88
   ;
   
literal
   : NONNUMERICLITERAL | figurativeConstant | numericLiteral | booleanLiteral | cicsDfhRespLiteral | cicsDfhValueLiteral | charString
   ;  
   
