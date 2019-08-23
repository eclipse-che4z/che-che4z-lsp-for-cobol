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
package com.ca.lsp.cobol.service.delegates;

import com.ca.lsp.cobol.service.delegates.validations.LanguageEngines;
import org.junit.Test;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertThat;

public class LanguageEnginesTest {
  private static final String LANGUAGE_ID = "cbl";
  private static final String LANGUAGE_ID_UPPERCASE = "COBOL";
  private static final List<String> COBOL_EXTENSIONS = Arrays.asList("cpy", "cbl", "cob");

  private static final String INCORRECT_TEXT_EXAMPLE = "       IDENTIFICATION DIVISIONs.";

  @Test
  public void testGetLanguageEngineByLanguageId() {
    assertThat(
        Objects.requireNonNull(LanguageEngines.getLanguageEngineById(LANGUAGE_ID))
            .analyze(INCORRECT_TEXT_EXAMPLE)
            .getDiagnostics()
            .size(),
        is(not(0)));
  }

  @Test
  public void testGetLanguageEngineByUppercaseLanguageId() {
    assertThat(
        Objects.requireNonNull(LanguageEngines.getLanguageEngineById(LANGUAGE_ID_UPPERCASE))
            .analyze(INCORRECT_TEXT_EXAMPLE)
            .getDiagnostics()
            .size(),
        is(not(0)));
  }

  @Test
  public void testMultipleValidCobolLanguageEngine() {
    for (String cobolLangEngine : COBOL_EXTENSIONS) {
      assertThat(
          LanguageEngines.getLanguageEngineById(cobolLangEngine)
              .analyze(INCORRECT_TEXT_EXAMPLE)
              .getDiagnostics()
              .size(),
          is(not(0)));
    }
  }
}
