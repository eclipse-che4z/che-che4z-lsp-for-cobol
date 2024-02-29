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

import java.util.regex.Pattern;
import lombok.Builder;
import lombok.Getter;
import org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants;

/**
 * This class represents a cobol program line layout <sequence><indicator><area A><area B><comment
 * Area>
 */
@Getter
@Builder
public class CobolProgramLayout {
  private final int sequenceLength;
  private final int indicatorLength;
  private final int areaALength;
  private final int areaBLength;
  private final int commentAreaLength;

  public CobolProgramLayout(
      int sequenceLength,
      int indicatorLength,
      int areaALength,
      int areaBLength,
      int commentAreaLength) {
    this.sequenceLength = sequenceLength;
    this.indicatorLength = indicatorLength;
    this.areaALength = areaALength;
    this.areaBLength = areaBLength;
    this.commentAreaLength = commentAreaLength;
  }

  public CobolProgramLayout() {
    this(
        ProcessingConstants.SEQUENCE_LENGTH,
        ProcessingConstants.INDICATOR_LENGTH,
        ProcessingConstants.AREA_A_LENGTH,
        ProcessingConstants.AREA_B_LENGTH,
        ProcessingConstants.COMMENT_AREA);
  }

  public int getSourceCodeLength() {
    return sequenceLength + indicatorLength + areaALength + areaBLength;
  }

  public int getMaxLineLength() {
    return getSourceCodeLength() + commentAreaLength;
  }

  public Pattern getCobolLinePattern() {
    return Pattern.compile(
            String.format(
                    "^(?<sequence>.{0,%s})(?<indicator>.{0,%s})(?<contentA>.{0,%s})(?<contentB>.{0,%s})(?<comment>.{0,%s})(?<extra>.*)$",
                    sequenceLength, indicatorLength, areaALength, areaBLength, commentAreaLength));
  }
}
