/*
 * Copyright (c) 2019 Broadcom.
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

import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.CobolLexer;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.parser.listener.SemanticListener;
import com.ca.lsp.core.cobol.parser.listener.VerboseListener;
import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
import com.ca.lsp.core.cobol.preprocessor.impl.CobolPreprocessorImpl;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.ca.lsp.core.cobol.strategy.CobolErrorStrategy;
import com.ca.lsp.core.cobol.visitor.CobolVisitor;
import com.google.inject.Inject;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
public class CobolLanguageEngine {

  private CobolSourceFormat sourceFormat;

  @Inject
  public CobolLanguageEngine(CobolSourceFormat sourceFormat) {
    this.sourceFormat = sourceFormat;
  }

  public ResultWithErrors<SemanticContext> run(String documentUri, String text) {

    CobolPreprocessorImpl preprocessor = new CobolPreprocessorImpl();

    ResultWithErrors<PreprocessedInput> preProcessedInput =
        preprocessor.process(documentUri, text, sourceFormat);

    CobolLexer lexer =
        new CobolLexer(CharStreams.fromString(preProcessedInput.getResult().getInput()));

    List<SyntaxError> errors = new ArrayList<>(preProcessedInput.getErrors());

    lexer.removeErrorListeners();
    lexer.addErrorListener(new VerboseListener(errors, documentUri));

    CommonTokenStream tokens = new CommonTokenStream(lexer);
    CobolParser parser = new CobolParser(tokens);

    parser.removeErrorListeners();
    parser.addErrorListener(new VerboseListener(errors, documentUri));

    CobolErrorStrategy strategy = new CobolErrorStrategy();
    parser.setErrorHandler(strategy);

    CobolParser.StartRuleContext tree = parser.startRule();
    CobolVisitor visitor = new CobolVisitor();
    visitor.setSemanticErrors(new SemanticListener(errors));
    visitor.setSemanticContext(preProcessedInput.getResult().getSemanticContext());
    visitor.setDocumentUri(documentUri);
    visitor.visit(tree);

    errors.forEach(err -> LOG.debug(err.toString()));
    return new ResultWithErrors<>(preProcessedInput.getResult().getSemanticContext(), errors);
  }
}
