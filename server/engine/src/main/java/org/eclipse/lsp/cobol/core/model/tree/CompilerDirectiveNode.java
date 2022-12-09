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
package org.eclipse.lsp.cobol.core.model.tree;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.CobolParser;

/** Node describing compiler directive in a cobol document. */
@Slf4j
public class CompilerDirectiveNode extends Node {
  @Getter private final CobolParser.CompilerOptionsContext directiveContext;

  public CompilerDirectiveNode(
      Locality location, CobolParser.CompilerOptionsContext directiveContext) {
    super(location, NodeType.COMPILER_DIRECTIVE);
    this.directiveContext = directiveContext;
  }
}
