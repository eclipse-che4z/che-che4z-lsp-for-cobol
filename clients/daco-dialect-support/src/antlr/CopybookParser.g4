/*
 * Copyright (c) 2026 Broadcom.
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

parser grammar CopybookParser;
options {tokenVocab = CopybookLexer;  superClass = MessageServiceParser;}

@header {
import { MessageServiceParser } from "../antlr/MessageServiceParser";
}

startRule
   : header dataDescriptionEntry*
   ;

header
  : ~(LEVEL_NUMBER | COPY)*
  ;

dataDescriptionEntry
   : copyMaid | variableEntry
   ;

copyMaid
   : LEVEL_NUMBER? COPY MAID layoutId (layoutUsage)?
   ;

layoutId
   : DACO_COPYBOOK_IDENTIFIER
   ;

layoutUsage
   : SUFFIX
   ;

variableEntry
   : LEVEL_NUMBER identifier .*?
   ;

identifier
   : IDENTIFIER
   ;
