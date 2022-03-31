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
    : dafPrefixStatement? (getMetaInfoStatement | tableRowRetrievalStatement | getTableStatement
    | getFileStatement | stringDMLStatement) DOT_FS?
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

daf_entity_role
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

tableRowRetrievalStatement
    : ROW rowGetStatement
    ;

rowGetStatement
    : GET daf_table_name
      (ON (qualifiedDataName | literal))?
      (TO qualifiedDataName)?
    ;

getTableStatement
    : GET TABLE (ANY | SEQ)
      {validateExactLength(_input.LT(1).getText(), "table reference", 4);} cobolWord
    ;

getFileStatement
    : GET FILE (qualifiedDataName | NONNUMERICLITERAL) INTO qualifiedDataName
      (VOLSER INTO qualifiedDataName)?
    ;

stringDMLStatement
    : STRING stringGetStatement
    ;

stringGetStatement
    : GET qualifiedDataName
    ;

dafPrefixStatement
    : (D_B | D_C)
    ;

daf_table_name
    : { validateStartsWith(_input.LT(1).getText(), "TBL", "TBF"); } qualifiedDataName
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
