/*
 * Copyright (c) 2024 Broadcom.
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

/**
 * Represents USE FOR DEBUGGING statement
 */
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Getter
public class UseForDebuggingNode extends Node {

  private final ProcedureName target;
  public UseForDebuggingNode(Locality location, ProcedureName target) {
    super(location, NodeType.STATEMENT);
    this.target = target;
  }
}
