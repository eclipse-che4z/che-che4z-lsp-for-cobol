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

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;

import java.util.List;
import java.util.Optional;

/** The class represents usages of paragraphs or sections. */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class CodeBlockUsageNode extends Node {
  String name;
  private NodeState nodeState = NodeState.NEW;

  public CodeBlockUsageNode(Locality location, String name) {
    super(location, NodeType.CODE_BLOCK_USAGE, false);
    this.name = name;
  }

  @Override
  protected List<SyntaxError> processNode() {
    switch (nodeState) {
      case NEW:
        nodeState = NodeState.WAIT_FOR_BLOCKS;
        break;
      case WAIT_FOR_BLOCKS:
        nodeState = NodeState.DONE;
        setNodeProcessed();
        return registerNode();
      case DONE:
      default:
        break;
    }
    return ImmutableList.of();
  }

  private List<SyntaxError> registerNode() {
    return getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .map(program -> program.registerCodeBlockUsage(this))
        .filter(Optional::isPresent)
        .map(Optional::get)
        .map(ImmutableList::of)
        .orElse(ImmutableList.of());
  }

  private enum NodeState {
    NEW, WAIT_FOR_BLOCKS, DONE;
  }
}
