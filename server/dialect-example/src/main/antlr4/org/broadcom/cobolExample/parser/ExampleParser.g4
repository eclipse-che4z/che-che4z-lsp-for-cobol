/*
 * Copyright (c) 2023 Broadcom.
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

parser grammar ExampleParser;
options {tokenVocab = ExampleLexer;}

startRule: .*? myRules* EOF;
myRules: (injectStatement | dataDescriptionEntry100 | shiftStatement | bitwiseShiftstatement | untieStatement | unsetStatement | rpcParseStatement) .*?;

injectStatement: EXAMPLE INJECT copyLibrary DOT_FS?;

shiftStatement: EXAMPLE SHIFT qualifiedVariableDataName TO qualifiedVariableDataName DOT_FS?;

dataDescriptionEntry100: EXAMPLE LEVEL_NUMBER_100 dataName DOT_FS?;

bitwiseShiftstatement: EXAMPLE BITWISE SHIFT qualifiedVariableDataName (RIGHT | LEFT) numericLiteral DOT_FS?;

untieStatement: EXAMPLE UNTIE qualifiedVariableDataName DOT_FS?;

unsetStatement: EXAMPLE UNSET qualifiedVariableDataName DOT_FS?;

rpcParseStatement: EXAMPLE RPC_MSG PARSE identifier1 INTO identifier2
                   (WITH DETAILS? XID identifier3)?
                   (WITH DETAILS? MSG_TYPE identifier4)?
                   (WITH DETAILS? CALL identifier5)?
                   (WITH DETAILS? REPLY identifier6)? DOT_FS?;

identifier1: qualifiedVariableDataName;

identifier2: qualifiedVariableDataName;

identifier3: qualifiedVariableDataName;

identifier4: qualifiedVariableDataName;

identifier5: qualifiedVariableDataName;

identifier6: qualifiedVariableDataName;

literal
   : NONNUMERICLITERAL | numericLiteral
   ;

numericLiteral: NUMERICLITERAL | INTEGERLITERAL | LEVEL_NUMBER |LEVEL_NUMBER_66 | LEVEL_NUMBER_77
                   | LEVEL_NUMBER_88 | LEVEL_NUMBER_100;

cobolWord
   : COPYBOOK_IDENTIFIER | IDENTIFIER
   ;

dataName
   : cobolWord
   ;

qualifiedVariableDataName
   : (variable (IN | OF))? variable
   ;

variable: IDENTIFIER;

copyLibrary
   : literal | cobolWord
   ;
