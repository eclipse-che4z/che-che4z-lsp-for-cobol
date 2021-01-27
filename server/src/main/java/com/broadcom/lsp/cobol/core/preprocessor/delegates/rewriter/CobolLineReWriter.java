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
package com.broadcom.lsp.cobol.core.preprocessor.delegates.rewriter;

import com.broadcom.lsp.cobol.core.model.CobolLine;

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
}
