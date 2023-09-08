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

package org.eclipse.lsp.cobol.common.model.tree;

import lombok.Getter;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.statements.StatementNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;

/**
 * File operation statement Nodes , namely READ_STATEMENT, WRITE_STATEMENT, I_O_STATEMENT, EXTEND
 */
public class FileOperationStatementNode extends StatementNode {
  @Getter private final VariableNameAndLocality filename;

  public FileOperationStatementNode(Locality locality, VariableNameAndLocality filename, NodeType nodeType) {
    super(locality, nodeType);
    this.filename = filename;
  }
}
