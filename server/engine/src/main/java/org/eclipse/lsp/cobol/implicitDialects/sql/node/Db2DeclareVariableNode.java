/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.implicitDialects.sql.node;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.implicitDialects.sql.Db2SqlDialect;

/** Represents a DB2 code block representing a Db2 variable declaration. */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class Db2DeclareVariableNode extends Node {
  public Db2DeclareVariableNode(Locality location) {
    super(location, NodeType.CUSTOM, Db2SqlDialect.DIALECT_NAME);
  }
}
