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

parser grammar CutParser;
options {tokenVocab = CutLexer;}

startRule: .*? cutRules* EOF;
cutRules: (beforeEachStatements | afterEachStatements | testSuiteStatements | testCaseStatements | assertStatements) .*?;

beforeEachStatements: BEFORE EACH cobolCode END_BEFORE;

afterEachStatements: AFTER EACH cobolCode END_AFTER;

testSuiteStatements: TESTSUITE literal;

testCaseStatements: TESTCASE literal cobolCode? (mockStatements cobolCode?)*;

assertStatements: (EXPECT | VERIFY | IGNORE) qualifiedVariableDataName assertValue;

mockStatements: MOCK cobolCode END_MOCK;

assertValue: (to_be |  NOT | IN | HAPPENED | NEVER | ONCE | AT LEAST | MOREWRD)* literal;

cobolCode: (literal | TO | OF)*;

to_be: TO BE;

variable: IDENTIFIER;

literal
   : NONNUMERICLITERAL | NUMERICLITERAL | IDENTIFIER | STRINGLITERAL | DOT_FS | LEVEL_NUMBER | INTEGERLITERAL;

qualifiedVariableDataName
   : (variable (IN | OF))? variable
   ;
