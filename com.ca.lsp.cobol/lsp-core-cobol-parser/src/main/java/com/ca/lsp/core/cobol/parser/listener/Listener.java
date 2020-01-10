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
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@AllArgsConstructor
public abstract class Listener {
  @Getter private List<SyntaxError> errorsPipe;

  public void syntaxError(
      String documentName,
      int line,
      int charPositionInLine,
      String msg,
      int errorLength,
      int severity) {
    registerError(
        msg,
        new Position(
            documentName,
            charPositionInLine,
            (charPositionInLine + errorLength),
            line,
            charPositionInLine),
        severity);
  }

  public void syntaxError(
      String documentName,
      int line,
      int charPositionInLine,
      int charEndingIndex,
      String msg,
      int severity) {
    registerError(
        msg,
        new Position(documentName, charPositionInLine, charEndingIndex, line, charPositionInLine),
        severity);
  }

  void registerError(String msg, Position position, int severity) {
    if (getErrorsPipe() != null) {
      getErrorsPipe()
          .add(
              SyntaxError.syntaxError()
                  .position(position)
                  .suggestion(msg)
                  .severity(severity)
                  .build());
    }
  }
}
