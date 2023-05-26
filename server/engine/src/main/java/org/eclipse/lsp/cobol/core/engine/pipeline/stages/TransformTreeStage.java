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
package org.eclipse.lsp.cobol.core.engine.pipeline.stages;

import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.CommonTokenStream;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.pipeline.Stage;
import org.eclipse.lsp.cobol.core.engine.pipeline.PipelineResult;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.model.tree.*;
import org.eclipse.lsp.cobol.core.model.tree.logic.*;
import org.eclipse.lsp.cobol.core.model.tree.logic.implicit.ImplicitVariablesProcessor;
import org.eclipse.lsp.cobol.core.model.tree.statements.StatementNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.FileDescriptionNode;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.visitor.CobolVisitor;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext.Activity.SYNTAX_TREE;
import static org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext.Activity.VISITOR;

/**
 * Transform Tree Stage
 */
@RequiredArgsConstructor
public class TransformTreeStage implements Stage<ProcessingResult, Pair<ParserStageResult, List<Node>>> {

  private final SymbolsRepository symbolsRepository;
  private final MessageService messageService;
  private final SubroutineService subroutineService;
  private final CachingConfigurationService cachingConfigurationService;
  private final DialectService dialectService;
  private final AstProcessor astProcessor;

  @Override
  public PipelineResult<ProcessingResult> run(AnalysisContext context, PipelineResult<Pair<ParserStageResult, List<Node>>> prevPipelineResult) {
    // Transform parsed tree to AST
    List<Node> syntaxTree = context.measure(VISITOR,
        () -> transformAST(
            context,
            context.getDialectNodes(),
            context.getCopybooksRepository(),
            prevPipelineResult.getData().getKey().getTokens(),
            prevPipelineResult.getData().getKey().getTree()));

    addEmbeddedNodes(syntaxTree.get(0), prevPipelineResult.getData().getRight());

    SymbolAccumulatorService symbolAccumulatorService = new SymbolAccumulatorService();
    Node rootNode = context.measure(SYNTAX_TREE,
        () -> {
          Node root = processSyntaxTree(context.getConfig(), symbolAccumulatorService, context, syntaxTree);
          symbolsRepository.updateSymbols(symbolAccumulatorService.getProgramSymbols());
          return root;
        });

    return new PipelineResult<>(new ProcessingResult(symbolAccumulatorService.getProgramSymbols(), rootNode));
  }

  private List<Node> transformAST(AnalysisContext ctx, List<Node> dialectNodes,
                                  CopybooksRepository copybooksRepository, CommonTokenStream tokens,
                                  CobolParser.StartRuleContext tree) {
    CobolVisitor visitor =
        new CobolVisitor(copybooksRepository, tokens, ctx.getExtendedSource(),
            messageService, subroutineService, dialectNodes, cachingConfigurationService);
    List<Node> syntaxTree = visitor.visit(tree);
    ctx.getAccumulatedErrors().addAll(visitor.getErrors());
    return syntaxTree;
  }

  private void addEmbeddedNodes(Node rootNode, List<Node> embeddedNodes) {
    for (Node dialectNode : embeddedNodes) {
      Optional<Node> nodeByPosition =
          RangeUtils.findNodeByPosition(
              rootNode,
              dialectNode.getLocality().getUri(),
              dialectNode.getLocality().getRange().getStart());

      nodeByPosition.orElse(rootNode).addChild(dialectNode);
    }
  }

  private Node processSyntaxTree(AnalysisConfig analysisConfig, SymbolAccumulatorService symbolAccumulatorService, AnalysisContext ctx, List<Node> syntaxTree) {
    Node rootNode = syntaxTree.get(0);
    ProcessingContext processingContext = new ProcessingContext(new ArrayList<>(), symbolAccumulatorService, ctx.getConfig().getDialectsSettings());
    registerProcessors(analysisConfig, processingContext, symbolAccumulatorService);
    ctx.getAccumulatedErrors().addAll(astProcessor.processSyntaxTree(processingContext, rootNode));
    return rootNode;
  }

  private void registerProcessors(AnalysisConfig analysisConfig, ProcessingContext ctx, SymbolAccumulatorService symbolAccumulatorService) {
    // Phase TRANSFORMATION
    ProcessingPhase t = ProcessingPhase.TRANSFORMATION;
    ctx.register(t, CompilerDirectiveNode.class, new CompilerDirectiveProcess());
    ctx.register(t, ProgramIdNode.class, new ProgramIdProcess());
    ctx.register(t, SectionNode.class, new SectionNodeProcessor(symbolAccumulatorService));
    ctx.register(t, FileEntryNode.class, new FileEntryProcess());
    ctx.register(t, FileDescriptionNode.class, new FileDescriptionProcess(symbolAccumulatorService));
    ctx.register(t, DeclarativeProcedureSectionNode.class, new DeclarativeProcedureSectionRegister(symbolAccumulatorService));

    // Phase DEFINITION
    ProcessingPhase d = ProcessingPhase.DEFINITION;
    ctx.register(d, ParagraphsNode.class, new DefineCodeBlock(symbolAccumulatorService));
    ctx.register(d, SectionNameNode.class, new SectionNameRegister(symbolAccumulatorService));
    ctx.register(d, ParagraphNameNode.class, new ParagraphNameRegister(symbolAccumulatorService));
    ctx.register(d, ProcedureDivisionBodyNode.class, new DefineCodeBlock(symbolAccumulatorService));

    // Phase POST DEFINITION
    ctx.register(ProcessingPhase.POST_DEFINITION, SectionNode.class, new ImplicitVariablesProcessor());

    // Phase USAGE
    ProcessingPhase u = ProcessingPhase.USAGE;
    ctx.register(u, CodeBlockUsageNode.class, new CodeBlockUsage(symbolAccumulatorService));
    ctx.register(u, RootNode.class, new RootNodeUpdateCopyNodesByPositionInTree());
    ctx.register(u, QualifiedReferenceNode.class, new QualifiedReferenceUpdateVariableUsage(symbolAccumulatorService));

    // ENRICHMENT
    ProcessingPhase e = ProcessingPhase.ENRICHMENT;
    ctx.register(e, SectionNameNode.class, new SectionNameNodeEnricher(symbolAccumulatorService));
    ctx.register(e, ParagraphNameNode.class, new ParagraphNameNodeEnricher(symbolAccumulatorService));
    ctx.register(e, CodeBlockUsageNode.class, new CodeBlockUsageNodeEnricher(symbolAccumulatorService));

    // Phase VALIDATION
    ProcessingPhase v = ProcessingPhase.VALIDATION;
    ctx.register(v, VariableWithLevelNode.class, new VariableWithLevelCheck());
    ctx.register(v, StatementNode.class, new StatementValidate());
    ctx.register(v, ElementaryNode.class, new ElementaryNodeCheck());
    ctx.register(v, GroupItemNode.class, new GroupItemCheck());
    ctx.register(v, ObsoleteNode.class, new ObsoleteNodeCheck());
    ctx.register(v, StandAloneDataItemNode.class, new StandAloneDataItemCheck());
    ctx.register(v, ProgramEndNode.class, new ProgramEndCheck());
    ctx.register(v, CICSTranslatorNode.class, new CICSTranslatorProcessor(analysisConfig, messageService));
    ctx.register(t, JsonParseNode.class, new JsonParseProcess(symbolAccumulatorService));
    ctx.register(t, JsonGenerateNode.class, new JsonGenerateProcess(symbolAccumulatorService));

    // Dialects
    List<ProcessorDescription> pds = dialectService.getProcessors(analysisConfig.getDialects());
    pds.forEach(ctx::register);
  }

}
