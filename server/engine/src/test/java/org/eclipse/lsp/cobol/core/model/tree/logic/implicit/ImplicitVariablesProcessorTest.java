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
package org.eclipse.lsp.cobol.core.model.tree.logic.implicit;

import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.symbols.VariableAccumulator;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.mockito.Mockito.*;

/**
 * Test for ImplicitVariablesProcessor
 */
class ImplicitVariablesProcessorTest {

  private ProcessingContext processingContext;
  private VariableAccumulator variableAccumulator;
  ImplicitVariablesProcessor processor;

  @BeforeEach
  void init() {
    processingContext = mock(ProcessingContext.class);
    variableAccumulator = mock(VariableAccumulator.class);

    when(processingContext.getVariableAccumulator()).thenReturn(variableAccumulator);
    processor = new ImplicitVariablesProcessor();
  }

  @Test
  void testLinkageSection() {
    SectionNode sectionNode = new SectionNode(Locality.builder().build(), SectionType.LINKAGE);
    sectionNode.setParent(new ProgramNode(Locality.builder().build()));

    processor.accept(sectionNode, processingContext);
    verify(variableAccumulator, times(33)).addVariableDefinition(any(), any());
  }

  @Test
  void testWorkingSection() {
    SectionNode sectionNode = new SectionNode(Locality.builder().build(), SectionType.WORKING_STORAGE);
    sectionNode.setParent(new ProgramNode(Locality.builder().build()));

    processor.accept(sectionNode, processingContext);
    verify(variableAccumulator, times(41)).addVariableDefinition(any(), any());
  }

}
