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
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
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
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;

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

  /**
   * This implementation is specific to include statements. This injects include copybooks into a
   * document before analysis.
   *
   * @param context data related to dialect processing
   * @return a list of syntax errors
   */
  @Override
  public List<SyntaxError> extend(DialectProcessingContext context) {
    IncludeRuleVisitor includeRuleVisitor = new IncludeRuleVisitor(context);
    List<SyntaxError> errors = new ArrayList<>();

    Db2SqlParser.StartIncludeRuleContext startRuleContext =
        parseIncludeStatement(
            context.getExtendedDocument().toString(),
            context.getExtendedDocument().getUri(),
            errors);

    List<CopyNode> nodes = includeRuleVisitor.visitStartIncludeRule(startRuleContext);

    nodes.forEach(
        node -> {
          String currentUri = context.getExtendedDocument().getUri();
          includeDb2Copybook(context, errors, node, currentUri, new LinkedList<>());
        });
    return errors;
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

  private void includeDb2Copybook(
      DialectProcessingContext context,
      List<SyntaxError> errors,
      CopyNode node,
      String currentUri,
      Deque<String> copybookStack) {
    CopybookName copybookName = new CopybookName(node.getName());
    ResultWithErrors<CopybookModel> resolvedCopybook =
        copybookService.resolve(
            copybookName.toCopybookId(context.getProgramDocumentUri()),
            copybookName,
            context.getProgramDocumentUri(),
            currentUri,
            true);

    if (resolvedCopybook.getResult().getUri() == null
        || resolvedCopybook.getResult().getContent() == null) {
      errors.addAll(resolvedCopybook.getErrors());
      errors.add(ErrorHelper.missingCopybooks(messageService, node.getLocality(), node.getName()));
      return;
    }

    CopybookModel copybookModel = resolvedCopybook.getResult();
    node.getLocality().setCopybookId(copybookModel.getCopybookId().toString());
    CopyNode copyNode =
        new CopyNode(
            node.getLocality(),
            node.getNameLocation(),
            copybookName.getQualifiedName(),
            copybookModel.getUri());
    if (recursiveCall(copybookStack, copyNode.getName())) {
      errors.add(
          ErrorHelper.circularDependency(messageService, node.getLocality(), node.getName()));
      return;
    }
    Range range =
        context.getExtendedDocument().mapLocation(copyNode.getLocality().getRange()).getRange();
    copyNode.getLocality().setRange(range);
    copybookStack.push(copyNode.getName());
    ExtendedDocument copybookDocument =
        new ExtendedDocument(copybookModel.getContent(), copybookModel.getUri());
    copybookDocument.commitTransformations();
    context
        .getExtendedDocument()
        .insertCopybook(copyNode.getNameLocation().getRange(), copybookDocument.getCurrentText());
    Location location = context.getExtendedDocument().mapLocation(copyNode.getNameLocation().getRange());
    copyNode.setLocality(node.getLocality().toBuilder().uri(location.getUri()).range(location.getRange()).build());
    context.getDialectNodes().add(copyNode);
    copybookStack.pop();
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

  private Db2SqlParser.StartIncludeRuleContext parseIncludeStatement(
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

    Db2SqlParser.StartIncludeRuleContext result = parser.startIncludeRule();
    errors.addAll(listener.getErrors());
    return result;
  }

  private boolean recursiveCall(Deque<String> copybookStack, String name) {
    return copybookStack.contains(name);
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
