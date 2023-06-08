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
package org.eclipse.lsp.cobol.dialects.daco;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.common.utils.KeywordsUtils;
import org.eclipse.lsp.cobol.dialects.daco.nodes.DaCoCopyFromNode;
import org.eclipse.lsp.cobol.dialects.daco.processors.DaCoCopyFromProcessor;
import org.eclipse.lsp.cobol.dialects.daco.processors.implicit.DaCoImplicitCodeProcessor;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Process the text according to the DaCo rules */
public final class DaCoDialect implements CobolDialect {
  public static final String NAME = "DaCo";
  private final Pattern dcdbPattern = Pattern.compile("^[\\s\\d]{7}D-[BC]", Pattern.MULTILINE);
  private static final String DACO_CPY_LOCAL_PATHS = "cpy-manager.daco.paths-local";
  public static final String DACO_PREDEFINED_SECTIONS = "daco.predefined-sections";
  private static final String IDMS_DIALECT_NAME = "IDMS";

  private final MessageService messageService;

  private final DaCoMaidProcessor maidProcessor;

  public DaCoDialect(CopybookService copybookService, MessageService messageService) {
    this.messageService = messageService;
    this.maidProcessor = new DaCoMaidProcessor(copybookService,
        new InterruptingTreeListener(), messageService);
  }

  /**
   * Gets the name of the dialect
   *
   * @return the name of the dialect
   */
  @Override
  public String getName() {
    return DaCoDialect.NAME;
  }

  /**
   * Processing the text according to the DaCo rules
   *
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return the dialect processing result
   */
  @Override
  public ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    List<SyntaxError> errors = new ArrayList<>();
    removeDcDb(context.getExtendedDocument());
    DialectOutcome maidOutcome = maidProcessor.process(context, errors);
    context.getExtendedDocument().commitTransformations();
    DaCoLexer lexer = new DaCoLexer(CharStreams.fromString(context.getExtendedDocument().toString()));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    DaCoParser parser = new DaCoParser(tokens);
    DialectParserListener listener =
        new DialectParserListener(context.getExtendedDocument().getUri());
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
    DaCoVisitor visitor = new DaCoVisitor(context);
    List<Node> nodes = visitor.visitStartRule(parser.startRule());
    nodes.addAll(maidOutcome.getDialectNodes());

    List<SyntaxError> parserErrors = new LinkedList<>();
    parserErrors.addAll(listener.getErrors());
    parserErrors.addAll(visitor.getErrors());

    parserErrors.forEach(error -> error.getLocation().getLocation().setRange(
            context.getExtendedDocument().mapLocation(error.getLocation().getLocation().getRange()).getRange()));

    errors.addAll(parserErrors);

    DialectOutcome result = new DialectOutcome(nodes, context);
    return new ResultWithErrors<>(result, errors);
  }

  @Override
  public Map<String, String> getKeywords() {
    return KeywordsUtils.getKeywords(DaCoDialect.class.getClassLoader(), "KeywordsDaCo.txt");
  }

  private void removeDcDb(ExtendedDocument extendedDocument) {
    String input = extendedDocument.toString();
    Matcher matcher = dcdbPattern.matcher(input);
    while (matcher.find()) {
      Position start = DialectUtils.findPosition(input, matcher.start());
      Position end = DialectUtils.findPosition(input, matcher.end() - 2);
      String replace = new String(new char[matcher.end() - matcher.start() - 1]).replace('\0', ' ');
      extendedDocument.replace(new Range(start, end), replace);
    }
  }

  @Override
  public List<SyntaxError> extend(DialectProcessingContext context) {
    return ImmutableList.of();
  }

  @Override
  public Set<String> runBefore() {
    return ImmutableSet.of(IDMS_DIALECT_NAME);
  }

  @Override
  public List<ProcessorDescription> getProcessors() {
    return ImmutableList.of(
        new ProcessorDescription(
            DaCoCopyFromNode.class, ProcessingPhase.POST_DEFINITION,
                new DaCoCopyFromProcessor()),
        new ProcessorDescription(ProgramNode.class, ProcessingPhase.POST_DEFINITION,
                new DaCoImplicitCodeProcessor())
    );
  }

  @Override
  public List<String> getSettingsSections() {
    return ImmutableList.of(DACO_PREDEFINED_SECTIONS);
  }

  @Override
  public List<String> getWatchingFolderSettings() {
    return ImmutableList.of(DACO_CPY_LOCAL_PATHS);
  }
}
