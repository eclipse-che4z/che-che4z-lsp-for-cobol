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

import com.google.gson.JsonPrimitive;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.model.AnalysisFinishedEvent;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.net.URI;
import java.nio.file.Path;
import java.util.concurrent.CompletableFuture;

import static java.util.Arrays.asList;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static java.util.concurrent.CompletableFuture.completedFuture;
import static java.util.concurrent.CompletableFuture.supplyAsync;
import static org.eclipse.lsp.cobol.service.CopybookProcessingMode.ENABLED;
import static org.eclipse.lsp.cobol.service.CopybookProcessingMode.SKIP;
import static org.eclipse.lsp.cobol.service.SQLBackend.DB2_SERVER;
import static org.eclipse.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_2_URI;
import static org.eclipse.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

/**
 * This unit tests check the of the {@link CopybookServiceImpl} how it resolves the copybook
 * requests.
 */
@SuppressWarnings("unchecked")
class CopybookServiceTest {
  private static final String VALID_CPY_NAME = "VALIDNAME";
  private static final String VALID_CPY_URI =
      "file:///c%3A/workspace/.c4z/.copybooks/VALIDNAME.CPY";
  private static final String INVALID_CPY_NAME = "INVALID";
  private static final String INVALID_2_CPY_NAME = "INVALID_2";
  private static final String PARENT_CPY_NAME = "PARENT";
  private static final String PARENT_CPY_URI = "file:///c%3A/workspace/.c4z/.copybooks/PARENT.CPY";
  private static final String PARENT_CONTENT = "         COPY NESTED.";
  private static final String NESTED_CPY_NAME = "nested";
  private static final String CONTENT = "content";

  private DataBusBroker broker = mock(DataBusBroker.class);
  private SettingsService settingsService = mock(SettingsService.class);
  private FileSystemService files = mock(FileSystemService.class);
  private Path cpyPath = mock(Path.class);
  private Path parentPath = mock(Path.class);
  private CopybookConfig cpyConfig;

  @BeforeEach
  void setupMocks() {
    when(settingsService.getConfiguration("copybook-resolve", "document", VALID_CPY_NAME))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(VALID_CPY_URI))));
    when(settingsService.getConfiguration("copybook-resolve", "document", INVALID_CPY_NAME))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));

    when(cpyPath.toUri()).thenReturn(URI.create(VALID_CPY_URI));
    when(parentPath.toUri()).thenReturn(URI.create(PARENT_CPY_URI));

    when(files.getNameFromURI(VALID_CPY_URI)).thenReturn(VALID_CPY_NAME);
    when(files.getNameFromURI(DOCUMENT_URI)).thenReturn("document");
    when(files.getPathFromURI(VALID_CPY_URI)).thenReturn(cpyPath);
    when(files.getContentByPath(cpyPath)).thenReturn(CONTENT);
    when(files.fileExists(cpyPath)).thenReturn(true);
    when(files.fileExists(parentPath)).thenReturn(true);

    cpyConfig = new CopybookConfig(ENABLED, DB2_SERVER);
  }

  /**
   * Test a main positive scenario when the copybook exists, and the request invoked while copybook
   * analysis enabled.
   */
  @Test
  void testRequestWhileCopybookAnalysisActiveProcessed() {
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModel = copybookService.resolve(VALID_CPY_NAME, DOCUMENT_URI, cpyConfig);

    assertEquals(new CopybookModel(VALID_CPY_NAME, VALID_CPY_URI, CONTENT), copybookModel);
    verify(files).getNameFromURI(DOCUMENT_URI);
    verify(files).getPathFromURI(VALID_CPY_URI);
    verify(files).getContentByPath(cpyPath);
  }

  /**
   * Test a main positive scenario when the copybook exists, and the request invoked while copybook
   * analysis is enabled.
   */
  @Test
  void testResponseIfFileNotExists() {
    CopybookService copybookService = createCopybookService();
    when(files.getPathFromURI(VALID_CPY_URI)).thenReturn(null);
    CopybookModel copybookModel = copybookService.resolve(VALID_CPY_NAME, DOCUMENT_URI, cpyConfig);

    assertEquals(new CopybookModel(VALID_CPY_NAME, null, null), copybookModel);
    verify(files).getNameFromURI(DOCUMENT_URI);
    verify(files).getPathFromURI(VALID_CPY_URI);
  }

  /**
   * Test an empty request sent if URI cannot be found (if copybook doesn't exist) no to block the
   * analysis thread.
   */
  @Test
  void testRequestWhenUriNotFoundProcessed() {
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModel = copybookService.resolve(INVALID_CPY_NAME, DOCUMENT_URI, cpyConfig);

    assertEquals(new CopybookModel(INVALID_CPY_NAME, null, null), copybookModel);
    verify(files).getNameFromURI(DOCUMENT_URI);
  }

  /**
   * Test no new file system calls invoked when the copybook resolved first time in "did open"
   * analysis, and the copybook cached.
   */
  @Test
  void testNoNewClientCallsOnDidChange() {
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModelEnabled = copybookService.resolve(VALID_CPY_NAME, DOCUMENT_URI, cpyConfig);
    CopybookModel copybookModelSkipped = copybookService.resolve(VALID_CPY_NAME, DOCUMENT_URI, new CopybookConfig(SKIP, DB2_SERVER));

    verify(files, times(1)).getContentByPath(cpyPath);
    verify(files, times(1)).getNameFromURI(DOCUMENT_URI);
    verify(files, times(1)).getPathFromURI(VALID_CPY_URI);

    assertEquals(new CopybookModel(VALID_CPY_NAME, VALID_CPY_URI, CONTENT), copybookModelEnabled);
    assertEquals(new CopybookModel(VALID_CPY_NAME, VALID_CPY_URI, CONTENT), copybookModelSkipped);
  }

  /**
   * Test when cache invalidation invoked, the next copybook requests tries to resolve URI in order
   * to avoid dirty state
   */
  @Test
  void testCacheInvalidation() {
    CopybookService copybookService = createCopybookService();

    CopybookModel copybookModel = copybookService.resolve(VALID_CPY_NAME, DOCUMENT_URI, cpyConfig);
    assertEquals(new CopybookModel(VALID_CPY_NAME, VALID_CPY_URI, CONTENT), copybookModel);

    copybookService.invalidateCache();

    copybookModel = copybookService.resolve(VALID_CPY_NAME, DOCUMENT_URI, cpyConfig);
    assertEquals(new CopybookModel(VALID_CPY_NAME, VALID_CPY_URI, CONTENT), copybookModel);

    verify(files, times(2)).getContentByPath(cpyPath);
    verify(files, times(2)).getNameFromURI(DOCUMENT_URI);
    verify(files, times(2)).getPathFromURI(VALID_CPY_URI);
  }

  /**
   * Test {@link CopybookService} responds even if the {@link SettingsService} return invalid result
   */
  @Test
  void testServiceRespondsIfClientSendsInvalidResult() {
    CopybookService copybookService = createCopybookService();
    when(settingsService.getConfiguration(any())).thenReturn(completedFuture(null));
    CopybookModel copybookModel = copybookService.resolve(VALID_CPY_NAME, DOCUMENT_URI, cpyConfig);

    assertEquals(new CopybookModel(VALID_CPY_NAME, null, null), copybookModel);
    verify(files, times(1)).getNameFromURI(DOCUMENT_URI);
  }

  /**
   * Test the service must collect not resolved copybooks and sends downloading request for them on
   * {@link AnalysisFinishedEvent}. The server must track missed copybooks for each document
   * separately. The server must send a downloading request only once. Any subsequent Done analysis
   * events should not trigger downloading requests until new missed copybooks found.
   */
  @Test
  void testServiceSendsDownloadingRequestForAnalysisFinishedEvent() {
    CopybookServiceImpl copybookService = createCopybookService();
    verify(broker).subscribe(copybookService);

    when(files.getNameFromURI(DOCUMENT_2_URI)).thenReturn("document2");
    when(settingsService.getConfiguration("copybook-resolve", "document2", INVALID_2_CPY_NAME))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));

    // First document parsed
    CopybookModel invalidCpy = copybookService.resolve(INVALID_CPY_NAME, DOCUMENT_URI, cpyConfig);
    CopybookModel validCpy = copybookService.resolve(VALID_CPY_NAME, DOCUMENT_URI, cpyConfig);
    // Second document parsed
    CopybookModel invalidCpy2 = copybookService.resolve(INVALID_2_CPY_NAME, DOCUMENT_2_URI, cpyConfig);

    // Check that all copybook models are correct
    assertEquals(new CopybookModel(VALID_CPY_NAME, VALID_CPY_URI, CONTENT), validCpy);
    assertEquals(new CopybookModel(INVALID_CPY_NAME, null, null), invalidCpy);
    assertEquals(new CopybookModel(INVALID_2_CPY_NAME, null, null), invalidCpy2);

    // First document parsing done
    copybookService.handleAnalysisFinishedEvent(
        AnalysisFinishedEvent.builder()
            .documentUri(DOCUMENT_URI)
            .copybookUris(emptyList())
            .copybookProcessingMode(ENABLED)
            .build());
    verify(settingsService, times(1))
        .getConfigurations(singletonList("copybook-download.quiet.document.INVALID"));

    // Others parsing done events for first document are not trigger settingsService
    copybookService.handleAnalysisFinishedEvent(
        AnalysisFinishedEvent.builder()
            .documentUri(DOCUMENT_URI)
            .copybookUris(emptyList())
            .copybookProcessingMode(ENABLED)
            .build());
    verify(settingsService, times(1))
        .getConfigurations(singletonList("copybook-download.quiet.document.INVALID"));

    // Second document parsing done
    copybookService.handleAnalysisFinishedEvent(
        AnalysisFinishedEvent.builder()
            .documentUri(DOCUMENT_2_URI)
            .copybookUris(emptyList())
            .copybookProcessingMode(ENABLED)
            .build());
    verify(settingsService, times(1))
        .getConfigurations(singletonList("copybook-download.quiet.document2.INVALID_2"));
  }

  /**
   * Test the service collects all the copybooks that were not resolved and sends a request to
   * resolve all of them, including nested ones
   */
  @Test
  void testServiceSendsDownloadingRequestForAllNotResolvedCopybooks() {
    CopybookServiceImpl copybookService = createCopybookService();
    verify(broker).subscribe(copybookService);

    when(files.getNameFromURI(PARENT_CPY_URI)).thenReturn(PARENT_CPY_NAME);
    when(files.getPathFromURI(PARENT_CPY_URI)).thenReturn(parentPath);
    when(files.getContentByPath(parentPath)).thenReturn(PARENT_CONTENT);
    when(files.getContentByPath(parentPath)).thenReturn(PARENT_CONTENT);

    when(settingsService.getConfiguration("copybook-resolve", PARENT_CPY_NAME, NESTED_CPY_NAME))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));

    when(settingsService.getConfiguration("copybook-resolve", "document", PARENT_CPY_NAME))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(PARENT_CPY_URI))));

    CopybookModel invalidCpy = copybookService.resolve(INVALID_CPY_NAME, DOCUMENT_URI, cpyConfig);
    CopybookModel parentCpy = copybookService.resolve(PARENT_CPY_NAME, DOCUMENT_URI, cpyConfig);
    // Nested copybook declaration
    CopybookModel nestedCpy = copybookService.resolve(NESTED_CPY_NAME, PARENT_CPY_URI, cpyConfig);

    // Check that all copybook models are correct
    assertEquals(new CopybookModel(INVALID_CPY_NAME, null, null), invalidCpy);
    assertEquals(new CopybookModel(PARENT_CPY_NAME, PARENT_CPY_URI, PARENT_CONTENT), parentCpy);
    assertEquals(new CopybookModel(NESTED_CPY_NAME, null, null), nestedCpy);

    // Notify that analysis finished sending the document URI and copybook names that have nested
    // copybooks
    copybookService.handleAnalysisFinishedEvent(
        AnalysisFinishedEvent.builder()
            .documentUri(DOCUMENT_URI)
            .copybookUris(asList(PARENT_CPY_URI, DOCUMENT_URI))
            .copybookProcessingMode(ENABLED)
            .build());

    verify(settingsService, times(1))
        .getConfigurations(
            asList("copybook-download.quiet.document.nested", "copybook-download.quiet.document.INVALID"));
  }

  /**
   * Test the service will work correctly in case the middleware throw an error.
   */
  @Test
  void testResolveGetsStubWhenConfigurationThrowAnError() {
    when(settingsService.getConfiguration("copybook-resolve", "document", VALID_CPY_NAME))
        .thenReturn(CompletableFuture.supplyAsync(() -> {
          throw new NullPointerException();
        }));
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModel = copybookService.resolve(VALID_CPY_NAME, DOCUMENT_URI, cpyConfig);

    assertEquals(new CopybookModel(VALID_CPY_NAME, null, null), copybookModel);
  }

  @Test
  void testThatMiddlewareThrowsRuntimeException() {
    when(settingsService.getConfiguration("copybook-resolve", "document", VALID_CPY_NAME))
        .thenThrow(new RuntimeException("Something is wrong"));
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModel = copybookService.resolve(VALID_CPY_NAME, DOCUMENT_URI, cpyConfig);

    assertEquals(new CopybookModel(VALID_CPY_NAME, null, null), copybookModel);
  }

  private CopybookServiceImpl createCopybookService() {
    return new CopybookServiceImpl(broker, settingsService, files, 3, 3, "HOURS");
  }
}
