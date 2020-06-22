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
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.ca.lsp.core.cobol.strategy.CobolErrorStrategy;
import com.ca.lsp.core.cobol.visitor.CobolVisitor;
import com.ca.lsp.core.cobol.visitor.ParserListener;
import com.google.common.collect.Multimap;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

import static java.util.stream.Collectors.*;

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
  public ResultWithErrors<SemanticContext> run(
      String documentUri, String text, String textDocumentSyncType) {

    ResultWithErrors<ExtendedDocument> extendedDocument =
        preprocessor.process(documentUri, text, textDocumentSyncType);

    CobolLexer lexer =
        new CobolLexer(CharStreams.fromString(extendedDocument.getResult().getText()));

    List<SyntaxError> accumulatedErrors = new ArrayList<>(extendedDocument.getErrors());

    ParserListener listener = new ParserListener();
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);

    CommonTokenStream tokens = new CommonTokenStream(lexer);

    CobolParser parser = new CobolParser(tokens);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy());

    CobolParser.StartRuleContext tree = parser.startRule();
    CobolVisitor visitor = new CobolVisitor(documentUri, extendedDocument.getResult());
    visitor.visit(tree);

    Map<Token, Position> mapping = visitor.getMapping();
    accumulatedErrors.addAll(finalizeErrors(listener.getErrors(), mapping));
    accumulatedErrors.addAll(finalizeErrors(visitor.getErrors(), mapping));
    accumulatedErrors.forEach(err -> LOG.debug(err.toString()));

    return new ResultWithErrors<>(buildSemanticContext(visitor, mapping), accumulatedErrors);
  }

  private SemanticContext buildSemanticContext(CobolVisitor visitor, Map<Token, Position> mapping) {
    return new SemanticContext(
        mapPositions(visitor.getVariables().getDefinitions(), mapping),
        mapPositions(visitor.getVariables().getUsages(), mapping),
        mapPositions(visitor.getParagraphs().getDefinitions(), mapping),
        mapPositions(visitor.getParagraphs().getUsages(), mapping),
        visitor.getCopybooks().getDefinitions().asMap(),
        visitor.getCopybooks().getUsages().asMap());
  }

  private Map<String, Collection<Position>> mapPositions(
      Multimap<String, Token> source, Map<Token, Position> mapping) {
    return source.asMap().entrySet().stream()
        .collect(toMap(Map.Entry::getKey, mapPositions(mapping)));
  }

  private Function<Map.Entry<String, Collection<Token>>, Collection<Position>> mapPositions(
      Map<Token, Position> mapping) {
    return it -> it.getValue().stream().map(mapping::get).collect(toSet());
  }

  private List<SyntaxError> finalizeErrors(List<SyntaxError> errors, Map<Token, Position> mapping) {
    return errors.stream()
        .map(convertError(mapping))
        .filter(it -> it.getPosition() != null)
        .collect(toList());
  }

  private Function<SyntaxError, SyntaxError> convertError(Map<Token, Position> mapping) {
      return err -> err.toBuilder()
              .position(convertPositionRange(err.getStartToken(), err.getStopToken(), mapping))
              .build();
  }

  private Position convertPositionRange(Token start, Token stop, Map<Token, Position> mapping) {
    Position position = mapping.get(start);
    if (start == stop || stop == null) {
      return position;
    }
    return new Position(
        position.getDocumentURI(),
        start.getStartIndex(),
        stop.getStopIndex(),
        start.getLine(),
        start.getCharPositionInLine(),
        start.getText());
  }
}
