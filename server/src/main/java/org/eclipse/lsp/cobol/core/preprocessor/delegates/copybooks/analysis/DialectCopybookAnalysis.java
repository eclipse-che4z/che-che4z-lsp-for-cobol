/*
 * Copyright (c) 2022 Broadcom.
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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.engine.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.LevelNumberAdjustingListener;
import org.eclipse.lsp.cobol.service.CopybookService;

/**
 * This implementation of the {@link AbstractCopybookAnalysis} provides the logic and the default
 * parameters for the copybook analysis, required by the COBOL dialects.
 */
class DialectCopybookAnalysis extends AbstractCopybookAnalysis {
  DialectCopybookAnalysis(
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      MessageService messageService) {
    super(preprocessor, copybookService, messageService, MAX_COPYBOOK_NAME_LENGTH_DEFAULT);
  }

  @Override
  protected ResultWithErrors<String> handleReplacing(
      CopybookMetaData metaData, CopybookHierarchy hierarchy, String text) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    final int level = hierarchy.takeLevelNumber();
    if (level == 0) {
      return ResultWithErrors.of(text);
    }

    Lexer lexer = new CobolLexer(CharStreams.fromString(text));
    lexer.removeErrorListeners();

    BufferedTokenStream tokens = new CommonTokenStream(lexer);

    CobolParser parser = new CobolParser(tokens);
    parser.removeErrorListeners();

    RuleContext startRule = parser.dataDescriptionEntries();

    ParseTreeWalker walker = new ParseTreeWalker();
    LevelNumberAdjustingListener listener = new LevelNumberAdjustingListener(level, tokens);
    walker.walk(listener, startRule);
    return ResultWithErrors.of(listener.accumulate());
  }
}
