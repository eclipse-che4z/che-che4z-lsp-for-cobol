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
package org.eclipse.lsp.cobol.dialects.daco.processors.implicit;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;

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

//      "        01   %s       PIC S9(8)  VALUE ZERO COMP.\n",
//      "        01   %s       PIC X      VALUE LOW-VALUE.\n",
//      "        01   %s       PIC S9(8)  VALUE 300  COMP.\n",
//      "        01   %s       PIC S9(4)  VALUE ZERO COMP.\n",
//      "        01   %s       PIC S9(8)  VALUE ZERO  COMP.\n"

  @UtilityClass
  private static class VariableFactory {
    public VariableNode create(int index, String name) {
      switch (index) {
        case 1:
          return GeneratorHelper.createElementaryNode(1, name, "X", "LOW-VALUE", UsageFormat.UNDEFINED);
        case 2:
          return GeneratorHelper.createElementaryNode(1, name, "S9(8)", "300", UsageFormat.COMP);
        case 3:
          return GeneratorHelper.createElementaryNode(1, name, "S9(4)", "ZERO", UsageFormat.COMP);
        default:
          return GeneratorHelper.createElementaryNode(1, name, "S9(8)", "ZERO", UsageFormat.COMP);
      }
    }
  }


  /**
   * Generates code for WORKING STORAGE SECTION
   * @param programNode is a program node
   * @return a generated code pair where the key is a name and a value is a code
   */
  public List<VariableNode> generate(ProgramNode programNode) {
    List<VariableNameInfo> result = new LinkedList<>(TreeScanner.scan(programNode));

    Set<String> defined = getAlreadyDefinedVariables(programNode);
    return result.stream().distinct()
        .flatMap(info -> WorkingSectionDynamicGenerator.generateTableVariables(info, defined).stream())
        .collect(Collectors.toList());
  }

  private Set<String> getAlreadyDefinedVariables(ProgramNode programNode) {
    return programNode.getDepthFirstStream()
        .filter(v -> v.getNodeType() == NodeType.VARIABLE_DEFINITION_NAME)
        .map(VariableDefinitionNameNode.class::cast)
        .map(VariableDefinitionNameNode::getName)
        .collect(Collectors.toSet());
  }

  private List<VariableNode> generateTableVariables(VariableNameInfo tableInfo, Set<String> alreadyDefined) {
    List<VariableNode> result = new LinkedList<>();
    for (int i = 0; i < NAMES_TEMPLATES.length; i++) {
      String name = applyTemplate(NAMES_TEMPLATES[i], tableInfo);
      if (!alreadyDefined.contains(name)) {
        result.add(VariableFactory.create(i, name));
      }
    }
    return result;
  }

  private String applyTemplate(String nameTemplate, VariableNameInfo tableInfo) {
    String name = nameTemplate.replace("{mmm}", tableInfo.getName());
    return  name.replace("{ii}", tableInfo.getSuffix());
  }
}
