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
import { CopybookLexer } from "./CopybookLexer"
}

startRule
   : skipUntilFirstSection
     dataSection*
     procedureDivision?
     EOF
   ;

procedureDivision
   : PROCEDURE DIVISION procedureDivisionOptions DOT_FS procedureDivisionItem*;

procedureDivisionOptions
   : (~DOT_FS)*
   ;

procedureDivisionItem
   : skipCopyMaid DOT_FS?
   | procedureSection
   | proceduralNoiseBlock
   ;

proceduralNoiseBlock
   : (
       { this.tokenStream.LA(1) !== -1 &&
         !(this.tokenStream.LA(1) === CopybookLexer.IDENTIFIER && this.tokenStream.LA(2) === CopybookLexer.SECTION) &&
         !(this.tokenStream.LA(1) === CopybookLexer.DACO_COPYBOOK_IDENTIFIER && this.tokenStream.LA(2) === CopybookLexer.SECTION) &&
         !(this.tokenStream.LA(1) === CopybookLexer.COPY)
       }?
       .
     )+
   ;

skipCopyMaid
   : LEVEL_NUMBER? COPY MAID 
      layoutId
      layoutUsage?
   ;

procedureSection
   : sectionName SECTION DOT_FS
   ;

sectionName
   : IDENTIFIER
   | DACO_COPYBOOK_IDENTIFIER
   ;

skipUntilFirstSection
   : (
       { this.tokenStream.LA(1) !== -1 && 
         this.tokenStream.LA(1) !== CopybookLexer.WORKING_STORAGE && 
         this.tokenStream.LA(1) !== CopybookLexer.LINKAGE 
       }?
       .
     )*
   ;

dataSection
   : WORKING_STORAGE SECTION DOT_FS dataDescriptionEntry*
   | LINKAGE SECTION DOT_FS dataDescriptionEntry*
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
   : DACO_COPYBOOK_IDENTIFIER
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