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
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp4j.Range;

import java.util.*;

/** A container for symbol information */
@Getter
@RequiredArgsConstructor
public class SymbolTable {
  private final Map<ProcedureId, CodeBlockReference> procedures = new HashMap<>();
  private final Multimap<String, VariableNode> variablesMap = ArrayListMultimap.create();
  private final Multimap<String, VariableNode> variablesGlobalsMap = ArrayListMultimap.create();
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
