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
package com.broadcom.lsp.cobol.core.preprocessor.delegates;

import com.broadcom.lsp.cobol.core.CobolPreprocessor;
import com.broadcom.lsp.cobol.core.CobolPreprocessorLexer;
import com.broadcom.lsp.cobol.core.annotation.CheckThreadInterruption;
import com.broadcom.lsp.cobol.core.annotation.ThreadInterruptAspect;
import com.broadcom.lsp.cobol.core.model.CobolLine;
import com.broadcom.lsp.cobol.core.model.CopybookUsage;
import com.broadcom.lsp.cobol.core.model.ExtendedDocument;
import com.broadcom.lsp.cobol.core.model.ResultWithErrors;
import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import com.google.common.collect.Multimap;
import com.google.inject.Inject;
import lombok.NonNull;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.util.Deque;

/**
 * This class runs pre-processing for COBOL using CobolPreprocessor.g4 grammar file. As a result, it
 * returns an extended document with all the available copybooks included, with their definitions
 * and usages specified, as well as related errors.
 */
public class GrammarPreprocessorImpl implements GrammarPreprocessor, ThreadInterruptAspect {
  private GrammarPreprocessorListenerFactory listenerFactory;

  @Inject
  public GrammarPreprocessorImpl(GrammarPreprocessorListenerFactory listenerFactory) {
    this.listenerFactory = listenerFactory;
  }

  @NonNull
  @Override
  @CheckThreadInterruption
  public ResultWithErrors<ExtendedDocument> buildExtendedDocument(
      @NonNull String uri,
      @NonNull String code,
      @NonNull Deque<CopybookUsage> copybookStack,
      @NonNull CopybookProcessingMode copybookProcessingMode,
      Multimap<Integer, CobolLine> positionCorrectionMap) {
    Lexer lexer = new CobolPreprocessorLexer(CharStreams.fromString(code));
    lexer.removeErrorListeners();

    BufferedTokenStream tokens = new CommonTokenStream(lexer);

    CobolPreprocessor parser = new CobolPreprocessor(tokens);
    parser.removeErrorListeners();

    RuleContext startRule = parser.startRule();

    ParseTreeWalker walker = new ParseTreeWalker();
    GrammarPreprocessorListener listener =
        listenerFactory.create(
            uri, tokens, copybookStack, copybookProcessingMode, positionCorrectionMap);
    walker.walk(listener, startRule);

    return new ResultWithErrors<>(listener.getResult(), listener.getErrors());
  }
}
