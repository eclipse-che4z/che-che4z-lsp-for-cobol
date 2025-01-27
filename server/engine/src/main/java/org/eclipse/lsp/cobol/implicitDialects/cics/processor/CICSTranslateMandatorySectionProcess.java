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

import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.model.tree.DivisionNode;
import org.eclipse.lsp.cobol.common.model.variables.DivisionType;
import org.eclipse.lsp4j.Range;

import java.util.Optional;

/**
 * Checks for the mandatory Data Division (Working storage Section and Linkage section) in a program
 * for CICS translation. If not found creates the necessary code.
 */
public class CICSTranslateMandatorySectionProcess implements Processor<ProgramNode> {

  @Override
  public void accept(ProgramNode programNode, ProcessingContext processingContext) {
      if (isSectionMissing(programNode, SectionType.LINKAGE)) {
        addSectionNode(
                getDataDivisionTypeNode(programNode).orElseGet(() -> createVirtualDivisionNode(programNode)),
                SectionType.LINKAGE);
      }
      if (isSectionMissing(programNode, SectionType.WORKING_STORAGE)) {
        addSectionNode(
                getDataDivisionTypeNode(programNode).orElseGet(() -> createVirtualDivisionNode(programNode)),
                SectionType.WORKING_STORAGE);
      }
  }

  private void addSectionNode(DivisionNode divisionNode, SectionType type) {
    divisionNode.addChild(new SectionNode(divisionNode.getLocality(), type));
  }

  private Optional<DivisionNode> getDataDivisionTypeNode(ProgramNode programNode) {
    return Optional.ofNullable(
            programNode.findFirstNodeInSubtree(n -> n instanceof DivisionNode
                    && ((DivisionNode) n).getDivisionType() == DivisionType.DATA_DIVISION))
            .map(DivisionNode.class::cast);
  }

  private boolean isSectionMissing(ProgramNode programNode, SectionType sectionType) {
    return null == programNode.findFirstNodeInSubtree(
            n -> n instanceof SectionNode && ((SectionNode) n).getSectionType() == sectionType);
  }


  private static DivisionNode createVirtualDivisionNode(ProgramNode programNode) {
    Locality locality = Locality.builder()
            .uri(programNode.getLocality().getUri())
            // Empty range for virtual node
            .range(new Range(
                    programNode.getLocality().getRange().getStart(),
                    programNode.getLocality().getRange().getStart()
            ))
            .build();
    DivisionNode divisionNode = new DivisionNode(locality, DivisionType.DATA_DIVISION);
    divisionNode.setParent(programNode);
    programNode.getChildren().add(0, divisionNode);
    return divisionNode;
  }

}
