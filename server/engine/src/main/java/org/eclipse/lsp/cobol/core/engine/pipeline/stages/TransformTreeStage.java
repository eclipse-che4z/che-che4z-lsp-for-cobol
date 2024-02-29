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

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.statements.StatementNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.model.tree.variables.FileDescriptionNode;
import org.eclipse.lsp.cobol.common.processor.*;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.pipeline.Stage;
import org.eclipse.lsp.cobol.core.engine.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.processors.*;
import org.eclipse.lsp.cobol.core.engine.processors.implicit.ImplicitVariablesProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.visitor.CobolVisitor;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;

/**
 * Transform Tree Stage
 */
@RequiredArgsConstructor
public class TransformTreeStage implements Stage<ProcessingResult, ParserStageResult> {

  private final SymbolsRepository symbolsRepository;
  private final MessageService messageService;
  private final SubroutineService subroutineService;
  private final CachingConfigurationService cachingConfigurationService;
  private final DialectService dialectService;
  private final AstProcessor astProcessor;
  private final CodeLayoutStore codeLayoutStore;

  @Override
  public StageResult<ProcessingResult> run(AnalysisContext context, StageResult<ParserStageResult> prevStageResult) {
    // Transform parsed tree to AST
    List<Node> syntaxTree = transformAST(
            context,
            context.getCopybooksRepository(),
            prevStageResult.getData().getTokens(),
            prevStageResult.getData().getTree());

    SymbolAccumulatorService symbolAccumulatorService = new SymbolAccumulatorService();
    Node rootNode = processSyntaxTree(context.getConfig(), symbolAccumulatorService, context, syntaxTree);

    symbolsRepository.updateSymbols(symbolAccumulatorService.getProgramSymbols());

    return new StageResult<>(new ProcessingResult(symbolAccumulatorService.getProgramSymbols(), rootNode));
  }

  @Override
  public String getName() {
    return "Transform tree";
  }

  private void addDialectsNode(AnalysisContext context, Node rootNode) {
    for (Node dialectNode : context.getDialectNodes()) {
      Optional<Node> nodeByPosition =
          RangeUtils.findNodeByPosition(
              rootNode,
              dialectNode.getLocality().getUri(),
              dialectNode.getLocality().getRange().getStart());

      nodeByPosition.orElse(rootNode).addChild(dialectNode);
    }
  }

  private void addCopyNodes(AnalysisContext context, Node rootNode) {
    for (Map.Entry<String, Location> copybook : context.getCopybooksRepository().getUsages().entries()) {
      String name = copybook.getKey();
      Range range = copybook.getValue().getRange();
      Locality statementLocality = Locality.builder().range(range).uri(copybook.getValue().getUri()).build();
      String copybookUri = context.getCopybooksRepository().getDefinitions().get(name).stream().findFirst().orElse(null);
      rootNode.addChild(
          new CopyNode(statementLocality, copybook.getValue(), name, copybookUri));
    }
  }

  private List<Node> transformAST(AnalysisContext ctx,
                                  CopybooksRepository copybooksRepository, CommonTokenStream tokens,
                                  CobolParser.StartRuleContext tree) {
    CobolVisitor visitor =
        new CobolVisitor(copybooksRepository, tokens, ctx.getExtendedDocument(),
            messageService, subroutineService, cachingConfigurationService, codeLayoutStore);
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
    addCopyNodes(ctx, rootNode);
    addDialectsNode(ctx, rootNode);

    ProcessingContext processingContext =
            new ProcessingContext(new ArrayList<>(), symbolAccumulatorService, getCompilerDirectiveContext(analysisConfig), ctx.getConfig().getDialectsSettings());
    registerProcessors(analysisConfig, processingContext, symbolAccumulatorService);
    ctx.getAccumulatedErrors().addAll(astProcessor.processSyntaxTree(processingContext, rootNode));
    return rootNode;
  }

  private CompilerDirectiveContext getCompilerDirectiveContext(AnalysisConfig analysisConfig) {
    CompilerDirectiveContext compilerDirectiveContext = new CompilerDirectiveContext();
    analysisConfig.getCompilerOptions().stream()
            .map(this::getCompilerDirective)
            .forEach(opts -> opts.ifPresent(compilerDirectiveContext::updateDirectiveOptions));
    return compilerDirectiveContext;
  }

  private Optional<CompilerDirectiveOption> getCompilerDirective(String compilerOptions) {
    return Arrays.stream(CompilerDirectiveName.values())
            .map(val -> val.getDirectiveOption(compilerOptions))
            .filter(Optional::isPresent)
            .map(Optional::get)
            .findFirst();
  }

  private void registerProcessors(AnalysisConfig analysisConfig, ProcessingContext ctx, SymbolAccumulatorService symbolAccumulatorService) {
    // Phase TRANSFORMATION
    ProcessingPhase t = ProcessingPhase.TRANSFORMATION;
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
    ctx.register(v, JsonParseNode.class, new JsonParseProcess(symbolAccumulatorService));
    ctx.register(v, JsonGenerateNode.class, new JsonGenerateProcess(symbolAccumulatorService));
    ctx.register(v, XMLParseNode.class, new XMLParseProcess(symbolAccumulatorService));
    ctx.register(v, FileOperationStatementNode.class, new FileOperationProcess());

    // Implicit Dialects
    dialectService.getActiveImplicitDialects(analysisConfig)
            .stream().map(CobolDialect::getProcessors)
            .flatMap(List::stream)
            .forEach(ctx::register);

    // Dialects
    List<ProcessorDescription> pds = dialectService.getProcessors(analysisConfig.getDialects());
    pds.forEach(ctx::register);
  }

}
