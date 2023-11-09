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
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol.implicitDialects.sql;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonElement;
import java.util.*;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.file.WorkspaceFileService;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.common.utils.PredefinedCopybooks;
import org.eclipse.lsp.cobol.implicitDialects.sql.node.Db2DataAndProcedureDivisionNode;
import org.eclipse.lsp.cobol.implicitDialects.sql.node.Db2DeclareVariableNode;
import org.eclipse.lsp.cobol.implicitDialects.sql.node.Db2ProcedureDivisionNode;
import org.eclipse.lsp.cobol.implicitDialects.sql.node.Db2WorkingAndLinkageSectionNode;
import org.eclipse.lsp.cobol.implicitDialects.sql.processor.*;

/** Db2 SQL dialect */
@Slf4j
public class Db2SqlDialect implements CobolDialect {
  public static final String DIALECT_NAME = "db2";
  public static final String SQL_BACKEND_SETTING = "target-sql-backend";

  private final CopybookService copybookService;
  private final MessageService messageService;

  public Db2SqlDialect(CopybookService copybookService, MessageService messageService) {
    this.copybookService = copybookService;
    this.messageService = messageService;
  }

  @Override
  public String getName() {
    return DIALECT_NAME;
  }

  @Override
  public ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    Db2SqlVisitor db2SqlVisitor = new Db2SqlVisitor(context, messageService);

    List<SyntaxError> parseError = new ArrayList<>();

    // parse the document text to get parseTree
    Db2SqlParser.StartRuleContext startRuleContext =
        parseDB2(
            context.getExtendedDocument().toString(),
            context.getExtendedDocument().getUri(),
            parseError);

    // Traverse the parse tree to generate dialect specific nodes
    List<Node> nodes = db2SqlVisitor.visitStartRule(startRuleContext);

    // Add nodes returned by extend method. Not needed here.
    nodes.addAll(context.getDialectNodes());

    // Add error encountered while visiting the parser. To be reported to COBOL LS engine.
    parseError.addAll(db2SqlVisitor.getErrors());

    return new ResultWithErrors<>(new DialectOutcome(nodes, context), parseError);
  }

  @Override
  public List<CopybookModel> getPredefinedCopybook(AnalysisConfig ctx) {
    return ImmutableList.of("SQLDA", "SQLCA").stream()
        .map(CopybookName::new)
        .collect(Collectors.toList())
        .stream()
        .map(copybook -> tryResolvePredefinedCopybook(copybook, ctx.getDialectsSettings()))
        .filter(Optional::isPresent)
        .map(Optional::get)
        .collect(Collectors.toList());
  }

  @Override
  public List<ProcessorDescription> getProcessors() {
    return ImmutableList.of(
        new ProcessorDescription(
            SectionNode.class,
            ProcessingPhase.POST_DEFINITION,
            new ImplicitDb2VariablesProcessor()),
        new ProcessorDescription(
            Db2DataAndProcedureDivisionNode.class,
            ProcessingPhase.POST_DEFINITION,
            new Db2DataAndProcedureDivisionProcessor(messageService)),
        new ProcessorDescription(
            Db2DeclareVariableNode.class,
            ProcessingPhase.POST_DEFINITION,
            new Db2DeclareVariableProcessor(messageService)),
        new ProcessorDescription(
            Db2ProcedureDivisionNode.class,
            ProcessingPhase.POST_DEFINITION,
            new Db2ProcedureDivisionProcessor(messageService)),
        new ProcessorDescription(
            Db2WorkingAndLinkageSectionNode.class,
            ProcessingPhase.POST_DEFINITION,
            new Db2WorkingAndLinkageSectionProcessor(messageService)));
  }

  @Override
  public List<String> getSettingsSections() {
    return ImmutableList.of(SQL_BACKEND_SETTING);
  }

  private Db2SqlParser.StartRuleContext parseDB2(
      String text, String programDocumentUri, List<SyntaxError> errors) {
    Db2SqlLexer lexer = new Db2SqlLexer(CharStreams.fromString(text));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    Db2SqlParser parser = new Db2SqlParser(tokens);
    Db2ErrorListener listener = new Db2ErrorListener(programDocumentUri);
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new Db2ErrorStrategy(messageService));

    Db2SqlParser.StartRuleContext result = parser.startRule();
    errors.addAll(listener.getErrors());
    return result;
  }

  /**
   * Retrieve optional {@link CopybookModel} of the {@link PredefinedCopybooks} for the given name
   * if it is predefined.
   *
   * @param copybookName - the name of copybook to check
   * @param dialectsSettings - Dialect specific settings
   * @return optional model of a predefined copybook if it exists
   */
  private Optional<CopybookModel> tryResolvePredefinedCopybook(
      CopybookName copybookName, Map<String, JsonElement> dialectsSettings) {
    SQLBackend sqlBackend =
        Optional.ofNullable(dialectsSettings.get("target-sql-backend"))
            .map(JsonElement::getAsString)
            .map(SQLBackend::valueOf)
            .orElse(SQLBackend.DB2_SERVER);
    LOG.debug(
        "Trying to resolve predefined copybook {}, using sqlBackend {}", copybookName, sqlBackend);

    Optional<CopybookModel> copybookModel =
        Optional.ofNullable(PredefinedCopybooks.forName(copybookName.getQualifiedName()))
            .map(
                c -> {
                  String name = c.nameForBackend(sqlBackend);
                  String content = new WorkspaceFileService().readImplicitCode(name);
                  return new CopybookModel(
                      copybookName.toCopybookId(ImplicitCodeUtils.createFullUrl(c.name())),
                      copybookName,
                      ImplicitCodeUtils.createFullUrl(c.name()),
                      content);
                });

    LOG.debug("Db2 Predefined copybook: {}", copybookModel);
    return copybookModel;
  }
}
