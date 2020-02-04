/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.engine;

import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.Arrays;
import java.util.Collection;

import static com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat.*;
import static org.junit.Assert.assertEquals;

/** JUnit Test checks with Cobol engine for both positive and negative tests with 3 formats */
@RunWith(Parameterized.class)
public class CobolLanguageEngineTest {
  public static final String DOCUMENT_URI = "file:///c%3A/workspace/document.cbl";

  private static final String NEGATIVE_TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.   \r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "           PEFRORM VARYING A FROM 10 BY 10 UNTIL A > 40\r\n" // Typo in "PERORM",
          // offending token is
          // "VARYING"
          + "               PERFORM VARYING b FROM 1 BY 1 UNTIL B > 4\r\n"
          + "               END-PERFORM\r\n"
          + "            END-PERFORM.\r\n"
          + "\r\n"
          + "            STOP RUN.";

  private static final String POSITIVE_TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.   \r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "           PERFORM VARYING A FROM 10 BY 10 UNTIL A > 40\r\n"
          + "               PERFORM VARYING b FROM 1 BY 1 UNTIL B > 4\r\n"
          + "               END-PERFORM\r\n"
          + "            END-PERFORM.\r\n"
          + "\r\n"
          + "            STOP RUN.";
  private CobolSourceFormat format;

  public CobolLanguageEngineTest(CobolSourceFormat format) {
    super();
    this.format = format;
  }

  @Parameterized.Parameters
  public static Collection<Object> textsToTest() {
    return Arrays.asList(FIXED, TANDEM, VARIABLE);
  }

  @Test
  public void doCheckNegative() {
    CobolLanguageEngine engine = new CobolLanguageEngine(format);
    ResultWithErrors<SemanticContext> result = engine.run(DOCUMENT_URI, NEGATIVE_TEXT);
    assertEquals(11, result.getErrors().stream().filter(item -> item.getSeverity() == 1).count());
  }

  @Test
  public void doCheckPositive() {
    CobolLanguageEngine engine = new CobolLanguageEngine(format);
    ResultWithErrors<SemanticContext> result = engine.run(DOCUMENT_URI, POSITIVE_TEXT);
    assertEquals(0, result.getErrors().stream().filter(item -> item.getSeverity() == 1).count());
  }
}
