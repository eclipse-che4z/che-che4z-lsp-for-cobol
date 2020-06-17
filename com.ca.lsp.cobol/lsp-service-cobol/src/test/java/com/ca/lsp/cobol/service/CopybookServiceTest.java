/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.cobol.service;

import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.AnalysisFinishedEvent;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.service.utils.FileSystemService;
import com.google.gson.JsonPrimitive;
import org.junit.Before;
import org.junit.Test;

import java.net.URI;
import java.nio.file.Path;

import static com.broadcom.lsp.domain.cobol.event.model.DataEventType.ANALYSIS_FINISHED_EVENT;
import static com.broadcom.lsp.domain.cobol.event.model.DataEventType.REQUIRED_COPYBOOK_EVENT;
import static com.ca.lsp.cobol.service.TextDocumentSyncType.DID_CHANGE;
import static com.ca.lsp.cobol.service.TextDocumentSyncType.DID_OPEN;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_2_URI;
import static java.util.Collections.singletonList;
import static java.util.concurrent.CompletableFuture.completedFuture;
import static java.util.concurrent.CompletableFuture.supplyAsync;
import static org.mockito.Mockito.*;

/**
 * This unit tests check the of the {@link CopybookServiceImpl} how it resolves the copybook
 * requests.
 */
@SuppressWarnings("unchecked")
public class CopybookServiceTest {
  private static final String VALID_CPY_NAME = "VALIDNAME";
  private static final String VALID_CPY_URI =
      "file:///c%3A/workspace/.c4z/.copybooks/VALIDNAME.CPY";
  private static final String INVALID_CPY_NAME = "INVALID";
  private static final String INVALID_2_CPY_NAME = "INVALID_2";
  private static final String CONTENT = "content";

  private DataBusBroker broker = mock(DataBusBroker.class);
  private SettingsService settingsService = mock(SettingsService.class);
  private FileSystemService files = mock(FileSystemService.class);
  private Path cpyPath = mock(Path.class);

  @Before
  public void setupMocks() {
    when(settingsService.getConfiguration("copybook-resolve", "document", VALID_CPY_NAME))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(VALID_CPY_URI))));
    when(settingsService.getConfiguration("copybook-resolve", "document", INVALID_CPY_NAME))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));

    when(cpyPath.toUri()).thenReturn(URI.create(VALID_CPY_URI));

    when(files.getNameFromURI(VALID_CPY_URI)).thenReturn(VALID_CPY_NAME);
    when(files.getNameFromURI(DOCUMENT_URI)).thenReturn("document");
    when(files.getPathFromURI(VALID_CPY_URI)).thenReturn(cpyPath);
    when(files.getContentByPath(cpyPath)).thenReturn(CONTENT);
    when(files.fileExists(cpyPath)).thenReturn(true);
  }

  /**
   * Test a main positive scenario when the copybook exists, and the request invoked while "did
   * open" analysis.
   */
  @Test
  public void testRequestWhileDidOpenProcessed() {
    CopybookService copybookService = new CopybookServiceImpl(broker, settingsService, files);
    verify(broker).subscribe(REQUIRED_COPYBOOK_EVENT, copybookService);

    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(VALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_OPEN.name())
            .build());

    verify(files).getNameFromURI(DOCUMENT_URI);
    verify(files).getPathFromURI(VALID_CPY_URI);
    verify(files).getContentByPath(cpyPath);

    verify(broker, timeout(10000))
        .postData(
            FetchedCopybookEvent.builder()
                .name(VALID_CPY_NAME)
                .content(CONTENT)
                .uri(VALID_CPY_URI)
                .build());
  }

  /**
   * Test a main positive scenario when the copybook exists, and the request invoked while "did
   * open" analysis.
   */
  @Test
  public void testResponseIfFileNotExists() {
    CopybookService copybookService = new CopybookServiceImpl(broker, settingsService, files);
    verify(broker).subscribe(REQUIRED_COPYBOOK_EVENT, copybookService);

    when(files.getPathFromURI(VALID_CPY_URI)).thenReturn(null);

    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(VALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_OPEN.name())
            .build());

    verify(files).getNameFromURI(DOCUMENT_URI);
    verify(files).getPathFromURI(VALID_CPY_URI);

    verify(broker, timeout(10000))
        .postData(FetchedCopybookEvent.builder().name(VALID_CPY_NAME).build());
  }

  /**
   * Test the service should return the content of the copybook only while analysis runs in the "did
   * open" mode. When it is in "did change", the copybook name may be incomplete and due to this
   * unable to resolve.
   */
  @Test
  public void testRequestWhileDidChangeNotProcessed() {
    CopybookService copybookService = new CopybookServiceImpl(broker, settingsService, null);

    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(VALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_CHANGE.name())
            .build());

    verify(broker).postData(FetchedCopybookEvent.builder().name(VALID_CPY_NAME).build());
  }

  /**
   * Test an empty request sent if URI cannot be found (if copybook doesn't exist) no to block the
   * analysis thread.
   */
  @Test
  public void testRequestWhenUriNotFoundProcessed() {
    CopybookService copybookService = new CopybookServiceImpl(broker, settingsService, files);
    verify(broker).subscribe(REQUIRED_COPYBOOK_EVENT, copybookService);

    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(INVALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_OPEN.name())
            .build());

    verify(files).getNameFromURI(DOCUMENT_URI);
    verify(broker, timeout(10000))
        .postData(FetchedCopybookEvent.builder().name(INVALID_CPY_NAME).build());
  }

  /**
   * Test no new file system calls invoked when the copybook resolved first time in "did open"
   * analysis, and the URI cached.
   */
  @Test
  public void testNoNewClientCallsOnDidChange() {
    CopybookService copybookService = new CopybookServiceImpl(broker, settingsService, files);
    verify(broker).subscribe(REQUIRED_COPYBOOK_EVENT, copybookService);

    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(VALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_OPEN.name())
            .build());

    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(VALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_CHANGE.name())
            .build());

    verify(files, times(2)).getContentByPath(cpyPath);
    verify(files, times(1)).getNameFromURI(DOCUMENT_URI);
    verify(files, times(1)).getPathFromURI(VALID_CPY_URI);

    verify(broker, timeout(10000).times(2))
        .postData(
            FetchedCopybookEvent.builder()
                .name(VALID_CPY_NAME)
                .content(CONTENT)
                .uri(VALID_CPY_URI)
                .build());
  }

  /** Test the cached URI deleted if the file is not available anymore. */
  @Test
  public void testCacheInvalidatedIfUriUnavailable() {
    CopybookService copybookService = new CopybookServiceImpl(broker, settingsService, files);
    verify(broker).subscribe(REQUIRED_COPYBOOK_EVENT, copybookService);

    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(VALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_OPEN.name())
            .build());

    verify(broker, timeout(10000))
        .postData(
            FetchedCopybookEvent.builder()
                .name(VALID_CPY_NAME)
                .content(CONTENT)
                .uri(VALID_CPY_URI)
                .build());

    // simulate the file deleted
    when(files.fileExists(cpyPath)).thenReturn(false);

    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(VALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_CHANGE.name())
            .build());

    verify(files, times(1)).getContentByPath(cpyPath);
    verify(files, times(1)).getNameFromURI(DOCUMENT_URI);
    verify(files, times(1)).getPathFromURI(VALID_CPY_URI);

    verify(broker, timeout(10000))
        .postData(
            FetchedCopybookEvent.builder()
                .name(VALID_CPY_NAME)
                .content(CONTENT)
                .uri(VALID_CPY_URI)
                .build());
  }

  /**
   * Test when cache invalidation invoked, the next copybook requests tries to resolve URI in order
   * to avoid dirty state
   */
  @Test
  public void testCacheInvalidation() {
    CopybookService copybookService = new CopybookServiceImpl(broker, settingsService, files);
    verify(broker).subscribe(REQUIRED_COPYBOOK_EVENT, copybookService);

    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(VALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_OPEN.name())
            .build());

    copybookService.invalidateURICache();

    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(VALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_OPEN.name())
            .build());

    // Check the requests applied same logic
    verify(broker, timeout(10000).times(2))
        .postData(
            FetchedCopybookEvent.builder()
                .name(VALID_CPY_NAME)
                .content(CONTENT)
                .uri(VALID_CPY_URI)
                .build());

    verify(files, times(2)).getContentByPath(cpyPath);
    verify(files, times(2)).getNameFromURI(DOCUMENT_URI);
    verify(files, times(2)).getPathFromURI(VALID_CPY_URI);
  }

  /**
   * Test {@link CopybookService} responds even if the {@link SettingsService} return invalid result
   */
  @Test
  public void testServiceRespondsIfClientSendsInvalidResult() {
    CopybookService copybookService = new CopybookServiceImpl(broker, settingsService, files);
    verify(broker).subscribe(REQUIRED_COPYBOOK_EVENT, copybookService);

    when(settingsService.getConfiguration(any())).thenReturn(completedFuture(null));
    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(VALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_OPEN.name())
            .build());

    verify(broker, timeout(10000).times(1))
        .postData(FetchedCopybookEvent.builder().name(VALID_CPY_NAME).build());

    verify(files, times(1)).getNameFromURI(DOCUMENT_URI);
  }

  /**
   * Test that the service must collect not resolved copybooks and sends downloading request for them on
   * {@link AnalysisFinishedEvent}.
   * The server must track missed copybooks for each document separately.
   * The server must send a downloading request only once. Any subsequent Done analysis events should not trigger
   * downloading requests until new missed copybooks found.
   */
  @Test
  public void testServiceSendsDownloadingRequestForAnalysisFinishedEvent() {
    CopybookService copybookService = new CopybookServiceImpl(broker, settingsService, files);
    verify(broker).subscribe(REQUIRED_COPYBOOK_EVENT, copybookService);
    verify(broker).subscribe(ANALYSIS_FINISHED_EVENT, copybookService);

    when(files.getNameFromURI(DOCUMENT_2_URI)).thenReturn("document2");
    when(settingsService.getConfiguration("copybook-resolve", "document2", INVALID_2_CPY_NAME))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));

    // First document parsed
    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(INVALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_OPEN.name())
            .build());
    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(VALID_CPY_NAME)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType(DID_OPEN.name())
            .build());
    // Second document parsed
    copybookService.observerCallback(
        RequiredCopybookEvent.builder()
            .name(INVALID_2_CPY_NAME)
            .documentUri(DOCUMENT_2_URI)
            .textDocumentSyncType(DID_OPEN.name())
            .build());

    // Wait for all settingsService calls processed
    verify(broker, timeout(10000))
        .postData(
            FetchedCopybookEvent.builder()
                .name(VALID_CPY_NAME)
                .content(CONTENT)
                .uri(VALID_CPY_URI)
                .build());
    verify(broker, timeout(10000))
        .postData(FetchedCopybookEvent.builder().name(INVALID_CPY_NAME).build());
    verify(broker, timeout(10000))
        .postData(FetchedCopybookEvent.builder().name(INVALID_2_CPY_NAME).build());

    // First document parsing done
    copybookService.observerCallback(
        AnalysisFinishedEvent.builder()
            .documentUri(DOCUMENT_URI)
            .build());
    verify(settingsService, times(1)).getConfigurations(singletonList("copybook-download.document.INVALID"));

    // Others parsing done events for first document are not trigger settingsService
    copybookService.observerCallback(
        AnalysisFinishedEvent.builder()
            .documentUri(DOCUMENT_URI)
            .build());
    verify(settingsService, times(1)).getConfigurations(singletonList("copybook-download.document.INVALID"));

    // Second document parsing done
    copybookService.observerCallback(
        AnalysisFinishedEvent.builder()
            .documentUri(DOCUMENT_2_URI)
            .build());
    verify(settingsService, times(1)).getConfigurations(singletonList("copybook-download.document2.INVALID_2"));
  }
}
