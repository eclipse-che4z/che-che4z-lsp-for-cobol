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

package org.eclipse.lsp.cobol.implicitDialects.cics;

import com.google.common.collect.ImmutableList;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.implicitDialects.cics.nodes.ExecCicsNode;
import org.eclipse.lsp.cobol.implicitDialects.cics.processor.CICSExecBlockProcessor;
import org.eclipse.lsp.cobol.implicitDialects.cics.processor.CICSImplicitVariablesProcessor;
import org.eclipse.lsp.cobol.implicitDialects.cics.processor.CICSTranslateMandatorySectionProcess;

/** CICS dialect */
@Slf4j
public class CICSDialect implements CobolDialect {

  public static final String DIALECT_NAME = "cics";
  private final CopybookService copybookService;
  private final MessageService messageService;

  public CICSDialect(CopybookService copybookService, MessageService messageService) {
    this.copybookService = copybookService;
    this.messageService = messageService;
  }

  @Override
  public String getName() {
    return DIALECT_NAME;
  }

  @Override
  public ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    CICSVisitor cicsVisitor = new CICSVisitor(context, messageService);

    List<SyntaxError> parseError = new ArrayList<>();

    // parse the document text to get parseTree
    CICSParser.StartRuleContext startRuleContext =
        parseCICS(
            context.getExtendedDocument().toString(),
            context.getExtendedDocument().getUri(),
            parseError);

    // Traverse the parse tree to generate dialect specific nodes
    List<Node> nodes = new ArrayList<>(cicsVisitor.visitStartRule(startRuleContext));

    // Add nodes returned by extend method. Not needed here.
    nodes.addAll(context.getDialectNodes());

    // Add error encountered while visiting the parser. To be reported to COBOL LS engine.
    parseError.addAll(cicsVisitor.getErrors());

    return new ResultWithErrors<>(new DialectOutcome(nodes, context), parseError);
  }

  @Override
  public List<ProcessorDescription> getProcessors() {
    return ImmutableList.of(
        new ProcessorDescription(
            ProgramNode.class,
            ProcessingPhase.TRANSFORMATION,
            new CICSTranslateMandatorySectionProcess()),
        new ProcessorDescription(
            SectionNode.class,
            ProcessingPhase.POST_DEFINITION,
            new CICSImplicitVariablesProcessor()),
        new ProcessorDescription(
            ExecCicsNode.class,
            ProcessingPhase.VALIDATION,
            new CICSExecBlockProcessor(messageService)));
  }

  @Override
  public List<CompilerDirectiveNode> getCompilerDirectives(DialectProcessingContext context) {
    CICSVisitor cicsVisitor = new CICSVisitor(context, messageService);
    List<SyntaxError> parseError = new ArrayList<>();
    // parse the document text to get parseTree
    CICSParser.CompilerDirectiveContext compilerDirectiveContext =
        parseCICSDirective(
            context.getExtendedDocument().toString(),
            context.getExtendedDocument().getUri(),
            parseError);

    // Traverse the parse tree to generate dialect specific nodes
    List<Node> nodes = new ArrayList<>(cicsVisitor.visitCompilerDirective(compilerDirectiveContext));

    return nodes.stream().filter(CompilerDirectiveNode.class::isInstance).map(CompilerDirectiveNode.class::cast).collect(Collectors.toList());
  }

  private CICSParser.StartRuleContext parseCICS(
      String text, String programDocumentUri, List<SyntaxError> errors) {
    CICSLexer lexer = new CICSLexer(CharStreams.fromString(text));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    CICSParser parser = new CICSParser(tokens);
    CICSErrorListener listener = new CICSErrorListener(programDocumentUri);
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CICSErrorStrategy(messageService));

    CICSParser.StartRuleContext result = parser.startRule();
    errors.addAll(listener.getErrors());
    return result;
  }

  private CICSParser.CompilerDirectiveContext parseCICSDirective(
          String text, String programDocumentUri, List<SyntaxError> errors) {
    CICSLexer lexer = new CICSLexer(CharStreams.fromString(text));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    CICSParser parser = new CICSParser(tokens);
    CICSErrorListener listener = new CICSErrorListener(programDocumentUri);
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CICSErrorStrategy(messageService));

    CICSParser.CompilerDirectiveContext compilerDirectiveContext = parser.compilerDirective();
    errors.addAll(listener.getErrors());
    return compilerDirectiveContext;
  }
}
