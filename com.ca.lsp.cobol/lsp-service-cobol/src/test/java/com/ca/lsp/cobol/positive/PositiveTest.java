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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.positive;

import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.TestModule;
import com.ca.lsp.cobol.service.mocks.MockWorkspaceService;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.analyzeForErrors;
import static java.lang.System.getProperty;
import static java.util.Optional.ofNullable;
import static org.junit.Assert.assertEquals;

/**
 * This class provides capability to run the server for actual cobol files that are provided using
 * {@link CobolTextRegistry}. The positive test should always pass. If not, then there are some
 * regressions. The complete error description with the file name logged.
 */
@RunWith(Parameterized.class)
public class PositiveTest extends ConfigurableTest {
  private static final String PATH_TO_TEST_RESOURCES = "filesToTestPath";
  private static List<CobolText> copybooks;
  private CobolText text;

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
    CobolTextRegistry registry =
        new ZipTextRegistry(ofNullable(getProperty(PATH_TO_TEST_RESOURCES)).orElse(""));
    copybooks = registry.getCopybooks();

    return new ArrayList<>(registry.getPositives());
    Collection<Object> cobolTexts = new ArrayList<>(registry.getPositives());

    LangServerCtx.shutdown();
    return cobolTexts;
  }

  @Before
  public void setUpServer() {
    MockFileSystemServiceImpl workspaceService =
        LangServerCtx.getInjector().getInstance(MockFileSystemServiceImpl.class);
    workspaceService.setCopybooks(LangServerCtx.getInjector().getInstance(CobolTextRegistry.class));
  }

  @Test
  public void test() {
    assertNoSyntaxErrorsFound(analyzeForErrors(text.getFullText(), copybooks));
  }

  private void assertNoSyntaxErrorsFound(List<Diagnostic> diagnostics) {
    assertEquals(createErrorMessage(diagnostics), 0, diagnostics.size());
  }

  private String createErrorMessage(List<Diagnostic> diagnostics) {
    StringBuilder result = new StringBuilder(text.getFileName());
    result.append(" contains syntax errors:\r\n");
    diagnostics.forEach(
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
