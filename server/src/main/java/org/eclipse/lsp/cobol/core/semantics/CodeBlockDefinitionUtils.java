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

package org.eclipse.lsp.cobol.core.semantics;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.CodeBlockDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;

import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.model.tree.Node.hasType;

/** The utilities for defining the {@link CodeBlockDefinitionNode} */
@UtilityClass
public class CodeBlockDefinitionUtils {

  /**
   * Define the given code block in its parent program node
   *
   * @param node code block definition node
   * @return a list of syntax errors if found
   */
  public List<SyntaxError> defineCodeBlock(Node node) {
    return node.getChildren().stream()
        .filter(hasType(NodeType.PARAGRAPH).or(hasType(NodeType.PROCEDURE_SECTION)))
        .map(CodeBlockDefinitionNode.class::cast)
        .map(CodeBlockDefinitionUtils::register)
        .filter(Objects::nonNull)
        .collect(toList());
  }

  private SyntaxError register(CodeBlockDefinitionNode node) {
    return node.getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .map(parent -> parent.registerCodeBlock(node))
        .orElse(null);
  }
}
