 /*
* Copyright (C) 2017, Ulrich Wolffgang <ulrich.wolffgang@proleap.io>
* All rights reserved.
*
* This software may be modified and distributed under the terms
* of the MIT license. See the LICENSE file for details.
*/

parser grammar CobolPreprocessor;
options {tokenVocab = CobolPreprocessorLexer;}

startRule
   : .*? ((includeStatement | copyStatement | copyMaidStatement | replaceAreaStart | replaceOffStatement
   | titleDirective | enterDirective | controlDirective | linkageSection | plusplusIncludeStatement | procedureDivision | workingStorageSection)+ .*?)* EOF
   ;

// procedure devision for resolving predefined labels
procedureDivision
   : PROCEDURE DIVISION procedureDivisionUsingClause? procedureDivisionGivingClause? DOT_FS
   ;

procedureDivisionUsingClause
   : (USING | CHAINING) procedureDivisionUsingParameter (COMMACHAR? procedureDivisionUsingParameter)*
   ;

procedureDivisionGivingClause
   : RETURNING cobolWord
   ;

procedureDivisionUsingParameter
   : BY? (REFERENCE | VALUE)? generalIdentifier
   ;

conditionalStatementCall
   : statement SEMICOLON_FS? | dialectStatement
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


// linkage section for resolving predefined variables
linkageSection
   : LINKAGE SECTION DOT_FS
   ;

// working storage section for resolving speacal registers as variables
workingStorageSection
   : WORKING_STORAGE SECTION DOT_FS
   ;

// copy statement
copyStatement
   : COPY copySource (replacingPhrase | SUPPRESS)? DOT_FS
   ;

// sql include statement
includeStatement
   : EXEC SQL INCLUDE copySource END_EXEC DOT_FS
   ;

// ++Include statement
plusplusIncludeStatement
    : PLUSPLUSINCLUDE copySource (DOT_FS | SEMICOLON_FS)?
    ;

// copy maid statement
copyMaidStatement
    : LEVEL_NUMBER? COPY MAID copySource qualifier? DOT_FS?
    ;

copySource
   : (literal | cobolWord) ((OF | IN) copyLibrary)?
   ;

copyLibrary
   : literal | cobolWord
   ;

qualifier
   : literal | cobolWord
   ;

// Compiler directives
titleDirective
   : TITLE literal DOT_FS?
   ;

enterDirective
   : ENTER languageName? routineName? DOT_FS
   ;

routineName
   : cobolWord
   ;

languageName
   : cobolWord
   ;

controlDirective
   : ASTERISKCHAR controlCbl controlOptions* DOT_FS?
   ;

controlCbl
   : (CONTROL | CBL)
   ;

controlOptions
   : (SOURCE | NOSOURCE | LIST | NOLIST | MAP | NOMAP)
   ;

// replace statement
replacingPhrase
   : REPLACING replaceClause+
   ;

replaceAreaStart
   : REPLACE (replacePseudoText)+ DOT_FS
   ;

replaceOffStatement
   : REPLACE OFF DOT_FS
   ;

replaceClause
   : (replacePseudoText | replaceLiteral)
   ;

replaceLiteral
   : replaceable BY replacement
   ;

replacePseudoText
   : (LEADING | TRAILING)? pseudoReplaceable BY pseudoReplacement
   ;

pseudoReplaceable
   : (openingPseudoTextDelimiter ~DOUBLEEQUALCHAR*? closingPseudoTextDelimiter)
   ;

pseudoReplacement
   : (openingPseudoTextDelimiter ~DOUBLEEQUALCHAR*? closingPseudoTextDelimiter) | EMPTYPSEUDOTEXT
   ;

openingPseudoTextDelimiter
   : DOUBLEEQUALCHAR
   ;

closingPseudoTextDelimiter
   : DOUBLEEQUALCHAR (COMMACHAR | DOT_FS | SEMICOLON_FS)?
   ;

replaceable
   : literal | cobolWord | charDataLine | functionCall
   ;

functionCall
   : FUNCTION functionName (LPARENCHAR argument (COMMACHAR? argument)* RPARENCHAR)
   ;

functionName
   : literal | cobolWord | charDataLine
   ;

argument
   : literal | cobolWord | charDataLine
   ;

replacement
   : literal | cobolWord | charDataLine | functionCall
   ;

charDataLine
   : (FILENAME | DOT_FS | LPARENCHAR | RPARENCHAR)+
   ;

cobolWord
   : COPYBOOK_IDENTIFIER | IDENTIFIER | MAID | SOURCE | NOSOURCE | LIST | NOLIST | MAP | NOMAP | LINKAGE | SECTION | PROCEDURE | DIVISION
   | DAY_OF_WEEK | YYYYDDD | YYYYMMDD | MMDDYYYY | WHEN_COMPILED  | DAY | DATE
   ;

literal
   : NONNUMERICLITERAL | NUMERICLITERAL | INTEGERLITERAL | LEVEL_NUMBER |LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88
   ;

integerLiteral
   : INTEGERLITERAL | LEVEL_NUMBER | LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88
   ;

// identifier ----------------------------------

generalIdentifier
   : cobolWord
   ;

specialRegister
   : ADDRESS OF generalIdentifier
   | LENGTH OF? generalIdentifier | LINAGE_COUNTER
   ;

procedureName
   : paragraphName inSection?
   ;

inSection
   : (IN | OF) sectionName
   ;

sectionName
   : cobolWord | integerLiteral
   ;

paragraphName
   : cobolWord | integerLiteral
   ;


// qualified data name ----------------------------------

qualifiedDataName
   : variableUsageName tableCall? referenceModifier? inData*
   ;

inData
   : (IN | OF) variableUsageName tableCall? referenceModifier?
   ;

variableUsageName
   : cobolWord
   ;

tableCall
   : LPARENCHAR (ALL | arithmeticExpression) (COMMACHAR? (ALL | arithmeticExpression))* RPARENCHAR
   ;

referenceModifier
   : LPARENCHAR arithmeticExpression COLONCHAR arithmeticExpression? RPARENCHAR
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

// altered go to statement

alteredGoTo
   : GO TO? DOT_FS
   ;

// - io control paragraph ----------------------------------

endClause
    : (DOT_FS | SEMICOLON_FS)
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

dialectNodeFiller
    : ZERO_WIDTH_SPACE+
    ;

fileName
   : cobolWord
   ;

// statement clauses ----------------------------------

onExceptionClause
   : ON? EXCEPTION (COMMACHAR? conditionalStatementCall)+
   ;

notOnExceptionClause
   : NOT ON? EXCEPTION (COMMACHAR? conditionalStatementCall)+
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

libraryName
   : cobolWord
   ;

cdName
   : cobolWord
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

className
   : cobolWord
   ;

booleanLiteral
   : TRUE | FALSE
   ;

reportName
   : qualifiedDataName
   ;

// names ----------------------------------

alphabetName
   : cobolWord
   ;

dataName
   : cobolWord
   ;

numericLiteral
   : NUMERICLITERAL | ZERO | integerLiteral
   ;

recordName
   : qualifiedDataName
   ;

mnemonicName
   : cobolWord
   ;
