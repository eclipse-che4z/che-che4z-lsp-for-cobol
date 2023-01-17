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
package org.eclipse.lsp.cobol.dialects.daco;

import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.StringUtils;

/**
 * Implements preprocess copybook functionality
 */
@UtilityClass
class DaCoPreprocessor {

  /**
   * Run preprocessor for copybook content
   * @param copybookContent is a copybook content
   * @return preprocessed text
   */
  public String run(String copybookContent) {
    if (copybookContent == null) {
      return null;
    }
    StringBuilder result = new StringBuilder();
    String[] lines = copybookContent.split("\\r?\\n");
    boolean hasNewLineAtEnd = copybookContent.endsWith("\n");
    for (int i = 0; i < lines.length; i++) {
      result.append(preprocessLine(lines[i]));
      if (i < lines.length - 1 || hasNewLineAtEnd) {
        result.append("\r\n");
      }
    }
    return result.toString();
  }

  private String preprocessLine(String line) {
    if (line.length() > 0) {
      int len = Math.min(line.length(), 6);
      String result = StringUtils.repeat(" ", len);
      if (len < line.length()) {
        result += line.substring(len);
      }
      return result;
    }
    return line;
  }
}
