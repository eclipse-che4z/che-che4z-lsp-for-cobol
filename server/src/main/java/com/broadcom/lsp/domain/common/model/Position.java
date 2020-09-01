/*
 *
 *  Copyright (c) 2020 Broadcom.
 *  The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 *  This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *  SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package com.broadcom.lsp.domain.common.model;

import lombok.AllArgsConstructor;
import lombok.Value;

import java.io.Serializable;
import java.util.Objects;

/**
 * This data class is used to describe the position of syntax or semantic element in the workspace.
 */
@Value
@AllArgsConstructor
public final class Position implements Serializable {
  private String documentURI;
  private String copybookId;
  private int startPosition;
  private int stopPosition;
  private int line;
  private int charPositionInLine;
  private String token;

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Position position = (Position) o;
    return startPosition == position.startPosition
        && stopPosition == position.stopPosition
        && line == position.line
        && charPositionInLine == position.charPositionInLine
        && documentURI.equals(position.documentURI)
        && Objects.equals(token, position.token);
  }

  @Override
  public int hashCode() {
    return Objects.hash(documentURI, startPosition, stopPosition, line, charPositionInLine, token);
  }
}
