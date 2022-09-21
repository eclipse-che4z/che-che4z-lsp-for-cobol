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
package org.eclipse.lsp.cobol.core.engine.dialects.daco;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Multimap;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.DaCoLexer;
import org.eclipse.lsp.cobol.core.DaCoParser;
import org.eclipse.lsp.cobol.core.engine.dialects.*;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.nodes.DaCoCopyFromNode;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.provider.DaCoImplicitCodeProvider;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.core.engine.mapping.ExtendedSource;
import org.eclipse.lsp.cobol.core.engine.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.core.engine.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Process the text according to the DaCo rules */
@RequiredArgsConstructor
public final class DaCoDialect implements CobolDialect {
  public static final String NAME = "DaCo";
  private final Pattern dcdbPattern = Pattern.compile("^[\\s\\d]{7}D-[BC]", Pattern.MULTILINE);

  private final MessageService messageService;
  private final DaCoMaidProcessor maidProcessor;

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
    removeDcDb(context.getExtendedSource());
    DialectOutcome maidOutcome = maidProcessor.process(context, errors);
    context.getExtendedSource().commitTransformations();
    DaCoLexer lexer = new DaCoLexer(CharStreams.fromString(context.getExtendedSource().getText()));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    DaCoParser parser = new DaCoParser(tokens);
    DialectParserListener listener =
        new DialectParserListener(context.getExtendedSource().getUri());
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
    DaCoVisitor visitor = new DaCoVisitor(context);
    List<Node> nodes = visitor.visitStartRule(parser.startRule());
    nodes.addAll(maidOutcome.getDialectNodes());
    errors.addAll(listener.getErrors());
    errors.addAll(visitor.getErrors());

    DaCoImplicitCodeProvider provider = new DaCoImplicitCodeProvider(maidProcessor.getSections());
    Multimap<String, Pair<String, String>> implicitCode =
        provider.getImplicitCode(
            context.getExtendedSource().getText(), nodes, context.getCopybookConfig());

    DialectOutcome result = new DialectOutcome(nodes, implicitCode, context);
    return new ResultWithErrors<>(result, errors);
  }

  private void removeDcDb(ExtendedSource extendedSource) {
    String input = extendedSource.getText();
    Matcher matcher = dcdbPattern.matcher(input);
    while (matcher.find()) {
      Position start = DialectUtils.findPosition(input, matcher.start());
      Position end = DialectUtils.findPosition(input, matcher.end() - 1);
      String replace = new String(new char[matcher.end() - matcher.start() - 1]).replace('\0', ' ');
      extendedSource.replace(new Range(start, end), replace);
    }
  }

  @Override
  public List<SyntaxError> extend(DialectProcessingContext context) {
    return ImmutableList.of();
  }

  @Override
  public Set<String> runBefore() {
    return ImmutableSet.of(IdmsDialect.NAME);
  }

  @Override
  public List<ProcessorDescription> getProcessors() {
    return Collections.singletonList(
        new ProcessorDescription(
            DaCoCopyFromNode.class, ProcessingPhase.POST_DEFINITION, new DaCoCopyFromProcessor()));
  }
}
