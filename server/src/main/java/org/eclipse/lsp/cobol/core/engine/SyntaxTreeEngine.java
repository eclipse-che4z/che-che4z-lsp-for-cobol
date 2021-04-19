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
package org.eclipse.lsp.cobol.core.engine;

import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;

import java.util.List;
import java.util.stream.Collectors;

/**
 * This class is responsible for processing the syntax tree.
 */
public class SyntaxTreeEngine {
  private final Node rootNode;

  public SyntaxTreeEngine(Node rootNode) {
    this.rootNode = rootNode;
  }

  /**
   * Run the process under the syntax tree.
   *
   * @return the list of syntax errors.
   */
  public List<SyntaxError> processTree() {
    rootNode.getDepthFirstStream().forEach(Node::process);
    return rootNode.getDepthFirstStream()
        .map(Node::getErrors)
        .flatMap(List::stream)
        .collect(Collectors.toList());
  }
}
