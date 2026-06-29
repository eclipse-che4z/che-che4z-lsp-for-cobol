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
 *   Broadcom - initial API and implementation
 */

parser grammar CopybookParser;
options {tokenVocab = CopybookLexer;  superClass = MessageServiceParser;}

@header {
import { MessageServiceParser } from "../antlr/MessageServiceParser";
}

startRule
   : skipUntilWS workingStorageBody EOF
   ;

skipUntilWS
   : (~WORKING_STORAGE)* (WORKING_STORAGE SECTION DOT_FS)?
   ;

workingStorageBody
   : dataDescriptionEntry*
   ;

dataDescriptionEntry
   : copyMaid | variableEntry | variableEntrySpecificLevel
   ;

copyMaid
   : LEVEL_NUMBER? COPY MAID 
      layoutId
      layoutUsage? 
      DOT_FS
   ;

layoutId
   : DACO_COPYBOOK_IDENTIFIER  { this.validateTokenWithRegex($DACO_COPYBOOK_IDENTIFIER, /^[A-Z0-9]*([-][A-Z0-9]{3})?$/, "validation.layout_identifier"); } 
   ;

layoutUsage
   : DACO_COPYBOOK_IDENTIFIER { this.validateTokenWithRegex($DACO_COPYBOOK_IDENTIFIER, /^[A-Z]{3}$/, "validation.layout_usage");}
   ;

variableEntry
   : LEVEL_NUMBER DACO_COPYBOOK_IDENTIFIER (variableOptionEntry) DOT_FS
   ;

variableOptionEntry
   : (~DOT_FS)*
   ;

variableEntrySpecificLevel
   : specificLevelNumber DACO_COPYBOOK_IDENTIFIER (~DOT_FS)* DOT_FS
   ;

specificLevelNumber
   : LEVEL_NUMBER_66
   | LEVEL_NUMBER_77
   | LEVEL_NUMBER_88
   ;