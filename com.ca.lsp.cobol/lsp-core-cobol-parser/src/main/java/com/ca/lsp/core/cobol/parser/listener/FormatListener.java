/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.parser.listener;

import com.ca.lsp.core.cobol.parser.error.SyntaxError;
import com.ca.lsp.core.cobol.parser.error.objects.ErrorPosition;

import java.util.List;

public class FormatListener extends Listener {

  private static final int ERROR_SEVERITY = 1;

  public FormatListener(List<SyntaxError> errorsPipe) {
    super(errorsPipe);
  }

  @Override
  public List<SyntaxError> getErrorsPipe() {
    return errorsPipe;
  }

  public void syntaxError(int line, int charPositionInLine, String msg, int errorLength) {
    super.syntaxError(line, charPositionInLine, msg, errorLength, ERROR_SEVERITY);
  }

  public void syntaxError(int line, int charPositionInLine, int charEndingIndex, String msg) {
    super.syntaxError(line, charPositionInLine, charEndingIndex, msg, ERROR_SEVERITY);
  }

  protected void registerError(String msg, ErrorPosition position) {
    super.registerError(msg, position, ERROR_SEVERITY);
  }
}
