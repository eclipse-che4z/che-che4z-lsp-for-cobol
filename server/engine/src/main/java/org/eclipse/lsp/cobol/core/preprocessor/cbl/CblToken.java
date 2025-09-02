/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.cbl;

import static org.eclipse.lsp.cobol.core.preprocessor.cbl.CblNodeTypes.TOKEN;

/** CBL Token */
public class CblToken extends CblNode {
  private final String text;

  /**
   * CBL Token
   *
   * @param uri - document URI
   * @param text - token text
   * @param line - token line number
   * @param start - token start position
   * @param end - token end position
   */
  public CblToken(String uri, String text, int line, int start, int end) {
    super(uri, line, start, end, TOKEN);
    this.text = text;
  }

  public String getText() {
    return text;
  }

  @Override
  public String toString() {
    return "CblToken{"
        + "text='"
        + text
        + '\''
        + ", start="
        + getStart()
        + ", end="
        + getEnd()
        + '}';
  }
}
