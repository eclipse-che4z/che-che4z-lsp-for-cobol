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

package org.eclipse.lsp.cobol.service;

import org.eclipse.lsp.cobol.ConfigurableTest;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.Mockito.*;

/**
 * This class checks that the service runs the analysis only for documents with supported
 * extensions. If an extension of a document is unsupported (i.e. not "cob", "cbl" or "cobol"
 * ignoring case) then the according to notification should be sent.
 */
class DocumentExtensionTests extends ConfigurableTest {
  private static final String DOCUMENT_URI_BEGINNING = "file:///c%3A/workspace/document.";
  private static final String TEXT = "";
  private static final String INCORRECT_TEXT_EXAMPLE = "       IDENTIFICATION DIVISIONs.";

  private DataBusBroker broker;
  private Communications communications;
  private LanguageEngineFacade engine;

  @BeforeEach
  void setUp() {
    broker = mock(DataBusBroker.class);
    communications = mock(Communications.class);
    engine = mock(LanguageEngineFacade.class);
  }

  /**
   * This test verifies that supported cobol extensions correctly analyzed by the underneath engine
   */
  @Test
  void testMatchingExtensions() {
    checkExtensionMatches("cbl");
    checkExtensionMatches("CBL");
    checkExtensionMatches("cob");
    checkExtensionMatches("COB");
    checkExtensionMatches("cobol");
    checkExtensionMatches("COBOL");
  }

  @Test
  void testNonMatchingExtensions() {
    checkExtensionNotMatches("cpy");
    checkExtensionNotMatches("CPY");
    checkExtensionNotMatches("txt");
    checkExtensionNotMatches("TXT");
    checkExtensionNotMatches("");
  }

  private void checkExtensionMatches(String extension) {
    String uri = DOCUMENT_URI_BEGINNING + extension;

    // dynamic stubbing in DID_OPEN mode
    when(engine.analyze(uri, TEXT, CopybookProcessingMode.ENABLED))
        .thenReturn(AnalysisResult.empty());
    fireDidOpen(extension, uri);
    verify(engine, timeout(10000).times(1)).analyze(uri, TEXT, CopybookProcessingMode.ENABLED);

    when(engine.analyze(uri, TEXT, CopybookProcessingMode.SKIP)).thenReturn(AnalysisResult.empty());
    fireDidChange(uri);
    verify(engine, timeout(10000))
        .analyze(uri, INCORRECT_TEXT_EXAMPLE, CopybookProcessingMode.SKIP);
  }

  private void checkExtensionNotMatches(String extension) {
    fireDidOpen(extension, DOCUMENT_URI_BEGINNING + extension);
    verify(communications).notifyThatExtensionIsUnsupported(extension);
  }

  private void fireDidOpen(String extension, String uri) {
    TextDocumentService service =
        CobolTextDocumentService.builder()
            .communications(communications)
            .engine(engine)
            .dataBus(broker)
            .executors(getCustomExecutor())
            .build();
    service.didOpen(new DidOpenTextDocumentParams(new TextDocumentItem(uri, extension, 0, TEXT)));
  }

  private void fireDidChange(String uri) {
    List<TextDocumentContentChangeEvent> textEdits = new ArrayList<>();
    textEdits.add(new TextDocumentContentChangeEvent(INCORRECT_TEXT_EXAMPLE));

    TextDocumentService service =
        CobolTextDocumentService.builder()
            .communications(communications)
            .engine(engine)
            .dataBus(broker)
            .executors(getCustomExecutor())
            .build();
    service.didChange(
        new DidChangeTextDocumentParams(new VersionedTextDocumentIdentifier(uri, 0), textEdits));
  }
}
