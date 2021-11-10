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
package org.eclipse.lsp.cobol.core.model.tree.variables;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.semantics.outline.RangeUtils;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.SEVERITY;

/** The abstract class for all variable definitions. */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public abstract class VariableNode extends Node {
  public static final String PREFIX = "  ";
  private final VariableType variableType;
  private final String name;
  @Setter private boolean global;
  @EqualsAndHashCode.Exclude private final List<VariableUsageNode> usages = new ArrayList<>();

  protected VariableNode(
      Locality location, String name, VariableType variableType, boolean global) {
    super(location, NodeType.VARIABLE);
    this.name = name;
    this.variableType = variableType;
    this.global = global;
  }

  /**
   * Return true if this variable redefines another variable.
   *
   * @return true if this variable redefines another variable.
   */
  public boolean isRedefines() {
    return false;
  }

  /**
   * Construct an error for that Variable
   *
   * @param messageTemplate a message template for error
   * @return the error with the variable locality
   */
  public SyntaxError getError(MessageTemplate messageTemplate) {
    return getError(messageTemplate, SEVERITY);
  }

  /**
   * Construct an error for that Variable
   *
   * @param messageTemplate a message template for error
   * @param severity severity of the error
   * @return the error with the variable locality
   */
  public SyntaxError getError(MessageTemplate messageTemplate, ErrorSeverity severity) {
    return SyntaxError.syntaxError()
        .severity(severity)
        .locality(getLocalityForError())
        .messageTemplate(messageTemplate)
        .build();
  }

  /**
   * Add usage node to this variable definition.
   * The method also updates definition for the usage node.
   *
   * @param usageNode a variable usage node
   */
  public void addUsage(VariableUsageNode usageNode) {
    usages.add(usageNode);
    usageNode.setDefinition(this);
  }

  public List<Node> getDefinitions() {
    return getChildren().stream()
            .filter(hasType(NodeType.VARIABLE_DEFINITION_NAME))
            .collect(Collectors.toList());
  }

  private Locality getLocalityForError() {
    return getChildren().stream()
        .filter(hasType(NodeType.VARIABLE_DEFINITION_NAME))
        .findAny()
        .map(Node::getLocality)
        .orElseGet(this::getLocality);
  }

  /**
   * Change locality end position if the new end is bigger than current end.
   *
   * @param newEndPosition the new end position
   */
  public void extendLocality(Position newEndPosition) {
    if (RangeUtils.isBefore(locality.getRange().getEnd(), newEndPosition))
      locality = locality.toBuilder()
          .range(new Range(locality.getRange().getStart(), newEndPosition))
          .build();
  }

  protected abstract String getVariableDisplayString();

  /**
   * Get user friendly variable description.
   *
   * @return the string with described variable.
   */
  public String getFullVariableDescription() {
    StringBuilder prefix = new StringBuilder();
    List<String> lines = new ArrayList<>();
    for (String parentLine: parentsDescription()) {
      lines.add(prepend(prefix.toString(), parentLine));
      prefix.append(PREFIX);
    }
    lines.add(prepend(prefix.toString(), getVariableDisplayString()));
    prefix.append(PREFIX);
    lines.addAll(getChildrenDescription(prefix.toString()));
    return String.join("\n", lines);
  }

  private List<String> parentsDescription() {
    return getNearestParentByType(NodeType.VARIABLE)
        .map(VariableNode.class::cast)
        .map(variableNode -> {
          List<String> result = variableNode.parentsDescription();
          result.add(variableNode.getVariableDisplayString());
          return result;
        })
        .orElseGet(ArrayList::new);
  }

  protected List<String> getChildrenDescription(String prefix) {
    return getChildren().stream()
        .filter(hasType(NodeType.VARIABLE))
        .map(VariableNode.class::cast)
        .map(VariableNode::getDisplayStringWithConditionals)
        .map(description -> prepend(prefix, description))
        .collect(Collectors.toList());
  }

  private String getDisplayStringWithConditionals() {
    List<String> result = new ArrayList<>();
    result.add(getVariableDisplayString());
    getChildren().stream()
        .filter(hasType(NodeType.VARIABLE))
        .map(VariableNode.class::cast)
        .filter(variableNode -> variableNode.variableType == VariableType.CONDITION_DATA_NAME)
        .map(VariableNode::getVariableDisplayString)
        .map(displayString -> prepend(PREFIX, displayString))
        .forEach(result::add);
    return String.join("\n", result);
  }

  private static String prepend(String prefix, String text) {
    return prefix + text.replace("\n", "\n" + prefix);
  }
}
