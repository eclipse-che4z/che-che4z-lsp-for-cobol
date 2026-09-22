/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.engine.processors;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.DialectVariableNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;
import org.junit.jupiter.api.Test;

/** Tests registration of variable definitions supplied by a dialect. */
class DialectVariableNodeProcessorTest {
  @Test
  void registersAStandaloneDialectVariable() {
    SymbolAccumulator symbolAccumulator = mock(SymbolAccumulator.class);
    ProcessingContext context = mock(ProcessingContext.class);
    ProgramNode program = mock(ProgramNode.class);
    DialectVariableNode variable = variable();
    when(context.getCurrentProgramNode()).thenReturn(program);

    new DialectVariableNodeProcessor(symbolAccumulator).accept(variable, context);

    verify(symbolAccumulator).addVariableDefinition(program, variable);
  }

  @Test
  void letsTheSectionProcessorRegisterVariablesInsideASection() {
    SymbolAccumulator symbolAccumulator = mock(SymbolAccumulator.class);
    ProcessingContext context = mock(ProcessingContext.class);
    DialectVariableNode variable = variable();
    new SectionNode(Locality.builder().build(), SectionType.MAP).addChild(variable);
    when(context.getCurrentProgramNode()).thenReturn(mock(ProgramNode.class));

    new DialectVariableNodeProcessor(symbolAccumulator).accept(variable, context);

    verifyNoInteractions(symbolAccumulator);
  }

  private static DialectVariableNode variable() {
    return new DialectVariableNode(Locality.builder().build(), "ABCDE", "MAP ABCDE.");
  }
}
