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

import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.core.cobol.model.SyntaxError;

import java.util.List;

/** @author ilise01 */
public class SemanticListener extends Listener {

  private static final int WARNING_SEVERITY = 2;

  public SemanticListener(List<SyntaxError> errorsPipe) {
    super(errorsPipe);
  }

  @Override
  public List<SyntaxError> getErrorsPipe() {
    return errorsPipe;
  }

  public void syntaxError(int line, int charPositionInLine, String msg, int errorLength) {
    super.syntaxError(line, charPositionInLine, msg, errorLength, WARNING_SEVERITY);
  }

  public void syntaxError(int line, int charPositionInLine, int charEndingIndex, String msg) {
    super.syntaxError(line, charPositionInLine, charEndingIndex, msg, WARNING_SEVERITY);
  }

  protected void registerError(String msg, Position position) {
    super.registerError(msg, position, WARNING_SEVERITY);
  }
}
