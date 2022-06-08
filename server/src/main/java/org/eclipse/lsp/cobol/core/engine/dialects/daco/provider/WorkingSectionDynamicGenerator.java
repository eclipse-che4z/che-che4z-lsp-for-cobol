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
package org.eclipse.lsp.cobol.core.engine.dialects.daco.provider;

import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNameAndLocality;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Generates code for WORKING STORAGE SECTION depends on COBOL listing
 */
@UtilityClass
class WorkingSectionDynamicGenerator {

  private static final String[] NAMES_TEMPLATES = {
      "RCU{mmm}-B{ii}",
      "TBO{mmm}-X{ii}",
      "RMX{mmm}-B{ii}",
      "RMP{mmm}-B{ii}",
      "RUS{mmm}-B{ii}"
  };

  private static final String[] CODE_TEMPLATES = {
      "        01   %s       PIC S9(8)  VALUE ZERO COMP.\n",
      "        01   %s       PIC X      VALUE LOW-VALUE.\n",
      "        01   %s       PIC S9(8)  VALUE 300  COMP.\n",
      "        01   %s       PIC S9(4)  VALUE ZERO COMP.\n",
      "        01   %s       PIC S9(8)  VALUE ZERO  COMP.\n"
  };

  /**
   * Generates code for WORKING STORAGE SECTION
   * @param input source code
   * @param nodes is generated nodes with DaCo dialect processor
   * @return a generated code pair where the key is a name and a value is a code
   */
  public List<Pair<String, String>> generate(String input, List<Node> nodes) {
    List<VariableNameInfo> result = new LinkedList<>(TreeScanner.scan(nodes));
    result.addAll(TextScanner.scan(input));

    Set<String> defined = getAlreadyDefinedVariables(input, nodes);
    return result.stream().distinct()
        .map(info -> WorkingSectionDynamicGenerator.generateTableVariables(info, defined))
        .filter(Objects::nonNull)
        .collect(Collectors.toList());
  }

  private Set<String> getAlreadyDefinedVariables(String input, List<Node> nodes) {
    Set<String> alreadyDefined = new HashSet<>();
    nodes.forEach(n -> alreadyDefined.addAll(n.getDepthFirstStream()
        .filter(v -> v.getNodeType() == NodeType.VARIABLE_DEFINITION)
        .map(VariableDefinitionNode.class::cast)
        .map(VariableDefinitionNode::getVariableName)
        .filter(Objects::nonNull)
        .map(VariableNameAndLocality::getName)
        .collect(Collectors.toList())));

    alreadyDefined.addAll(DefinedVariablesScanner.scan(input));
    return alreadyDefined;
  }

  private Pair<String, String> generateTableVariables(VariableNameInfo tableInfo, Set<String> alreadyDefined) {
    StringBuilder codeBuilder = new StringBuilder();
    for (int i = 0; i < NAMES_TEMPLATES.length; i++) {
      String name = applyTemplate(NAMES_TEMPLATES[i], tableInfo);
      if (!alreadyDefined.contains(name)) {
        codeBuilder.append(String.format(CODE_TEMPLATES[i], name));
      }
    }
    String code = codeBuilder.toString();
    if (code.isEmpty()) {
      return null;
    }
    return new ImmutablePair<>("DaCo-TBX", code);
  }

  private String applyTemplate(String nameTemplate, VariableNameInfo tableInfo) {
    String name = nameTemplate.replace("{mmm}", tableInfo.getName());
    return  name.replace("{ii}", tableInfo.getSuffix());
  }
}
