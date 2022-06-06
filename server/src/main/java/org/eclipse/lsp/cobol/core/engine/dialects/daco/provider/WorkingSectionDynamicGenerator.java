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

import java.util.LinkedList;
import java.util.List;
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

  /**
   * Generates code for WORKING STORAGE SECTION
   * @param input source code
   * @param nodes is generated nodes with DaCo dialect processor
   * @return a generated code pair where the key is a name and a value is a code
   */
  public List<Pair<String, String>> generate(String input, List<Node> nodes) {
    List<VariableNameInfo> result = new LinkedList<>(TreeScanner.scan(nodes));
    result.addAll(TextScanner.scan(input));

    return result.stream().distinct()
        .map(WorkingSectionDynamicGenerator::generateTableVariables)
        .collect(Collectors.toList());
  }

  private Pair<String, String> generateTableVariables(VariableNameInfo tableInfo) {
    String code = TEMPLATE.replace("{mmm}", tableInfo.getName());
    code =  code.replace("{ii}", tableInfo.getSuffix());
    return new ImmutablePair<>("DaCo-TBX", code);
  }
}
