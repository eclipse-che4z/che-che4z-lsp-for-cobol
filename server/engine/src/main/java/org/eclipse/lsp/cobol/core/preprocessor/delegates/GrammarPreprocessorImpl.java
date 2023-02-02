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
package org.eclipse.lsp.cobol.core.preprocessor.delegates;

import com.google.inject.Inject;
import lombok.NonNull;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedSource;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.CobolPreprocessor;
import org.eclipse.lsp.cobol.core.CobolPreprocessorLexer;
import org.eclipse.lsp.cobol.core.model.OldExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.GrammarPreprocessorListener;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.GrammarPreprocessorListenerFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.ReplacePreprocessorFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * This class runs pre-processing for COBOL using CobolPreprocessor.g4 grammar file. As a result, it
 * returns an extended document with all the available copybooks included, with their definitions
 * and usages specified, as well as related errors.
 */
public class GrammarPreprocessorImpl implements GrammarPreprocessor {
  private final GrammarPreprocessorListenerFactory listenerFactory;
  private final ReplacePreprocessorFactory replacingFactory;

  @Inject
  public GrammarPreprocessorImpl(
      GrammarPreprocessorListenerFactory listenerFactory,
      ReplacePreprocessorFactory replacingFactory) {
    this.listenerFactory = listenerFactory;
    this.replacingFactory = replacingFactory;
  }

  @NonNull
  @Override
  public ResultWithErrors<OldExtendedDocument> buildExtendedDocument(
      @NonNull ExtendedSource extendedSource,
      @NonNull CopybookConfig copybookConfig,
      @NonNull CopybookHierarchy hierarchy) {
    List<SyntaxError> errors = new ArrayList<>();

    String replacedCode = replace(extendedSource, hierarchy).unwrap(errors::addAll);

    return createOldExtendedDocument(replacedCode, extendedSource.getUri(), copybookConfig, hierarchy)
        .accumulateErrors(errors);
  }

  private ResultWithErrors<String> replace(
          ExtendedSource extendedSource, CopybookHierarchy hierarchy) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    BufferedTokenStream tokens = makeTokens(extendedSource.extendedText());
    GrammarPreprocessorListener<String> listener = replacingFactory
            .create(extendedSource.getUri(), tokens, hierarchy);

    CobolPreprocessor parser = new CobolPreprocessor(tokens);
    parser.removeErrorListeners();

    ParseTreeWalker walker = new ParseTreeWalker();
    walker.walk(listener, parser.startRule());
    return listener.getResult();
  }

  private ResultWithErrors<OldExtendedDocument> createOldExtendedDocument(
          String code, String uri,
          CopybookConfig copybookConfig,
          CopybookHierarchy hierarchy) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    BufferedTokenStream tokens = makeTokens(code);

    GrammarPreprocessorListener<OldExtendedDocument> listener =
            listenerFactory.create(uri, tokens, copybookConfig, hierarchy);

    CobolPreprocessor parser = new CobolPreprocessor(tokens);
    parser.removeErrorListeners();

    ParseTreeWalker walker = new ParseTreeWalker();
    walker.walk(listener, parser.startRule());
    return listener.getResult();
  }

  private static BufferedTokenStream makeTokens(String code) {
    Lexer lexer = new CobolPreprocessorLexer(CharStreams.fromString(code));
    lexer.removeErrorListeners();
    return new CommonTokenStream(lexer);
  }
}
