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
package org.eclipse.lsp.cobol.core.engine.processors.implicit;

import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.EmbeddedLanguage;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.symbols.VariableAccumulator;

import java.util.List;

/**
 * Enrich symbolic table with predefined variables
 */
@AllArgsConstructor
public class ImplicitVariablesProcessor implements Processor<SectionNode> {

  private final AnalysisConfig config;

  @Override
  public void accept(SectionNode sectionNode, ProcessingContext processingContext) {
    if (sectionNode.getSectionType() == SectionType.LINKAGE) {
      VariableAccumulator variableAccumulator = processingContext.getVariableAccumulator();
      ProgramNode programNode = sectionNode.getProgram()
              .orElseThrow(() -> new RuntimeException("Program for section " + sectionNode.getSectionType() + " not found"));
      if (config.isCicsTranslatorEnabled()) {
        registerVariable(
                variableAccumulator, programNode, BlkImplicitVariablesGenerator.generate());
      }
    }

    if (sectionNode.getSectionType() == SectionType.WORKING_STORAGE) {
      VariableAccumulator variableAccumulator = processingContext.getVariableAccumulator();
      ProgramNode programNode = sectionNode.getProgram()
              .orElseThrow(() -> new RuntimeException("Program for section " + sectionNode.getSectionType() + " not found"));
      registerVariables(variableAccumulator, programNode, SRImplicitVariablesGenerator.generate());
      if (config.isCicsTranslatorEnabled()) {
        registerVariables(variableAccumulator, programNode, SRImplicitVariablesGenerator.generateCicsRegisters());
      }

      if (config.getFeatures().contains(EmbeddedLanguage.SQL)
              && config.getCopybookConfig().getSqlBackend().equals(SQLBackend.DB2_SERVER)
              && !hasSqlCa(programNode)) {
        registerVariables(variableAccumulator, programNode, Db2ImplicitVariablesGenerator.generate());
      }
    }
  }

  private static boolean hasSqlCa(ProgramNode programNode) {
    return programNode.getDepthFirstStream().anyMatch(node ->
            node.getNodeType().equals(NodeType.VARIABLE)
                    && ((VariableNode) node).getName().equalsIgnoreCase("SQLCA")
                    && (node instanceof VariableWithLevelNode)
                    && ((VariableWithLevelNode) node).getLevel() == 1);
  }

  private void registerVariables(VariableAccumulator variableAccumulator, ProgramNode programNode, List<VariableNode> nodes) {
    nodes.forEach(n -> registerVariable(variableAccumulator, programNode, n));
  }

  private void registerVariable(VariableAccumulator variableAccumulator, ProgramNode programNode, VariableNode variable) {
    variableAccumulator.addVariableDefinition(programNode, variable);
    variable.getChildren()
            .stream()
            .map(VariableNode.class::cast)
            .forEach(c -> variableAccumulator.addVariableDefinition(programNode, c));
  }
}
