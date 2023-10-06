/*
 * Copyright (c) 2021 Broadcom.
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
 *
 */

package org.eclipse.lsp.cobol.core.engine.analysis;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;
import org.eclipse.lsp.cobol.common.EmbeddedLanguage;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.core.*;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;

import static org.eclipse.lsp.cobol.core.CobolParser.*;

/**
 * This lexer separates embedded language code parts from the main document and parse them with
 * specific parsers.
 */
@AllArgsConstructor
public class EmbeddedCodeListener extends CobolParserBaseListener {

  private final MessageService messageService;
  private final ParseTreeListener treeListener;
  private final ParserListener errorListener;
  private final String programUri;
  private final List<EmbeddedLanguage> features;
  private final ExtendedDocument extendedDocument;
  private final CopybooksRepository copybooksRepository;

  @Getter private final List<Node> resultNodes = new LinkedList<>();
  @Getter private final List<SyntaxError> errors = new LinkedList<>();

  @Override
  public void exitExecSqlStatementInProcedureDivision(
      ExecSqlStatementInProcedureDivisionContext ctx) {
    parseSql(ctx.execSqlStatement(), Db2SqlParser::procedureDivisionRules);
  }

  @Override
  public void exitExecSqlStatementInWorkingStorage(ExecSqlStatementInWorkingStorageContext ctx) {
    parseSql(ctx.execSqlStatement(), Db2SqlParser::dataDivisionRules);
  }

  @Override
  public void exitExecSqlStatementInWorkingStorageAndLinkageSection(
      ExecSqlStatementInWorkingStorageAndLinkageSectionContext ctx) {
    parseSql(ctx.execSqlStatement(), Db2SqlParser::dataDivisionRules);
  }

  @Override
  public void exitExecSqlStatementInDataDivision(ExecSqlStatementInDataDivisionContext ctx) {
    parseSql(ctx.execSqlStatement(), Db2SqlParser::dataDivisionRules);
  }


  private List<SyntaxError> fetchError(Location originalLocation) {
    List<SyntaxError> errorList = new ArrayList<>();
    errorListener.getErrors().forEach(e -> {
      if (embeddedCodePresentInMainSource(originalLocation)) {
        e.getLocation().getLocation().setRange(
                getAdjustedRange(originalLocation, e));
        errorList.add(e);
      } else {
        errorList.add(getSyntaxErrorForCopybook(originalLocation, e));
      }
    });
    return Collections.unmodifiableList(errorList);
  }

  private Range getAdjustedRange(Location originalLocation, SyntaxError e) {
    return RangeUtils.shiftRangeWithPosition(originalLocation.getRange().getStart(), e.getLocation().getLocation().getRange());
  }

  private SyntaxError getSyntaxErrorForCopybook(Location originalLocation, SyntaxError e) {
    return SyntaxError.syntaxError()
            .errorSource(e.getErrorSource())
            .location(
                    Locality.builder()
                            .uri(originalLocation.getUri())
                            .range(getAdjustedRange(originalLocation, e))
                            .copybookId(copybooksRepository.getCopybookIdByUri(originalLocation.getUri()))
                            .build().toOriginalLocation())
            .suggestion(e.getSuggestion())
            .severity(e.getSeverity())
            .build();
  }

  private boolean embeddedCodePresentInMainSource(Location originalLocation) {
    return extendedDocument.getCurrentText().getUri().equals(originalLocation.getUri());
  }

  private Position createPosition(Token token) {
    return new Position(token.getLine() - 1, token.getCharPositionInLine());
  }

  private void parseSql(
      ExecSqlStatementContext context, Function<Db2SqlParser, ParserRuleContext> grammarStartRule) {
    if (!features.contains(EmbeddedLanguage.SQL)) return;

    errorListener.getErrors().clear();
    SqlCodeContext sqlCode = context.sqlCode();
    if (sqlCode == null) return;
    CommonTokenStream tokens = applyDb2Lexer(sqlCode);
    Location originalLocation = getOriginalLocation(sqlCode);

    ParserRuleContext tree = grammarStartRule.apply(createDb2SqlParser(tokens));
    ParseTreeVisitor<List<Node>> visitor = instanceVisitor(createPosition(sqlCode.getStart()), EmbeddedLanguage.SQL);
    resultNodes.addAll(visitor.visit(tree));

    errors.addAll(fetchError(originalLocation));
  }

  private Location getOriginalLocation(ParserRuleContext parserRuleContext) {
    return extendedDocument.mapLocation(
            new Range(createPosition(parserRuleContext.getStart()), createPosition(parserRuleContext.getStop())));
  }

  private CommonTokenStream applyDb2Lexer(ParserRuleContext context) {
    Db2SqlLexer lexer =
        new Db2SqlLexer(CharStreams.fromString(VisitorHelper.getIntervalText(context)));
    lexer.removeErrorListeners();

    return new CommonTokenStream(lexer);
  }

  private Db2SqlParser createDb2SqlParser(CommonTokenStream tokens) {
    Db2SqlParser parser = new Db2SqlParser(tokens);
    configureParser(parser);
    return parser;
  }

  private void configureParser(Parser parser) {
    parser.removeErrorListeners();
    parser.addErrorListener(errorListener);
    parser.addParseListener(treeListener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
  }

  /**
   * Instance AST visitor for provided language
   * @param position is a embedded code statring position
   * @param lang the languate
   * @return a visitor
   */
  public ParseTreeVisitor<List<Node>> instanceVisitor(Position position, EmbeddedLanguage lang) {
    if (EmbeddedLanguage.SQL == lang) {
      return new Db2SqlVisitor(position, programUri, extendedDocument);
    }
    throw new RuntimeException("Unknown language " + lang);
  }

}
