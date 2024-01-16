/*
* Copyright (C) 2017, Ulrich Wolffgang <ulrich.wolffgang@proleap.io>
* All rights reserved.
*
* This software may be modified and distributed under the terms
* of the MIT license. See the LICENSE file for details.
*/

parser grammar CobolDataDivisionParser;
options {tokenVocab = CobolDataDivisionLexer; superClass = MessageServiceParser;}

dataDivision
   : DATA DIVISION DOT_FS dataDivisionSection* EOF
   ;


// --- data division --------------------------------------------------------------------


dataDivisionSection
   : fileSection | workingStorageSection | linkageSection | localStorageSection
   | dialectSection
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
   : LABEL (RECORD | RECORDS) (IS | ARE)? (OMITTED | STANDARD | dataName*)
   ;

valueOfClause
   : VALUE OF valuePair+
   ;

valuePair
   : systemName IS? (qualifiedDataName | literal)
   ;

dataRecordsClause
   : DATA (RECORD | RECORDS) (IS | ARE)? qualifiedDataName+
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
   : LOCAL_STORAGE SECTION DOT_FS dataDescriptionEntryForLocalStorageSection*
   ;

dataDescriptionEntryForLocalStorageSection
   : dataDescriptionEntry
   ;

dataDescriptionEntryForWorkingStorageSection
   : dataDescriptionEntryForWorkingStorageAndLinkageSection
   ;

dataDescriptionEntryForWorkingStorageAndLinkageSection
   : dataDescriptionEntry
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
   : (FILLER | { validateLength(_input.LT(1).getText(), "Variable name", 30);} dataName)
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
   : OCCURS (integerLiteral | UNBOUNDED) dataOccursTo? TIMES? (DEPENDING ON? qualifiedDataName)? dataOccursSort* (INDEXED BY? LOCAL? indexName+)?
   ;

dataOccursTo
   : TO (integerLiteral | UNBOUNDED)
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
   | TRAILING | LEADING
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

// names ----------------------------------

alphabetName
   : cobolWord
   ;

className
   : cobolWord
   ;

dataName
   : cobolWord
   ;

variableUsageName
   : cobolWord
   ;

functionName
   : INTEGER | LENGTH | RANDOM | SUM | MAX | WHEN_COMPILED | cobolWord
   ;

indexName
   : cobolWord
   ;


reportName
   : qualifiedDataName
   ;

systemName
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

//cics_conditions: EOC | EODS | INVMPSZ | INVPARTN | INVREQ | MAPFAIL | PARTNFAIL | RDATT | UNEXPIN;

literal
   : NONNUMERICLITERAL | figurativeConstant | numericLiteral | booleanLiteral | charString | dialectLiteral | utfLiteral | hexadecimalUtfLiteral
   ;

dialectLiteral: dialectNodeFiller+;

utfLiteral: U_CHAR NONNUMERICLITERAL;

hexadecimalUtfLiteral: U_CHAR HEX_NUMBERS;

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
   : dialectNodeFiller | generalIdentifier | literal | LPARENCHAR arithmeticExpression RPARENCHAR
   ;

cobolWord
   : IDENTIFIER | SYMBOL | INTEGER | CHANNEL | PROCESS | REMOVE | WAIT | ANY | LIST | NAME | THREAD | U_CHAR
   | ADDRESS | BOTTOM | COUNT | CR | FIELD | FIRST | MMDDYYYY | PRINTER | DAY | TIME | DATE | DAY_OF_WEEK
   | REMARKS | RESUME | TIMER | TODAYS_DATE | TODAYS_NAME | TOP | YEAR | YYYYDDD | YYYYMMDD | WHEN_COMPILED
   | DISK | KEYBOARD | PORT | READER | REMOTE | VIRTUAL | LIBRARY | DEFINITION | PARSE | BOOL | ESCAPE | INITIALIZED
   | LOC | BYTITLE | BYFUNCTION | ABORT | ORDERLY | ASSOCIATED_DATA | ASSOCIATED_DATA_LENGTH | CLOSE | CURRENCY
   | DATA | DBCS | EXIT | EXTEND | INITIAL | NATIONAL | OBJECT | OFF | QUOTE | SEPARATE | SEQUENCE
   | SERVICE | STANDARD | SUPPRESS | TERMINAL | TEST | VOLATILE
   ;

dialectNodeFiller
    : ZERO_WIDTH_SPACE+
    ;
