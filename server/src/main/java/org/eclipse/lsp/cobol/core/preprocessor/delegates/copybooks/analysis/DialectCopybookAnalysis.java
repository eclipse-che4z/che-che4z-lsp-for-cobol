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

import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.engine.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopyStatementModifier;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.CopybookModificationListener;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.PreprocessorStack;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.CobolParserUtils;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.PreprocessorStringUtils;
import org.eclipse.lsp.cobol.service.CopybookService;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.MAID_WRK_QUALIFIER;

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
  protected CopybookName retrieveCopybookName(
      ParserRuleContext ctx, String dialect, CopybookHierarchy hierarchy) {
    final String name = PreprocessorStringUtils.trimQuotes(ctx.getText().toUpperCase());
    return new CopybookName(
        name,
        dialect,
        name
            + ofNullable(hierarchy.getModifier())
                .map(CopyStatementModifier::getQualifier)
                .map(String::toUpperCase)
                .filter(it -> !it.equals(MAID_WRK_QUALIFIER))
                .map(it -> "_" + it)
                .orElse(""));
  }

  @Override
  protected ResultWithErrors<String> handleReplacing(
      CopybookMetaData metaData, CopybookHierarchy hierarchy, String text) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    final CopyStatementModifier modifier = hierarchy.getModifier();
    hierarchy.setModifier(null);
    if (modifier == null || modifier.getLevelNumber() == 0) {
      return ResultWithErrors.of(text);
    }

    return ResultWithErrors.of(
        CobolParserUtils.parse(
            text,
            tokens -> new CopybookModificationListener(modifier, modifier.getSuffix(), tokens),
            CobolParser::dataDescriptionEntries,
            PreprocessorStack::accumulate));
  }
}
