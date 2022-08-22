/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects.idms;

import com.google.common.collect.ImmutableMultimap;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.IdmsCopyLexer;
import org.eclipse.lsp.cobol.core.IdmsCopyParser;
import org.eclipse.lsp.cobol.core.IdmsLexer;
import org.eclipse.lsp.cobol.core.IdmsParser;
import org.eclipse.lsp.cobol.core.engine.dialects.CobolDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectParserListener;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.core.engine.mapping.DocumentMap;
import org.eclipse.lsp.cobol.core.engine.mapping.ExtendedSource;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.CopyDefinition;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookService;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.Deque;
import java.util.LinkedList;
import java.util.List;

/** Process the text according to the IDMS rules */
public final class IdmsDialect implements CobolDialect {
  public static final String NAME = "IDMS";
  private final CopybookService copybookService;
  private final MessageService messageService;

  public IdmsDialect(
      CopybookService copybookService,
      MessageService messageService) {
    this.copybookService = copybookService;
    this.messageService = messageService;
  }

  /**
   * Gets the name of the dialect
   *
   * @return the name of the dialect
   */
  @Override
  public String getName() {
    return NAME;
  }

  @Override
  public List<SyntaxError> extend(DialectProcessingContext context) {
    List<SyntaxError> errors = new LinkedList<>();

    IdmsDialectVisitor inlineVisitor = new IdmsDialectVisitor(context);
    IdmsParser.StartRuleContext ruleContext = parseIdms(context.getExtendedSource().getText(), context.getProgramDocumentUri(), errors);

    List<IdmsCopybookDescriptor> cbs = inlineVisitor.visitStartRule(ruleContext);
    cbs.forEach(cb ->
            insertIdmsCopybook(
                    context.getExtendedSource(),
                    context.getExtendedSource().getMainMap(),
                    errors, cb,
                    context.getProgramDocumentUri(),
                    context.getExtendedSource().getUri(),
                    context.getCopybookConfig()));
    return errors;
  }

  private void insertIdmsCopybook(ExtendedSource extendedSource, DocumentMap currentMap, List<SyntaxError> errors,
      IdmsCopybookDescriptor cb, String programDocumentUri, String currentUri,
      CopybookConfig copybookConfig) {
    insertIdmsCopybook(extendedSource, currentMap, errors, cb, programDocumentUri, currentUri,
        copybookConfig, new LinkedList<>());
  }

  private void insertIdmsCopybook(ExtendedSource extendedSource, DocumentMap currentMap, List<SyntaxError> errors,
                                  IdmsCopybookDescriptor cb, String programDocumentUri, String currentUri,
                                  CopybookConfig copybookConfig,
                                  Deque<String> copybookStack) {
    CopybookModel copybookModel =
        copybookService.resolve(
            new CopybookName(cb.getName(), IdmsDialect.NAME),
            programDocumentUri,
            currentUri,
            copybookConfig,
            true);

    if (copybookModel.getUri() == null || copybookModel.getContent() == null) {
      errors.add(ErrorHelper.missingCopybooks(messageService, cb.getUsage(), cb.getName()));
      extendedSource.replace(cb.getStatement().getRange(), "");
      return;
    }

    CopyNode copyNode = new CopyNode(cb.getStatement(), cb.getName(), IdmsDialect.NAME);
    if (recursiveCall(copybookStack, copyNode.getName())) {
      currentMap.replace(copyNode.getLocality().getRange(), "");
      errors.add(ErrorHelper.circularDependency(messageService, cb.getUsage(), cb.getName()));
      return;
    }
    copybookStack.push(copyNode.getName());

    Location cbLocation = new Location(copybookModel.getUri(), new Range(new Position(), new Position()));
    CopyDefinition copyDefinition = new CopyDefinition(cbLocation, cb.getName());
    copyNode.setDefinition(copyDefinition);

    DocumentMap copybookMap = new DocumentMap(copybookModel.getUri(), copybookModel.getContent());
    processTextTransformation(extendedSource, copybookMap,
            errors, copybookConfig, programDocumentUri, cb.getLevel(), copybookStack);
    copybookMap.commitTransformations();
    extendedSource.extend(currentMap, copyNode, copybookMap);
    copyNode.setLocality(cb.getUsage());
    copybookStack.pop();
  }

  private boolean recursiveCall(Deque<String> copybookStack, String name) {
    return copybookStack.contains(name);
  }

  private void processTextTransformation(ExtendedSource extendedSource,
                                         DocumentMap currentDocumentMap,
                                         List<SyntaxError> errors,
                                         CopybookConfig copybookConfig,
                                         String programDocumentUri,
                                         int copybookLevel,
                                         Deque<String> copybookStack) {
    IdmsCopyVisitor copyVisitor = new IdmsCopyVisitor(currentDocumentMap);
    IdmsCopyParser.StartRuleContext context = parseCopyIdms(currentDocumentMap.extendedText(), programDocumentUri, errors);

    List<IdmsCopybookDescriptor> cbs = copyVisitor.visitStartRule(context);
    int firstLevel = copyVisitor.getVariableLevels().stream().findFirst().map(Pair::getRight).orElse(0);
    copyVisitor.getVariableLevels().forEach(p -> {
      if (copybookLevel > 0 && p.getRight() != null) {
        currentDocumentMap.replace(p.getLeft(), String.format("%02d", calculateLevel(copybookLevel, firstLevel, p.getRight())));
      }
    });
    cbs.forEach(cb -> {
      if (copybookLevel > 0) {
        cb.setLevel(copybookLevel);
      }

      insertIdmsCopybook(extendedSource, currentDocumentMap, errors, cb, programDocumentUri, currentDocumentMap.getUri(), copybookConfig, copybookStack);
    });
  }

  private int calculateLevel(int copybookLevel, int firstLevel, int level) {
    int delta = copybookLevel - firstLevel;
    return level + delta;
  }

  /**
   * Processing the text according to the IDMS rules
   *
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return the dialect processing result
   */
  public ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    IdmsVisitor visitor = new IdmsVisitor(context);
    List<SyntaxError> errors = new ArrayList<>();
    IdmsParser.StartRuleContext startRuleContext = parseIdms(context.getExtendedSource().getText(),
            context.getExtendedSource().getUri(), errors);
    List<Node> nodes = new ArrayList<>();
    nodes.addAll(visitor.visitStartRule(startRuleContext));
    nodes.addAll(context.getExtendedSource().calculateCopyNodes());

    new ArrayList<>(nodes).stream().filter(c -> c instanceof CopyNode).forEach(n -> {
      new ArrayList<>(nodes).stream()
          .filter(cn -> cn != n)
          .filter(cn -> cn instanceof CopyNode)
          .map(CopyNode.class::cast)
          .filter(cn -> cn.getDefinition().getLocation().getUri().equals(n.getLocality().getUri()))
          .forEach(cn -> {
            nodes.remove(n);
            cn.addChild(n);
          });
    });

    errors.addAll(visitor.getErrors());

    return new ResultWithErrors<>(new DialectOutcome(nodes, ImmutableMultimap.of(), context), errors);
  }

  private IdmsCopyParser.StartRuleContext parseCopyIdms(String text, String programDocumentUri, List<SyntaxError> errors) {
    IdmsCopyLexer lexer = new IdmsCopyLexer(CharStreams.fromString(text));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    IdmsCopyParser parser = new IdmsCopyParser(tokens);
    DialectParserListener listener = new DialectParserListener(programDocumentUri);
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));

    IdmsCopyParser.StartRuleContext result = parser.startRule();
    errors.addAll(listener.getErrors());
    return result;
  }

  private IdmsParser.StartRuleContext parseIdms(
      String text, String programDocumentUri, List<SyntaxError> errors) {
    IdmsLexer lexer = new IdmsLexer(CharStreams.fromString(text));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    IdmsParser parser = new IdmsParser(tokens);
    DialectParserListener listener = new DialectParserListener(programDocumentUri);
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));

    IdmsParser.StartRuleContext result = parser.startRule();
    errors.addAll(listener.getErrors());
    return result;
  }
}
