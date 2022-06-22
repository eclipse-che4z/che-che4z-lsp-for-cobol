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
package org.eclipse.lsp.cobol.core.model.tree;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.variables.DivisionType;

/** The class represent Division block in COBOL */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class DivisionNode extends Node {

  private final DivisionType divisionType;

  public DivisionNode(Locality location, DivisionType divisiontype) {
    super(location, NodeType.DIVISION);
    this.divisionType = divisiontype;
  }
}
