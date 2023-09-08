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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.EmbeddedLanguage;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.symbols.VariableAccumulator;
import org.eclipse.lsp.cobol.core.engine.processors.implicit.ImplicitVariablesProcessor;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Collections;

import static org.mockito.Mockito.*;

/**
 * Test for ImplicitVariablesProcessor
 */
class ImplicitVariablesProcessorTest {

  private static final int CICS_INTRODUCED_REGISTERS_COUNT = 72;
  private static final AnalysisConfig ANALYSIS_CONFIG_CICS_TRANSLATE_DIABLED = new AnalysisConfig(
          new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DB2_SERVER),
          Collections.singletonList(EmbeddedLanguage.CICS),
          ImmutableList.of(), false, ImmutableList.of(), ImmutableMap.of());
  private ProcessingContext processingContext;
  private VariableAccumulator variableAccumulator;
  ImplicitVariablesProcessor processor;

  @BeforeEach
  void init() {
    processingContext = mock(ProcessingContext.class);
    variableAccumulator = mock(VariableAccumulator.class);

    when(processingContext.getVariableAccumulator()).thenReturn(variableAccumulator);
    processor =
            new ImplicitVariablesProcessor(new AnalysisConfig(
                    new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DB2_SERVER),
                    Collections.singletonList(EmbeddedLanguage.CICS),
                    ImmutableList.of(), true, ImmutableList.of(), ImmutableMap.of()));
  }

  @Test
  void testLinkageSectionWhenCicsTranslateEnabled() {
    SectionNode sectionNode = new SectionNode(Locality.builder().build(), SectionType.LINKAGE);
    sectionNode.setParent(new ProgramNode(Locality.builder().build()));

    processor.accept(sectionNode, processingContext);
    verify(variableAccumulator, times(33)).addVariableDefinition(any(), any());
  }

  @Test
  void testLinkageSectionWhenCicsTranslateDisabled() {
    processor = new ImplicitVariablesProcessor(ANALYSIS_CONFIG_CICS_TRANSLATE_DIABLED);
    SectionNode sectionNode = new SectionNode(Locality.builder().build(), SectionType.LINKAGE);
    sectionNode.setParent(new ProgramNode(Locality.builder().build()));

    processor.accept(sectionNode, processingContext);
    verify(variableAccumulator, times(0)).addVariableDefinition(any(), any());
  }

  @Test
  void testWorkingSectionWhenCicsTranslateEnabled() {
    SectionNode sectionNode = new SectionNode(Locality.builder().build(), SectionType.WORKING_STORAGE);
    sectionNode.setParent(new ProgramNode(Locality.builder().build()));

    processor.accept(sectionNode, processingContext);
    verify(variableAccumulator, times(41 + CICS_INTRODUCED_REGISTERS_COUNT)).addVariableDefinition(any(), any());
  }

  @Test
  void testWorkingSectionWhenCicsTranslateDisabled() {
    processor = new ImplicitVariablesProcessor(ANALYSIS_CONFIG_CICS_TRANSLATE_DIABLED);
    SectionNode sectionNode = new SectionNode(Locality.builder().build(), SectionType.WORKING_STORAGE);
    sectionNode.setParent(new ProgramNode(Locality.builder().build()));

    processor.accept(sectionNode, processingContext);
    verify(variableAccumulator, times(41)).addVariableDefinition(any(), any());
  }

}
