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
package org.eclipse.lsp.cobol.core.model.extendedapi.analysisresult;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.google.common.collect.ImmutableList;
import com.google.gson.Gson;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCase;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.junit.jupiter.api.Test;

/** Tests {@link AnalysisResultDtoMapper} */
class AnalysisResultDtoMapperTest {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 PARENT.\n"
          + "          05 CHILD PIC 9.\n"
          + "       COPY BOOK1.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       PARA1.\n"
          + "           MOVE 1 TO CHILD.\n"
          + "           MOVE 2 TO BOOKVAR.\n"
          + "           PERFORM PARA1.";

  private static final String BOOK1 = "       01 BOOKVAR PIC 9.";

  @Test
  void testMap() {
    AnalysisResult result =
        UseCaseUtils.analyze(
            UseCase.builder()
                .documentUri(UseCaseUtils.DOCUMENT_URI)
                .text(TEXT)
                .copybooks(ImmutableList.of(new CobolText("BOOK1", BOOK1)))
                .build());

    AnalysisResultDto dto = AnalysisResultDtoMapper.map(result);

    assertEquals(1, dto.getPrograms().size());
    ProgramDto program = dto.getPrograms().get(0);
    assertEquals("TEST1", program.getName());

    VariableDto child = findVariable(program, "CHILD");
    assertEquals(5, child.getDefinition().getRange().getStart().getLine());
    assertEquals(1, child.getUsages().size());
    assertEquals(9, child.getUsages().get(0).getRange().getStart().getLine());
    assertNotNull(findVariable(program, "PARENT"));
    assertTrue(findVariable(program, "BOOKVAR").getDefinition().getUri().contains("BOOK1"));

    ProcedureDto para =
        program.getProcedures().stream()
            .filter(p -> p.getName().equals("PARA1"))
            .findFirst()
            .orElseThrow(AssertionError::new);
    assertEquals(1, para.getDefinitions().size());
    assertEquals(1, para.getUsages().size());

    assertEquals(1, program.getCopybooks().size());
    assertEquals("BOOK1", program.getCopybooks().get(0).getName());

    assertTrue(new Gson().toJson(dto).contains("\"BOOKVAR\""));
  }

  private static VariableDto findVariable(ProgramDto program, String name) {
    return program.getVariables().stream()
        .filter(v -> v.getName().equals(name))
        .findFirst()
        .orElseThrow(() -> new AssertionError(name + " not found"));
  }
}
