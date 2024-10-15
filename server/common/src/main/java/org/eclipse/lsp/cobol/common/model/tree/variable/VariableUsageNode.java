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
package org.eclipse.lsp.cobol.common.model.tree.variable;

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.DefinedAndUsedStructure;
import org.eclipse.lsp.cobol.common.model.Describable;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * The class represents variable usage in COBOL program.
 */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class VariableUsageNode extends Node implements DefinedAndUsedStructure, Describable {
  private final String name;
  @EqualsAndHashCode.Exclude @ToString.Exclude private final List<VariableNode> definitions = new ArrayList<>();
  private final boolean isDefinitionMandatory;

  public VariableUsageNode(
      String dataName,
      Locality locality) {
    super(locality, NodeType.VARIABLE_USAGE);
    this.name = dataName;
    this.isDefinitionMandatory = true;
  }

  public VariableUsageNode(
          String dataName,
          Locality locality,
          boolean isDefinitionMandatory) {
    super(locality, NodeType.VARIABLE_USAGE);
    this.name = dataName;
    this.isDefinitionMandatory = isDefinitionMandatory;
  }

  @Override
  public List<Location> getDefinitions() {
    return definitions.stream().map(VariableNode::getLocality).map(Locality::toLocation).collect(Collectors.toList());
  }

  /**
   * Add a definition to the node.
   * @param definition the definition node
   */
  public void addDefinition(VariableNode definition) {
    definitions.add(definition);
  }

  private Optional<VariableNode> getDefinition() {
    if (definitions.isEmpty()) return Optional.empty();
    return Optional.of(definitions.get(0));
  }

  @Override
  public List<Location> getUsages() {
    return getDefinition()
        .map(VariableNode::getUsages)
        .orElseGet(ImmutableList::of);
  }

  @Override
  public String getFormattedDisplayString() {
    return getDefinition()
        .map(VariableNode::getFullVariableDescription)
        .orElse("");
  }
}
