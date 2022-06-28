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
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.core.IdmsLexer;
import org.eclipse.lsp.cobol.core.IdmsParser;
import org.eclipse.lsp.cobol.core.engine.dialects.CobolDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectParserListener;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.model.tree.CopyDefinition;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.service.copybooks.CopybookService;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/** Process the text according to the IDMS rules */
public final class IdmsDialect implements CobolDialect {
  public static final String NAME = "IDMS";
  private final CopybookService copybookService;
  private final ParseTreeListener treeListener;
  private final MessageService messageService;

  public IdmsDialect(
      CopybookService copybookService,
      ParseTreeListener treeListener,
      MessageService messageService) {
    this.copybookService = copybookService;
    this.treeListener = treeListener;
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
    List<SyntaxError> errors = new LinkedList<>();
    TextTransformations textTransformations = context.getTextTransformations();
    List<IdmsCopybookDescriptor> cbs =
        new CopybookInlineVisitor(textTransformations)
            .visitStartRule(
                parseIdms(textTransformations.calculateExtendedText(), "", errors));
    cbs.forEach(
        cb -> {
          CopybookModel copybookModel =
              copybookService.resolve(
                  new CopybookName(cb.getName(), IdmsDialect.NAME),
                  textTransformations.getUri(),
                  textTransformations.getUri(), // FIX me for nested case
                  context.getCopybookConfig(),
                  true);
          CopyNode copyNode = new CopyNode(cb.getUsage(), cb.getName(), IdmsDialect.NAME);

          Location cbLocation = new Location();
          cbLocation.setRange(new Range());
          cbLocation.setUri(copybookModel.getUri());
          CopyDefinition copyDefinition = new CopyDefinition(cbLocation, cb.getName());
          copyNode.setDefinition(copyDefinition);
          textTransformations.extend(
              copyNode,
              new TextTransformations(copybookModel.getContent(), copybookModel.getUri()));
        });
  }

  /**
   * Processing the text according to the IDMS rules
   *
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return the dialect processing result
   */
  public ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    IdmsVisitor visitor = new IdmsVisitor(copybookService, treeListener, messageService, context);
    List<SyntaxError> errors = new ArrayList<>();
    IdmsParser.StartRuleContext startRuleContext =
        parseIdms(context.getTextTransformations().calculateExtendedText(), context.getTextTransformations().getUri(), errors);
    List<Node> nodes = new ArrayList<>();
    nodes.addAll(visitor.visitStartRule(startRuleContext));
    nodes.addAll(context.getTextTransformations().getCopyNodes());
    errors.addAll(visitor.getErrors());

    return new ResultWithErrors<>(
        new DialectOutcome(visitor.getResultedText(), nodes, ImmutableMultimap.of()), errors);
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
