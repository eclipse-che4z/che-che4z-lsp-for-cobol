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
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Test for DocumentModelService
 */
class DocumentModelServiceTest {
  private DocumentModelService service;

  @BeforeEach
  void init() {
    service = new DocumentModelService();
  }

  @Test
  void testOpenDocument() {
    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();
    service.openDocument(uri, text);

    assertTrue(service.get(uri).isOpened());
  }

  private AnalysisResult createAnalysisResult(String uri) {
    return AnalysisResult.builder()
        .diagnostics(ImmutableMap.of(uri, ImmutableList.of(new Diagnostic())))
        .rootNode(new RootNode())
        .symbolTableMap(ImmutableMap.of())
        .build();
  }

  @Test
  void testGetAllOpened() {
    String uri1 = UUID.randomUUID().toString();
    String uri2 = UUID.randomUUID().toString();
    service.openDocument(uri1, UUID.randomUUID().toString());
    service.openDocument(uri2, UUID.randomUUID().toString());
    service.closeDocument(uri1);

    assertEquals(uri2, service.getAllOpened().get(0).getUri());
  }

  @Test
  void testIsDocumentSynced() {
    String uri = UUID.randomUUID().toString();
    service.openDocument(uri, UUID.randomUUID().toString());
    assertFalse(service.isDocumentSynced(uri));

    service.processAnalysisResult(uri, AnalysisResult.builder().build(), "text");
    assertTrue(service.isDocumentSynced(uri));
  }

  @Test
  void testGetOpenedDiagnostic() {
    String uri1 = UUID.randomUUID().toString();
    String uri2 = UUID.randomUUID().toString();
    service.openDocument(uri1, UUID.randomUUID().toString());
    service.processAnalysisResult(uri1, createAnalysisResult(uri1), "text");

    service.openDocument(uri2, UUID.randomUUID().toString());
    service.processAnalysisResult(uri2, createAnalysisResult(uri2), "text");

    service.closeDocument(uri1);
    Map<String, List<Diagnostic>> diagnostics = service.getOpenedDiagnostic();

    assertEquals(2, diagnostics.size());
    assertEquals(0, diagnostics.get(uri1).size());
    assertEquals(1, diagnostics.get(uri2).size());
  }

  @Test
  void testInvalidate() {
    String uri = UUID.randomUUID().toString();
    service.openDocument(uri, UUID.randomUUID().toString());
    service.processAnalysisResult(uri, createAnalysisResult(uri), "text");

    Map<String, List<Diagnostic>> diagnostics = service.getOpenedDiagnostic();
    assertEquals(1, diagnostics.get(uri).size());

    CobolDocumentModel documentModel = service.get(uri);
    assertNotNull(documentModel);

    service.removeDocumentDiagnostics(uri);
    diagnostics = service.getOpenedDiagnostic();
    assertEquals(0, diagnostics.get(uri).size());

    documentModel = service.get(uri);
    assertNotNull(documentModel.getAnalysisResult());
  }

  @Test
  void testProcessAnalysis() {
    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();
    service.openDocument(uri, text);
    service.processAnalysisResult(uri, createAnalysisResult(uri), text);

    assertTrue(service.isDocumentSynced(uri));
  }

  @Test
  void testRemove() {
    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();

    service.openDocument(uri, text);
    assertNotNull(service.get(uri));

    service.removeDocumentDiagnostics(uri);
    Map<String, List<Diagnostic>> diagnostics = service.getOpenedDiagnostic();
    assertEquals(0, diagnostics.get(uri).size());
    assertNotNull(service.get(uri));
  }

}
