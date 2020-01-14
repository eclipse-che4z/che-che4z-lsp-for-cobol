/*
 *
 *  Copyright (c) 2019 Broadcom.
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

/**
 * This data class is used to describe the position of syntax or semantic element in the workspace.
 */
@Value
@AllArgsConstructor
public final class Position implements Serializable {
  private final String documentURI;
  private final int tokenIndex;
  private final int startPosition;
  private final int stopPosition;
  private final int line;
  private final int charPositionInLine;
}
