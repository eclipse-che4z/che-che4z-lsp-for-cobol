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

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.VariableUsageUtils;
import org.eclipse.lsp.cobol.core.model.tree.variables.MnemonicNameNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableUsageNode;
import org.eclipse.lsp.cobol.core.semantics.PredefinedVariables;
import org.eclipse.lsp4j.Location;

import java.util.*;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.PROGRAM;
import static org.eclipse.lsp.cobol.core.semantics.PredefinedVariables.PREDEFINED;
import static org.eclipse.lsp.cobol.service.copybooks.PredefinedCopybooks.PREF_IMPLICIT;

/** This class represents program context in COBOL. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
@Slf4j
public class ProgramNode extends Node {
  private final Multimap<String, VariableNode> variables = ArrayListMultimap.create();
  private final List<CodeBlockDefinitionNode> codeBlocks = new ArrayList<>();
  private final Map<String, CodeBlockReference> paragraphMap = new HashMap<>();
  private final Map<String, CodeBlockReference> sectionMap = new HashMap<>();

  private String programName;

  public ProgramNode(Locality locality) {
    super(locality, PROGRAM);
    addPredefinedVariables();
  }

  public String getProgramName() {
    return programName;
  }

  public void setProgramName(String programName) {
    this.programName = programName;
  }

  /**
   * Add the variable definition to that program context.
   *
   * @param node the variable definition node
   */
  public void addVariableDefinition(VariableNode node) {
    variables.put(node.getName(), node);
  }

  /**
   * Get variable definition node based on list of variable usage nodes.
   *
   * @param usageNodes represents variable name and its parents
   * @return the list of founded variable definitions
   */
  public List<VariableNode> getVariableDefinition(List<VariableUsageNode> usageNodes) {
    List<VariableNode> foundDefinitions =
        VariableUsageUtils.findVariablesForUsage(variables, usageNodes);
    if (foundDefinitions.isEmpty()) {
      Multimap<String, VariableNode> globals = ArrayListMultimap.create();
      getMapOfGlobalVariables()
          .values()
          .forEach(variableNode -> globals.put(variableNode.getName(), variableNode));
      foundDefinitions = VariableUsageUtils.findVariablesForUsage(globals, usageNodes);
    }
    return foundDefinitions;
  }

  /**
   * Add a paragraph defined in the program context.
   *
   * @param node - the paragraph node
   * @return syntax error if the code block duplicates
   */
  public Optional<SyntaxError> registerCodeBlock(CodeBlockDefinitionNode node) {
    codeBlocks.add(node);
    // TODO: add uniqueness check for paragraphs
    return Optional.empty();
  }

  /**
   * Add the usage of a code block defined in this program. Returns an optional syntax error if the
   * paragraph is not defined.
   *
   * @param node the usage node to register
   * @return Optional error if the paragraph or section with the given name is not defined
   */
  public Optional<SyntaxError> registerCodeBlockUsage(CodeBlockUsageNode node) {
    final Optional<CodeBlockDefinitionNode> definition =
        codeBlocks.stream().filter(it -> it.getName().equals(node.getName())).findAny();
    definition.ifPresent(it -> it.addUsage(node.getLocality()));

    Optional.ofNullable(paragraphMap.get(node.getName()))
        .ifPresent(it -> it.addUsage(node.getLocality().toLocation()));
    Optional.ofNullable(sectionMap.get(node.getName()))
        .ifPresent(it -> it.addUsage(node.getLocality().toLocation()));

    return definition.isPresent()
        ? Optional.empty()
        : Optional.of(
            SyntaxError.syntaxError()
                .messageTemplate(
                    MessageTemplate.of("semantics.paragraphNotDefined", node.getName()))
                .severity(ErrorSeverity.ERROR)
                .locality(node.getLocality())
                .build());
  }

  private Map<String, VariableNode> getMapOfGlobalVariables() {
    Map<String, VariableNode> result =
        getNearestParentByType(PROGRAM)
            .map(ProgramNode.class::cast)
            .map(ProgramNode::getMapOfGlobalVariables)
            .orElseGet(HashMap::new);
    variables.values().stream()
        .filter(VariableNode::isGlobal)
        .forEach(variableNode -> result.put(variableNode.getName(), variableNode));
    return result;
  }

  private void addPredefinedVariables() {
    Locality location = Locality.builder().uri(PREF_IMPLICIT + PREDEFINED).build();
    for (String predefinedVariableName : PredefinedVariables.getPredefinedVariablesNames())
      addVariableDefinition(new MnemonicNameNode(location, PREDEFINED, predefinedVariableName));
  }
  /**
   * Add a paragraph definition name node in the program context.
   *
   * @param node - the section definition node
   * @return syntax error if the code block duplicates
   */
  public Optional<SyntaxError> registerParagraphNameNode(ParagraphNameNode node) {
    updateMap(paragraphMap, node.getName(), node.locality.toLocation());
    return Optional.empty();
  }
  /**
   * Add a section definition name node in the program context.
   *
   * @param node - the section definition node
   * @return syntax error if the code block duplicates
   */
  public Optional<SyntaxError> registerSectionNameNode(SectionNameNode node) {
    updateMap(sectionMap, node.getName(), node.locality.toLocation());
    return Optional.empty();
  }

  private void updateMap(Map<String, CodeBlockReference> map, String name, Location location) {
    map.putIfAbsent(name, new CodeBlockReference());
    CodeBlockReference references = map.get(name);
    // TODO: add uniqueness check for section definition
    references.addDefinition(location);
  }
}
