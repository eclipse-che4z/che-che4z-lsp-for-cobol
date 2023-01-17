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

package org.eclipse.lsp.cobol.dialects.idms;

import com.google.common.collect.ImmutableList;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp4j.DiagnosticRelatedInformation;
import org.eclipse.lsp4j.Range;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import static org.eclipse.lsp.cobol.common.VariableConstants.*;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.WARNING;

/**
 * Processor for the text adjustment in the copy IDMS statements.
 */
@AllArgsConstructor
public class CopyIdmsAdjustmentProcessor {

  private final CopyNode copyNode;
  private final String uri;
  private final int copybookLevel;
  private final int firstLevel;
  private final Pair<Range, Integer> variable;
  private final MessageService messageService;

  private static final int HIGHEST_LEVEL_FOR_ADJUSTMENT = 49;
  private static final List<Integer> SPECIAL_LEVELS = ImmutableList.of(LEVEL_66, LEVEL_77, LEVEL_88);
  public static final String IDMS_DIALECT_MAX_ADJUSTMENT_EXCEED_MSG = "IdmsDialect.maxAdjustmentExceed";

  /**
   * Add adjustment warnings to existing error list.
   *
   * @param errors Existing {@link SyntaxError} list
   */
  public void processError(List<SyntaxError> errors) {
    errors
        .addAll(
            getWarningForNoAdjustment(
                copybookLevel, firstLevel, variable, uri, copyNode.getLocality()));
  }

  protected int calculateLevel(int copybookLevel, int firstLevel, int level) {
    if (isLevelAdjustable(copybookLevel, firstLevel, level)) {
      int delta = copybookLevel - firstLevel;
      return level + delta;
    }
    return level;
  }

  private boolean isLevelAdjustable(int copybookLevel, int firstLevel, Integer level) {
    int delta = copybookLevel - firstLevel;
    return level + delta <= HIGHEST_LEVEL_FOR_ADJUSTMENT;
  }

  private Collection<SyntaxError> getWarningForNoAdjustment(
      int copybookLevel,
      int firstLevel,
      Pair<Range, Integer> rangeIntegerPair,
      String uri,
      Locality sourceLocality) {
    if (shouldWarnForAdjustment(copybookLevel, firstLevel, rangeIntegerPair)) {
      int delta = copybookLevel - firstLevel;
      return getWarningAtARange(
          rangeIntegerPair.getLeft(),
          uri,
          messageService.getMessage(
              IDMS_DIALECT_MAX_ADJUSTMENT_EXCEED_MSG,
              delta + rangeIntegerPair.getRight(),
              delta,
              rangeIntegerPair.getRight()),
          sourceLocality);
    }
    return Collections.emptyList();
  }

  private boolean shouldWarnForAdjustment(
      int copybookLevel, int firstLevel, Pair<Range, Integer> rangeIntegerPair) {
    return !isLevelAdjustable(copybookLevel, firstLevel, rangeIntegerPair.getRight())
            && !SPECIAL_LEVELS.contains(rangeIntegerPair.getRight());
  }

  private List<SyntaxError> getWarningAtARange(
      Range rangeForError, String uri, String message, Locality sourceLocality) {
    return Collections.singletonList(
        SyntaxError.syntaxError()
            .location(Locality.builder().uri(uri).range(rangeForError).build().toOriginalLocation())
            .suggestion(messageService.getMessage(message))
            .severity(WARNING)
            .errorSource(ErrorSource.DIALECT)
            .relatedInformation(
                new DiagnosticRelatedInformation(sourceLocality.toLocation(), "Copy IDMS source"))
            .build());
  }
}
