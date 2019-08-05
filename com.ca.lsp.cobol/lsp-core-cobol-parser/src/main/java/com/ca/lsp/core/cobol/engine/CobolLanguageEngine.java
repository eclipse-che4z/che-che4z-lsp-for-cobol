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

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.params.impl.CobolParserParamsImpl;
import com.ca.lsp.core.cobol.parser.CobolLexer;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.parser.error.SyntaxError;
import com.ca.lsp.core.cobol.parser.listener.FormatListener;
import com.ca.lsp.core.cobol.parser.listener.SemanticListener;
import com.ca.lsp.core.cobol.parser.listener.VerboseListener;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.impl.CobolPreprocessorImpl;
import com.ca.lsp.core.cobol.strategy.CobolErrorStrategy;
import com.ca.lsp.core.cobol.visitor.CobolVisitor;
import com.google.common.collect.Lists;

@Slf4j
@RequiredArgsConstructor
public class CobolLanguageEngine {

  private final CobolPreprocessor.CobolSourceFormatEnum sourceFormat;
  private List<SyntaxError> generalErrors = new ArrayList<>();

  @SuppressWarnings("unused")
  private CobolParserParams createDefaultParams(final File cobolFile) {
    final CobolParserParams result = new CobolParserParamsImpl();
    final File copyBooksDirectory = cobolFile.getParentFile();
    result.setCopyBookDirectories(Lists.newArrayList(copyBooksDirectory));
    return result;
  }

  public List<SyntaxError> check(String in) {
    CobolPreprocessorImpl preprocessor = new CobolPreprocessorImpl();
    preprocessor.setFormatErrors(new FormatListener(generalErrors));
    final String preProcessedInput = preprocessor.process(in, sourceFormat);
    doParse(preProcessedInput);

    return generalErrors;
  }

  private void doParse(String preProcessedInput) {
    final CobolLexer lexer = new CobolLexer(CharStreams.fromString(preProcessedInput));

    lexer.removeErrorListeners();
    lexer.addErrorListener(new VerboseListener(generalErrors));

    final CommonTokenStream tokens = new CommonTokenStream(lexer);
    final CobolParser parser = new CobolParser(tokens);

    parser.removeErrorListeners();
    parser.addErrorListener(new VerboseListener(generalErrors));

    CobolErrorStrategy strategy = new CobolErrorStrategy();
    parser.setErrorHandler(strategy);
    CobolParser.StartRuleContext tree = parser.startRule();
    CobolVisitor tourist = new CobolVisitor();
    tourist.setSemanticErrors(new SemanticListener(generalErrors));
    tourist.visit(tree);
    generalErrors.forEach(errors -> LOG.debug(errors.printSyntaxError()));
  }
}
