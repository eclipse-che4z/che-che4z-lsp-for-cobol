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
package com.ca.lsp.cobol.positive;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.TestModule;
import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.ArrayList;
import java.util.Collection;

import static com.ca.lsp.cobol.usecases.UseCaseUtils.startServerAndRunValidation;
import static com.ca.lsp.cobol.usecases.UseCaseUtils.waitForDiagnostics;
import static org.junit.Assert.assertEquals;

/**
 * This positive test should always pass. If not, then there are some regressions.
 *
 * @author teman02
 */

@RunWith(Parameterized.class)
public class PositiveTest extends ConfigurableTest {
  private CobolText text;

  public PositiveTest(CobolText text) {
    this.text = text;
  }

  @Parameterized.Parameters
  public static Collection<Object> textsToTest() {

    LangServerCtx.getGuiceCtx(new TestModule(), new DatabusModule());
    Collection<Object> cobolTexts =
        new ArrayList<>(
            LangServerCtx.getInjector().getInstance(CobolTextRegistry.class).getPositives());
    LangServerCtx.shutdown();
    return cobolTexts;
  }

  @Test
  public void test() {
    TestLanguageClient client = startServerAndRunValidation(text.getText());

    waitForDiagnostics(client, text.getFileName());

    assertNoSyntaxErrorsFound(client);
  }

  private void assertNoSyntaxErrorsFound(TestLanguageClient client) {
    assertEquals(createErrorMessage(client), 0, client.getDiagnostics().size());
  }

  private String createErrorMessage(TestLanguageClient client) {
    StringBuilder result = new StringBuilder(text.getFileName());
    result.append(" contains syntax errors:\r\n");
    client
        .getDiagnostics()
        .forEach(
            it -> {
              result.append(it.getRange().getStart().getLine() + 1);
              result.append(":");
              result.append(it.getRange().getStart().getCharacter());
              result.append(" - ");
              result.append(it.getRange().getEnd().getLine() + 1);
              result.append(":");
              result.append(it.getRange().getEnd().getCharacter());
              result.append(" : ");
              result.append(it.getMessage());
              result.append("\r\n");
            });
    return result.toString();
  }
}
