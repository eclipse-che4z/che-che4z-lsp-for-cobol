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

import static org.eclipse.lsp.cobol.common.processor.ProcessingPhase.TRANSFORMATION;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoMoreInteractions;

import com.google.common.collect.ImmutableMap;
import java.util.ArrayList;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramSubtype;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableType;
import org.eclipse.lsp.cobol.common.model.tree.variables.DialectVariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.FileDescriptionNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests registration of variables during the transformation tree traversal. */
class VariableNodeProcessorTest {
  private static final Locality LOCALITY =
      Locality.builder()
          .uri("file:///program.cbl")
          .range(new Range(new Position(0, 0), new Position(10, 0)))
          .build();

  @Test
  void registersDialectVariablesInsideAndOutsideSectionsOnce() {
    ProgramNode program = program();
    SectionNode section = new SectionNode(LOCALITY, SectionType.MAP);
    DialectVariableNode inSection = new DialectVariableNode(LOCALITY, "IN-MAP", "MAP IN-MAP.");
    DialectVariableNode standalone =
        new DialectVariableNode(LOCALITY, "STANDALONE", "MAP STANDALONE.");
    section.addChild(inSection);
    program.addChild(section);
    program.addChild(standalone);

    SymbolAccumulator accumulator = process(program);

    verify(accumulator).addVariableDefinition(program, inSection);
    verify(accumulator).addVariableDefinition(program, standalone);
    verifyNoMoreInteractions(accumulator);
  }

  @Test
  void registersConvertedCobolVariableOnce() {
    ProgramNode program = program();
    SectionNode section = new SectionNode(LOCALITY, SectionType.WORKING_STORAGE);
    section.addChild(definition("WS-DATA"));
    program.addChild(section);

    SymbolAccumulator accumulator = process(program);
    VariableNode variable = (VariableNode) section.getChildren().get(0);

    assertEquals("WS-DATA", variable.getName());
    verify(accumulator).addVariableDefinition(program, variable);
    verifyNoMoreInteractions(accumulator);
  }

  @Test
  void registersFileDescriptionAndItsConvertedChildOnce() {
    ProgramNode program = program();
    SectionNode section = new SectionNode(LOCALITY, SectionType.FILE);
    FileDescriptionNode file =
        new FileDescriptionNode(
            LOCALITY,
            "TEST-FILE",
            VariableType.FD,
            false,
            false,
            "FD TEST-FILE.",
            "SELECT TEST-FILE");
    file.addChild(definition("FILE-RECORD"));
    section.addChild(file);
    program.addChild(section);

    SymbolAccumulator accumulator = process(program);
    VariableNode record = (VariableNode) file.getChildren().get(0);

    assertEquals("FILE-RECORD", record.getName());
    verify(accumulator).addVariableDefinition(program, file);
    verify(accumulator).addVariableDefinition(program, record);
    verifyNoMoreInteractions(accumulator);
  }

  private static ProgramNode program() {
    return new ProgramNode(LOCALITY, ProgramSubtype.Program, 0);
  }

  private static VariableDefinitionNode definition(String name) {
    return VariableDefinitionNode.builder()
        .level(1)
        .statementLocality(LOCALITY)
        .variableNameAndLocality(new VariableNameAndLocality(name, LOCALITY))
        .build();
  }

  private static SymbolAccumulator process(ProgramNode program) {
    SymbolAccumulator accumulator = mock(SymbolAccumulator.class);
    ProcessingContext context =
        new ProcessingContext(new ArrayList<>(), accumulator, ImmutableMap.of());
    context.register(TRANSFORMATION, SectionNode.class, new SectionNodeProcessor());
    context.register(TRANSFORMATION, FileDescriptionNode.class, new FileDescriptionProcess());
    context.register(TRANSFORMATION, VariableNode.class, new VariableNodeProcessor(accumulator));

    new AstProcessor().process(TRANSFORMATION, program, context);
    return accumulator;
  }
}
