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
package org.eclipse.lsp.cobol.common.model.tree;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.ProcedureName;

/** The class represents perform in COBOL. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class PerformNode extends Node {
  ProcedureName target;
  ProcedureName thru;

  public PerformNode(Locality location) {
    super(location, NodeType.PERFORM);
    this.target = null;
    this.thru = null;
  }

  public PerformNode(Locality location, ProcedureName target, ProcedureName thru) {
    super(location, NodeType.PERFORM);
    this.target = target;
    this.thru = thru;
  }

  public boolean isInline() {
    return target == null;
  }
}
