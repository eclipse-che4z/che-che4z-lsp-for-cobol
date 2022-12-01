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
import lombok.RequiredArgsConstructor;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
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
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.model.EmbeddedCode;
import org.eclipse.lsp.cobol.core.model.OldExtendedDocument;
import org.eclipse.lsp.cobol.core.model.tree.*;
import org.eclipse.lsp.cobol.core.model.tree.logic.*;
import org.eclipse.lsp.cobol.core.model.tree.statements.StatementNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.FileDescriptionNode;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.core.visitor.CobolVisitor;
import org.eclipse.lsp.cobol.core.visitor.EmbeddedLanguagesListener;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.service.CachingConfigurationService;
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

/**
 * This class is responsible for run the syntax and semantic analysis of an input cobol document.
 * Its run method used by the service facade layer CobolLanguageEngineFacade.
 */
@Slf4j
@Singleton
@SuppressWarnings("WeakerAccess")
public class CobolLanguageEngine {

  private final TextPreprocessor preprocessor;
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
      MessageService messageService,
      ParseTreeListener treeListener,
      SubroutineService subroutineService,
      CachingConfigurationService cachingConfigurationService,
      DialectService dialectService,
      AstProcessor astProcessor,
      SymbolsRepository symbolsRepository) {
    this.preprocessor = preprocessor;
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
    AnalysisContext ctx = new AnalysisContext(documentUri, analysisConfig);
    TextTransformations cleanText = preprocessor.cleanUpCode(documentUri, text).unwrap(ctx.getAccumulatedErrors()::addAll);

    ctx.dialectsStart();
    DialectOutcome dialectOutcome = processDialects(ctx, cleanText);
    ctx.dialectsDone();

    ctx.preprocessorStart();
    ExtendedSource extendedSource = dialectOutcome.getContext().getExtendedSource();
    OldExtendedDocument oldExtendedDocument = runPreprocessor(ctx, extendedSource);
    ctx.preprocessorDone();

    ParserListener listener = new ParserListener();

    ctx.parserStart();
    CobolLexer lexer = new CobolLexer(CharStreams.fromString(oldExtendedDocument.getText()));
    lexer.removeErrorListeners();

    CommonTokenStream tokens = new CommonTokenStream(lexer);
    CobolParser.StartRuleContext tree = runParser(listener, lexer, tokens);
    ctx.parserDone();

    ctx.splittingLanguageStart();
    Map<Token, EmbeddedCode> embeddedCodeParts = extractEmbeddedCode(listener, tree);
    ctx.splittingLanguageDone();

    OldMapping positionMapping = new OldMapping(documentUri, oldExtendedDocument, tokens, embeddedCodeParts, extendedSource);

    ctx.visitorStart();
    List<Node> syntaxTree = runVisitor(analysisConfig, ctx, dialectOutcome, oldExtendedDocument, tokens, tree, embeddedCodeParts, positionMapping);
    ctx.visitorDone();

    ctx.syntaxTreeStart();
    SymbolAccumulatorService symbolAccumulatorService = new SymbolAccumulatorService();
    Node rootNode = processSyntaxTree(analysisConfig, symbolAccumulatorService, ctx, positionMapping, syntaxTree);
    symbolsRepository.updateSymbols(symbolAccumulatorService.getProgramSymbols());
    ctx.syntaxTreeDone();

    ctx.lateErrorProcessingStart();
    processLateErrors(ctx, oldExtendedDocument, listener, positionMapping);
    ctx.lateErrorProcessingDone();

    if (LOG.isDebugEnabled()) {
      ctx.logTiming();
    }

    return new ResultWithErrors<>(
        AnalysisResult.builder()
            .rootNode(rootNode)
            .symbolTableMap(symbolAccumulatorService.getProgramSymbols())
            .build(),
            ctx.getAccumulatedErrors().stream().map(this::constructErrorMessage).collect(toList()));
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
    ProcessingContext processingContext = new ProcessingContext(new ArrayList<>(), symbolAccumulatorService);
    registerProcessors(analysisConfig, processingContext, symbolAccumulatorService);
    ctx.getAccumulatedErrors().addAll(astProcessor.processSyntaxTree(processingContext, rootNode));
    return rootNode;
  }

  private List<Node> runVisitor(AnalysisConfig analysisConfig, AnalysisContext ctx, DialectOutcome dialectOutcome, OldExtendedDocument oldExtendedDocument, CommonTokenStream tokens, CobolParser.StartRuleContext tree, Map<Token, EmbeddedCode> embeddedCodeParts, OldMapping positionMapping) {
    CobolVisitor visitor =
        new CobolVisitor(
            applyDialectCopybooks(oldExtendedDocument.getCopybooks(), dialectOutcome),
                tokens,
                positionMapping,
                analysisConfig,
                embeddedCodeParts,
            messageService,
            subroutineService,
            dialectOutcome.getDialectNodes(),
            cachingConfigurationService);
    List<Node> syntaxTree = visitor.visit(tree);
    ctx.getAccumulatedErrors().addAll(visitor.getErrors());
    return syntaxTree;
  }

  private CobolParser.StartRuleContext runParser(ParserListener listener, CobolLexer lexer, CommonTokenStream tokens) {
    lexer.addErrorListener(listener);

    CobolParser parser = getCobolParser(tokens);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
    parser.addParseListener(treeListener);

    return parser.startRule();
  }

  private OldExtendedDocument runPreprocessor(AnalysisContext ctx, ExtendedSource extendedSource) {
    List<SyntaxError> preprocessorErrors = new ArrayList<>();
    OldExtendedDocument oldExtendedDocument =
            preprocessor
                    .processCleanCode(
                            ctx.getDocumentUri(),
                            extendedSource.extendedText(),
                            ctx.getConfig().getCopybookConfig(),
                            new CopybookHierarchy())
                    .unwrap(preprocessorErrors::addAll);
    preprocessorErrors.forEach(
            e ->
                    e.getLocality()
                            .setRange(
                                    extendedSource
                                            .mapLocation(e.getLocality().getRange())
                                            .getRange()));
    ctx.getAccumulatedErrors().addAll(preprocessorErrors);
    // Update copybook usages with proper positions
    oldExtendedDocument
            .getCopybooks()
            .getUsages()
            .forEach(
                    (k, v) ->
                            v.setRange(
                                    extendedSource
                                            .mapLocation(v.getRange())
                                            .getRange()));

    // Update copybook definition statements with proper positions
    oldExtendedDocument
            .getCopybooks()
            .getDefinitionStatements()
            .forEach(
                    (k, v) ->
                            v.setRange(
                                    extendedSource
                                            .mapLocation(v.getRange())
                                            .getRange()));

    return oldExtendedDocument;
  }

  private DialectOutcome processDialects(AnalysisContext ctx, TextTransformations cleanText) {
    CopybookConfig copybookConfig = ctx.getConfig().getCopybookConfig();
    DialectProcessingContext dialectProcessingContext =
            DialectProcessingContext.builder()
                    .copybookConfig(copybookConfig)
                    .programDocumentUri(ctx.getDocumentUri())
                    .extendedSource(new ExtendedSource(cleanText))
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
    ctx.register(
        new ProcessorDescription(
            ProgramIdNode.class, ProcessingPhase.TRANSFORMATION, new ProgramIdProcess()));
    ctx.register(
        new ProcessorDescription(
            SectionNode.class,
            ProcessingPhase.TRANSFORMATION,
            new ProcessNodeWithVariableDefinitions(symbolAccumulatorService)));
    ctx.register(
        new ProcessorDescription(
            FileEntryNode.class, ProcessingPhase.TRANSFORMATION, new FileEntryProcess()));
    ctx.register(
        new ProcessorDescription(
            FileDescriptionNode.class,
            ProcessingPhase.TRANSFORMATION,
            new FileDescriptionProcess(symbolAccumulatorService)));
    ctx.register(
        new ProcessorDescription(
            DeclarativeProcedureSectionNode.class,
            ProcessingPhase.TRANSFORMATION,
            new DeclarativeProcedureSectionRegister(symbolAccumulatorService)));
    // Phase DEFINITION
    ctx.register(
        new ProcessorDescription(
            ParagraphsNode.class, ProcessingPhase.DEFINITION, new DefineCodeBlock(symbolAccumulatorService)));
    ctx.register(
        new ProcessorDescription(
            SectionNameNode.class,
            ProcessingPhase.DEFINITION,
            new SectionNameRegister(symbolAccumulatorService)));
    ctx.register(
        new ProcessorDescription(
            ParagraphNameNode.class,
            ProcessingPhase.DEFINITION,
            new ParagraphNameRegister(symbolAccumulatorService)));
    ctx.register(
        new ProcessorDescription(
            ProcedureDivisionBodyNode.class,
            ProcessingPhase.DEFINITION,
            new DefineCodeBlock(symbolAccumulatorService)));
    // Phase USAGE
    ctx.register(
        new ProcessorDescription(
            CodeBlockUsageNode.class, ProcessingPhase.USAGE, new CodeBlockUsage(symbolAccumulatorService)));
    ctx.register(
        new ProcessorDescription(
            RootNode.class, ProcessingPhase.USAGE, new RootNodeUpdateCopyNodesByPositionInTree()));
    ctx.register(
        new ProcessorDescription(
            QualifiedReferenceNode.class,
            ProcessingPhase.USAGE,
            new QualifiedReferenceUpdateVariableUsage(symbolAccumulatorService)));

    // ENRICHMENT
    ctx.register(
        new ProcessorDescription(
            SectionNameNode.class,
            ProcessingPhase.VALIDATION,
            new SectionNameNodeEnricher(symbolAccumulatorService)));
    ctx.register(
        new ProcessorDescription(
            ParagraphNameNode.class,
            ProcessingPhase.VALIDATION,
            new ParagraphNameNodeEnricher(symbolAccumulatorService)));
    ctx.register(
        new ProcessorDescription(
            CodeBlockUsageNode.class,
            ProcessingPhase.VALIDATION,
            new CodeBlockUsageNodeEnricher(symbolAccumulatorService)));

    // Phase VALIDATION
    ctx.register(
        new ProcessorDescription(
            VariableWithLevelNode.class, ProcessingPhase.VALIDATION, new VariableWithLevelCheck()));
    ctx.register(
        new ProcessorDescription(
            StatementNode.class, ProcessingPhase.VALIDATION, new StatementValidate()));
    ctx.register(
        new ProcessorDescription(
            ElementaryNode.class, ProcessingPhase.VALIDATION, new ElementaryNodeCheck()));
    ctx.register(
        new ProcessorDescription(
            GroupItemNode.class, ProcessingPhase.VALIDATION, new GroupItemCheck()));
    ctx.register(
        new ProcessorDescription(
            ObsoleteNode.class, ProcessingPhase.VALIDATION, new ObsoleteNodeCheck()));
    ctx.register(
        new ProcessorDescription(
            StandAloneDataItemNode.class,
            ProcessingPhase.VALIDATION,
            new StandAloneDataItemCheck()));
    ctx.register(
            new ProcessorDescription(
                    ProgramEndNode.class, ProcessingPhase.VALIDATION, new ProgramEndCheck()));
    ctx.register(
        new ProcessorDescription(
            CICSTranslatorNode.class, ProcessingPhase.VALIDATION, new CICSTranslatorProcessor(analysisConfig, messageService)));

    // Dialects
    List<ProcessorDescription> pds = dialectService.getProcessors(analysisConfig.getDialects());
    pds.forEach(ctx::register);
  }

  private CopybooksRepository applyDialectCopybooks(
      CopybooksRepository copybooks, DialectOutcome dialectOutcome) {
    dialectOutcome.getDialectNodes().stream()
        .flatMap(Node::getDepthFirstStream)
        .filter(n -> n.getNodeType().equals(NodeType.COPY))
        .map(CopyNode.class::cast)
        .filter(n -> n.getDefinition() != null)
        .forEach(
            n -> copybooks.define(n.getName(), n.getDialect(), n.getDefinition().getLocation()));
    return copybooks;
  }

  private Map<Token, EmbeddedCode> extractEmbeddedCode(
      ParserListener listener, CobolParser.StartRuleContext tree) {
    EmbeddedLanguagesListener embeddedLanguagesListener =
        new EmbeddedLanguagesListener(messageService, treeListener, listener);
    new ParseTreeWalker().walk(embeddedLanguagesListener, tree);
    return embeddedLanguagesListener.getEmbeddedCodeParts();
  }

  CobolParser getCobolParser(CommonTokenStream tokens) {

    ThreadInterruptionUtil.checkThreadInterrupted();
    return new CobolParser(tokens);
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
        .filter(it -> it.getLocality() != null)
        .collect(toList());
  }

  @NonNull
  private Function<SyntaxError, SyntaxError> convertError(@NonNull OldMapping mapping) {
    return err ->
        err.toBuilder()
            .locality(mapping.findPreviousVisibleLocality(err.getTokenIndex()))
            .suggestion(messageService.getMessage(err.getSuggestion()))
            .errorSource(ErrorSource.PARSING)
            .build();
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
                    .locality(copyStatements.get(err.getLocality().getCopybookId()))
                    .errorSource(ErrorSource.COPYBOOK))
        .map(SyntaxError.SyntaxErrorBuilder::build)
        .flatMap(err -> Stream.concat(raiseError(err, copyStatements).stream(), Stream.of(err)))
        .collect(toList());
  }

  private Predicate<SyntaxError> shouldRaise() {
    return err -> (err.getLocality() != null && err.getLocality().getCopybookId() != null);
  }

  private SyntaxError constructErrorMessage(SyntaxError syntaxError) {
    return ofNullable(syntaxError.getMessageTemplate())
        .map(messageService::localizeTemplate)
        .map(message -> syntaxError.toBuilder().messageTemplate(null).suggestion(message).build())
        .orElse(syntaxError);
  }
}

@RequiredArgsConstructor
@Value
@Slf4j
class AnalysisContext {
  String documentUri;
  AnalysisConfig config;
  Timing.Builder timingBuilder = Timing.builder();
  List<SyntaxError> accumulatedErrors = new ArrayList<>();
  public void dialectsStart() {
    timingBuilder.getDialectsTimer().start();
  }
  public void dialectsDone() {
    timingBuilder.getDialectsTimer().stop();
  }

  public void preprocessorStart() {
    timingBuilder.getPreprocessorTimer().start();
  }

  public void preprocessorDone() {
    timingBuilder.getPreprocessorTimer().stop();
  }

  public void parserStart() {
    timingBuilder.getParserTimer().start();
  }

  public void parserDone() {
    timingBuilder.getParserTimer().stop();
  }

  public void splittingLanguageStart() {
    timingBuilder.getSplittingLanguageTimer().start();
  }

  public void splittingLanguageDone() {
    timingBuilder.getSplittingLanguageTimer().stop();
  }

  public void visitorStart() {
    timingBuilder.getVisitorTimer().start();
  }

  public void visitorDone() {
    timingBuilder.getVisitorTimer().stop();
  }

  public void syntaxTreeStart() {
    timingBuilder.getSyntaxTreeTimer().start();
  }

  public void syntaxTreeDone() {
    timingBuilder.getSyntaxTreeTimer().stop();
  }

  public void lateErrorProcessingStart() {
    timingBuilder.getLateErrorProcessingTimer().start();
  }

  public void lateErrorProcessingDone() {
    timingBuilder.getLateErrorProcessingTimer().stop();
  }

  public void logTiming() {
    Timing timing = timingBuilder.build();
    LOG.debug(
            "Timing for parsing {}. Dialects: {}, preprocessor: {}, parser: {}, mapping: {}, visitor: {}, syntaxTree: {}, "
                    + "late error processing: {}",
            documentUri,
            timing.getDialectsTime(),
            timing.getPreprocessorTime(),
            timing.getParserTime(),
            timing.getMappingTime(),
            timing.getVisitorTime(),
            timing.getSyntaxTreeTime(),
            timing.getLateErrorProcessingTime());

  }}
