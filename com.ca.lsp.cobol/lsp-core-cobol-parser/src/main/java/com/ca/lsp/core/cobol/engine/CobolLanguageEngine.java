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

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.params.impl.CobolParserParamsImpl;
import com.ca.lsp.core.cobol.parser.CobolLexer;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.listener.FormatListener;
import com.ca.lsp.core.cobol.parser.listener.SemanticListener;
import com.ca.lsp.core.cobol.parser.listener.VerboseListener;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.impl.CobolPreprocessorImpl;
import com.ca.lsp.core.cobol.semantics.LanguageContext;
import com.ca.lsp.core.cobol.semantics.CobolParagraphContext;
import com.ca.lsp.core.cobol.semantics.CobolVariableContext;
import com.ca.lsp.core.cobol.strategy.CobolErrorStrategy;
import com.ca.lsp.core.cobol.visitor.CobolVisitor;
import com.google.common.collect.Lists;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import edu.emory.mathcs.backport.java.util.Collections;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

@Slf4j
@RequiredArgsConstructor
public class CobolLanguageEngine {

  private final CobolPreprocessor.CobolSourceFormatEnum sourceFormat;
  @Getter private List<SyntaxError> errors = new ArrayList<>();
  @Getter private LanguageContext variables = new CobolVariableContext();
  @Getter private LanguageContext paragraphs = new CobolParagraphContext();
  @Getter private List<File> copybookList;

  @SuppressWarnings("unused")
  private CobolParserParams createDefaultParams(final File cobolFile) {
    final CobolParserParams result = new CobolParserParamsImpl();
    final File copyBooksDirectory = cobolFile.getParentFile();
    result.setCopyBookDirectories(Lists.newArrayList(copyBooksDirectory));
    return result;
  }

  private CobolParserParams createParams() {
    final CobolParserParams result = new CobolParserParamsImpl();
    result.setCopyBookFiles(copybookList);
    return result;
  }

  public void run(String in) {
    CobolPreprocessorImpl preprocessor = new CobolPreprocessorImpl();
    preprocessor.setFormatErrors(new FormatListener(errors));
    final String preProcessedInput = preprocessor.process(in, sourceFormat, createParams());
    doParse(preProcessedInput);
  }

  private void doParse(String preProcessedInput) {
    final CobolLexer lexer = new CobolLexer(CharStreams.fromString(preProcessedInput));

    lexer.removeErrorListeners();
    lexer.addErrorListener(new VerboseListener(errors));

    final CommonTokenStream tokens = new CommonTokenStream(lexer);
    final CobolParser parser = new CobolParser(tokens);

    parser.removeErrorListeners();
    parser.addErrorListener(new VerboseListener(errors));

    CobolErrorStrategy strategy = new CobolErrorStrategy();
    parser.setErrorHandler(strategy);
    CobolParser.StartRuleContext tree = parser.startRule();

    CobolVisitor tourist = new CobolVisitor();
    tourist.setSemanticErrors(new SemanticListener(errors));
    tourist.setVariableContext((CobolVariableContext) variables);
    tourist.setParagraphContext((CobolParagraphContext) paragraphs);
    tourist.visit(tree);
    errors.forEach(errs -> LOG.debug(errs.printSyntaxError()));
  }

  public void setCopybookList(List<File> copybookList) {
    this.copybookList = copybookList;
  }
}
