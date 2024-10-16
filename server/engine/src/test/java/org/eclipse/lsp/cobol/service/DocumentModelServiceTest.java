/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.service;

import static org.junit.jupiter.api.Assertions.*;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.Uri;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Test for DocumentModelService
 */
class DocumentModelServiceTest {
  private DocumentModelService service;
  private final String languageId = "cobol";

  @BeforeEach
  void init() {
    service = new DocumentModelService();
  }

  @Test
  void testOpenDocument() {
    Uri uri = new Uri(UUID.randomUUID().toString());
    String text = UUID.randomUUID().toString();
    service.openDocument(uri, text, "cobol");

    assertTrue(service.get(uri).isOpened());
  }

  private AnalysisResult createAnalysisResult(Uri uri) {
    return AnalysisResult.builder()
        .diagnostics(ImmutableMap.of(uri, ImmutableList.of(new Diagnostic())))
        .rootNode(new RootNode())
        .symbolTableMap(ImmutableMap.of())
        .build();
  }

  @Test
  void testGetAllOpened() {
    Uri uri1 = new Uri(UUID.randomUUID().toString());
    Uri uri2 = new Uri(UUID.randomUUID().toString());
    service.openDocument(uri1, UUID.randomUUID().toString(), languageId);
    service.openDocument(uri2, UUID.randomUUID().toString(), languageId);
    service.closeDocument(uri1);

    assertEquals(uri2, service.getAllOpened().get(0).getUri());
  }

  @Test
  void testIsDocumentSynced() {
    Uri uri = new Uri(UUID.randomUUID().toString());
    service.openDocument(uri, UUID.randomUUID().toString(), languageId);
    assertFalse(service.isDocumentSynced(uri));

    service.processAnalysisResult(uri, AnalysisResult.builder().build(), "text");
    assertTrue(service.isDocumentSynced(uri));
  }

  @Test
  void testGetOpenedDiagnosticLsp() {
    Uri uri1 = new Uri(UUID.randomUUID().toString());
    Uri uri2 = new Uri(UUID.randomUUID().toString());
    service.openDocument(uri1, UUID.randomUUID().toString(), languageId);
    service.processAnalysisResult(uri1, createAnalysisResult(uri1), "text");

    service.openDocument(uri2, UUID.randomUUID().toString(), languageId);
    service.processAnalysisResult(uri2, createAnalysisResult(uri2), "text");

    service.closeDocument(uri1);
    Map<Uri, List<Diagnostic>> diagnostics = service.getOpenedDiagnosticLsp();

    assertEquals(2, diagnostics.size());
    assertEquals(0, diagnostics.get(uri1).size());
    assertEquals(1, diagnostics.get(uri2).size());
  }

  @Test
  void testInvalidate() {
    Uri uri = new Uri(UUID.randomUUID().toString());
    service.openDocument(uri, UUID.randomUUID().toString(), languageId);
    service.processAnalysisResult(uri, createAnalysisResult(uri), "text");

    Map<Uri, List<Diagnostic>> diagnostics = service.getOpenedDiagnosticLsp();
    assertEquals(1, diagnostics.get(uri).size());

    CobolDocumentModel documentModel = service.get(uri);
    assertNotNull(documentModel);

    service.removeDocumentDiagnostics(uri);
    diagnostics = service.getOpenedDiagnosticLsp();
    assertEquals(0, diagnostics.get(uri).size());

    documentModel = service.get(uri);
    assertNotNull(documentModel.getAnalysisResult());
  }

  @Test
  void testProcessAnalysis() {
    Uri uri = new Uri(UUID.randomUUID().toString());
    String text = UUID.randomUUID().toString();
    service.openDocument(uri, text, languageId);
    service.processAnalysisResult(uri, createAnalysisResult(uri), text);

    assertTrue(service.isDocumentSynced(uri));
  }

  @Test
  void testRemove() {
    Uri uri = new Uri(UUID.randomUUID().toString());
    String text = UUID.randomUUID().toString();

    service.openDocument(uri, text, languageId);
    assertNotNull(service.get(uri));

    service.removeDocumentDiagnostics(uri);
    Map<Uri, List<Diagnostic>> diagnostics = service.getOpenedDiagnosticLsp();
    assertEquals(0, diagnostics.get(uri).size());
    assertNotNull(service.get(uri));
  }

}
