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

import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.CobolLexer;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.parser.listener.VerboseListener;
import com.ca.lsp.core.cobol.preprocessor.impl.CobolPreprocessorImpl;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.ca.lsp.core.cobol.strategy.CobolErrorStrategy;
import com.ca.lsp.core.cobol.visitor.CobolVisitor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
public class CobolLanguageEngine {

  public ResultWithErrors<SemanticContext> run(String documentUri, String text) {

    CobolPreprocessorImpl preprocessor = new CobolPreprocessorImpl();

    ResultWithErrors<PreprocessedInput> preProcessedInput = preprocessor.process(documentUri, text);

    CobolLexer lexer =
        new CobolLexer(CharStreams.fromString(preProcessedInput.getResult().getInput()));

    List<SyntaxError> errors = new ArrayList<>(preProcessedInput.getErrors());

    lexer.removeErrorListeners();
    lexer.addErrorListener(new VerboseListener(errors, documentUri));

    CommonTokenStream tokens = new CommonTokenStream(lexer);
    CobolParser parser = new CobolParser(tokens);

    parser.removeErrorListeners();
    parser.addErrorListener(new VerboseListener(errors, documentUri));
    parser.setErrorHandler(new CobolErrorStrategy());

    CobolParser.StartRuleContext tree = parser.startRule();
    CobolVisitor visitor =
        new CobolVisitor(documentUri, preProcessedInput.getResult().getSemanticContext());
    visitor.visit(tree);

    errors.addAll(visitor.getErrors());

    errors.forEach(err -> LOG.debug(err.toString()));
    return new ResultWithErrors<>(preProcessedInput.getResult().getSemanticContext(), errors);
  }
}
