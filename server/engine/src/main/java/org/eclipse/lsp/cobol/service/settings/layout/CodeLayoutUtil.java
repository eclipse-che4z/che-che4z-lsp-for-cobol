/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.service.settings.layout;

import java.util.Optional;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.lsp.CobolLanguageId;

/** Utility class for code layout */
@UtilityClass
public class CodeLayoutUtil {
  /**
   * Merge two layout and gives the resultant layout by combining the passed layouts
   *
   * @param defaultLayout default layout values
   * @param proposedLayout proposed layout
   * @return {@link CobolProgramLayout}
   */
  public CobolProgramLayout mergeLayout(
      CobolProgramLayout defaultLayout, CobolProgramLayout proposedLayout) {
    Integer sequenceLength =
        Optional.ofNullable(proposedLayout.getSequenceLength())
            .orElse(defaultLayout.getSequenceLength());
    Integer indicatorAreaLength =
        Optional.ofNullable(proposedLayout.getIndicatorLength())
            .orElse(defaultLayout.getIndicatorLength());
    Integer areaALength =
        Optional.ofNullable(proposedLayout.getAreaALength()).orElse(defaultLayout.getAreaALength());
    Integer areaBLength =
        Optional.ofNullable(proposedLayout.getAreaBLength()).orElse(defaultLayout.getAreaBLength());
    Integer commentAreaLength =
        Optional.ofNullable(proposedLayout.getCommentAreaLength())
            .orElse(defaultLayout.getCommentAreaLength());
    return new CobolProgramLayout(
        sequenceLength, indicatorAreaLength, areaALength, areaBLength, commentAreaLength);
  }

  /**
   * Gives a merged {@link CobolProgramLayout} based on the user configuration and languageID
   * @param defaultLangId language id send bt the LSP client
   * @param layoutStore {@link CodeLayoutStore}
   * @return {@link CobolProgramLayout}
   */
  public CobolProgramLayout getProgramLayout(
      CobolLanguageId defaultLangId, CodeLayoutStore layoutStore) {
    CobolLanguageId cobolLanguageId =
        CobolLanguageId.MAPPER.getOrDefault(defaultLangId, CobolLanguageId.COBOL);
    return layoutStore
        .getCodeLayout()
        .map(lay -> mergeLayout(cobolLanguageId.getLayout(), lay))
        .orElse(cobolLanguageId.getLayout());
  }
}
