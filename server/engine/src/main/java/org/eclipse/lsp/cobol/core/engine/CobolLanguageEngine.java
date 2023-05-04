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
package org.eclipse.lsp.cobol.core.engine;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.mapping.ExtendedSource;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.mapping.TextTransformations;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.analysis.EmbeddedCodeService;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.errors.ErrorFinalizerService;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.model.tree.*;
import org.eclipse.lsp.cobol.core.model.tree.logic.*;
import org.eclipse.lsp.cobol.core.model.tree.logic.implicit.ImplicitVariablesProcessor;
import org.eclipse.lsp.cobol.core.model.tree.statements.StatementNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.FileDescriptionNode;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.PreprocessorContext;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.core.visitor.CobolVisitor;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.utils.ServerTypeUtil;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.error.ErrorSource.WORKSPACE_SETTINGS;
import static org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext.Activity.*;

/**
 * This class is responsible for run the syntax and semantic analysis of an input cobol document.
 * Its run method used by the service facade layer CobolLanguageEngineFacade.
 */
@Slf4j
@Singleton
@SuppressWarnings("WeakerAccess")
public class CobolLanguageEngine {

  private final TextPreprocessor preprocessor;
  private final GrammarPreprocessor grammarPreprocessor;
  private final MessageService messageService;
  private final ParseTreeListener treeListener;
  private final SubroutineService subroutineService;
  private final CachingConfigurationService cachingConfigurationService;
  private final DialectService dialectService;
  private final AstProcessor astProcessor;
  private final SymbolsRepository symbolsRepository;
  private final EmbeddedCodeService embeddedCodeService;
  private final ErrorFinalizerService errorFinalizerService;

  @Inject
  public CobolLanguageEngine(
      TextPreprocessor preprocessor,
      GrammarPreprocessor grammarPreprocessor,
      MessageService messageService,
      ParseTreeListener treeListener,
      SubroutineService subroutineService,
      CachingConfigurationService cachingConfigurationService,
      DialectService dialectService,
      AstProcessor astProcessor,
      SymbolsRepository symbolsRepository,
      EmbeddedCodeService embeddedCodeService,
      ErrorFinalizerService errorFinalizerService) {
    this.preprocessor = preprocessor;
    this.grammarPreprocessor = grammarPreprocessor;
    this.messageService = messageService;
    this.treeListener = treeListener;
    this.subroutineService = subroutineService;
    this.cachingConfigurationService = cachingConfigurationService;
    this.dialectService = dialectService;
    this.astProcessor = astProcessor;
    this.symbolsRepository = symbolsRepository;
    this.embeddedCodeService = embeddedCodeService;
    this.errorFinalizerService = errorFinalizerService;
  }

  /**
   * Perform syntax and semantic analysis for the given text document
   *
   * @param documentUri unique resource identifier of the processed document
   * @param text the content of the document that should be processed
   * @param analysisConfig contains analysis processing features info and copybook config with
   *     following information: target backend sql server, copybook processing mode which reflect
   *     the sync status of the document (DID_OPEN|DID_CHANGE)
   * @return Semantic information wrapper object and list of syntax error that might send back to
   *     the client
   */
  @NonNull
  public ResultWithErrors<AnalysisResult> run(
      @NonNull String documentUri, @NonNull String text, @NonNull AnalysisConfig analysisConfig) {
    ThreadInterruptionUtil.checkThreadInterrupted();

    if (ServerTypeUtil.isInCompatibleServerTypeRegistered(analysisConfig)) {
      return getErrorForIncompatibleServerTypeAndDialects(documentUri);
    }

    // Cleaning up
    ResultWithErrors<TextTransformations> resultWithErrors = preprocessor.cleanUpCode(documentUri, text);
    AnalysisContext ctx = new AnalysisContext(new ExtendedSource(resultWithErrors.getResult()), analysisConfig);
    ctx.getAccumulatedErrors().addAll(resultWithErrors.getErrors());

    // Dialect processing
    dialectService.updateDialects(analysisConfig.getDialectRegistry());
    DialectOutcome dialectOutcome = ctx.measure(DIALECTS,
            () -> processDialects(ctx));

    // Preprocessor (replacement, copybooks)
    CopybooksRepository copybooksRepository = ctx.measure(PREPROCESSOR, () -> runPreprocessor(documentUri, ctx));
    applyDialectCopybooks(copybooksRepository, dialectOutcome.getDialectNodes());

    // Run parser
    ParserListener listener = new ParserListener(ctx.getExtendedSource(), copybooksRepository);
    CobolLexer lexer = new CobolLexer(CharStreams.fromString(ctx.getExtendedSource().extendedText()));
    lexer.removeErrorListeners();
    CommonTokenStream tokens = new CommonTokenStream(lexer);

    CobolParser.StartRuleContext tree = ctx.measure(PARSER,
            () -> runParser(listener, lexer, tokens));

    // Parse embedded code
    List<Node> embeddedNodes = embeddedCodeService.generateNodes(ctx.getExtendedSource(), new ParserListener(ctx.getExtendedSource(), copybooksRepository), tree, treeListener,
        documentUri, analysisConfig.getFeatures())
        .unwrap(ctx.getAccumulatedErrors()::addAll);

    ctx.getExtendedSource().commitTransformations();
    // Transform parsed tree to AST
    List<Node> syntaxTree = ctx.measure(VISITOR,
            () -> transformAST(
                    ctx,
                    dialectOutcome.getDialectNodes(),
                    copybooksRepository,
                    tokens,
                    tree));

    addEmbeddedNodes(syntaxTree.get(0), embeddedNodes);

    SymbolAccumulatorService symbolAccumulatorService = new SymbolAccumulatorService();
    Node rootNode = ctx.measure(SYNTAX_TREE,
            () -> {
      Node root = processSyntaxTree(analysisConfig, symbolAccumulatorService, ctx, syntaxTree);
      symbolsRepository.updateSymbols(symbolAccumulatorService.getProgramSymbols());
      return root;
    });

    ctx.getAccumulatedErrors().addAll(listener.getErrors());
    ctx.measure(LATE_ERROR_PROCESSING,
        () -> errorFinalizerService.processLateErrors(ctx, copybooksRepository));

    if (LOG.isDebugEnabled()) {
      ctx.logTiming();
    }

    return new ResultWithErrors<>(
        AnalysisResult.builder()
            .rootNode(rootNode)
            .symbolTableMap(symbolAccumulatorService.getProgramSymbols())
            .build(),
            ctx.getAccumulatedErrors().stream().map(errorFinalizerService::localizeErrorMessage).collect(toList()));
  }

  private ResultWithErrors<AnalysisResult> getErrorForIncompatibleServerTypeAndDialects(String documentUri) {
    return new ResultWithErrors<>(AnalysisResult.builder().build(),
            Collections.singletonList(SyntaxError.syntaxError()
                    .severity(ErrorSeverity.ERROR)
                    .suggestion(messageService.getMessage("workspaceError.ServerType"))
                    .errorSource(WORKSPACE_SETTINGS)
                    .errorCode(ErrorCodes.INCOMPATIBLE_SERVER_TYPE)
                    .location(new OriginalLocation(
                            new Location(documentUri,
                                    new Range(new Position(0, 0), new Position(0, 6))),
                            null)).build()
            ));
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

  private CobolParser.StartRuleContext runParser(ParserListener listener, CobolLexer lexer, CommonTokenStream tokens) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    lexer.addErrorListener(listener);
    CobolParser parser = new CobolParser(tokens);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
    parser.addParseListener(treeListener);
    return parser.startRule();
  }

  private CopybooksRepository runPreprocessor(String programDocumentUri, AnalysisContext ctx) {
    List<SyntaxError> preprocessorErrors = new ArrayList<>();
    ExtendedSource extendedSource = ctx.getExtendedSource();
    CopybooksRepository copybooks =
            grammarPreprocessor.preprocess(new PreprocessorContext(programDocumentUri, extendedSource, extendedSource.getMainMap(),
                    ctx.getConfig().getCopybookConfig(), new CopybookHierarchy(), new CopybooksRepository()))
                    .unwrap(preprocessorErrors::addAll);
    extendedSource.commitTransformations();

    ctx.getAccumulatedErrors().addAll(preprocessorErrors);
    return copybooks;
  }

  private DialectOutcome processDialects(AnalysisContext ctx) {
    CopybookConfig copybookConfig = ctx.getConfig().getCopybookConfig();
    DialectProcessingContext dialectProcessingContext =
            DialectProcessingContext.builder()
                    .copybookConfig(copybookConfig)
                    .programDocumentUri(ctx.getExtendedSource().getUri())
                    .extendedSource(ctx.getExtendedSource())
                    .build();
    dialectProcessingContext.getExtendedSource().commitTransformations();

    DialectOutcome dialectOutcome = dialectService
                    .process(ctx.getConfig().getDialects(), dialectProcessingContext)
                    .unwrap(ctx.getAccumulatedErrors()::addAll);
    Set<SyntaxError> errors = new HashSet<>(ctx.getAccumulatedErrors());
    ctx.getAccumulatedErrors().clear();
    ctx.getAccumulatedErrors().addAll(errors);
    return dialectOutcome;
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

    // Dialects
    List<ProcessorDescription> pds = dialectService.getProcessors(analysisConfig.getDialects());
    pds.forEach(ctx::register);
  }

  private void applyDialectCopybooks(CopybooksRepository copybooksRepository, List<Node> dialectNodes) {
    dialectNodes.stream()
        .filter(n -> n instanceof CopyNode)
        .map(CopyNode.class::cast)
        .filter(n -> n.getUri() != null)
        .forEach(n -> {
          copybooksRepository.addStatement(n.getName(), n.getDialect(), n.getLocality());
          copybooksRepository.define(n.getName(), n.getDialect(), n.getNameLocation().getUri(), n.getUri());
        });
  }
}
