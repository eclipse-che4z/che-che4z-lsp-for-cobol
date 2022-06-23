/*
 * Copyright (c) 2022 Broadcom.
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

package org.eclipse.lsp.cobol.core.model;

import lombok.Value;

/** This value class stores all the possible modifiers of a copy statement. */
@Value
public class CopyStatementModifier {
  int levelNumber;
  String qualifier;
  String suffix;

  public CopyStatementModifier(int levelNumber) {
    this.levelNumber = levelNumber;
    qualifier = null;
    suffix = "";
  }

  public CopyStatementModifier(int levelNumber, String qualifier, String suffix) {
    this.levelNumber = levelNumber;
    this.qualifier = qualifier;
    this.suffix = suffix;
  }
}
