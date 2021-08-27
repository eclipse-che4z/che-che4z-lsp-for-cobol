
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
   : .*? ((includeStatement | copyStatement | copyIdmsStatement | copyMaidStatement | replaceAreaStart | replaceOffStatement | title)+ .*?)* EOF
   ;

// copy statement
copyStatement
   : COPY copySource (replacingPhrase | SUPPRESS)? DOT_FS
   ;

// sql include statement
includeStatement
   :EXEC_SQL INCLUDE copySource END_EXEC DOT_FS
   ;

// copy idms statement
copyIdmsStatement
    : LEVEL_NUMBER? COPY IDMS copyIdmsOptions (DOT_FS | SEMICOLON_FS)?
    ;

copyIdmsOptions
    : (RECORD copyIdmsSource versionClause? (REDEFINES cobolWord)?) |
    (FILE copyIdmsSource versionClause?) |
    ((MAP | MAP_CONTROL) copyIdmsSource) |
    (MODULE? copyIdmsSource versionClause?)
    ;

copyIdmsSource
    : copySource
    ;

versionClause
    : VERSION integerLiteral
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
title
   : TITLE literal DOT_FS?
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
   : COPYBOOK_IDENTIFIER | IDENTIFIER | MAID
   ;

literal
   : NONNUMERICLITERAL | NUMERICLITERAL | INTEGERLITERAL | LEVEL_NUMBER |LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88
   ;

integerLiteral
   : INTEGERLITERAL | LEVEL_NUMBER | LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88
   ;

