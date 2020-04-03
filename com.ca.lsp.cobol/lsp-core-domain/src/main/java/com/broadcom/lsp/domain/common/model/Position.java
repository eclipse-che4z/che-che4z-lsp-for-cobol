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

import lombok.Data;

import java.io.Serializable;

/**
 * This data class is used to describe the position of syntax or semantic element in the workspace.
 */
@Data
public final class Position implements Serializable {
  private final String documentURI;
  private final int startPosition;
  private final int stopPosition;
  private final int line;
  private final int charPositionInLine;

  private String token;

  public Position(
      String documentURI,
      int startPosition,
      int stopPosition,
      int line,
      int charPositionInLine,
      String token) {
    this.documentURI = documentURI;
    this.startPosition = startPosition;
    this.stopPosition = stopPosition;
    this.line = line;
    this.charPositionInLine = charPositionInLine;
    this.token = token;
  }

  public Position(
      String documentURI, int startPosition, int stopPosition, int line, int charPositionInLine) {
    this.documentURI = documentURI;
    this.startPosition = startPosition;
    this.stopPosition = stopPosition;
    this.line = line;
    this.charPositionInLine = charPositionInLine;
  }
}
