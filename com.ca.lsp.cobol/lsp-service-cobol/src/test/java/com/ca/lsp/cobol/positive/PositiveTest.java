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
import com.ca.lsp.cobol.service.mocks.MockWorkspaceService;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.ArrayList;
import java.util.Collection;

import static com.ca.lsp.cobol.usecases.UseCaseUtils.runTextValidation;
import static com.ca.lsp.cobol.usecases.UseCaseUtils.waitForDiagnostics;
import static org.junit.Assert.assertEquals;

/**
 * This class provides capability to run the server for actual cobol files that are provided using
 * {@link CobolTextRegistry}. The positive test should always pass. If not, then there are some
 * regressions. The complete error description with the file name is logged.
 */
@RunWith(Parameterized.class)
public class PositiveTest extends ConfigurableTest {
  private CobolText text;

  private static TestLanguageClient client;
  private static TextDocumentService service;

  public PositiveTest(CobolText text) {
    this.text = text;
  }

  /**
   * Retrieve the files to be analyzed by Language Server from {@link CobolTextRegistry} using
   * file-based implementation.
   *
   * @return a collection of objects that would be passed to the constructor one by one.
   */
  @Parameterized.Parameters
  public static Collection<Object> retrieveTextsToTest() {
    LangServerCtx.getGuiceCtx(new TestModule(), new DatabusModule());

    CobolTextRegistry registry = LangServerCtx.getInjector().getInstance(CobolTextRegistry.class);

    Collection<Object> cobolTexts = new ArrayList<>(registry.getPositives());

    LangServerCtx.shutdown();
    return cobolTexts;
  }

  @Before
  public void setUpServer()
  {
      client = (TestLanguageClient) LangServerCtx.getInjector().getInstance(LanguageClient.class);
      client.clean();
      service = LangServerCtx.getInjector().getInstance(TextDocumentService.class);

      MockWorkspaceService workspaceService =
              LangServerCtx.getInjector().getInstance(MockWorkspaceService.class);
      workspaceService.setRegistry(LangServerCtx.getInjector().getInstance(CobolTextRegistry.class));
  }

  @Test
  public void test() {
    runTextValidation(service, text.getText());

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
