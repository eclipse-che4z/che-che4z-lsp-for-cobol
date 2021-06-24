
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
   : .*? ((includeStatement | copyStatement | copyMaidStatement | replaceAreaStart | replaceOffStatement )+ .*?)* EOF
   ;

// copy statement
copyStatement
   : COPY copySource (replacingPhrase | SUPPRESS)? DOT_FS
   ;

// sql include statement
includeStatement
   :EXEC_SQL INCLUDE copySource END_EXEC DOT_FS
   ;

// copy maid statement
copyMaidStatement
    : LEVEL_NUMBER? COPY MAID copySource DOT_FS?
    ;

copySource
   : (literal | cobolWord) ((OF | IN) copyLibrary)?
   ;

copyLibrary
   : literal | cobolWord
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

openingPseudoTextDelimiter: DOUBLEEQUALCHAR;

closingPseudoTextDelimiter: DOUBLEEQUALCHAR (COMMACHAR | DOT| DOT_FS | SEMICOLON | SEMICOLON_FS)?;

pseudoReplacement
   : (openingPseudoTextDelimiter ~DOUBLEEQUALCHAR*? closingPseudoTextDelimiter) | EMPTYPSEUDOTEXT
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
   : (FILENAME | DOT | LPARENCHAR | RPARENCHAR)+
   ;

cobolWord
   : COPYBOOK_IDENTIFIER | IDENTIFIER | MAID
   ;

literal
   : NONNUMERICLITERAL | NUMERICLITERAL | INTEGERLITERAL | LEVEL_NUMBER |LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88
   ;

