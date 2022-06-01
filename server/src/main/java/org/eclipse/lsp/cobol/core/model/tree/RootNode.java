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
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.RangeUtils;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.model.tree.NodeType.ROOT;

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
    addProcessStep(this::updateCopyNodesByPositionInTree);
    return ImmutableList.of();
  }

  private List<SyntaxError> updateCopyNodesByPositionInTree() {
    List<Node> nodes = getChildren().stream().filter(hasType(NodeType.COPY)).collect(toList());
    nodes.forEach(this::removeChild);
    nodes.forEach(
        it ->
            RangeUtils.findNodeByPosition(
                    this, it.getLocality().getUri(), it.getLocality().getRange().getStart())
                .orElse(this)
                .addChild(it));

    getDepthFirstStream().filter(hasType(NodeType.COPY)).map(CopyNode.class::cast).forEach(this::registerCopyUsage);
    return ImmutableList.of();
  }

  private void registerCopyUsage(CopyNode copyNode) {
    copyDefinitionMap.putIfAbsent(
        copyNode.getName(),
        new CopyDefinition(
            new Location(ImplicitCodeUtils.createLocation(), new Range()), copyNode.getName()));
    CopyDefinition foundDefinition = copyDefinitionMap.get(copyNode.getName());
    foundDefinition.addUsages(copyNode);
    copyNode.setDefinition(foundDefinition);
  }
}
