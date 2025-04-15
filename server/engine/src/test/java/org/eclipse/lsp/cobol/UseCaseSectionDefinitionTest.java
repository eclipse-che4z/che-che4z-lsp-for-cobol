/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.common.symbols.ProcedureId;
import org.eclipse.lsp.cobol.test.engine.AnnotatedDocumentCleaning;
import org.junit.jupiter.api.Test;

/** Test section definitions calculation in UseCaseEngine */
class UseCaseSectionDefinitionTest {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {@*SECT1} SECTION.\n"
          + "       {#*PAR}.\n"
          + "       {@*SECT2} SECTION.\n"
          + "       {#*PAR}.\n"
          + "           DISPLAY \"HELLO WORLD\".";
  private static final String TEXT_PROGRAMS =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {@*SECT1} SECTION.\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*PAR}.\n"
          + "       {@*SECT2} SECTION.\n"
          + "       {#*PAR}.\n"
          + "           DISPLAY \"HELLO WORLD\".";

  private static final String TEXT_DECLARATIVES =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       DECLARATIVES.\n"
          + "       {@*SECT1} SECTION.\n"
          + "       END DECLARATIVES.\n"
          + "       {#*PAR}.\n"
          + "       {@*SECT2} SECTION.\n"
          + "       {#*PAR}.\n"
          + "           DISPLAY \"HELLO WORLD\".";

  @Test
  void test() {
    List<ProcedureId> procedureDefinitions = extractProcedureDefinitions(TEXT);
    assertEquals(4, procedureDefinitions.size());
    ProcedureId sect1Def = procedureDefinitions.get(0);
    assertEquals("SECT1", sect1Def.getSectionName());
    assertNull(sect1Def.getParagraphName());
    ProcedureId par1Def = procedureDefinitions.get(1);
    assertEquals("SECT1", par1Def.getSectionName());
    assertEquals("PAR", par1Def.getParagraphName());
    ProcedureId sect2Def = procedureDefinitions.get(2);
    assertEquals("SECT2", sect2Def.getSectionName());
    assertNull(sect2Def.getParagraphName());
    ProcedureId par2Def = procedureDefinitions.get(3);
    assertEquals("SECT2", par2Def.getSectionName());
    assertEquals("PAR", par2Def.getParagraphName());
  }

  @Test
  void test_declarative() {
    List<ProcedureId> procedureDefinitions = extractProcedureDefinitions(TEXT_DECLARATIVES);
    assertEquals(4, procedureDefinitions.size());
    ProcedureId sect1Def = procedureDefinitions.get(0);
    assertEquals("SECT1", sect1Def.getSectionName());
    assertNull(sect1Def.getParagraphName());
    ProcedureId par1Def = procedureDefinitions.get(1);
    assertNull(par1Def.getSectionName());
    assertEquals("PAR", par1Def.getParagraphName());
    ProcedureId sect2Def = procedureDefinitions.get(2);
    assertEquals("SECT2", sect2Def.getSectionName());
    assertNull(sect2Def.getParagraphName());
    ProcedureId par2Def = procedureDefinitions.get(3);
    assertEquals("SECT2", par2Def.getSectionName());
    assertEquals("PAR", par2Def.getParagraphName());
  }

  @Test
  void test_program() {
    List<ProcedureId> procedureDefinitions = extractProcedureDefinitions(TEXT_PROGRAMS);
    assertEquals(4, procedureDefinitions.size());
    ProcedureId sect1Def = procedureDefinitions.get(0);
    assertEquals("SECT1", sect1Def.getSectionName());
    assertNull(sect1Def.getParagraphName());
    ProcedureId par1Def = procedureDefinitions.get(1);
    assertNull(par1Def.getSectionName());
    assertEquals("PAR", par1Def.getParagraphName());
    ProcedureId sect2Def = procedureDefinitions.get(2);
    assertEquals("SECT2", sect2Def.getSectionName());
    assertNull(sect2Def.getParagraphName());
    ProcedureId par2Def = procedureDefinitions.get(3);
    assertEquals("SECT2", par2Def.getSectionName());
    assertEquals("PAR", par2Def.getParagraphName());
  }

  private static List<ProcedureId> extractProcedureDefinitions(String text) {
    return AnnotatedDocumentCleaning.prepareDocument(
            text,
            Collections.emptyList(),
            Collections.emptyList(),
            Collections.emptyMap(),
            SQLBackend.NONE,
            Collections.emptyList())
        .getTestData()
        .getProcedureDefinitions()
        .entrySet()
        .stream()
        .sorted(Comparator.comparingInt(e -> e.getValue().get(0).getRange().getStart().getLine()))
        .map(Map.Entry::getKey)
        .collect(Collectors.toList());
  }
}
