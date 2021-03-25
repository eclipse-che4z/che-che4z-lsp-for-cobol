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
import org.antlr.v4.runtime.DefaultErrorStrategy;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.annotation.CheckThreadInterruption;
import org.eclipse.lsp.cobol.core.annotation.ThreadInterruptAspect;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.LocalityMappingUtils;
import org.eclipse.lsp.cobol.core.semantics.SemanticContext;
import org.eclipse.lsp.cobol.core.visitor.CobolVisitor;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;
import org.eclipse.lsp.cobol.service.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.SubroutineService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Stream;

import static java.util.stream.Collectors.toList;

/**
 * This class is responsible for run the syntax and semantic analysis of an input cobol document.
 * Its run method used by the service facade layer CobolLanguageEngineFacade.
 */
@Slf4j
@Singleton
@SuppressWarnings("WeakerAccess")
public class CobolLanguageEngine implements ThreadInterruptAspect {

  private TextPreprocessor preprocessor;
  private DefaultErrorStrategy defaultErrorStrategy;
  private MessageService messageService;
  private ParseTreeListener treeListener;
  private SubroutineService subroutineService;

  @Inject
  public CobolLanguageEngine(
      TextPreprocessor preprocessor,
      DefaultErrorStrategy defaultErrorStrategy,
      MessageService messageService,
      ParseTreeListener treeListener,
      SubroutineService subroutineService) {
    this.preprocessor = preprocessor;
    this.defaultErrorStrategy = defaultErrorStrategy;
    this.messageService = messageService;
    this.treeListener = treeListener;
    this.subroutineService = subroutineService;
  }

  /**
   * Perform syntax and semantic analysis for the given text document
   *
   * @param documentUri unique resource identifier of the processed document
   * @param text the content of the document that should be processed
   * @param copybookProcessingMode the trigger for copybook scan (ENABLED|DISABLED)
   * @return Semantic information wrapper object and list of syntax error that might send back to
   *     the client
   */
  @NonNull
  @CheckThreadInterruption
  public ResultWithErrors<SemanticContext> run(
      @NonNull String documentUri,
      @NonNull String text,
      @NonNull CopybookProcessingMode copybookProcessingMode) {
    List<SyntaxError> accumulatedErrors = new ArrayList<>();
    ExtendedDocument extendedDocument =
        preprocessor
            .process(documentUri, text, copybookProcessingMode)
            .unwrap(accumulatedErrors::addAll);

    CobolLexer lexer = new CobolLexer(CharStreams.fromString(extendedDocument.getText()));
    lexer.removeErrorListeners();

    CommonTokenStream tokens = new CommonTokenStream(lexer);
    ParserListener listener = new ParserListener();
    lexer.addErrorListener(listener);

    CobolParser parser = getCobolParser(tokens);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(defaultErrorStrategy);
    parser.addParseListener(treeListener);

    CobolParser.StartRuleContext tree = parser.startRule();

    Map<Token, Locality> positionMapping =
        getPositionMapping(documentUri, extendedDocument, tokens);

    CobolVisitor visitor =
        new CobolVisitor(
            documentUri,
            extendedDocument.getCopybooks(),
            tokens,
            positionMapping,
            messageService,
            subroutineService);
    Node rootNode = visitor.visit(tree).get(0);
    SyntaxTreeEngine syntaxTreeEngine = new SyntaxTreeEngine(rootNode, positionMapping, messageService);
    accumulatedErrors.addAll(syntaxTreeEngine.processTree());
    SemanticContext context = visitor.finishAnalysis().unwrap(accumulatedErrors::addAll);
    accumulatedErrors.addAll(finalizeErrors(listener.getErrors(), positionMapping));
    accumulatedErrors.addAll(
        collectErrorsForCopybooks(accumulatedErrors, extendedDocument.getCopyStatements()));

    return new ResultWithErrors<>(context, accumulatedErrors);
  }

  @CheckThreadInterruption
  CobolParser getCobolParser(CommonTokenStream tokens) {
    return new CobolParser(tokens);
  }

  @CheckThreadInterruption
  Map<Token, Locality> getPositionMapping(
      String documentUri, ExtendedDocument extendedDocument, CommonTokenStream tokens) {
    return LocalityMappingUtils.createPositionMapping(
        tokens.getTokens(), extendedDocument.getDocumentMapping(), documentUri);
  }

  @NonNull
  private List<SyntaxError> finalizeErrors(
      @NonNull List<SyntaxError> errors, @NonNull Map<Token, Locality> mapping) {
    return errors.stream()
        .map(convertError(mapping))
        .filter(it -> it.getLocality() != null)
        .collect(toList());
  }

  @NonNull
  private Function<SyntaxError, SyntaxError> convertError(@NonNull Map<Token, Locality> mapping) {
    return err ->
        err.toBuilder()
            .locality(
                mapping.getOrDefault(
                    err.getOffendedToken(),
                    LocalityMappingUtils.getNearestLocality(err.getOffendedToken(), mapping)
                        .orElse(null)))
            .suggestion(messageService.getMessage(err.getSuggestion()))
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
        .map(err -> err.toBuilder().locality(copyStatements.get(err.getLocality().getCopybookId())))
        .map(SyntaxError.SyntaxErrorBuilder::build)
        .flatMap(err -> Stream.concat(raiseError(err, copyStatements).stream(), Stream.of(err)))
        .collect(toList());
  }

  private Predicate<SyntaxError> shouldRaise() {
    return err -> err.getLocality().getCopybookId() != null;
  }
}
