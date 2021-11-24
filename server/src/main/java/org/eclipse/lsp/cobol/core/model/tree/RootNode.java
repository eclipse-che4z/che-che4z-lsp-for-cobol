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
import com.google.common.collect.Multimap;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.utils.SyntaxTreeUtil;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.ROOT;
import static org.eclipse.lsp.cobol.service.PredefinedCopybooks.IMPLICIT_PATH;
import static org.eclipse.lsp.cobol.service.PredefinedCopybooks.PREF_IMPLICIT;

/**
 * The class represents the root. All trees must start with one root node. This class also creates
 * definition nodes for copyNodes and adds its usages.
 */
@ToString(callSuper = true)
@Getter
public class RootNode extends Node {
  private final Map<String, CopyDefinition> copyDefinitionMap = new HashMap<>();
  public RootNode(Locality locality, NamedSubContext copybook) {
    super(locality, ROOT);
    addProcessStep(this::waitForVariableStructure);
    createCopyBookDefinitionNode(copybook.getDefinitions());
  }

  private void createCopyBookDefinitionNode(Multimap<String, Location> definition) {
    for (Map.Entry<String, Location> copybook : definition.entries()) {
      copyDefinitionMap.put(
          copybook.getKey(), new CopyDefinition(copybook.getValue(), copybook.getKey()));
    }
  }

  private List<SyntaxError> waitForVariableStructure() {
    addProcessStep(this::updateVariableStructure);
    return ImmutableList.of();
  }

  private List<SyntaxError> updateVariableStructure() {
    List<Node> nodes =
        this.getChildren().stream().filter(hasType(NodeType.COPY)).collect(Collectors.toList());
    nodes.forEach(this::removeChild);
    nodes.forEach(
        it ->
            SyntaxTreeUtil.findNodeInRange(this, it.getLocality().getRange().getStart())
                .orElse(this)
                .addChild(it));
    for (Node node : nodes) {
      registerCopyUsage((CopyNode) node);
    }
    return ImmutableList.of();
  }

  private void registerCopyUsage(CopyNode copyNode) {
    copyDefinitionMap.putIfAbsent(
        copyNode.getCopyBookName(),
        new CopyDefinition(
            new Location(PREF_IMPLICIT + IMPLICIT_PATH, new Range()), copyNode.getCopyBookName()));
    CopyDefinition foundDefinition = copyDefinitionMap.get(copyNode.getCopyBookName());
    foundDefinition.addUsages(copyNode);
    copyNode.setDefinition(foundDefinition);
  }
}
