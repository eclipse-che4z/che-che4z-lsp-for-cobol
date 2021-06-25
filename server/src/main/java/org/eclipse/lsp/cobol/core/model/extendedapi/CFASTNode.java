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

import lombok.Data;

import java.util.List;

/**
 * Data transport object of CF AST. CFASTNode is root of CF ASF node hierarchy. It contains list of
 * possible children of CF AST node.
 */
@Data
public class CFASTNode {
  final String type;
  List<CFASTNode> children;

  public CFASTNode(String type) {
    this.type = type;
  }
}
