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
import org.eclipse.lsp.cobol.core.engine.mapping.Mappable;
import org.eclipse.lsp.cobol.core.engine.mapping.TextTransformations;
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
  public void extend(DialectProcessingContext context) {
    Deque<String> copybookStack = new LinkedList<>();

    List<SyntaxError> errors = new LinkedList<>();

    IdmsDialectVisitor inlineVisitor = new IdmsDialectVisitor(context);
    IdmsParser.StartRuleContext ruleContext = parseIdms(context.extendedText(), "", errors);

    List<IdmsCopybookDescriptor> cbs = inlineVisitor.visitStartRule(ruleContext);
    cbs.forEach(cb -> insertIdmsCopybook(context, errors, cb, context.getProgramDocumentUri(),
            context.getCurrentUri(), context.getCopybookConfig(), copybookStack));
  }

  private void insertIdmsCopybook(Mappable map, List<SyntaxError> errors,
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
    CopyNode copyNode = new CopyNode(cb.getStatement(), cb.getName(), IdmsDialect.NAME);
    if (recursiveCall(copybookStack, copyNode.getName())) {
      map.replace(copyNode.getLocality().getRange(), "");
      errors.add(ErrorHelper.circularDependency(messageService, cb.getUsage(), cb.getName()));
      return;
    }
    copybookStack.push(copyNode.getName());

    Location cbLocation = new Location(copybookModel.getUri(), new Range(new Position(), new Position()));
    CopyDefinition copyDefinition = new CopyDefinition(cbLocation, cb.getName());
    copyNode.setDefinition(copyDefinition);

    TextTransformations copyTransform = new TextTransformations(copybookModel.getContent(), copybookModel.getUri());
    Mappable mappable = new Mappable() {
      @Override
      protected TextTransformations getTextTransformations() {
        return copyTransform;
      }
    };
    mappable.rebuildMapping();
    processTextTransformation(mappable, errors, copybookConfig, programDocumentUri, cb.level, copybookStack);

    map.extend(copyNode, copyTransform);
    copyNode.setLocality(cb.getUsage());
    copybookStack.pop();
  }

  private boolean recursiveCall(Deque<String> copybookStack, String name) {
    return copybookStack.contains(name);
  }

  private void processTextTransformation(Mappable map,
                                         List<SyntaxError> errors,
                                         CopybookConfig copybookConfig, String programDocumentUri,
                                         int copybookLevel, Deque<String> copybookStack) {
    IdmsCopyVisitor copyVisitor = new IdmsCopyVisitor(map);
    IdmsCopyParser.StartRuleContext context = parseCopyIdms(map.extendedText(), programDocumentUri, errors);

    List<IdmsCopybookDescriptor> cbs = copyVisitor.visitStartRule(context);
    int firstLevel = copyVisitor.getVariableLevels().stream().findFirst().map(Pair::getRight).orElse(0);
    copyVisitor.getVariableLevels().forEach(p -> {
      if (copybookLevel > 0 && p.getRight() != null) {
        // TODO: use mapping
        map.replace(p.getLeft(), String.format("%02d", calculateLevel(copybookLevel, firstLevel, p.getRight())));
      }
    });

    cbs.forEach(cb -> {
      if (copybookLevel > 0) {
        cb.level = copybookLevel;
      }

      insertIdmsCopybook(map, errors, cb, programDocumentUri, map.getCurrentUri(), copybookConfig, copybookStack);
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
    IdmsParser.StartRuleContext startRuleContext = parseIdms(context.extendedText(), context.getCurrentUri(), errors);
    List<Node> nodes = new ArrayList<>();
    nodes.addAll(visitor.visitStartRule(startRuleContext));
    nodes.addAll(context.calculateCopyNodes());
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
