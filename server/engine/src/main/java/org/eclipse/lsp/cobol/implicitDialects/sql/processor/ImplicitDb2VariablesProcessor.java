/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.implicitDialects.sql.processor;

import java.util.List;
import java.util.Objects;

import com.google.gson.JsonElement;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.symbols.VariableAccumulator;
import org.eclipse.lsp.cobol.implicitDialects.sql.generator.Db2ImplicitVariablesGenerator;

import static org.eclipse.lsp.cobol.implicitDialects.sql.Db2SqlDialect.SQL_BACKEND_SETTING;

/** Enrich symbolic table with DB2 predefined variables based on the configured SQL backend */
public class ImplicitDb2VariablesProcessor implements Processor<SectionNode> {

  @Override
  public void accept(SectionNode sectionNode, ProcessingContext processingContext) {
    if (sectionNode.getSectionType() == SectionType.WORKING_STORAGE) {
      VariableAccumulator variableAccumulator = processingContext.getVariableAccumulator();
      ProgramNode programNode =
          sectionNode
              .getProgram()
              .orElseThrow(
                  () ->
                      new RuntimeException(
                          "Program for section " + sectionNode.getSectionType() + " not found"));
      if (getSqlBackendConfig(processingContext).equalsIgnoreCase(SQLBackend.DB2_SERVER.toString()) && !hasSqlCa(programNode)) {
        registerVariables(
            variableAccumulator, programNode, Db2ImplicitVariablesGenerator.generateDb2Nodes());
      }
      if (getSqlBackendConfig(processingContext).equalsIgnoreCase(SQLBackend.DATACOM_SERVER.toString()) && !hasSqlCa(programNode)) {
        registerVariables(
            variableAccumulator, programNode, Db2ImplicitVariablesGenerator.generateDatacomNodes());
      }
    }
  }

  private static String getSqlBackendConfig(ProcessingContext processingContext) {
    JsonElement jsonElement = processingContext.getDialectsConfig().get(SQL_BACKEND_SETTING);
    if (Objects.isNull(jsonElement)) return SQLBackend.DB2_SERVER.toString();
    return jsonElement.getAsString();
  }

  private static boolean hasSqlCa(ProgramNode programNode) {
    return programNode
        .getDepthFirstStream()
        .anyMatch(
            node ->
                node.getNodeType().equals(NodeType.VARIABLE)
                    && ((VariableNode) node).getName().equalsIgnoreCase("SQLCA")
                    && (node instanceof VariableWithLevelNode)
                    && ((VariableWithLevelNode) node).getLevel() == 1);
  }

  private void registerVariables(
      VariableAccumulator variableAccumulator, ProgramNode programNode, List<VariableNode> nodes) {
    nodes.forEach(n -> registerVariable(variableAccumulator, programNode, n));
  }

  private void registerVariable(
      VariableAccumulator variableAccumulator, ProgramNode programNode, VariableNode variable) {
    variableAccumulator.addVariableDefinition(programNode, variable);
    variable.getChildren().stream()
        .map(VariableNode.class::cast)
        .forEach(c -> variableAccumulator.addVariableDefinition(programNode, c));
  }
}
