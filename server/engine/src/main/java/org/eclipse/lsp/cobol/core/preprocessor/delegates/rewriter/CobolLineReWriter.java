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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter;

import org.eclipse.lsp.cobol.core.model.CobolLine;

import java.util.List;

/**
 * The implementations of this interface should receive a list of lines and apply some changes on
 * each line. It should not change order of the lines, add or remove them.
 */
public interface CobolLineReWriter {

  /**
   * Apply some changes on each line.
   *
   * @param lines cobol lines
   * @return the same amount of lines
   */
  List<CobolLine> processLines(List<CobolLine> lines);

  /**
   *  Checks if a string ends with Quote marks
   * @param stringToCheck {@link String} parameter for test
   * @return True is string ends with quotes and false otherwise
   */
  static boolean checkStringEndsWithQuoteMark(String stringToCheck) {
    return stringToCheck.endsWith("\"") || stringToCheck.endsWith("'");
  }

  /**
   * Checks if a string starts with Quote marks
   * @param stringToCheck {@link String} parameter for test
   * @return True is string starts with quotes and false otherwise
   */
  static boolean checkStringStartsWithQuoteMark(String stringToCheck) {
    return stringToCheck.startsWith("\"") || stringToCheck.startsWith("'");
  }
}
