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
import com.ca.lsp.core.cobol.model.ProcessingResult;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.CobolLexer;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.parser.listener.FormatListener;
import com.ca.lsp.core.cobol.parser.listener.SemanticListener;
import com.ca.lsp.core.cobol.parser.listener.VerboseListener;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.impl.CobolPreprocessorImpl;
import com.ca.lsp.core.cobol.strategy.CobolErrorStrategy;
import com.ca.lsp.core.cobol.visitor.CobolVisitor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
public class CobolLanguageEngine {

  private final CobolPreprocessor.CobolSourceFormatEnum sourceFormat;
  @Setter private List<File> copybookList;

  public ProcessingResult run(String in) {
    List<SyntaxError> errors = new ArrayList<>();
    CobolPreprocessorImpl preprocessor = new CobolPreprocessorImpl();
    preprocessor.setFormatListener(new FormatListener(errors));
    preprocessor.setCopybookList(copybookList);

    final PreprocessedInput preProcessedInput = preprocessor.process(in, sourceFormat);
    final CobolLexer lexer = new CobolLexer(CharStreams.fromString(preProcessedInput.getInput()));

    lexer.removeErrorListeners();
    lexer.addErrorListener(new VerboseListener(errors));

    final CommonTokenStream tokens = new CommonTokenStream(lexer);
    final CobolParser parser = new CobolParser(tokens);

    parser.removeErrorListeners();
    parser.addErrorListener(new VerboseListener(errors));

    CobolErrorStrategy strategy = new CobolErrorStrategy();
    parser.setErrorHandler(strategy);

    CobolParser.StartRuleContext tree = parser.startRule();
    CobolVisitor visitor = new CobolVisitor();
    visitor.setSemanticErrors(new SemanticListener(errors));
    visitor.setSemanticContext(preProcessedInput.getSemanticContext());
    visitor.visit(tree);

    errors.forEach(errs -> LOG.debug(errs.printSyntaxError()));
    return new ProcessingResult(errors, preProcessedInput.getSemanticContext());
  }
}
