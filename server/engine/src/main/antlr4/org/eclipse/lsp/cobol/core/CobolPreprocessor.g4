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
   : (includeStatement | copyStatement | replaceAreaStartOrOffStatement | titleDirective | enterDirective
   | controlDirective | plusplusIncludeStatement | .)* EOF
   ;

// copy statement
copyStatement
   : COPY copySource SUPPRESS? replacingPhrase? DOT_FS
   ;

// sql include statement
includeStatement
   : EXEC SQL INCLUDE copySource END_EXEC DOT_FS?
   ;

// ++Include statement
plusplusIncludeStatement
    : PLUSPLUSINCLUDE copySource (DOT_FS | SEMICOLON_FS)?
    ;

copySource
   : (literal | cobolWord) ((OF | IN) copyLibrary)?
   ;

copyLibrary
   : literal | cobolWord
   ;

// Compiler directives
titleDirective
   : TITLE literal DOT_FS?
   ;

enterDirective
   : ENTER languageName? DOT_FS
   ;

routineName
   : cobolWord
   ;

languageName
   : cobolWord routineName?
   ;

controlDirective
   : ASTERISKCHAR controlCbl controlOptions* DOT_FS?
   ;

controlCbl
   : (CONTROL | CBL)
   ;

controlOptions
   : (SOURCE | NOSOURCE | LIST | NOLIST | MAP | NOMAP)
   ;

// replace statement
replacingPhrase
   : REPLACING replaceClause+
   ;

replaceAreaStartOrOffStatement
   : REPLACE (replacePseudoText+ | OFF) DOT_FS
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
   : DOUBLEEQUALCHAR (COMMACHAR | SEMICOLON_FS)?
   ;

replaceable
   : literal | cobolWord | charDataLine | functionCall | pseudoReplaceable
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
   : (literal | cobolWord | charDataLine)+ | functionCall | pseudoReplacement
   ;

charDataLine
   : (FILENAME | LPARENCHAR | RPARENCHAR | IN)+
   ;

cobolWord
   : COPYBOOK_IDENTIFIER | IDENTIFIER | MAID | SOURCE | NOSOURCE | LIST | NOLIST | MAP | NOMAP | LINKAGE | SECTION | PROCEDURE | DIVISION
   ;

literal
   : NONNUMERICLITERAL | NUMERICLITERAL | INTEGERLITERAL | LEVEL_NUMBER |LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88
   ;

integerLiteral
   : INTEGERLITERAL | LEVEL_NUMBER | LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88
   ;

