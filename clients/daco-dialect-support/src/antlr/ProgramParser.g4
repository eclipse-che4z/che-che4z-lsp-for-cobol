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

parser grammar ProgramParser;
options {tokenVocab = ProgramLexer;  superClass = MessageServiceParser;}

@header {
import { MessageServiceParser } from "../antlr/MessageServiceParser";
}

startRule
   : skipUntilDataDivision
     dataDivision?
     procedureDivision?
     EOF
   ;

dataDivision
   : DATA_DIVISION DOT_FS dataSection*
   ;

procedureDivision
   : PROCEDURE DIVISION procedureDivisionOptions DOT_FS procedureDivisionItem*;

procedureDivisionOptions
   : (~DOT_FS)*
   ;

procedureDivisionItem
   : skipCopyMaid DOT_FS?
   | procedureSection
   | .+?
   ;

skipCopyMaid
   : COPY MAID 
      layoutId
      ({this.inputStream?.LT(-1)?.line === this.inputStream?.LT(1)?.line}? layoutUsage)?
   ;

procedureSection
   : sectionName SECTION DOT_FS
   ;

sectionName
   : identifier = (IDENTIFIER | DACO_COPYBOOK_IDENTIFIER)
   ;

skipUntilDataDivision
   : (~(DATA_DIVISION | PROCEDURE))*
   ;

dataSection
   : FILE SECTION DOT_FS dataDescriptionEntry*
   | WORKING_STORAGE SECTION DOT_FS dataDescriptionEntry*
   | LINKAGE SECTION DOT_FS dataDescriptionEntry*
   | otherDialectSection
   ;

// Sections owned by other dialects (e.g. IDMS SCHEMA SECTION, MAP SECTION) can appear anywhere
otherDialectSection
   : sectionName SECTION DOT_FS skipUntilNextSection
   ;

skipUntilNextSection
   : .*?
   ;

dataDescriptionEntry
   : copyMaid | variableEntry | variableEntrySpecificLevel | otherDialectCopy | skipFileDescriptor | skipExecBlock | unknownDataEntry
   ;

skipFileDescriptor
   : (FD | SD) (~DOT_FS)* DOT_FS
   ;

otherDialectCopy
   : LEVEL_NUMBER? COPY ~(MAID | DOT_FS) (~DOT_FS)* DOT_FS
   ;

// Embedded statements can end without a period. Resume parsing at END-EXEC
// so a following COPY, data entry, or section is not consumed with the block.
skipExecBlock
   : EXEC (~END_EXEC)* END_EXEC DOT_FS?
   ;

// Leave data entries owned by COBOL or another dialect to their own parser.
// Do not consume a following <name> SECTION header as a data entry.
// Stop at the next period so subsequent MAID entries can still be collected.
unknownDataEntry
   : ~(LEVEL_NUMBER | LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88
       | PROCEDURE | DATA_DIVISION | FILE | WORKING_STORAGE | LINKAGE
       | COPY | EXEC | FD | SD | DOT_FS)
     (~(SECTION | DOT_FS) (~DOT_FS)*)? DOT_FS
   ;

copyMaid
   : LEVEL_NUMBER COPY MAID 
      layoutId
      layoutUsage?
      DOT_FS?
   ;

layoutId
   : DACO_COPYBOOK_IDENTIFIER  { this.validateTokenWithRegex($DACO_COPYBOOK_IDENTIFIER, /^[A-Z0-9]*([-][A-Z0-9]{3})?$/, "validation.layout_identifier"); } 
   ;

layoutUsage
   : DACO_COPYBOOK_IDENTIFIER
   ;

variableEntry
   : LEVEL_NUMBER identifier = (IDENTIFIER | DACO_COPYBOOK_IDENTIFIER) variableOptionEntry DOT_FS
   ;

variableOptionEntry
   : (~DOT_FS)*
   ;

variableEntrySpecificLevel
   : specificLevelNumber identifier = (IDENTIFIER | DACO_COPYBOOK_IDENTIFIER) variableOptionEntry DOT_FS
   ;

specificLevelNumber
   : LEVEL_NUMBER_66
   | LEVEL_NUMBER_77
   | LEVEL_NUMBER_88
   ;
