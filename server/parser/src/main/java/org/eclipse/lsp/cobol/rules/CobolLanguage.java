/*
 * Copyright (c) 2024 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 */
package org.eclipse.lsp.cobol.rules;

import java.util.*;
import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.rules.data.DataDivisionRule;
import org.eclipse.lsp.cobol.rules.environment.EnvironmentDivisionRule;
import org.eclipse.lsp.cobol.rules.identification.IdentificationDivisionRule;
import org.eclipse.lsp.cobol.rules.procedure.*;
import org.eclipse.lsp.cobol.rules.procedure.statements.*;

/** A container for COBOL language grammar rules. */
public class CobolLanguage {
  private final Map<Class<? extends LanguageRule>, LanguageRule> languageRules = new HashMap<>();
  private final Set<String> reservedWord = new HashSet<>();

  public CobolLanguage() {
    languageRules.put(SourceUnitRule.class, new SourceUnitRule());
    languageRules.put(ProgramRule.class, new ProgramRule());

    languageRules.put(EnvironmentDivisionRule.class, new EnvironmentDivisionRule());
    languageRules.put(DataDivisionRule.class, new DataDivisionRule());
    languageRules.put(ProcedureDivisionRule.class, new ProcedureDivisionRule());

    languageRules.put(DeclarativesRule.class, new DeclarativesRule());

    languageRules.put(ParagraphRule.class, new ParagraphRule());
    languageRules.put(IdentificationDivisionRule.class, new IdentificationDivisionRule());
    languageRules.put(SectionRule.class, new SectionRule());
    languageRules.put(SentenceRule.class, new SentenceRule());
    languageRules.put(AddRule.class, new AddRule());
    languageRules.put(MultiplyRule.class, new MultiplyRule());
    languageRules.put(ComputeRule.class, new ComputeRule());
    languageRules.put(PerformRule.class, new PerformRule());
    languageRules.put(IfRule.class, new IfRule());
    languageRules.put(MoveRule.class, new MoveRule());
    languageRules.put(EvaluateRule.class, new EvaluateRule());
    languageRules.put(StringRule.class, new StringRule());
    languageRules.put(UnstringRule.class, new UnstringRule());
    languageRules.put(SearchRule.class, new SearchRule());
    languageRules.put(SubtractRule.class, new SubtractRule());
    languageRules.put(CallRule.class, new CallRule());
    languageRules.put(DivideRule.class, new DivideRule());
    languageRules.put(StartRule.class, new StartRule());
    languageRules.put(ReadRule.class, new ReadRule());
    languageRules.put(ReturnRule.class, new ReturnRule());
    languageRules.put(DeleteRule.class, new DeleteRule());
    languageRules.put(WriteRule.class, new WriteRule());
    languageRules.put(RewriteRule.class, new RewriteRule());

    // Fragments
    languageRules.put(ConditionExpressionRule.class, new ConditionExpressionRule());
    languageRules.put(ArithmeticExpressionRule.class, new ArithmeticExpressionRule());
    languageRules.put(IdentifierRule.class, new IdentifierRule());

    //// Reserved Words P. 761
    // Arithmetic operator
    reservedWord.add("+");
    reservedWord.add("-");
    reservedWord.add("*");
    reservedWord.add("/");
    reservedWord.add("**");
    reservedWord.add(">");
    reservedWord.add("<");
    reservedWord.add("=");
    reservedWord.add("==");
    reservedWord.add(">=");
    reservedWord.add("<=");
    reservedWord.add("<>");
    reservedWord.add("*>");
    reservedWord.add(">>");
    //
    reservedWord.add("ACCEPT");
    reservedWord.add("ACCESS");
    reservedWord.add("ACTIVE-CLASS");
    reservedWord.add("ADD");
    reservedWord.add("ADDRESS");
    reservedWord.add("ADVANCING");
    reservedWord.add("AFTER");
    reservedWord.add("ALIGNED");
    reservedWord.add("ALL");
    reservedWord.add("ALLOCATE");
    reservedWord.add("ALPHABET");
    reservedWord.add("ALPHABETIC");
    reservedWord.add("ALPHABETIC-LOWER");
    reservedWord.add("ALPHABETIC-UPPER");
    reservedWord.add("ALPHANUMERIC");
    reservedWord.add("ALPHANUMERIC-EDITED");
    reservedWord.add("ALSO");
    reservedWord.add("ALTER");
    reservedWord.add("ALTERNATE");
    reservedWord.add("AND");
    reservedWord.add("ANY");
    reservedWord.add("ANYCASE");
    reservedWord.add("APPLY");
    reservedWord.add("ARE");
    reservedWord.add("AREA");
    reservedWord.add("AREAS");
    reservedWord.add("ASCENDING");
    reservedWord.add("ASSIGN");
    reservedWord.add("AT");
    reservedWord.add("AUTHOR");
    reservedWord.add("BASIS");
    reservedWord.add("BEFORE");
    reservedWord.add("BEGINNING");
    reservedWord.add("BINARY");
    reservedWord.add("BLANK");
    reservedWord.add("BLOCK");
    reservedWord.add("BOTTOM");
    reservedWord.add("BY");
    reservedWord.add("BYTE-LENGTH");
    reservedWord.add("CALL");
    reservedWord.add("CANCEL");
    reservedWord.add("CBL");
    reservedWord.add("CD");
    reservedWord.add("CF");
    reservedWord.add("CH");
    reservedWord.add("CHARACTER");
    reservedWord.add("CHARACTERS");
    reservedWord.add("CLASS");
    reservedWord.add("CLASS-ID");
    reservedWord.add("CLOCK-UNITS");
    reservedWord.add("CLOSE");
    reservedWord.add("COBOL");
    reservedWord.add("CODE");
    reservedWord.add("CODE-SET");
    reservedWord.add("COLLATING");
    reservedWord.add("COLUMN");
    reservedWord.add("COM-REG");
    reservedWord.add("COMMA");
    reservedWord.add("COMMON");
    reservedWord.add("COMMUNICATION");
    reservedWord.add("COMP");
    reservedWord.add("COMP-1");
    reservedWord.add("COMP-2");
    reservedWord.add("COMP-3");
    reservedWord.add("COMP-4");
    reservedWord.add("COMP-5");
    reservedWord.add("COMPUTATIONAL");
    reservedWord.add("COMPUTATIONAL-1");
    reservedWord.add("COMPUTATIONAL-2");
    reservedWord.add("COMPUTATIONAL-3");
    reservedWord.add("COMPUTATIONAL-4");
    reservedWord.add("COMPUTATIONAL-5");
    reservedWord.add("COMPUTE");
    reservedWord.add("CONFIGURATION");
    reservedWord.add("CONTAINS");
    reservedWord.add("CONTENT");
    reservedWord.add("CONTINUE");
    reservedWord.add("CONTROL");
    reservedWord.add("CONTROLS");
    reservedWord.add("CONVERTING");
    reservedWord.add("COPY");
    reservedWord.add("CORR");
    reservedWord.add("CORRESPONDING");
    reservedWord.add("COUNT");
    reservedWord.add("CURRENCY");
    reservedWord.add("DATA");
    reservedWord.add("DATE");
    reservedWord.add("DATE-COMPILED");
    reservedWord.add("DATE-WRITTEN");
    reservedWord.add("DAY");
    reservedWord.add("DAY-OF-WEEK");
    reservedWord.add("DBCS");
    reservedWord.add("DE");
    reservedWord.add("DEBUG-CONTENTS");
    reservedWord.add("DEBUG-ITEM");
    reservedWord.add("DEBUG-LINE");
    reservedWord.add("DEBUG-NAME");
    reservedWord.add("DEBUG-SUB-1");
    reservedWord.add("DEBUG-SUB-2");
    reservedWord.add("DEBUG-SUB-3");
    reservedWord.add("DEBUGGING");
    reservedWord.add("DECIMAL-POINT");
    reservedWord.add("DECLARATIVES");
    reservedWord.add("DEFAULT");
    reservedWord.add("DELETE");
    reservedWord.add("DELIMITED");
    reservedWord.add("DELIMITER");
    reservedWord.add("DEPENDING");
    reservedWord.add("DESCENDING");
    reservedWord.add("DESTINATION");
    reservedWord.add("DETAIL");
    reservedWord.add("DISABLE");
    reservedWord.add("DISPLAY");
    reservedWord.add("DISPLAY-1");
    reservedWord.add("DIVIDE");
    reservedWord.add("DIVISION");
    reservedWord.add("DOWN");
    reservedWord.add("DUPLICATES");
    reservedWord.add("DYNAMIC");
    reservedWord.add("EGCS");
    reservedWord.add("EGI");
    reservedWord.add("EJECT");
    reservedWord.add("ELSE");
    reservedWord.add("EMI");
    reservedWord.add("ENABLE");
    reservedWord.add("END");
    reservedWord.add("END-ADD");
    reservedWord.add("END-CALL");
    reservedWord.add("END-COMPUTE");
    reservedWord.add("END-DELETE");
    reservedWord.add("END-DIVIDE");
    reservedWord.add("END-EVALUATE");
    reservedWord.add("END-EXEC");
    reservedWord.add("END-IF");
    reservedWord.add("END-INVOKE");
    reservedWord.add("END-JSON");
    reservedWord.add("END-MULTIPLY");
    reservedWord.add("END-OF-PAGE");
    reservedWord.add("END-PERFORM");
    reservedWord.add("END-READ");
    reservedWord.add("END-RECEIVE");
    reservedWord.add("END-RETURN");
    reservedWord.add("END-REWRITE");
    reservedWord.add("END-SEARCH");
    reservedWord.add("END-START");
    reservedWord.add("END-STRING");
    reservedWord.add("END-SUBTRACT");
    reservedWord.add("END-UNSTRING");
    reservedWord.add("END-WRITE");
    reservedWord.add("END-XML");
    reservedWord.add("ENDING");
    reservedWord.add("ENTER");
    reservedWord.add("ENTRY");
    reservedWord.add("ENVIRONMENT");
    reservedWord.add("EOP");
    reservedWord.add("EQUAL");
    reservedWord.add("ERROR");
    reservedWord.add("ESI");
    reservedWord.add("EVALUATE");
    reservedWord.add("EVERY");
    reservedWord.add("EXCEPTION");
    reservedWord.add("EXEC");
    reservedWord.add("EXECUTE");
    reservedWord.add("EXIT");
    reservedWord.add("EXTEND");
    reservedWord.add("EXTERNAL");
    reservedWord.add("FACTORY");
    reservedWord.add("FALSE");
    reservedWord.add("FD");
    reservedWord.add("FILE");
    reservedWord.add("FILE-CONTROL");
    reservedWord.add("FILLER");
    reservedWord.add("FINAL");
    reservedWord.add("FIRST");
    reservedWord.add("FOOTING");
    reservedWord.add("FOR");
    reservedWord.add("FREE");
    reservedWord.add("FROM");
    reservedWord.add("FUNCTION");
    reservedWord.add("FUNCTION-ID");
    reservedWord.add("FUNCTION-POINTER");
    reservedWord.add("GENERATE");
    reservedWord.add("GIVING");
    reservedWord.add("GLOBAL");
    reservedWord.add("GO");
    reservedWord.add("GOBACK");
    reservedWord.add("GREATER");
    reservedWord.add("GROUP");
    reservedWord.add("GROUP-USAGE");
    reservedWord.add("HEADING");
    reservedWord.add("HIGH-VALUE");
    reservedWord.add("HIGH-VALUES");
    reservedWord.add("I-O");
    reservedWord.add("I-O-CONTROL");
    reservedWord.add("ID");
    reservedWord.add("IDENTIFICATION");
    reservedWord.add("IF");
    reservedWord.add("IN");
    reservedWord.add("INDEX");
    reservedWord.add("INDEXED");
    reservedWord.add("INDICATE");
    reservedWord.add("INHERITS");
    reservedWord.add("INITIAL");
    reservedWord.add("INITIALIZE");
    reservedWord.add("INITIATE");
    reservedWord.add("INPUT");
    reservedWord.add("INPUT-OUTPUT");
    reservedWord.add("INSERT");
    reservedWord.add("INSPECT");
    reservedWord.add("INSTALLATION");
    reservedWord.add("INTO");
    reservedWord.add("INVALID");
    reservedWord.add("INVOKE");
    reservedWord.add("IS");
    reservedWord.add("JAVA");
    reservedWord.add("JNIENVPTR");
    reservedWord.add("JSON");
    reservedWord.add("JSON-CODE");
    reservedWord.add("JSON-STATUS");
    reservedWord.add("JUST");
    reservedWord.add("JUSTIFIED");
    reservedWord.add("KANJI");
    reservedWord.add("KEY");
    reservedWord.add("LABEL");
    reservedWord.add("LAST");
    reservedWord.add("LEADING");
    reservedWord.add("LEFT");
    reservedWord.add("LENGTH");
    reservedWord.add("LESS");
    reservedWord.add("LIMIT");
    reservedWord.add("LIMITS");
    reservedWord.add("LINAGE");
    reservedWord.add("LINAGE-COUNTER");
    reservedWord.add("LINE");
    reservedWord.add("LINE-COUNTER");
    reservedWord.add("LINES");
    reservedWord.add("LINKAGE");
    reservedWord.add("LOCAL-STORAGE");
    reservedWord.add("LOCK");
    reservedWord.add("LOW-VALUE");
    reservedWord.add("LOW-VALUES");
    reservedWord.add("MEMORY");
    reservedWord.add("MERGE");
    reservedWord.add("MESSAGE");
    reservedWord.add("METHOD");
    reservedWord.add("METHOD-ID");
    reservedWord.add("MODE");
    reservedWord.add("MODULES");
    reservedWord.add("MORE-LABELS");
    reservedWord.add("MOVE");
    reservedWord.add("MULTIPLE");
    reservedWord.add("MULTIPLY");
    reservedWord.add("NATIONAL");
    reservedWord.add("NATIONAL-EDITED");
    reservedWord.add("NATIVE");
    reservedWord.add("NEGATIVE");
    reservedWord.add("NEXT");
    reservedWord.add("NO");
    reservedWord.add("NOT");
    reservedWord.add("NULL");
    reservedWord.add("NULLS");
    reservedWord.add("NUMBER");
    reservedWord.add("NUMERIC");
    reservedWord.add("NUMERIC-EDITED");
    reservedWord.add("OBJECT");
    reservedWord.add("OBJECT-COMPUTER");
    reservedWord.add("OCCURS");
    reservedWord.add("OF");
    reservedWord.add("OFF");
    reservedWord.add("OMITTED");
    reservedWord.add("ON");
    reservedWord.add("OPEN");
    reservedWord.add("OPTIONAL");
    reservedWord.add("OPTIONS");
    reservedWord.add("OR");
    reservedWord.add("ORDER");
    reservedWord.add("ORGANIZATION");
    reservedWord.add("OTHER");
    reservedWord.add("OUTPUT");
    reservedWord.add("OVERFLOW");
    reservedWord.add("OVERRIDE");
    reservedWord.add("PACKED-DECIMAL");
    reservedWord.add("PADDING");
    reservedWord.add("PAGE");
    reservedWord.add("PAGE-COUNTER");
    reservedWord.add("PASSWORD");
    reservedWord.add("PERFORM");
    reservedWord.add("PF");
    reservedWord.add("PH");
    reservedWord.add("PIC");
    reservedWord.add("PICTURE");
    reservedWord.add("PLUS");
    reservedWord.add("POINTER");
    reservedWord.add("POINTER-32");
    reservedWord.add("POSITION");
    reservedWord.add("POSITIVE");
    reservedWord.add("PRINTING");
    reservedWord.add("PROCEDURE");
    reservedWord.add("PROCEDURE-POINTER");
    reservedWord.add("PROCEDURES");
    reservedWord.add("PROCEED");
    reservedWord.add("PROCESSING");
    reservedWord.add("PROGRAM");
    reservedWord.add("PROGRAM-ID");
    reservedWord.add("PROTOTYPE");
    reservedWord.add("PURGE");
    reservedWord.add("QUEUE");
    reservedWord.add("QUOTE");
    reservedWord.add("QUOTES");
    reservedWord.add("RANDOM");
    reservedWord.add("RD");
    reservedWord.add("READ");
    reservedWord.add("READY");
    reservedWord.add("RECEIVE");
    reservedWord.add("RECORD");
    reservedWord.add("RECORDING");
    reservedWord.add("RECORDS");
    reservedWord.add("RECURSIVE");
    reservedWord.add("REDEFINES");
    reservedWord.add("REEL");
    reservedWord.add("REFERENCE");
    reservedWord.add("REFERENCES");
    reservedWord.add("RELATIVE");
    reservedWord.add("RELEASE");
    reservedWord.add("RELOAD");
    reservedWord.add("REMAINDER");
    reservedWord.add("REMOVAL");
    reservedWord.add("RENAMES");
    reservedWord.add("REPLACE");
    reservedWord.add("REPLACING");
    reservedWord.add("REPORT");
    reservedWord.add("REPORTING");
    reservedWord.add("REPORTS");
    reservedWord.add("REPOSITORY");
    reservedWord.add("RERUN");
    reservedWord.add("RESERVE");
    reservedWord.add("RESET");
    reservedWord.add("RESUME");
    reservedWord.add("RETRY");
    reservedWord.add("RETURN");
    reservedWord.add("RETURN-CODE");
    reservedWord.add("RETURNING");
    reservedWord.add("REVERSED");
    reservedWord.add("REWIND");
    reservedWord.add("REWRITE");
    reservedWord.add("RF");
    reservedWord.add("RH");
    reservedWord.add("RIGHT");
    reservedWord.add("ROUNDED");
    reservedWord.add("RUN");
    reservedWord.add("SAME");
    reservedWord.add("SD");
    reservedWord.add("SEARCH");
    reservedWord.add("SECTION");
    reservedWord.add("SECURITY");
    reservedWord.add("SEGMENT");
    reservedWord.add("SEGMENT-LIMIT");
    reservedWord.add("SELECT");
    reservedWord.add("SELF");
    reservedWord.add("SEND");
    reservedWord.add("SENTENCE");
    reservedWord.add("SEPARATE");
    reservedWord.add("SEQUENCE");
    reservedWord.add("SEQUENTIAL");
    reservedWord.add("SERVICE");
    reservedWord.add("SET");
    reservedWord.add("SHIFT-IN");
    reservedWord.add("SHIFT-OUT");
    reservedWord.add("SIGN");
    reservedWord.add("SIZE");
    reservedWord.add("SKIP1");
    reservedWord.add("SKIP2");
    reservedWord.add("SKIP3");
    reservedWord.add("SORT");
    reservedWord.add("SORT-CONTROL");
    reservedWord.add("SORT-CORE-SIZE");
    reservedWord.add("SORT-FILE-SIZE");
    reservedWord.add("SORT-MERGE");
    reservedWord.add("SORT-MESSAGE");
    reservedWord.add("SORT-MODE-SIZE");
    reservedWord.add("SORT-RETURN");
    reservedWord.add("SOURCE");
    reservedWord.add("SOURCE-COMPUTER");
    reservedWord.add("SPACE");
    reservedWord.add("SPACES");
    reservedWord.add("SPECIAL-NAMES");
    reservedWord.add("SQL");
    reservedWord.add("SQLIMS");
    reservedWord.add("STANDARD");
    reservedWord.add("STANDARD-1");
    reservedWord.add("STANDARD-2");
    reservedWord.add("START");
    reservedWord.add("STATUS");
    reservedWord.add("STOP");
    reservedWord.add("STRING");
    reservedWord.add("SUB-QUEUE-1");
    reservedWord.add("SUB-QUEUE-2");
    reservedWord.add("SUB-QUEUE-3");
    reservedWord.add("SUBTRACT");
    reservedWord.add("SUM");
    reservedWord.add("SUPER");
    reservedWord.add("SUPPRESS");
    reservedWord.add("SYMBOLIC");
    reservedWord.add("SYNC");
    reservedWord.add("SYNCHRONIZED");
    reservedWord.add("TABLE");
    reservedWord.add("TALLY");
    reservedWord.add("TALLYING");
    reservedWord.add("TAPE");
    reservedWord.add("TERMINAL");
    reservedWord.add("TERMINATE");
    reservedWord.add("TEST");
    reservedWord.add("TEXT");
    reservedWord.add("THAN");
    reservedWord.add("THEN");
    reservedWord.add("THROUGH");
    reservedWord.add("THRU");
    reservedWord.add("TIME");
    reservedWord.add("TIMES");
    reservedWord.add("TITLE");
    reservedWord.add("TO");
    reservedWord.add("TOP");
    reservedWord.add("TRACE");
    reservedWord.add("TRAILING");
    reservedWord.add("TRUE");
    reservedWord.add("TYPE");
    reservedWord.add("UNIT");
    reservedWord.add("UNSTRING");
    reservedWord.add("UNTIL");
    reservedWord.add("UP");
    reservedWord.add("UPON");
    reservedWord.add("USAGE");
    reservedWord.add("USE");
    reservedWord.add("USING");
    reservedWord.add("UTF-8");
    reservedWord.add("VALUE");
    reservedWord.add("VALUES");
    reservedWord.add("VARYING");
    reservedWord.add("VOLATILE");
    reservedWord.add("WHEN");
    reservedWord.add("WHEN-COMPILED");
    reservedWord.add("WITH");
    reservedWord.add("WORDS");
    reservedWord.add("WORKING-STORAGE");
    reservedWord.add("WRITE");
    reservedWord.add("WRITE-ONLY");
    reservedWord.add("XML");
    reservedWord.add("XML-CODE");
    reservedWord.add("XML-EVENT");
    reservedWord.add("XML-INFORMATION");
    reservedWord.add("XML-NAMESPACE");
    reservedWord.add("XML-NAMESPACE-PREFIX");
    reservedWord.add("XML-NNAMESPACE");
    reservedWord.add("XML-NNAMESPACE-PREFIX");
    reservedWord.add("XML-NTEXT");
    reservedWord.add("XML-SCHEMA");
    reservedWord.add("XML-TEXT");
    reservedWord.add("ZERO");
    reservedWord.add("ZEROES");
    reservedWord.add("ZEROS");
  }

  /**
   * Is the next sequence of tokens can be this rule.
   *
   * @param ruleClass a rule class.
   * @param ctx parsing relater api.
   * @return true if rule matches.
   */
  public boolean tryMatchRule(Class<? extends LanguageRule> ruleClass, ParsingContext ctx) {
    return languageRules.get(ruleClass).tryMatch(ctx, this);
  }

  /**
   * Parse the rule.
   *
   * @param ruleClass a rule class.
   * @param ctx parsing relater api.
   */
  public void parseRule(Class<? extends LanguageRule> ruleClass, ParsingContext ctx) {
    languageRules.get(ruleClass).parse(ctx, this);
  }

  /**
   * Parse the rule if it matches. A combination of tryMatch and parse method calls.
   *
   * @param ruleClass a rule class
   * @param ctx parsing relater api.
   * @return optional true if rule matched even if parsing had errors.
   */
  public Optional<Boolean> tryParseRule(
      Class<? extends LanguageRule> ruleClass, ParsingContext ctx) {
    LanguageRule rule = languageRules.get(ruleClass);
    if (rule.tryMatch(ctx, this)) {
      rule.parse(ctx, this);
      return Optional.of(true);
    }
    return Optional.empty();
  }

  /**
   * Checks if lexeme can be user defined word
   *
   * @param lexeme a string to check
   * @return true/false
   */
  public boolean isUserDefinedWord(String lexeme) {
    // P.11: A reserved word cannot be used as a user-defined word or as a system-name.
    return !isReservedWord(lexeme);
  }

  private boolean isReservedWord(String lexeme) {
    return reservedWord.contains(lexeme);
  }
}
