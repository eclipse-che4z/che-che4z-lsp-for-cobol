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
package org.eclipse.lsp.cobol.service.copybooks;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonPrimitive;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.model.AnalysisFinishedEvent;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.URI;
import java.nio.file.Path;
import java.util.concurrent.CompletableFuture;

import static java.util.Arrays.asList;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static java.util.concurrent.CompletableFuture.completedFuture;
import static java.util.concurrent.CompletableFuture.supplyAsync;
import static org.eclipse.lsp.cobol.core.Constants.COBOL;
import static org.eclipse.lsp.cobol.service.SQLBackend.DATACOM_SERVER;
import static org.eclipse.lsp.cobol.service.SQLBackend.DB2_SERVER;
import static org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode.ENABLED;
import static org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode.SKIP;
import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.*;

/**
 * This unit tests check the of the {@link CopybookServiceImpl} how it resolves the copybook
 * requests.
 */
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
  private static final String SQLCA = "SQLCA";
  private static final String SQLDA = "SQLDA";
  private static final String DOCUMENT_2_URI = "file:///c%3A/workspace/document2.cbl";
  private static final String DOCUMENT_3_URI = "implicit:///implicitCopybooks/SQLCA_DB2.cpy";

  private final DataBusBroker broker = mock(DataBusBroker.class);
  private final SettingsService settingsService = mock(SettingsService.class);
  private final FileSystemService files = mock(FileSystemService.class);
  private final TextPreprocessor preprocessor = mock(TextPreprocessor.class);
  private final Path cpyPath = mock(Path.class);
  private final Path parentPath = mock(Path.class);
  private CopybookConfig cpyConfig;

  @BeforeEach
  void setupMocks() throws IOException {
    when(settingsService.getConfiguration("copybook-resolve", "document", VALID_CPY_NAME, COBOL))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(VALID_CPY_URI))));
    when(settingsService.getConfiguration("copybook-resolve", "document", INVALID_CPY_NAME, COBOL))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));

    when(cpyPath.toUri()).thenReturn(URI.create(VALID_CPY_URI));
    when(parentPath.toUri()).thenReturn(URI.create(PARENT_CPY_URI));

    when(files.getNameFromURI(VALID_CPY_URI)).thenReturn(VALID_CPY_NAME);
    when(files.getNameFromURI(DOCUMENT_URI)).thenReturn("document");
    when(files.getPathFromURI(VALID_CPY_URI)).thenReturn(cpyPath);
    when(files.getContentByPath(cpyPath)).thenReturn(CONTENT);
    when(files.fileExists(cpyPath)).thenReturn(true);
    when(files.fileExists(parentPath)).thenReturn(true);
    when(files.readFromInputStream(any(), any())).thenReturn(CONTENT);

    cpyConfig = new CopybookConfig(ENABLED, DB2_SERVER, ImmutableList.of());
  }

  /**
   * Test a main positive scenario when the copybook exists, and the request invoked while copybook
   * analysis enabled.
   */
  @Test
  void testRequestWhileCopybookAnalysisActiveProcessed() {
    CopybookName copybookName = new CopybookName(VALID_CPY_NAME, COBOL);
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModel = copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);

    assertEquals(new CopybookModel(copybookName, VALID_CPY_URI, CONTENT), copybookModel);
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
    CopybookName copybookName = new CopybookName(VALID_CPY_NAME, COBOL);
    CopybookService copybookService = createCopybookService();
    when(files.getPathFromURI(VALID_CPY_URI)).thenReturn(null);
    CopybookModel copybookModel = copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);

    assertEquals(new CopybookModel(copybookName, null, null), copybookModel);
    verify(files).getNameFromURI(DOCUMENT_URI);
    verify(files).getPathFromURI(VALID_CPY_URI);
  }

  /**
   * Test an empty request sent if URI cannot be found (if copybook doesn't exist) no to block the
   * analysis thread.
   */
  @Test
  void testRequestWhenUriNotFoundProcessed() {
    CopybookName copybookName = new CopybookName(INVALID_CPY_NAME, COBOL);
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModel =
        copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);

    assertEquals(new CopybookModel(copybookName, null, null), copybookModel);
    verify(files).getNameFromURI(DOCUMENT_URI);
  }

  /**
   * Test no new file system calls invoked when the copybook resolved first time in "did open"
   * analysis, and the copybook cached.
   */
  @Test
  void testNoNewClientCallsOnDidChange() {
    CopybookName copybookName = new CopybookName(VALID_CPY_NAME, COBOL);
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModelEnabled =
        copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);
    CopybookModel copybookModelSkipped =
        copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, new CopybookConfig(SKIP, DB2_SERVER, ImmutableList.of()), false);

    verify(files, times(1)).getContentByPath(cpyPath);
    verify(files, times(1)).getNameFromURI(DOCUMENT_URI);
    verify(files, times(1)).getPathFromURI(VALID_CPY_URI);

    assertEquals(new CopybookModel(copybookName, VALID_CPY_URI, CONTENT), copybookModelEnabled);
    assertEquals(new CopybookModel(copybookName, VALID_CPY_URI, CONTENT), copybookModelSkipped);
  }

  /**
   * Test when cache invalidation invoked, the next copybook requests tries to resolve URI in order
   * to avoid dirty state
   */
  @Test
  void testCacheInvalidation() {
    CopybookName copybookName = new CopybookName(VALID_CPY_NAME, COBOL);
    CopybookService copybookService = createCopybookService();

    CopybookModel copybookModel = copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);
    assertEquals(new CopybookModel(copybookName, VALID_CPY_URI, CONTENT), copybookModel);

    copybookService.invalidateCache();

    copybookModel = copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);
    assertEquals(new CopybookModel(copybookName, VALID_CPY_URI, CONTENT), copybookModel);

    verify(files, times(2)).getContentByPath(cpyPath);
    verify(files, times(2)).getNameFromURI(DOCUMENT_URI);
    verify(files, times(2)).getPathFromURI(VALID_CPY_URI);
  }

  /**
   * Test {@link CopybookService} responds even if the {@link SettingsService} return invalid result
   */
  @Test
  void testServiceRespondsIfClientSendsInvalidResult() {
    CopybookName copybookName = new CopybookName(VALID_CPY_NAME, COBOL);
    CopybookService copybookService = createCopybookService();
    when(settingsService.getConfiguration(any())).thenReturn(completedFuture(null));
    CopybookModel copybookModel = copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);

    assertEquals(new CopybookModel(copybookName, null, null), copybookModel);
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
    when(settingsService.getConfiguration("copybook-resolve", "document2", INVALID_2_CPY_NAME, COBOL))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));

    // First document parsed
    CopybookModel invalidCpy = copybookService.resolve(new CopybookName(INVALID_CPY_NAME, COBOL), DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);
    CopybookModel validCpy = copybookService.resolve(new CopybookName(VALID_CPY_NAME, COBOL), DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);
    // Second document parsed
    CopybookModel invalidCpy2 =
        copybookService.resolve(new CopybookName(INVALID_2_CPY_NAME, COBOL), DOCUMENT_2_URI, DOCUMENT_2_URI, cpyConfig, false);

    // Check that all copybook models are correct
    assertEquals(new CopybookModel(new CopybookName(VALID_CPY_NAME, COBOL), VALID_CPY_URI, CONTENT), validCpy);
    assertEquals(new CopybookModel(new CopybookName(INVALID_CPY_NAME, COBOL), null, null), invalidCpy);
    assertEquals(new CopybookModel(new CopybookName(INVALID_2_CPY_NAME, COBOL), null, null), invalidCpy2);

    // First document parsing done
    copybookService.handleAnalysisFinishedEvent(
        AnalysisFinishedEvent.builder()
            .documentUri(DOCUMENT_URI)
            .copybookUris(emptyList())
            .copybookProcessingMode(ENABLED)
            .build());
    verify(settingsService, times(1))
        .getConfigurations(singletonList("copybook-download.quiet.document.INVALID.COBOL"));

    // Others parsing done events for first document are not trigger settingsService
    copybookService.handleAnalysisFinishedEvent(
        AnalysisFinishedEvent.builder()
            .documentUri(DOCUMENT_URI)
            .copybookUris(emptyList())
            .copybookProcessingMode(ENABLED)
            .build());
    verify(settingsService, times(1))
        .getConfigurations(singletonList("copybook-download.quiet.document.INVALID.COBOL"));

    // Second document parsing done
    copybookService.handleAnalysisFinishedEvent(
        AnalysisFinishedEvent.builder()
            .documentUri(DOCUMENT_2_URI)
            .copybookUris(emptyList())
            .copybookProcessingMode(ENABLED)
            .build());
    verify(settingsService, times(1))
        .getConfigurations(singletonList("copybook-download.quiet.document2.INVALID_2.COBOL"));
  }

  /** Tests copybook config nullity */
  @Test
  @SuppressWarnings("ConstantConditions")
  void whenNullCpyConfigPassed_thenThrowException() {
    CopybookServiceImpl copybookService = createCopybookService();

    Assertions.assertThrows(
        IllegalArgumentException.class, () -> copybookService.resolve(new CopybookName(SQLCA, COBOL), DOCUMENT_URI, DOCUMENT_URI, null, false));
  }

  /**
   * Test if implicit copybook SQLCA for DB2 is resolved. For simplicity, we consider content is
   * null. Full use case test is in TestSqlIncludeStatementForImplicitlyDefinedCpy
   */
  @Test
  void testServiceResolvesImplicitCopybook() {
    CopybookName copybookName = new CopybookName(SQLCA, COBOL);
    CopybookServiceImpl copybookService = createCopybookService();
    verify(broker).subscribe(copybookService);

    when(files.getNameFromURI(DOCUMENT_3_URI)).thenReturn("document2");
    when(settingsService.getConfiguration("copybook-resolve", "document2", SQLCA, COBOL))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));
    CopybookModel cpy = copybookService.resolve(copybookName, DOCUMENT_3_URI, DOCUMENT_3_URI, cpyConfig, false);

    assertEquals(new CopybookModel(copybookName, DOCUMENT_3_URI, CONTENT), cpy);
  }

  /** Test if implicit copybook SQLCA for DATACOM is resolved. */
  @Test
  void testServiceResolvesImplicitCopybookForDataCom() {
    CopybookName copybookName = new CopybookName(SQLCA, COBOL);
    CopybookServiceImpl copybookService = createCopybookService();
    verify(broker).subscribe(copybookService);

    when(files.getNameFromURI(DOCUMENT_URI)).thenReturn("document2");
    when(settingsService.getConfiguration("copybook-resolve", "document2", SQLCA, COBOL))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));
    CopybookModel cpy =
        copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, new CopybookConfig(ENABLED, DATACOM_SERVER, ImmutableList.of()), false);

    assertEquals(
        new CopybookModel(copybookName, "implicit:///implicitCopybooks/SQLCA_DATACOM.cpy", CONTENT), cpy);
  }

  /** Test that the service resolves the SQLDA predefined copybook */
  @Test
  void testSqldaCopybookResolutionDoesNotRelyOnBackend() {
    CopybookName copybookName = new CopybookName(SQLDA, COBOL);
    CopybookServiceImpl copybookService = createCopybookService();
    verify(broker).subscribe(copybookService);

    when(files.getNameFromURI(DOCUMENT_URI)).thenReturn("document2");
    when(settingsService.getConfiguration("copybook-resolve", "document2", SQLDA, COBOL))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));

    assertEquals(
        copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, new CopybookConfig(ENABLED, DATACOM_SERVER, ImmutableList.of()), false),
        copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, new CopybookConfig(ENABLED, DB2_SERVER, ImmutableList.of()), false));
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

    when(settingsService.getConfiguration("copybook-resolve", "document", NESTED_CPY_NAME, COBOL))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));

    when(settingsService.getConfiguration("copybook-resolve", "document", PARENT_CPY_NAME, COBOL))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(PARENT_CPY_URI))));

    CopybookModel invalidCpy = copybookService.resolve(new CopybookName(INVALID_CPY_NAME, COBOL), DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);
    CopybookModel parentCpy = copybookService.resolve(new CopybookName(PARENT_CPY_NAME, COBOL), DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);
    // Nested copybook declaration
    CopybookModel nestedCpy = copybookService.resolve(new CopybookName(NESTED_CPY_NAME, COBOL), DOCUMENT_URI, PARENT_CPY_URI, cpyConfig, false);

    // Check that all copybook models are correct
    assertEquals(new CopybookModel(new CopybookName(INVALID_CPY_NAME, COBOL), null, null), invalidCpy);
    assertEquals(new CopybookModel(new CopybookName(PARENT_CPY_NAME, COBOL), PARENT_CPY_URI, PARENT_CONTENT), parentCpy);
    assertEquals(new CopybookModel(new CopybookName(NESTED_CPY_NAME, COBOL), null, null), nestedCpy);

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
            asList(
                    "copybook-download.quiet.document.INVALID.COBOL",
                    "copybook-download.quiet.document.nested.COBOL"
                ));
  }

  /** Test the service will work correctly in case the middleware throw an error. */
  @Test
  void testResolveGetsStubWhenConfigurationThrowAnError() {
    CopybookName copybookName = new CopybookName(VALID_CPY_NAME, COBOL);
    when(settingsService.getConfiguration("copybook-resolve", "document", VALID_CPY_NAME, COBOL))
        .thenReturn(
            CompletableFuture.supplyAsync(
                () -> {
                  throw new NullPointerException();
                }));
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModel = copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);

    assertEquals(new CopybookModel(copybookName, null, null), copybookModel);
  }

  @Test
  void testThatMiddlewareThrowsRuntimeException() {
    CopybookName copybookName = new CopybookName(VALID_CPY_NAME, COBOL);
    when(settingsService.getConfiguration("copybook-resolve", "document", VALID_CPY_NAME, COBOL))
        .thenThrow(new RuntimeException("Something is wrong"));
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModel = copybookService.resolve(copybookName, DOCUMENT_URI, DOCUMENT_URI, cpyConfig, false);

    assertEquals(new CopybookModel(copybookName, null, null), copybookModel);
  }

  @Test
  void testPredefinedCopybooksLoaded() {
    final String copybookName = PredefinedCopybooks.Copybook.SQLCA.name();
    CopybookService copybookService = createCopybookService();
    when(settingsService.getConfiguration("copybook-resolve", "document", copybookName, COBOL))
        .thenReturn(supplyAsync(() -> ImmutableList.of(new JsonPrimitive(""))));
    final CopybookModel model =
        copybookService.resolve(
            new CopybookName(copybookName, COBOL), DOCUMENT_URI, DOCUMENT_URI, new CopybookConfig(ENABLED, DB2_SERVER, ImmutableList.of()), false);

    assertEquals("implicit:///implicitCopybooks/SQLCA_DB2.cpy", model.getUri());
    verify(settingsService, times(1))
        .getConfiguration("copybook-resolve", "document", copybookName, COBOL);
    verify(files, times(1)).getNameFromURI(DOCUMENT_URI);
  }

  @Test
  void testPredefinedCopybooksResolvedInsteadOfStaticOnes() {
    final String copybookName = PredefinedCopybooks.Copybook.SQLCA.name();
    final String copybookUri = "file:///c%3A/workspace/.c4z/.copybooks/" + copybookName + ".cpy";

    when(settingsService.getConfiguration("copybook-resolve", "document", copybookName, COBOL))
        .thenReturn(supplyAsync(() -> ImmutableList.of(new JsonPrimitive(copybookUri))));
    when(files.getPathFromURI(copybookUri)).thenReturn(cpyPath);
    when(files.fileExists(cpyPath)).thenReturn(true);
    when(files.getContentByPath(cpyPath)).thenReturn("content");

    CopybookServiceImpl copybookService = createCopybookService();
    // Assert the copybook was resolved from the workspace
    final CopybookModel model =
        copybookService.resolve(
            new CopybookName(copybookName, COBOL), DOCUMENT_URI, DOCUMENT_URI, new CopybookConfig(ENABLED, DB2_SERVER, ImmutableList.of()), false);

    // Assert the copybook was resolved from the workspace
    assertEquals(copybookUri, model.getUri());
    assertEquals("content", model.getContent());
    verify(settingsService, times(1))
        .getConfiguration("copybook-resolve", "document", copybookName, COBOL);

    // Assert the copybook was not added to the download queue
    assertTrue(copybookService.getCopybooksForDownloading().isEmpty());
  }

  private CopybookServiceImpl createCopybookService() {
    return new CopybookServiceImpl(broker, settingsService, files, preprocessor, new CopybookCache(3, 3, "HOURS"));
  }
}
