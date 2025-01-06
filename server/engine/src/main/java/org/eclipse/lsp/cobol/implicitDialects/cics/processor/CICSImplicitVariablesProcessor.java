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
package org.eclipse.lsp.cobol.implicitDialects.cics.processor;

import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.symbols.VariableAccumulator;
import org.eclipse.lsp.cobol.implicitDialects.cics.generator.CICSBulkImplicitVariablesGenerator;
import org.eclipse.lsp.cobol.implicitDialects.cics.generator.CICSSRImplicitVariablesGenerator;

/** Enrich symbolic table with predefined variables */
public class CICSImplicitVariablesProcessor implements Processor<SectionNode> {

  @Override
  public void accept(SectionNode sectionNode, ProcessingContext processingContext) {
    final SectionType st = sectionNode.getSectionType();
    final boolean lstor = st == SectionType.LINKAGE;
    final boolean wstor = st == SectionType.WORKING_STORAGE;
    if (!lstor && !wstor)
      return;

    final VariableAccumulator variableAccumulator = processingContext.getVariableAccumulator();
    final ProgramNode programNode = sectionNode
        .getProgram()
        .orElseThrow(() -> new RuntimeException("Program for section " + st + " not found"));

    if (lstor)
      registerVariable(variableAccumulator, programNode, CICSBulkImplicitVariablesGenerator.generate());
    if (wstor) {
      for (VariableNode vn : CICSSRImplicitVariablesGenerator.generate())
        registerVariable(variableAccumulator, programNode, vn);
    }
  }

  private void registerVariable(
      VariableAccumulator variableAccumulator, ProgramNode programNode, VariableNode variable) {
    variableAccumulator.addVariableDefinition(programNode, variable);
    variable.getChildren().stream()
        .map(VariableNode.class::cast)
        .forEach(c -> variableAccumulator.addVariableDefinition(programNode, c));
  }
}
