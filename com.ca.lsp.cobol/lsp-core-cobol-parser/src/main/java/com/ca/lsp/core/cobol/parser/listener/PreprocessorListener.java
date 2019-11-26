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

import com.ca.lsp.core.cobol.model.SyntaxError;

import java.util.List;

public class PreprocessorListener extends Listener {

  private static final int ERROR_SEVERITY = 1;

  public PreprocessorListener(List<SyntaxError> errorsPipe) {
    super(errorsPipe);
  }

  public void syntaxError(String documentName, int line, int charPositionInLine, String msg, int errorLength) {
    super.syntaxError(documentName, line, charPositionInLine, msg, errorLength, ERROR_SEVERITY);
  }

  public void syntaxError(String documentName, int line, int charPositionInLine, int charEndingIndex, String msg) {
    super.syntaxError(documentName, line, charPositionInLine, charEndingIndex, msg, ERROR_SEVERITY);
  }
}
