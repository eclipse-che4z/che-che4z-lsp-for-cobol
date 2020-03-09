/*
 *
 *  Copyright (c) 2020 Broadcom.
 *  The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 *  This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *  SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.cobol.service;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.ca.lsp.cobol.service.mocks.MockCopybookService;
import com.ca.lsp.cobol.service.mocks.MockCopybookServiceImpl;
import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.TextDocumentIdentifier;
import org.eclipse.lsp4j.TextDocumentPositionParams;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.*;
import static org.junit.Assert.assertEquals;

/**
 * This test verifies that the definition positions for semantic elements from copybooks contain
 * URIs to these copybooks. If a semantic element was defined in the currently open document, the
 * URI should represent this document.
 */
public class MultiDocumentDefinitionTest extends ConfigurableTest {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  PARENT.   COPY STRUCT.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       MOVE 00 TO CHILD1 OF PARENT."
          + "       COPY PARS."
          + "       PERFORM PAR2.";

  private static final String STRUCT =
      "       02  PARENT2.\n"
          + "           03  CHILD1         PIC 9   VALUE IS '0'.\n"
          + "           03  CHILD2         PIC 9   VALUE IS '1'.\n"
          + "           03  CHILD3         PIC 9   VALUE IS '2'.";
  private static final String PARS =
      "       PAR1.\n"
          + "           DISPLAY \"PAR1\".\n"
          + "       PAR2.\n"
          + "           DISPLAY \"PAR2\".\n";
  private AnalysisResult analysisResult;
  private TextDocumentService service;

  public MultiDocumentDefinitionTest() {

    MockCopybookService mockFileSystemService =
        LangServerCtx.getInjector().getInstance(MockCopybookServiceImpl.class);

    mockFileSystemService.setCopybooks(
        () -> Arrays.asList(new CobolText("STRUCT", STRUCT), new CobolText("PARS", PARS)));
  }

  @Before
  public void prepareAnalysisResult() {
    service = LangServerCtx.getInjector().getInstance(TextDocumentService.class);
    TestLanguageClient client = LangServerCtx.getInjector().getInstance(TestLanguageClient.class);
    client.clean();

    runTextValidation(service, TEXT);
    waitForDiagnostics(client);
    assertEquals(0, client.getDiagnostics().size());

    Map<String, MyDocumentModel> docs = ((MyTextDocumentService) service).getDocs();
    MyDocumentModel document = docs.get(DOCUMENT_URI);
    analysisResult = document.getAnalysisResult();
  }

  @Test
  public void testVariableDefinitions() {
    Map<String, List<Location>> variableDefinitions = analysisResult.getVariableDefinitions();
    assertEquals(5, variableDefinitions.size());

    assertEquals("STRUCT", variableDefinitions.get("CHILD1").get(0).getUri());
    assertEquals("STRUCT", retrieveURIForGoToDefinition(new Position(6, 20)));
    assertEquals(DOCUMENT_URI, retrieveURIForGoToDefinition(new Position(6, 30)));
  }

  @Ignore("Not yet implemented")
  @Test
  public void testParagraphDefinition() {
    Map<String, List<Location>> paragraphDefinitions = analysisResult.getParagraphDefinitions();
    assertEquals(2, paragraphDefinitions.size());

    assertEquals("PARS", paragraphDefinitions.get("PAR2").get(0).getUri());
    assertEquals("PARS", retrieveURIForGoToDefinition(new Position(8, 17)));
  }

  private String retrieveURIForGoToDefinition(Position position) {
    try {
      return service
          .definition(
              new TextDocumentPositionParams(new TextDocumentIdentifier(DOCUMENT_URI), position))
          .get()
          .get(0)
          .getUri();
    } catch (InterruptedException | ExecutionException e) {
      e.printStackTrace();
      return null;
    }
  }
}
