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

parser grammar DaCoParser;
options {tokenVocab = DaCoLexer;  superClass = MessageServiceParser;}

startRule: .*? dacoRules* EOF;
dacoRules: dacoStatements .*?;

dacoStatements
    : readTransactionStatement | writeTransactionStatement
    | writeReportStatement | openPacketStatement | getMetaInfoStatement
    | messageHandlingStatement | tableRowRetrievalStatement | tableRowUpdateStatement
    | tableDMLStatement | fileDMLStatement | stringDMLStatement
    | debugStatement | execStatement DOT_FS?
    ;

readTransactionStatement
    : READ TRANSACTION daco_task_name?
    ;

writeTransactionStatement
    : WRITE TRANSACTION daco_task_name
        (LENGTH ({validateIntegerRange(_input.LT(1).getText(), 4, 2048);} integerLiteral))?
        (TO ({validateLength(_input.LT(1).getText(), "dbu", 19);} (cobolWord | integerLiteral)))?
    ;

writeReportStatement
    : writeReportStatementWithName | endWriteReportStatement | autoWriteReportStatement
    ;

writeReportStatementWithName
    : WRITE REPORT daco_report_name
        FROM qualifiedDataName
        (TO qualifiedDataName)?
        (LENGTH ({validateIntegerRange(_input.LT(1).getText(), 80, 200);} integerLiteral))?
        (AFTER ((integerLiteral LINES) | PAGE | qualifiedDataName))?
    ;

endWriteReportStatement
    : WRITE REPORT daco_report_name ENDRPT
    ;

autoWriteReportStatement
    : WRITE REPORT AUTO qualifiedDataName
        (END qualifiedDataName)?
    ;

openPacketStatement
    : OPEN PACKET daco_task_name
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
            ( ( daco_entity_role |
                {validateAllowedValues(trimQuotes(_input.LT(1).getText()),
                  "OWNER","OWN","DESIGNER","AVG","ANALIST","ANA");} NONNUMERICLITERAL
              )
            | ( DESCRIPTION
                ( qualifiedDataName |
                  {validateExactLength(trimQuotes(_input.LT(1).getText()), "tal", 2);} NONNUMERICLITERAL)
              )
            )
    ;

daco_entity_role
    : (OWNER | DESIGNER | ANALIST | OWN | AVG | ANA)
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
    : STD? daco_message_types
     ({validateExactLength(_input.LT(1).getText(), "message code", 3);} integerLiteral)
     (qualifiedDataName | NONNUMERICLITERAL)?
     (qualifiedDataName | NONNUMERICLITERAL)?
     (qualifiedDataName | NONNUMERICLITERAL)?
    ;

showResultStatement
    : RESULT daco_task_name
    ;

showErrorMessageStatement
    : MESSAGE (({validateExactLength(trimQuotes(_input.LT(1).getText()), "language code", 2);} NONNUMERICLITERAL)
      | (qualifiedDataName | NONNUMERICLITERAL))?
    ;

returnStatusStatement
    : RETURN daco_message_types
      ({validateExactLength(_input.LT(1).getText(), "message code", 3);} integerLiteral)
      (qualifiedDataName | NONNUMERICLITERAL)?
    ;

tableRowRetrievalStatement
    : ROW (rowStartStatement | rowSaveStatement | rowRestoreStatement
      | rowGetStatement | rowNextStatement | rowPriorStatement
      | rowAnyStatement | rowMatchStatement | rowBufferStatement)
    ;

rowBufferStatement
    : BUFFER daco_table_name IS YES
    ;

rowStartStatement
    : START daco_table_name
    ;

rowSaveStatement
    : SAVE daco_table_name
      IN (qualifiedDataName | literal)
    ;

rowRestoreStatement
    : RESTORE daco_table_name
      FROM (qualifiedDataName | literal)
    ;

rowGetStatement
    : GET daco_table_name
      (ON (qualifiedDataName | literal))?
      (TO qualifiedDataName)?
    ;

rowNextStatement
    : NEXT daco_table_name
      (TO qualifiedDataName)?
    ;

rowPriorStatement
    : PRIOR daco_table_name
      (TO qualifiedDataName)?
    ;

rowAnyStatement
    : ANY daco_table_name
      USING qualifiedDataName
    ;

rowMatchStatement
    : MATCH daco_table_name
      USING qualifiedDataName
    ;

tableRowUpdateStatement
    : ROW (rowDeleteStatement | rowAddStatement | rowInsertStatement |
      rowModifyStatement | rowSortStatement | rowSingleStatement |
      rowDuplicateStatement | rowInvertStatement)
    ;

rowDeleteStatement
    : DELETE daco_table_name
    ;

rowAddStatement
    : ADD daco_table_name
      WITH qualifiedDataName
    ;

rowInsertStatement
    : INSERT daco_table_name
      WITH qualifiedDataName
    ;

rowModifyStatement
    : MODIFY daco_table_name
      ON (qualifiedDataName | literal)
      WITH qualifiedDataName
    ;

rowSortStatement
    : SORT daco_table_name (ASC | DES)
      ON qualifiedDataName
    ;

rowSingleStatement
    : SINGLE daco_table_name
      ON qualifiedDataName
    ;

rowDuplicateStatement
    : DUPLICATE daco_table_name
      ON qualifiedDataName
    ;

rowInvertStatement
    : INVERT daco_table_name
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
    : OPEN FILE daco_file_identifier (MAX LENGTH (qualifiedDataName | integerLiteral | LAYOUT))?
    ;

readFileStatement
    : READ FILE daco_file_identifier (MAX LENGTH (qualifiedDataName | integerLiteral | LAYOUT))?
    ;

writeFileStatement
    : WRITE FILE daco_file_identifier (LENGTH (qualifiedDataName | integerLiteral))?
    ;

closeFileStatement
    : CLOSE FILE (INPUT | OUTPUT) (daco_file_identifier | ALL)
    ;

getFileStatement
    : GET FILE (qualifiedDataName | NONNUMERICLITERAL) INTO qualifiedDataName
      (VOLSER INTO qualifiedDataName)?
    ;

stringDMLStatement
    : STRING (stringFindStatement | stringGetStatement | stringNextStatement
    | stringMatchStatement | stringCheckStatement | stringUpdateStatement
    | stringReplaceStatement | stringDeleteStatement)
    ;

stringFindStatement
    : FIND qualifiedDataName daco_string_identifier
    ;

stringGetStatement
    : GET qualifiedDataName
    ;

stringNextStatement
    : NEXT qualifiedDataName (DELIMITER qualifiedDataName)?
    ;

stringMatchStatement
    : MATCH daco_string_identifier daco_string_identifier
      (qualifiedDataName | ({validateIntegerRange(_input.LT(1).getText(), 0, 255);} numericLiteral))?
    ;

stringCheckStatement
    : CHECK daco_string_command
      (qualifiedDataName | ({validateLength(_input.LT(1).getText(), "email", 55);} literal))
    ;

stringUpdateStatement
    : (ADD | INSERT | FILL) qualifiedDataName daco_string_identifier
      LENGTH (qualifiedDataName | integerLiteral)
    ;

stringReplaceStatement
    : REPLACE ALL? qualifiedDataName daco_string_identifier
      BY daco_string_identifier
    ;

stringDeleteStatement
    : DELETE ALL? qualifiedDataName daco_string_identifier
    ;

debugStatement
    : debugStatsStatement | debugFieldStatement
    ;

debugStatsStatement
    : DEBUG STATS (qualifiedDataName | ({validateLength(_input.LT(1).getText(), "text", 32);} literal))?
    ;

debugFieldStatement
    : DEBUG qualifiedDataName LENGTH (qualifiedDataName | integerLiteral)
      (COLS ({validateIntegerRange(_input.LT(1).getText(), 0, 132);} numericLiteral))?
      (TABLE (qualifiedDataName | integerLiteral))?
      NO_POS? (HEX | DISPLAY | BOTH)?
    ;

execStatement
    : EXEC literal (USING qualifiedDataName)?
    ;

qualifiedDataName
   : variableUsageName tableCall? referenceModifier? inData*
   ;

tableCall
   : LPARENCHAR (ALL | arithmeticExpression) (COMMACHAR? (ALL | arithmeticExpression))* RPARENCHAR
   ;

inData
   : (IN | OF) variableUsageName tableCall? referenceModifier?
   ;

variableUsageName
   : cobolWord
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

generalIdentifier
   : specialRegister | qualifiedDataName | functionCall
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

functionCall
   : FUNCTION functionName (LPARENCHAR argument (COMMACHAR? argument)* RPARENCHAR)* referenceModifier?
   ;

argument
   : arithmeticExpression
   ;

functionName
   : INTEGER | LENGTH | RANDOM | SUM | WHEN_COMPILED | cobolWord
   ;

literal
   : NONNUMERICLITERAL | figurativeConstant | numericLiteral | booleanLiteral | charString
   ;

figurativeConstant
   : ALL literal | HIGH_VALUE | HIGH_VALUES | LOW_VALUE | LOW_VALUES | NULL | NULLS | QUOTE | QUOTES | SPACE | SPACES | ZEROS | ZEROES
   ;

numericLiteral
   : NUMERICLITERAL | ZERO | integerLiteral
   ;

integerLiteral
   : INTEGERLITERAL | LEVEL_NUMBER | LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88
   ;

booleanLiteral
   : TRUE | FALSE
   ;

charString
   : FINALCHARSTRING
   ;



cobolWord
   : IDENTIFIER | cobolKeywords
   ;

cobolKeywords
   : ADDRESS | CR
   ;

// DaCo Identifiers

daco_task_name
    :{validateExactLength(_input.LT(1).getText(), "task name", 4);
      validateAlphaNumericPattern(_input.LT(1).getText(), "task name");
     }
        (cobolWord | integerLiteral)
    ;

daco_report_name
    :{validateExactLength(_input.LT(1).getText(), "report name", 5);
      validateAlphaNumericPattern(_input.LT(1).getText(), "report name");
      validateStartsWith(_input.LT(1).getText(), "R", "T");
      }
        (cobolWord)
    ;

daco_message_types
    : ERROR | INFO | WARNING
    ;

daco_file_identifier
    : {validateExactLength(_input.LT(1).getText(), "file reference", 4);} integerLiteral
    ;

daco_table_name
    : { validateStartsWith(_input.LT(1).getText(), "TBL", "TBF"); } qualifiedDataName
    ;

daco_string_command
    : EMA
    ;

daco_string_identifier
    : qualifiedDataName | literal | SPACE
    ;