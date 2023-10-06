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
package org.eclipse.lsp.cobol.implicitDialects.cics.processor;

import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.model.tree.DivisionNode;
import org.eclipse.lsp.cobol.common.model.variables.DivisionType;

import java.util.Optional;

/**
 * Checks for the mandatory Data Division (Working storage Section and Linkage section) in a program
 * for CICS translation. If not found creates the necessary code.
 */
public class CICSTranslateMandatorySectionProcess implements Processor<ProgramNode> {

  @Override
  public void accept(ProgramNode programNode, ProcessingContext processingContext) {
      if (!sectionExists(programNode, SectionType.LINKAGE)) {
        insertLinkageSection(programNode);
      }

      if (!sectionExists(programNode, SectionType.WORKING_STORAGE)) {
        insertWorkingStorageSection(programNode);
      }
  }

  private void insertLinkageSection(ProgramNode programNode) {
    Optional<DivisionNode> dataDivisionNode = getDataDivisionTypeNode(programNode);
    if (dataDivisionNode.isPresent()) {
      addLinkageNode(dataDivisionNode.get());
    } else {
      DivisionNode divisionNode =
          new DivisionNode(programNode.getLocality(), DivisionType.DATA_DIVISION);
      addLinkageNode(divisionNode);
      programNode.addChild(divisionNode);
    }
  }

  private void addLinkageNode(DivisionNode divisionNode) {
    divisionNode.addChild(new SectionNode(divisionNode.getLocality(), SectionType.LINKAGE));
  }

  private void addWorkingStorageNode(DivisionNode divisionNode) {
    divisionNode.addChild(new SectionNode(divisionNode.getLocality(), SectionType.WORKING_STORAGE));
  }

  private Optional<DivisionNode> getDataDivisionTypeNode(ProgramNode programNode) {
    return programNode
        .getDepthFirstStream()
        .filter(DivisionNode.class::isInstance)
        .map(DivisionNode.class::cast)
        .filter(node -> node.getDivisionType() == DivisionType.DATA_DIVISION)
        .findAny();
  }

  private void insertWorkingStorageSection(ProgramNode programNode) {
    Optional<DivisionNode> dataDivisionNode = getDataDivisionTypeNode(programNode);
    if (dataDivisionNode.isPresent()) {
      addWorkingStorageNode(dataDivisionNode.get());
    } else {
      DivisionNode divisionNode =
          new DivisionNode(programNode.getLocality(), DivisionType.DATA_DIVISION);
      addWorkingStorageNode(divisionNode);
      programNode.addChild(divisionNode);
    }
  }

  private boolean sectionExists(ProgramNode programNode, SectionType sectionType) {
    return programNode
        .getDepthFirstStream()
        .filter(SectionNode.class::isInstance)
        .map(SectionNode.class::cast)
        .anyMatch(node -> node.getSectionType() == sectionType);
  }
}
