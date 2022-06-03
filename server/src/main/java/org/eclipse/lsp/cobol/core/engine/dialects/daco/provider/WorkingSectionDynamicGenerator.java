/*
 * Copyright (c) 2022 DAF Trucks NV.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * DAF Trucks NV – implementation of DaCo COBOL statements
 * and DAF development standards
 */
package org.eclipse.lsp.cobol.core.engine.dialects.daco.provider;

import lombok.Value;
import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNameAndLocality;

import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * Generates code for WORKING STORAGE SECTION depends on COBOL listing
 */
@UtilityClass
class WorkingSectionDynamicGenerator {

  private static final String TEMPLATE = "        01  RCU{mmm}-B{ii}       PIC S9(8)  VALUE ZERO COMP.\n"
      + "        01   TBO{mmm}-X{ii}       PIC X      VALUE LOW-VALUE.\n"
      + "        01   RMX{mmm}-B{ii}       PIC S9(8)  VALUE 300  COMP.\n"
      + "        01   RMP{mmm}-B{ii}       PIC S9(4)  VALUE ZERO COMP.\n"
      + "        01   RUS{mmm}-B{ii}       PIC S9(8)  VALUE ZERO  COMP.\n";

  @Value
  private static class VariableNameInfo {
    String name;
    String suffix;
  }

  /**
   * Generates code for WORKING STORAGE SECTION
   * @param nodes is generated nodes with DaCo dialect processor
   * @return a generated code pair where the key is a name and a value is a code
   */
  public Optional<Pair<String, String>> generate(List<Node> nodes) {
    List<Node> list = new LinkedList<>(nodes);
    nodes.forEach(n -> list.addAll(n.getDepthFirstStream().collect(Collectors.toList())));

    return list.stream()
        .filter(n -> n.getNodeType() == NodeType.VARIABLE_DEFINITION)
        .map(VariableDefinitionNode.class::cast)
        .map(VariableDefinitionNode::getVariableName)
        .filter(Objects::nonNull)
        .map(VariableNameAndLocality::getName)
        .map(WorkingSectionDynamicGenerator::getVariableNameInfo)
        .filter(Objects::nonNull)
        .findFirst()
        .map(WorkingSectionDynamicGenerator::generateTableVariables);
  }

  private VariableNameInfo getVariableNameInfo(String name) {
    VariableNameInfo result = null;
    if (name.length() == 10 && (name.startsWith("TBF") || name.startsWith("TBL")) && name.indexOf("-X") == 6) {
      result = new VariableNameInfo(name.substring(3, 6), name.substring(8));
    }
    return result;
  }

  private Pair<String, String> generateTableVariables(VariableNameInfo tableInfo) {
    String code = TEMPLATE.replace("{mmm}", tableInfo.getName());
    code =  code.replace("{ii}", tableInfo.getSuffix());
    return new ImmutablePair<>("DaCo-TBX", code);
  }
}
