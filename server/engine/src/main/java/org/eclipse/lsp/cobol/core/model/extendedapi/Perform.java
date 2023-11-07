/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.core.model.extendedapi;

import lombok.EqualsAndHashCode;
import lombok.Value;

/** Data transport object of CF AST. Perform type represents PERFORM statement. */
@Value
@EqualsAndHashCode(callSuper = true)
public class Perform extends CFASTNode {
  String targetName;
  String targetSectionName;
  String thruName;
  String thruSectionName;

  public Perform(String targetName, String targetSectionName, String thruName, String thruSectionName, Location location) {
    super(CFASTNodeType.PERFORM.getValue(), location);
    this.targetName = targetName;
    this.targetSectionName = targetSectionName;
    this.thruName = thruName;
    this.thruSectionName = thruSectionName;
  }
}
