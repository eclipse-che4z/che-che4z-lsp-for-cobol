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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.engine;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.ExtendedDocument;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.CobolLexer;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.PositionMappingUtils;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.ca.lsp.core.cobol.strategy.CobolErrorStrategy;
import com.ca.lsp.core.cobol.visitor.CobolVisitor;
import com.ca.lsp.core.cobol.visitor.ParserListener;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;

import javax.annotation.Nonnull;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

import static java.util.stream.Collectors.toList;

/**
 * This class is responsible for run the syntax and semantic analysis of an input cobol document.
 * Its run method used by the service facade layer CobolLanguageEngineFacade.
 */
@Slf4j
@Singleton
public class CobolLanguageEngine {

  private CobolPreprocessor preprocessor;

  @Inject
  public CobolLanguageEngine(CobolPreprocessor preprocessor) {
    this.preprocessor = preprocessor;
  }

  /**
   * Perform syntax and semantic analysis for the given text document
   *
   * @param documentUri unique resource identifier of the processed document
   * @param text the content of the document that should be processed
   * @param textDocumentSyncType the document sync type that can be (DID_OPEN|DID_CHANGE)
   * @return Semantic information wrapper object and list of syntax error that might send back to
   *     the client
   */
  @Nonnull
  public ResultWithErrors<SemanticContext> run(
      @Nonnull String documentUri, @Nonnull String text, @Nonnull String textDocumentSyncType) {

    ResultWithErrors<ExtendedDocument> extendedDocument =
        preprocessor.process(documentUri, text, textDocumentSyncType);

    List<SyntaxError> accumulatedErrors = new ArrayList<>(extendedDocument.getErrors());

    CobolLexer lexer =
        new CobolLexer(CharStreams.fromString(extendedDocument.getResult().getText()));
    lexer.removeErrorListeners();

    CommonTokenStream tokens = new CommonTokenStream(lexer);
    ParserListener listener = new ParserListener();

    CobolParser parser = new CobolParser(tokens);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy());

    CobolParser.StartRuleContext tree = parser.startRule();

    Map<Token, Position> positionMapping =
        PositionMappingUtils.createPositionMapping(
            tokens.getTokens(), extendedDocument.getResult().getDocumentMapping(), documentUri);

    CobolVisitor visitor = new CobolVisitor(extendedDocument.getResult(), positionMapping);
    visitor.visit(tree);

    accumulatedErrors.addAll(finalizeErrors(listener.getErrors(), positionMapping));
    accumulatedErrors.addAll(visitor.getErrors());
    accumulatedErrors.forEach(err -> LOG.debug(err.toString()));

    return new ResultWithErrors<>(buildSemanticContext(visitor), accumulatedErrors);
  }

  private SemanticContext buildSemanticContext(@Nonnull CobolVisitor visitor) {
    return new SemanticContext(
        visitor.getVariables().getDefinitions().asMap(),
        visitor.getVariables().getUsages().asMap(),
        visitor.getParagraphs().getDefinitions().asMap(),
        visitor.getParagraphs().getUsages().asMap(),
        visitor.getCopybooks().getDefinitions().asMap(),
        visitor.getCopybooks().getUsages().asMap());
  }

  @Nonnull
  private List<SyntaxError> finalizeErrors(
      @Nonnull List<SyntaxError> errors, @Nonnull Map<Token, Position> mapping) {
    return errors.stream()
        .map(convertError(mapping))
        .filter(it -> it.getPosition() != null)
        .collect(toList());
  }

  @Nonnull
  private Function<SyntaxError, SyntaxError> convertError(@Nonnull Map<Token, Position> mapping) {
    return err -> err.toBuilder().position(mapping.get(err.getOffendedToken())).build();
  }
}
