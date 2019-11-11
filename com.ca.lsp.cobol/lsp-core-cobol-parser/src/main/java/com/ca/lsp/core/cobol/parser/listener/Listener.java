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
import java.util.Optional;

public abstract class Listener {
  protected static final int PREPROCESSING_ERROR_INDEX = -1;
  protected List<SyntaxError> errorsPipe;

  public Listener(List<SyntaxError> errorsPipe) {
    this.errorsPipe = errorsPipe;
  }

  public List<SyntaxError> getErrorsPipe() {
    return errorsPipe;
  }

  public void syntaxError(
      int line, int charPositionInLine, String msg, int errorLength, int severity) {
    registerError(
        msg,
        new Position(
            PREPROCESSING_ERROR_INDEX,
            charPositionInLine,
            (charPositionInLine + errorLength),
            line,
            charPositionInLine),
        severity);
  }

  public void syntaxError(
      int line, int charPositionInLine, int charEndingIndex, String msg, int severity) {
    registerError(
        msg,
        new Position(
            PREPROCESSING_ERROR_INDEX,
            charPositionInLine,
            charEndingIndex,
            line,
            charPositionInLine),
        severity);
  }

  public void unregisterError(int line) {
    Optional<SyntaxError> error =
        getErrorsPipe().stream().filter(err -> err.getPosition().getLine() == line).findFirst();
    error.ifPresent(err -> getErrorsPipe().remove(err));
  }

  protected void registerError(String msg, Position position, int severity) {
    if (getErrorsPipe() != null) {
      getErrorsPipe()
          .add(
              SyntaxError.syntaxerror()
                  .position(position)
                  .suggestion(msg)
                  .type(0)
                  .severity(severity)
                  .build());
    }
  }
}
