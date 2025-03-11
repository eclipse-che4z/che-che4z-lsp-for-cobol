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
package org.eclipse.lsp.cobol.common.symbols;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;

/** A container for symbol information */
@RequiredArgsConstructor
public class SymbolTable {
  @Getter
  private final List<CodeBlockDefinitionNode> codeBlockDefinitions = new ArrayList<>();
  @Getter
  private final Multimap<ProcedureId, CodeBlockReference> procedures = ArrayListMultimap.create();
  @Getter
  private final Multimap<String, VariableNode> variablesMap = ArrayListMultimap.create();
  @Getter
  private final Multimap<String, VariableNode> variablesGlobalsMap = ArrayListMultimap.create();
  @Getter
  private final SymbolTable parent;

  public Collection<VariableNode> getVariables() {
    List<VariableNode> result = new ArrayList<>();
    result.addAll(variablesGlobalsMap.values());
    result.addAll(variablesMap.values());
    return result;
  }

  public Collection<VariableNode> findVariables(String name) {
    Collection<VariableNode> result = new ArrayList<>();
    result.addAll(variablesGlobalsMap.get(name));
    result.addAll(variablesMap.get(name));
    return result;
  }

  public List<String> listSectionNames() {
    return procedures.keySet().stream()
            .map(ProcedureId::getSectionName)
            .distinct()
            .filter(Objects::nonNull)
            .collect(Collectors.toList());
  }

  public List<String> listParagraphNames() {
    return procedures.keySet().stream()
            .map(ProcedureId::getParagraphName)
            .distinct()
            .filter(Objects::nonNull)
            .collect(Collectors.toList());
  }

  public List<CodeBlockReference> resolveProcedures(String sectionName, String paragraphName) {
    ProcedureId procedureId = new ProcedureId(sectionName, paragraphName);
    if (procedures.containsKey(procedureId)) {
      return new ArrayList<>(procedures.get(procedureId));
    }
    return Collections.emptyList();
  }

  public List<CodeBlockReference> resolveProcedures(String name) {
    if (name == null) {
      return Collections.emptyList();
    }

    ArrayList<CodeBlockReference> result = new ArrayList<>();
    for (Map.Entry<ProcedureId, CodeBlockReference> v: procedures.entries()) {
      if (name.equals(v.getKey().getSectionName()) || name.equals(v.getKey().getParagraphName())) {
        result.add(v.getValue());
      }
    }
    return result;
  }

  /**
   * Generates unique key for the program
   * @param program node
   * @return string value of a generated key
   */
  public static String generateKey(ProgramNode program) {
    Range range = program.getLocality().getRange();
    String rangeString = "["
            + range.getStart().getLine() + ", " + range.getStart().getCharacter()
            + "-"
            + range.getEnd().getLine() + ", " + range.getEnd().getCharacter()
            + "]";
    return program.getProgramName() + "%" + program.getLocality().getUri() + "%" + rangeString;
  }

  public void register(VariableNode node) {
    Multimap<String, VariableNode> targetMap = isGlobal(node) ? variablesGlobalsMap : variablesMap;
    targetMap.put(node.getName().toUpperCase(Locale.ROOT), node);
  }

  public void register(ParagraphNameNode node) {
    String sectionName = node.getNearestParentByType(NodeType.PROCEDURE_SECTION)
            .map(ProcedureSectionNode.class::cast).map(CodeBlockDefinitionNode::getName)
            .orElse(null);
    CodeBlockReference codeBlockReference = new CodeBlockReference(sectionName, node.getName());
    codeBlockReference.addDefinition(node.getLocality().toLocation());
    this.procedures.put(new ProcedureId(sectionName, node.getName()), codeBlockReference);
  }
  public void register(SectionNameNode node) {
    CodeBlockReference codeBlockReference = new CodeBlockReference(node.getName(), null);
    codeBlockReference.addDefinition(node.getLocality().toLocation());
    this.procedures.put(new ProcedureId(node.getName(), null), codeBlockReference);
  }

  public void register(CodeBlockDefinitionNode node) {
    codeBlockDefinitions.add(node);
  }

  private static boolean isGlobal(VariableNode node) {
    if(node.isGlobal()) {
      return true;
    }
    Node parent = node.getParent();
    while (parent != null) {
      if(parent instanceof VariableNode && ((VariableNode) parent).isGlobal()) {
        return true;
      }
      parent = parent.getParent();
    }
    return false;
  }
}
