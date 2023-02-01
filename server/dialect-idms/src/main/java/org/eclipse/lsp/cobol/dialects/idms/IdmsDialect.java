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
package org.eclipse.lsp.cobol.dialects.idms;

import com.google.common.collect.ImmutableList;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookModel;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.DocumentMap;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.CopyDefinition;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.utils.KeywordsUtils;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;

/** Process the text according to the IDMS rules */
public final class IdmsDialect implements CobolDialect {
  public static final String NAME = "IDMS";
  private static final String IDMS_CPY_LOCAL_PATHS = "cpy-manager.idms.paths-local";
  private final CopybookService copybookService;
  private final MessageService messageService;

  public IdmsDialect(CopybookService copybookService, MessageService messageService) {
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
    cbs.forEach(cb -> {
      DocumentMap currentMap = context.getExtendedSource().getMainMap();
      String currentUri = context.getExtendedSource().getUri();
      insertIdmsCopybook(context, currentMap, errors, cb, context.getProgramDocumentUri(), currentUri, new LinkedList<>());
    });
    return errors;
  }

  private void insertIdmsCopybook(DialectProcessingContext ctx, DocumentMap currentMap, List<SyntaxError> errors,
                                  IdmsCopybookDescriptor cb, String programDocumentUri, String currentUri,
                                  Deque<String> copybookStack) {
    CopybookName copybookName = new CopybookName(cb.getName(), IdmsDialect.NAME);
    CopybookModel copybookModel =
        copybookService.resolve(
            copybookName.toCopybookId(programDocumentUri),
            copybookName,
            programDocumentUri,
            currentUri,
            ctx.getCopybookConfig(),
            true);

    if (copybookModel.getUri() == null || copybookModel.getContent() == null) {
      errors.add(ErrorHelper.missingCopybooks(messageService, cb.getUsage(), cb.getName()));
      if (!cb.isInsert()) {
        ctx.getExtendedSource().replace(cb.getStatement().getRange(), "");
      }
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
    processTextTransformation(ctx, copybookMap,
            errors, programDocumentUri, cb.getLevel(), copybookStack, copyNode);
    copybookMap.commitTransformations();
    if (cb.isInsert()) {
      ctx.getExtendedSource().insert(currentMap, copyNode.getLocality().getRange().getStart().getLine(), copybookMap);
    } else {
      ctx.getExtendedSource().extend(currentMap, copyNode.getLocality().getRange(), copybookMap);
    }
    copyNode.setLocality(cb.getUsage());
    Range range = ctx.getExtendedSource().mapLocationUnsafe(copyNode.getLocality().getRange()).getRange();
    copyNode.getLocality().setRange(range);
    ctx.getDialectNodes().add(copyNode);
    copybookStack.pop();
  }

  private boolean recursiveCall(Deque<String> copybookStack, String name) {
    return copybookStack.contains(name);
  }

  private void processTextTransformation(
          DialectProcessingContext ctx,
          DocumentMap currentDocumentMap,
          List<SyntaxError> errors,
          String programDocumentUri,
          int copybookLevel,
          Deque<String> copybookStack,
          CopyNode copyNode) {
    IdmsCopyVisitor copyVisitor = new IdmsCopyVisitor(currentDocumentMap);
    IdmsCopyParser.StartRuleContext context =
        parseCopyIdms(currentDocumentMap.extendedText(), programDocumentUri, errors);

    List<IdmsCopybookDescriptor> cbs = copyVisitor.visitStartRule(context);
    int firstLevel =
        copyVisitor.getVariableLevels().stream().findFirst().map(Pair::getRight).orElse(0);
    copyVisitor
        .getVariableLevels()
        .forEach(
            p -> {
              if (copybookLevel > 0 && p.getRight() != null) {
                CopyIdmsAdjustmentProcessor copyIdmsAdjustmentProcessor = new CopyIdmsAdjustmentProcessor(copyNode,
                        currentDocumentMap.getUri(), copybookLevel, firstLevel, p, messageService);
                currentDocumentMap.replace(
                        p.getLeft(),
                        String.format("%02d", copyIdmsAdjustmentProcessor.calculateLevel(copybookLevel, firstLevel, p.getRight())));
                copyIdmsAdjustmentProcessor.processError(errors);
              }
            });
    cbs.forEach(
        cb -> {
          if (copybookLevel > 0) {
            cb.setLevel(copybookLevel);
          }

          insertIdmsCopybook(ctx, currentDocumentMap, errors, cb, programDocumentUri, currentDocumentMap.getUri(), copybookStack);
        });
  }

  /**
   * Processing the text according to the IDMS rules
   *
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return the dialect processing result
   */
  @Override
  public ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    IdmsVisitor visitor = new IdmsVisitor(context);
    List<SyntaxError> errors = new ArrayList<>();
    IdmsParser.StartRuleContext startRuleContext = parseIdms(context.getExtendedSource().getText(),
            context.getExtendedSource().getUri(), errors);
    List<Node> nodes = new ArrayList<>();
    nodes.addAll(visitor.visitStartRule(startRuleContext));
    nodes.addAll(context.getDialectNodes());

    new ArrayList<>(nodes).stream().filter(CopyNode.class::isInstance).forEach(n ->
        new ArrayList<>(nodes).stream()
        .filter(cn -> cn != n)
        .filter(CopyNode.class::isInstance)
        .map(CopyNode.class::cast)
        .filter(cn -> cn.getDefinition().getLocation().getUri().equals(n.getLocality().getUri()))
        .forEach(cn -> {
          nodes.remove(n);
          cn.addChild(n);
        }));

    errors.addAll(visitor.getErrors());

    return new ResultWithErrors<>(new DialectOutcome(nodes, context), errors);
  }

  @Override
  public Map<String, String> getKeywords() {
    return KeywordsUtils.getKeywords("KeywordsCobolCheck.txt");
  }

  @Override
  public List<String> getWatchingFolderSettings() {
    return ImmutableList.of(IDMS_CPY_LOCAL_PATHS);
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
