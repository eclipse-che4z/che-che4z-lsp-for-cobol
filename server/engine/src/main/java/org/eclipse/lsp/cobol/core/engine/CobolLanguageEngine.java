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
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedSource;
import org.eclipse.lsp.cobol.common.mapping.TextTransformations;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ObsoleteNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.common.symbols.SymbolTable;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.model.EmbeddedCode;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
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
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.SubroutineService;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;

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
  private final SymbolAccumulatorService symbolAccumulatorService;
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
      SymbolAccumulatorService symbolAccumulatorService,
      AstProcessor astProcessor,
      SymbolsRepository symbolsRepository) {
    this.preprocessor = preprocessor;
    this.messageService = messageService;
    this.treeListener = treeListener;
    this.subroutineService = subroutineService;
    this.cachingConfigurationService = cachingConfigurationService;
    this.dialectService = dialectService;
    this.symbolAccumulatorService = symbolAccumulatorService;
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
    Timing.Builder timingBuilder = Timing.builder();

    timingBuilder.getDialectsTimer().start();
    List<SyntaxError> accumulatedErrors = new ArrayList<>();
    TextTransformations cleanText =
        preprocessor.cleanUpCode(documentUri, text).unwrap(accumulatedErrors::addAll);

    DialectProcessingContext dialectProcessingContext =
        DialectProcessingContext.builder()
            .copybookConfig(analysisConfig.getCopybookConfig())
            .programDocumentUri(documentUri)
            .extendedSource(new ExtendedSource(cleanText))
            .build();
    dialectProcessingContext.getExtendedSource().commitTransformations();

    DialectOutcome dialectOutcome =
        dialectService
            .process(analysisConfig.getDialects(), dialectProcessingContext)
            .unwrap(accumulatedErrors::addAll);

    accumulatedErrors = accumulatedErrors.stream().distinct().collect(toList());
    timingBuilder.getDialectsTimer().stop();

    timingBuilder.getPreprocessorTimer().start();

    List<SyntaxError> preprocessorErrors = new ArrayList<>();
    ExtendedDocument extendedDocument =
        preprocessor
            .processCleanCode(
                documentUri,
                dialectOutcome.getContext().getExtendedSource().extendedText(),
                analysisConfig.getCopybookConfig(),
                new CopybookHierarchy())
            .unwrap(preprocessorErrors::addAll);
    timingBuilder.getPreprocessorTimer().stop();

    // Update copybook usages with proper positions
    extendedDocument
        .getCopybooks()
        .getUsages()
        .forEach(
            (k, v) ->
                v.setRange(
                    dialectOutcome
                        .getContext()
                        .getExtendedSource()
                        .mapLocation(v.getRange())
                        .getRange()));

    // Update copybook definition statements with proper positions
    extendedDocument
        .getCopybooks()
        .getDefinitionStatements()
        .forEach(
            (k, v) ->
                v.setRange(
                    dialectOutcome
                        .getContext()
                        .getExtendedSource()
                        .mapLocation(v.getRange())
                        .getRange()));

    preprocessorErrors.forEach(
        e ->
            e.getLocality()
                .setRange(
                    dialectOutcome
                        .getContext()
                        .getExtendedSource()
                        .mapLocation(e.getLocality().getRange())
                        .getRange()));
    accumulatedErrors.addAll(preprocessorErrors);

    timingBuilder.getParserTimer().start();
    CobolLexer lexer = new CobolLexer(CharStreams.fromString(extendedDocument.getText()));
    lexer.removeErrorListeners();

    CommonTokenStream tokens = new CommonTokenStream(lexer);
    ParserListener listener = new ParserListener();
    lexer.addErrorListener(listener);

    CobolParser parser = getCobolParser(tokens);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
    parser.addParseListener(treeListener);

    CobolParser.StartRuleContext tree = parser.startRule();
    timingBuilder.getParserTimer().stop();

    timingBuilder.getSplittingLanguageTimer().start();
    Map<Token, EmbeddedCode> embeddedCodeParts = extractEmbeddedCode(listener, tree);
    timingBuilder.getSplittingLanguageTimer().stop();

    timingBuilder.getMappingTimer().start();
    OldMapping positionMapping = new OldMapping(documentUri, extendedDocument, tokens, embeddedCodeParts,
            dialectProcessingContext.getExtendedSource());

    timingBuilder.getMappingTimer().stop();

    timingBuilder.getVisitorTimer().start();
    CobolVisitor visitor =
        new CobolVisitor(
            applyDialectCopybooks(extendedDocument.getCopybooks(), dialectOutcome),
            tokens,
            positionMapping,
            analysisConfig,
            embeddedCodeParts,
            messageService,
            subroutineService,
            symbolsRepository,
            dialectOutcome.getDialectNodes(),
            cachingConfigurationService);
    List<Node> syntaxTree = visitor.visit(tree);
    accumulatedErrors.addAll(visitor.getErrors());
    timingBuilder.getVisitorTimer().stop();

    timingBuilder.getSyntaxTreeTimer().start();
    analyzeEmbeddedCode(syntaxTree, positionMapping);

    Node rootNode = syntaxTree.get(0);
    ProcessingContext ctx = new ProcessingContext(new ArrayList<>());
    registerProcessors(analysisConfig, ctx);
    accumulatedErrors.addAll(astProcessor.processSyntaxTree(ctx, rootNode));

    timingBuilder.getSyntaxTreeTimer().stop();
    timingBuilder.getLateErrorProcessingTimer().start();
    accumulatedErrors.addAll(finalizeErrors(listener.getErrors(), positionMapping));
    accumulatedErrors.addAll(
        collectErrorsForCopybooks(
            accumulatedErrors, extendedDocument.getCopybooks().getDefinitionStatements()));
    timingBuilder.getLateErrorProcessingTimer().stop();

    if (LOG.isDebugEnabled()) {
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
    }

    Map<String, SymbolTable> symbolTableMap = Collections.synchronizedMap(new HashMap<>(symbolAccumulatorService.getProgramSymbols()));
    symbolsRepository.updateSymbols(symbolTableMap);
    symbolAccumulatorService.reset(documentUri);

    return new ResultWithErrors<>(
        AnalysisResult.builder()
            .rootNode(rootNode)
            .symbolTableMap(symbolTableMap)
            .build(),
        accumulatedErrors.stream().map(this::constructErrorMessage).collect(toList()));
  }

  private void registerProcessors(AnalysisConfig analysisConfig, ProcessingContext ctx) {
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
            new DeclarativeProcedureSectionRegister(symbolAccumulatorService, symbolsRepository)));
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
