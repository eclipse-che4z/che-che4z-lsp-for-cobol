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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement;

import static org.eclipse.lsp.cobol.core.CobolPreprocessor.*;

import com.google.inject.Inject;
import com.google.inject.assistedinject.Assisted;
import java.util.*;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.Token;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.eclipse.lsp.cobol.AntlrRangeUtils;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.CobolPreprocessorBaseListener;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.LocalityUtils;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * ANTLR listener, which deals only with the REPLACE compiler directives. So, that the rest of the
 * pre-processing works on the replaced source. Should be applied before the copybook preprocessor
 * in order to replace all the subsequent statements.
 */
@Slf4j
public class ReplacePreProcessorListener extends CobolPreprocessorBaseListener {
  private final List<SyntaxError> errors = new ArrayList<>();
  private final CobolLanguageId languageId;
  private final ReplacingService replacingService;
  private final ExtendedDocument extendedDocument;
  private final CopybookHierarchy hierarchy;

  private ReplaceData currentTextReplaceData;

  @Inject
  public ReplacePreProcessorListener(
      @Assisted ExtendedDocument extendedDocument,
      @Assisted CopybookHierarchy hierarchy,
      @Assisted CobolLanguageId languageId,
      ReplacingService replacingService) {
    this.languageId = languageId;
    this.replacingService = replacingService;
    this.extendedDocument = extendedDocument;
    this.hierarchy = hierarchy;
  }

  /** Apply pending replacing */
  public void applyReplacing() {
    if (hierarchy.requiresReplacing()) {
      replace();
    }
  }

  public List<SyntaxError> getErrors() {
    return errors;
  }

  @Override
  public void enterReplaceAreaStartOrOffStatement(ReplaceAreaStartOrOffStatementContext ctx) {
    if (ctx.OFF() != null && currentTextReplaceData != null) {
      currentTextReplaceData
          .getRange(extendedDocument.getUri())
          .setEnd(new Position(ctx.getStop().getLine() - 1, ctx.getStop().getCharPositionInLine()));
    }
    restartReplace(ctx.getStart());
    if (!ctx.replacePseudoText().isEmpty()) {
      applyReplacing();
      currentTextReplaceData =
          new ReplaceData(new ArrayList<>(), extendedDocument.getUri(), new Range());
    }
    extendedDocument.fillArea(AntlrRangeUtils.constructRange(ctx), ' ');
  }

  @Override
  public void exitReplacePseudoText(ReplacePseudoTextContext ctx) {
    if ((ctx.getParent() instanceof ReplaceAreaStartOrOffStatementContext)) {
      currentTextReplaceData
          .getRange(extendedDocument.getUri())
          .setStart(
              new Position(ctx.getStop().getLine() - 1, ctx.getStop().getCharPositionInLine()));
      replacingService
          .retrievePseudoTextReplacingPattern(
              new ImmutablePair<>(
                  ReplacementHelper.getPseudoText(ctx.pseudoReplaceable()),
                  ReplacementHelper.getPseudoText(ctx.pseudoReplacement())),
              retrieveLocality(ctx),
              languageId,
              ReplacementHelper.getSearchPattern(ctx))
          .processIfNoErrorsFound(
              pattern -> currentTextReplaceData.getReplacePatterns().add(pattern), errors::addAll);
    }
  }

  private void replace() {
    hierarchy.replaceText(extendedDocument, replacingService::applyReplacing);
  }

  private Locality retrieveLocality(ReplacePseudoTextContext ctx) {
    return LocalityUtils.buildLocality(ctx, extendedDocument.getUri(), null);
  }

  @Override
  public void exitStartRule(StartRuleContext ctx) {
    if (currentTextReplaceData != null) {
      currentTextReplaceData
          .getReplacePatterns()
          .forEach(
              p ->
                  hierarchy.addTextReplacing(
                      p,
                      extendedDocument.getUri(),
                      currentTextReplaceData.getRange(extendedDocument.getUri())));
      currentTextReplaceData = null;
    }
    if (hierarchy.getLastTextReplacing() != null) {
      Range range = hierarchy.getLastTextReplacing().getRange(extendedDocument.getUri());
      if (range.getEnd() == null) {
        range.setEnd(
            new Position(ctx.getStop().getLine() - 1, ctx.getStop().getCharPositionInLine()));
      }
    }
    applyReplacing();
  }

  private void restartReplace(Token start) {
    if (currentTextReplaceData != null) {
      currentTextReplaceData
          .getReplacePatterns()
          .forEach(
              p ->
                  hierarchy.addTextReplacing(
                      p,
                      extendedDocument.getUri(),
                      currentTextReplaceData.getRange(extendedDocument.getUri())));
      currentTextReplaceData = null;
    }
    if (hierarchy.getLastTextReplacing() != null) {
      Range range = hierarchy.getLastTextReplacing().getRange(extendedDocument.getUri());
      if (range.getEnd() == null) {
        range.setEnd(new Position(start.getLine() - 1, start.getCharPositionInLine()));
      }
    }
  }
}
