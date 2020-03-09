/*
 * Copyright (c) 2020 Broadcom.
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

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.ca.lsp.cobol.service.mocks.MockFileSystemService;
import org.eclipse.lsp4j.Location;
import org.junit.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.analyze;
import static java.util.Collections.emptyList;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

/** This test covers case when copybook that was not found appears as a variable. */
public class TestMissingCopybookNotInVariableList extends ConfigurableTest {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 PARENT. COPY CPYNAME.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       MOVE 00 TO CHILD1 OF PARENT.";

  public TestMissingCopybookNotInVariableList() {

    //TODO: Get rid of this inject
    MockFileSystemService mockFileSystemService =
        LangServerCtx.getInjector().getInstance(MockFileSystemService.class);
    mockFileSystemService.setCopybooks(Collections::emptyList);
  }

  /**
   * Assert that there is no variable with name 'CPYNAME' in the defined variable list due to the
   * copybook with this name isn't resolved. There should be only 'PARENT'.
   */
  @Test
  public void test() {
    AnalysisResult result = analyze(TEXT, emptyList());
    Map<String, List<Location>> variableDefinitions = result.getVariableDefinitions();

    assertEquals(variableDefinitions.keySet().toString(), 1, variableDefinitions.size());
    assertTrue(variableDefinitions.keySet().toString(), variableDefinitions.containsKey("PARENT"));
  }
}
