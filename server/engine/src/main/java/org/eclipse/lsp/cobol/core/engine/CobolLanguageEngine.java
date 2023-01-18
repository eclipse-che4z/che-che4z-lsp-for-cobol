/*
 * Copyright (c) 2020 Broadcom.
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
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedSource;
import org.eclipse.lsp.cobol.common.mapping.TextTransformations;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.analysis.EmbeddedCodeUtils;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.model.EmbeddedCode;
import org.eclipse.lsp.cobol.core.model.OldExtendedDocument;
import org.eclipse.lsp.cobol.core.model.tree.*;
import org.eclipse.lsp.cobol.core.model.tree.logic.*;
import org.eclipse.lsp.cobol.core.model.tree.logic.implicit.ImplicitVariablesProcessor;
import org.eclipse.lsp.cobol.core.model.tree.statements.StatementNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.FileDescriptionNode;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.core.visitor.CobolVisitor;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.AnalysisResult;

import java.util.*;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Stream;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.model.NodeType.EMBEDDED_CODE;
import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;
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
      SymbolsRepository symbolsRepository) {
    this.preprocessor = preprocessor;
    this.grammarPreprocessor = grammarPreprocessor;
    this.messageService = messageService;
    this.treeListener = treeListener;
    this.subroutineService = subroutineService;
    this.cachingConfigurationService = cachingConfigurationService;
    this.dialectService = dialectService;
    this.astProcessor = astProcessor;
    this.symbolsRepository = symbolsRepository;
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

    ResultWithErrors<TextTransformations> resultWithErrors = preprocessor.cleanUpCode(documentUri, text);
    AnalysisContext ctx = new AnalysisContext(new ExtendedSource(resultWithErrors.getResult()), analysisConfig);
    ctx.getAccumulatedErrors().addAll(resultWithErrors.getErrors());

    dialectService.updateDialects(analysisConfig.getDialectRegistry());
    DialectOutcome dialectOutcome = ctx.measure(DIALECTS,
            () -> processDialects(ctx));

    OldExtendedDocument oldExtendedDocument = ctx.measure(PREPROCESSOR,
            () -> runPreprocessor(ctx));

    ParserListener listener = new ParserListener();
    CobolLexer lexer = new CobolLexer(CharStreams.fromString(oldExtendedDocument.getText()));
    lexer.removeErrorListeners();
    CommonTokenStream tokens = new CommonTokenStream(lexer);

    CobolParser.StartRuleContext tree = ctx.measure(PARSER,
            () -> runParser(listener, lexer, tokens));

    Map<Token, EmbeddedCode> embeddedCodeParts = ctx.measure(PREPROCESSOR,
            () -> EmbeddedCodeUtils.extractEmbeddedCode(listener, tree, messageService, treeListener));

    OldMapping positionMapping = new OldMapping(documentUri, oldExtendedDocument, tokens, embeddedCodeParts, ctx.getExtendedSource());

    List<Node> syntaxTree = ctx.measure(VISITOR,
            () -> transformAST(
                    analysisConfig,
                    ctx,
                    dialectOutcome.getDialectNodes(),
                    oldExtendedDocument.getCopybooks(),
                    tokens,
                    tree,
                    embeddedCodeParts,
                    positionMapping));

    SymbolAccumulatorService symbolAccumulatorService = new SymbolAccumulatorService();
    Node rootNode = ctx.measure(SYNTAX_TREE,
            () -> {
      Node root = processSyntaxTree(analysisConfig, symbolAccumulatorService, ctx, positionMapping, syntaxTree);
      symbolsRepository.updateSymbols(symbolAccumulatorService.getProgramSymbols());
      return root;
    });

    ctx.measure(LATE_ERROR_PROCESSING,
            () -> processLateErrors(ctx, oldExtendedDocument, listener, positionMapping));

    if (LOG.isDebugEnabled()) {
      ctx.logTiming();
    }

    return new ResultWithErrors<>(
        AnalysisResult.builder()
            .rootNode(rootNode)
            .symbolTableMap(symbolAccumulatorService.getProgramSymbols())
            .build(),
            ctx.getAccumulatedErrors().stream().map(this::localizeErrorMessage).collect(toList()));
  }

  private void processLateErrors(AnalysisContext ctx, OldExtendedDocument oldExtendedDocument, ParserListener listener, OldMapping positionMapping) {
    ctx.getAccumulatedErrors().addAll(finalizeErrors(listener.getErrors(), positionMapping));
    ctx.getAccumulatedErrors().addAll(
        collectErrorsForCopybooks(
                ctx.getAccumulatedErrors(), oldExtendedDocument.getCopybooks().getDefinitionStatements()));
  }

  private Node processSyntaxTree(AnalysisConfig analysisConfig, SymbolAccumulatorService symbolAccumulatorService, AnalysisContext ctx, OldMapping positionMapping, List<Node> syntaxTree) {
    analyzeEmbeddedCode(syntaxTree, positionMapping);
    Node rootNode = syntaxTree.get(0);
    ProcessingContext processingContext = new ProcessingContext(new ArrayList<>(), symbolAccumulatorService, ctx.getConfig().getDialectsSettings());
    registerProcessors(analysisConfig, processingContext, symbolAccumulatorService);
    ctx.getAccumulatedErrors().addAll(astProcessor.processSyntaxTree(processingContext, rootNode));
    return rootNode;
  }

  private List<Node> transformAST(AnalysisConfig analysisConfig, AnalysisContext ctx, List<Node> dialectNodes,
                                  CopybooksRepository oldExtendedDocumentCopybooks, CommonTokenStream tokens,
                                  CobolParser.StartRuleContext tree, Map<Token, EmbeddedCode> embeddedCodeParts,
                                  OldMapping positionMapping) {
    CopybooksRepository copybooksRepository = applyDialectCopybooks(
            oldExtendedDocumentCopybooks,
            dialectNodes);

    CobolVisitor visitor =
        new CobolVisitor(copybooksRepository, tokens, positionMapping, analysisConfig, embeddedCodeParts,
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

  private OldExtendedDocument runPreprocessor(AnalysisContext ctx) {
    List<SyntaxError> preprocessorErrors = new ArrayList<>();
    ExtendedSource extendedSource = ctx.getExtendedSource();
    OldExtendedDocument oldExtendedDocument =
            grammarPreprocessor.buildExtendedDocument(extendedSource.getMainMap(),
                            ctx.getConfig().getCopybookConfig(), new CopybookHierarchy())
                    .unwrap(preprocessorErrors::addAll);
    preprocessorErrors.forEach(e -> e.getLocation().getLocation().setRange(extendedSource
                                            .mapLocation(e.getLocation().getLocation().getRange())
                                            .getRange()));
    ctx.getAccumulatedErrors().addAll(preprocessorErrors);
    CopybooksRepository copybooks = oldExtendedDocument.getCopybooks();

    // Update copybook usages with proper positions
    copybooks.getUsages()
            .forEach((k, v) -> v.setRange(extendedSource.mapLocation(v.getRange()).getRange()));

    // Update copybook definition statements with proper positions
    copybooks.getDefinitionStatements()
            .forEach((k, v) -> v.setRange(extendedSource.mapLocation(v.getRange()).getRange()));

    return oldExtendedDocument;
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
    ctx.register(t, SectionNode.class, new ProcessNodeWithVariableDefinitions(symbolAccumulatorService));
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

  private CopybooksRepository applyDialectCopybooks(CopybooksRepository copybooks, List<Node> dialectNodes) {
    dialectNodes.stream()
        .flatMap(Node::getDepthFirstStream)
        .filter(n -> n.getNodeType().equals(NodeType.COPY))
        .map(CopyNode.class::cast)
        .filter(n -> n.getDefinition() != null)
        .forEach(n -> copybooks.define(n.getName(), n.getDialect(), n.getDefinition().getLocation()));
    return copybooks;
  }

  private void analyzeEmbeddedCode(List<Node> syntaxTree, OldMapping mapping) {
    syntaxTree.stream()
        .flatMap(Node::getDepthFirstStream)
        .filter(hasType(EMBEDDED_CODE))
        .map(EmbeddedCodeNode.class::cast)
        .collect(toList())
        .forEach(it -> it.analyzeTree(mapping));
  }

  @NonNull
  private List<SyntaxError> finalizeErrors(
      @NonNull List<SyntaxError> errors, @NonNull OldMapping mapping) {
    return errors.stream()
        .filter(c -> c.getTokenIndex() != -1)
        .map(convertError(mapping))
        .filter(it -> it.getLocation() != null)
        .collect(toList());
  }

  @NonNull
  private Function<SyntaxError, SyntaxError> convertError(@NonNull OldMapping mapping) {
    return err -> {
      Locality previousVisibleLocality = mapping.findPreviousVisibleLocality(err.getTokenIndex());
      return err.toBuilder()
          .location(previousVisibleLocality == null ? null : previousVisibleLocality.toOriginalLocation())
          .suggestion(messageService.getMessage(err.getSuggestion()))
          .errorSource(ErrorSource.PARSING)
          .build();
    };
  }

  private List<SyntaxError> collectErrorsForCopybooks(
      List<SyntaxError> errors, Map<String, Locality> copyStatements) {
    return errors.stream()
        .filter(shouldRaise())
        .map(err -> raiseError(err, copyStatements))
        .flatMap(List::stream)
        .collect(toList());
  }

  private List<SyntaxError> raiseError(SyntaxError error, Map<String, Locality> copyStatements) {
    return Stream.of(error)
        .filter(shouldRaise())
        .map(
            err ->
                err.toBuilder()
                    .location(copyStatements.get(err.getLocation().getCopybookId()).toOriginalLocation())
                    .errorSource(ErrorSource.COPYBOOK))
        .map(SyntaxError.SyntaxErrorBuilder::build)
        .flatMap(err -> Stream.concat(raiseError(err, copyStatements).stream(), Stream.of(err)))
        .collect(toList());
  }

  private Predicate<SyntaxError> shouldRaise() {
    return err -> (err.getLocation() != null && err.getLocation().getCopybookId() != null);
  }

  private SyntaxError localizeErrorMessage(SyntaxError syntaxError) {
    return ofNullable(syntaxError.getMessageTemplate())
        .map(messageService::localizeTemplate)
        .map(message -> syntaxError.toBuilder().messageTemplate(null).suggestion(message).build())
        .orElse(syntaxError);
  }
}
