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

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.FileOperationKind;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;

/** Open Statement node */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class OpenStatementNode extends FileOperationStatementNode {
  private FileOperationKind fileOperationKind;

  public OpenStatementNode(
          Locality locality, VariableNameAndLocality filename, FileOperationKind fileOperationKind) {
    super(locality, filename, NodeType.OPEN_STATEMENT);
    this.fileOperationKind = fileOperationKind;
  }
}
