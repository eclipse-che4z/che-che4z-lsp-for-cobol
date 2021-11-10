/*
 * Copyright (c) 2020 Broadcom.
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
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.service.utils.SyntaxTreeUtil;

import java.util.List;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.ROOT;

/** The class represents the root. All trees must start with one root node. */
@ToString(callSuper = true)
@Getter
public class RootNode extends Node {
  public RootNode(Locality locality) {
    super(locality, ROOT);
    addProcessStep(this::waitForVariableStructure);
  }

  private List<SyntaxError> waitForVariableStructure() {
    addProcessStep(this::updateVariableStructure);
    return ImmutableList.of();
  }

  private List<SyntaxError> updateVariableStructure() {
    List<Node> node =
        this.getChildren().stream().filter(hasType(NodeType.COPY)).collect(Collectors.toList());
    node.forEach(it -> removeChild(it));
    node.forEach(
        it ->
            SyntaxTreeUtil.findNodeInRange(this, it.getLocality().getRange().getStart())
                .orElse(this)
                .addChild(it));

    return ImmutableList.of();
  }
}
