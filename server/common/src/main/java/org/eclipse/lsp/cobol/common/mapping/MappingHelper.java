/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.common.mapping;

import lombok.NonNull;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp4j.Range;

/** Maping helper class */
@UtilityClass
public class MappingHelper {
  public static final String SEPARATOR = "\\r?\\n";

  /**
   * Splits text into string array
   *
   * @param text - text to split
   * @return an array of string objects
   */
  public String[] split(String text) {
    return text.split(SEPARATOR);
  }

  static void validateRange(@NonNull Range range) {
    if (range.getStart() == null) {
      throw new IllegalArgumentException("Range start is null");
    }
    if (range.getEnd() == null) {
      throw new IllegalArgumentException("Range end is null");
    }
    if (range.getStart().getLine() < 0 || range.getEnd().getLine() < 0) {
      throw new IllegalArgumentException("Invalid range: " + range);
    }
    if (range.getStart().getLine() > range.getEnd().getLine()) {
      throw new IllegalArgumentException("Invalid range: " + range);
    }
    if (range.getStart().getCharacter() < 0 || range.getEnd().getCharacter() < 0) {
      throw new IllegalArgumentException("Invalid range: " + range);
    }
    if ((range.getStart().getLine() == range.getEnd().getLine())
        && (range.getStart().getCharacter() > range.getEnd().getCharacter())) {
      throw new IllegalArgumentException("Invalid range: " + range);
    }
  }
}
