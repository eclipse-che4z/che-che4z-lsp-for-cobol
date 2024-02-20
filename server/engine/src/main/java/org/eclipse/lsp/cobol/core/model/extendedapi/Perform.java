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
import org.eclipse.lsp.cobol.common.model.ProcedureName;

import java.util.Optional;

/** Data transport object of CF AST. Perform type represents PERFORM statement. */
@Value
@EqualsAndHashCode(callSuper = true)
public class Perform extends CFASTNode {
  String targetName;
  String targetSectionName;
  String thruName;
  String thruSectionName;

  public Perform(ProcedureName target, ProcedureName thru, Location location) {
    super(CFASTNodeType.PERFORM.getValue(), location);
    this.targetName = Optional.ofNullable(target).map(ProcedureName::getName).orElse(null);
    this.targetSectionName = Optional.ofNullable(target).map(ProcedureName::getInSection).orElse(null);
    this.thruName = Optional.ofNullable(thru).map(ProcedureName::getName).orElse(null);
    this.thruSectionName = Optional.ofNullable(thru).map(ProcedureName::getInSection).orElse(null);
  }
}
