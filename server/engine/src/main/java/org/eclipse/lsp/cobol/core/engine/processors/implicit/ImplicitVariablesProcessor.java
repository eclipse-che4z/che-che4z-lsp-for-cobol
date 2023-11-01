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

import java.util.List;
import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.symbols.VariableAccumulator;

/**
 * Enrich symbolic table with predefined variables
 */
@AllArgsConstructor
public class ImplicitVariablesProcessor implements Processor<SectionNode> {

  @Override
  public void accept(SectionNode sectionNode, ProcessingContext processingContext) {
    if (sectionNode.getSectionType() == SectionType.WORKING_STORAGE) {
      VariableAccumulator variableAccumulator = processingContext.getVariableAccumulator();
      ProgramNode programNode = sectionNode.getProgram()
              .orElseThrow(() -> new RuntimeException("Program for section " + sectionNode.getSectionType() + " not found"));
      registerVariables(variableAccumulator, programNode, SRImplicitVariablesGenerator.generate());
    }
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
