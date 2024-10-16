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

import static java.util.Arrays.asList;
import static java.util.Collections.emptyList;
import static java.util.concurrent.CompletableFuture.completedFuture;
import static java.util.concurrent.CompletableFuture.supplyAsync;
import static org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode.ENABLED;
import static org.eclipse.lsp.cobol.test.engine.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

import com.google.common.collect.ImmutableList;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.file.FileSystemService;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.model.Uri;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.common.utils.PredefinedCopybooks;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.providers.ClientProvider;
import org.eclipse.lsp4j.services.LanguageClient;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.MockedStatic;

/**
 * This unit tests check the of the {@link CopybookServiceImpl} how it resolves the copybook
 * requests.
 */
class CopybookServiceTest {
  private static final String VALID_CPY_NAME = "VALIDNAME";
  private static final Uri VALID_CPY_URI = new Uri("file:///c:/workspace/.c4z/.copybooks/VALIDNAME.CPY");
  private static final String INVALID_CPY_NAME = "INVALID";
  private static final String INVALID_2_CPY_NAME = "INVALID_2";
  private static final String PARENT_CPY_NAME = "PARENT";
  private static final Uri PARENT_CPY_URI = new Uri("file:///c:/workspace/.c4z/.copybooks/PARENT.CPY");
  private static final String PARENT_CONTENT = "         COPY NESTED.";
  private static final String NESTED_CPY_NAME = "nested";
  private static final String CONTENT = "content";
  private static final String SQLCA = "SQLCA";
  private static final String SQLDA = "SQLDA";
  private static final Uri DOCUMENT_2_URI = new Uri("file:///c:/workspace/document2.cbl");
    private static final String COPYBOOK_3_NAME = "SQLCA_DB2";
  private final CobolLanguageClient client = mock(CobolLanguageClient.class);
  private final FileSystemService files = mock(FileSystemService.class);
  private final CleanerPreprocessor preprocessor = mock(CleanerPreprocessor.class);
  private final Path cpyPath = Paths.get("/c:/workspace/.c4z/.copybooks/VALIDNAME.CPY");
  private final Path parentPath = Paths.get("/c:/workspace/.c4z/.copybooks/PARENT.CPY");

  @BeforeEach
  void setupMocks() throws IOException {
    when(client.resolveCopybook(DOCUMENT_URI.toString(), VALID_CPY_NAME, "COBOL"))
        .thenReturn(supplyAsync(VALID_CPY_URI::toString));
    when(client.resolveCopybook(DOCUMENT_URI.toString(), INVALID_CPY_NAME, "COBOL"))
        .thenReturn(supplyAsync(() -> null));
    when(client.resolveCopybook(DOCUMENT_URI.toString(), COPYBOOK_3_NAME, "COBOL"))
        .thenReturn(supplyAsync(VALID_CPY_URI::toString));

    when(files.getContentByPath(cpyPath)).thenReturn(CONTENT);
    when(files.fileExists(cpyPath)).thenReturn(true);
    when(files.fileExists(parentPath)).thenReturn(true);
    when(files.readFromInputStream(any(), any())).thenReturn(CONTENT);
  }

  /**
   * Test a main positive scenario when the copybook exists, and the request invoked while copybook
   * analysis enabled.
   */
  @Test
  void testRequestWhileCopybookAnalysisActiveProcessed() {
    CopybookName copybookName = createCopybook(VALID_CPY_NAME);
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModel =
        copybookService
            .resolve(
                copybookName.toCopybookId(DOCUMENT_URI),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();

    assertEquals(
        new CopybookModel(
            copybookName.toCopybookId(DOCUMENT_URI), copybookName, VALID_CPY_URI, CONTENT),
        copybookModel);
    verify(files).getContentByPath(cpyPath);
  }

  /**
   * Test a main positive scenario when the copybook exists, and the request invoked while copybook
   * analysis is enabled.
   */
  @Test
  void testResponseIfFileNotExists() {
    when(files.fileExists(cpyPath)).thenReturn(false);
    CopybookName copybookName = createCopybook(VALID_CPY_NAME);
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModel =
        copybookService
            .resolve(
                CopybookId.fromString(copybookName.getDisplayName()),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();
    when(files.fileExists(cpyPath)).thenReturn(true);
    assertEquals(
        new CopybookModel(copybookName.toCopybookId(DOCUMENT_URI), copybookName, null, null),
        copybookModel);
  }

  /**
   * Test an empty request sent if URI cannot be found (if copybook doesn't exist) no to block the
   * analysis thread.
   */
  @Test
  void testRequestWhenUriNotFoundProcessed() {
    CopybookName copybookName = new CopybookName(INVALID_CPY_NAME);
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModel =
        copybookService
            .resolve(
                copybookName.toCopybookId(DOCUMENT_URI),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();

    assertEquals(
        new CopybookModel(copybookName.toCopybookId(DOCUMENT_URI), copybookName, null, null),
        copybookModel);
  }

  /**
   * Test no new file system calls invoked when the copybook resolved first time in "did open"
   * analysis, and the copybook cached.
   */
  @Test
  void testNoNewClientCallsOnDidChange() {
    CopybookName copybookName = createCopybook(VALID_CPY_NAME);
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModelEnabled =
        copybookService
            .resolve(
                CopybookId.fromString(copybookName.getDisplayName()),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();
    CopybookModel copybookModelSkipped =
        copybookService
            .resolve(
                CopybookId.fromString(copybookName.getDisplayName()),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();

    verify(files, times(1)).getContentByPath(cpyPath);

    assertEquals(
        new CopybookModel(
            copybookName.toCopybookId(DOCUMENT_URI), copybookName, VALID_CPY_URI, CONTENT),
        copybookModelEnabled);
    assertEquals(
        new CopybookModel(
            copybookName.toCopybookId(DOCUMENT_URI), copybookName, VALID_CPY_URI, CONTENT),
        copybookModelSkipped);
  }

  /**
   * Test when cache invalidation invoked, the next copybook requests tries to resolve URI in order
   * to avoid dirty state
   */
  @Test
  void testCacheInvalidation() {
    CopybookName copybookName = createCopybook(VALID_CPY_NAME);
    CopybookService copybookService = createCopybookService();

    CopybookModel copybookModel =
        copybookService
            .resolve(
                copybookName.toCopybookId(DOCUMENT_URI),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();
    assertEquals(
        new CopybookModel(
            copybookName.toCopybookId(DOCUMENT_URI), copybookName, VALID_CPY_URI, CONTENT),
        copybookModel);

    copybookService.invalidateCache(false);

    copybookModel =
        copybookService
            .resolve(
                copybookName.toCopybookId(DOCUMENT_URI),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();
    assertEquals(
        new CopybookModel(
            copybookName.toCopybookId(DOCUMENT_URI), copybookName, VALID_CPY_URI, CONTENT),
        copybookModel);

    verify(files, times(2)).getContentByPath(eq(cpyPath));
  }

  @Test
  void cacheInvalidationForNonImplicitCopybook() {
    CopybookName copybookName = createCopybook(COPYBOOK_3_NAME);
    CopybookService copybookService = createCopybookService();

    CopybookModel copybookModel =
        copybookService
            .resolve(
                copybookName.toCopybookId(DOCUMENT_URI),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();
    assertEquals(
        new CopybookModel(
            copybookName.toCopybookId(DOCUMENT_URI), copybookName, VALID_CPY_URI, CONTENT),
        copybookModel);

    try (MockedStatic<ImplicitCodeUtils> mocked = mockStatic(ImplicitCodeUtils.class)) {
      mocked.when(() -> {
        ImplicitCodeUtils.isImplicit(eq(VALID_CPY_URI));
      }).thenReturn(true);
      copybookService.invalidateCache(true);
    }

    copybookModel =
        copybookService
            .resolve(
                copybookName.toCopybookId(DOCUMENT_URI),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();
    assertEquals(
        new CopybookModel(
            copybookName.toCopybookId(DOCUMENT_URI), copybookName, VALID_CPY_URI, CONTENT),
        copybookModel);

    verify(files, times(1)).getContentByPath(cpyPath);
  }

  /**
   * Test {@link CopybookService} responds even if the {@link LanguageClient} return invalid result
   */
  @Test
  void testServiceRespondsIfClientSendsInvalidResult() {
    CopybookName copybookName = new CopybookName(VALID_CPY_NAME);
    CopybookService copybookService = createCopybookService();

    when(client.resolveCopybook(anyString(), anyString(), any())).thenReturn(completedFuture(null));
    CopybookModel copybookModel =
        copybookService
            .resolve(
                copybookName.toCopybookId(DOCUMENT_URI),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();

    assertEquals(
        new CopybookModel(copybookName.toCopybookId(DOCUMENT_URI), copybookName, null, null),
        copybookModel);
  }

  /**
   * Test the service must collect not resolved copybooks and sends downloading request for them.
   * The server must track missed copybooks for each document separately. The server must send a
   * downloading request only once. Any subsequent Done analysis events should not trigger
   * downloading requests until new missed copybooks found.
   */
  @Test
  void testServiceSendsDownloadingRequestForAnalysisFinishedEvent() {
    CopybookServiceImpl copybookService = createCopybookService();

    when(client.resolveCopybook(DOCUMENT_2_URI.toString(), INVALID_2_CPY_NAME, "COBOL"))
        .thenReturn(completedFuture(null));

    // First document parsed
    CopybookName copybookInvalid = createCopybook(INVALID_CPY_NAME);
    CopybookModel invalidCpy =
        copybookService
            .resolve(
                CopybookId.fromString(INVALID_CPY_NAME),
                copybookInvalid,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();
    CopybookName copybookValid = createCopybook(VALID_CPY_NAME);
    CopybookModel validCpy =
        copybookService
            .resolve(
                CopybookId.fromString(VALID_CPY_NAME),
                copybookValid,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();
    // Second document parsed
    CopybookName copybookInvalid2 = createCopybook(INVALID_2_CPY_NAME);
    CopybookModel invalidCpy2 =
        copybookService
            .resolve(
                copybookInvalid2.toCopybookId(DOCUMENT_2_URI),
                copybookInvalid2,
                DOCUMENT_2_URI,
                DOCUMENT_2_URI,
                null)
            .getResult();

    // Check that all copybook models are correct
    assertEquals(
        new CopybookModel(
            copybookValid.toCopybookId(DOCUMENT_URI), copybookValid, VALID_CPY_URI, CONTENT),
        validCpy);
    assertEquals(
        new CopybookModel(copybookInvalid.toCopybookId(DOCUMENT_URI), copybookInvalid, null, null),
        invalidCpy);
    assertEquals(
        new CopybookModel(
            copybookInvalid2.toCopybookId(DOCUMENT_2_URI), copybookInvalid2, null, null),
        invalidCpy2);
    CopyBookDTO invalidCopybook = new CopyBookDTO(copybookInvalid);
    // First document parsing done
    copybookService.sendCopybookDownloadRequest(DOCUMENT_URI, emptyList(), ENABLED);
    verify(client, times(1))
        .downloadCopybooks(DOCUMENT_URI.toString(), ImmutableList.of(invalidCopybook), true);

    // Others parsing done events for first document are not trigger settingsService
    copybookService.sendCopybookDownloadRequest(DOCUMENT_URI, emptyList(), ENABLED);

    verify(client, times(1))
        .downloadCopybooks(DOCUMENT_URI.toString(), ImmutableList.of(invalidCopybook), true);
    CopyBookDTO invalidCopybook2 = new CopyBookDTO(copybookInvalid2);
    // Second document parsing done
    copybookService.sendCopybookDownloadRequest(DOCUMENT_2_URI, emptyList(), ENABLED);
    verify(client, times(1))
        .downloadCopybooks(DOCUMENT_2_URI.toString(), ImmutableList.of(invalidCopybook2), true);
  }

  /** Test that the service resolves the SQLDA predefined copybook */
  @Test
  void testSqldaCopybookResolutionDoesNotRelyOnBackend() {
    CopybookName copybookName = new CopybookName(SQLDA);
    CopybookServiceImpl copybookService = createCopybookService();

    when(client.resolveCopybook("document2", SQLCA, "COBOL")).thenReturn(supplyAsync(() -> null));

    assertEquals(
        copybookService.resolve(
            CopybookId.fromString(copybookName.getDisplayName()),
            copybookName,
            DOCUMENT_URI,
            DOCUMENT_URI,
            null),
        copybookService.resolve(
            CopybookId.fromString(copybookName.getDisplayName()),
            copybookName,
            DOCUMENT_URI,
            DOCUMENT_URI,
            null));
  }

  /**
   * Test the service collects all the copybooks that were not resolved and sends a request to
   * resolve all of them, including nested ones
   */
  @Test
  void testServiceSendsDownloadingRequestForAllNotResolvedCopybooks() {
    CopybookServiceImpl copybookService = createCopybookService();

    when(files.getContentByPath(parentPath)).thenReturn(PARENT_CONTENT);
    when(files.getContentByPath(parentPath)).thenReturn(PARENT_CONTENT);

    when(client.resolveCopybook(DOCUMENT_URI.toString(), NESTED_CPY_NAME, "COBOL"))
        .thenReturn(supplyAsync(() -> null));
    when(client.resolveCopybook(DOCUMENT_URI.toString(), PARENT_CPY_NAME, "COBOL"))
        .thenReturn(supplyAsync(PARENT_CPY_URI::toString));

    CopybookName copybookInvalid = createCopybook(INVALID_CPY_NAME);
    CopybookModel invalidCpy =
        copybookService
            .resolve(
                copybookInvalid.toCopybookId(DOCUMENT_URI),
                copybookInvalid,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();
    CopybookName copybookParent = createCopybook(PARENT_CPY_NAME);
    CopybookModel parentCpy =
        copybookService
            .resolve(
                copybookParent.toCopybookId(DOCUMENT_URI),
                copybookParent,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();
    // Nested copybook declaration
    CopybookName copybookNested = createCopybook(NESTED_CPY_NAME);
    CopybookModel nestedCpy =
        copybookService
            .resolve(
                CopybookId.fromString(NESTED_CPY_NAME),
                copybookNested,
                DOCUMENT_URI,
                PARENT_CPY_URI,
                null)
            .getResult();

    // Check that all copybook models are correct
    assertEquals(
        new CopybookModel(copybookInvalid.toCopybookId(DOCUMENT_URI), copybookInvalid, null, null),
        invalidCpy);
    assertEquals(
        new CopybookModel(
            copybookParent.toCopybookId(DOCUMENT_URI),
            copybookParent,
            PARENT_CPY_URI,
            PARENT_CONTENT),
        parentCpy);
    assertEquals(
        new CopybookModel(copybookNested.toCopybookId(DOCUMENT_URI), copybookNested, null, null),
        nestedCpy);

    // Notify that analysis finished sending the document URI and copybook names that have nested
    // copybooks
    CopyBookDTO invalidCopybook = new CopyBookDTO(copybookInvalid);
    CopyBookDTO nestedCopybook = new CopyBookDTO(copybookNested);
    copybookService.sendCopybookDownloadRequest(
        DOCUMENT_URI, asList(PARENT_CPY_URI, DOCUMENT_URI), ENABLED);
    verify(client, times(1))
        .downloadCopybooks(DOCUMENT_URI.toString(), asList(invalidCopybook, nestedCopybook), true);
  }

  @Test
  void testPredefinedCopybooksResolvedInsteadOfStaticOnes() {
    final String copybookName = PredefinedCopybooks.Copybook.SQLCA.name();
    final String copybookUri = "file:///c:/workspace/.c4z/.copybooks/" + copybookName + ".cpy";

    when(client.resolveCopybook(DOCUMENT_URI.toString(), copybookName, "COBOL"))
        .thenReturn(supplyAsync(() -> copybookUri));
    when(files.fileExists(Paths.get("/c:/workspace/.c4z/.copybooks/SQLCA.cpy"))).thenReturn(true);
    when(files.getContentByPath(Paths.get("/c:/workspace/.c4z/.copybooks/SQLCA.cpy"))).thenReturn("content");

    CopybookServiceImpl copybookService = createCopybookService();
    // Assert the copybook was resolved from the workspace
    final CopybookModel model =
        copybookService
            .resolve(
                CopybookId.fromString(copybookName),
                new CopybookName(copybookName),
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();

    // Assert the copybook was resolved from the workspace
    assertEquals(copybookUri, model.getUri().toString());
    assertEquals("content", model.getContent());
    verify(client, times(1)).resolveCopybook(DOCUMENT_URI.toString(), copybookName, "COBOL");

    // Assert the copybook was not added to the download queue
    assertTrue(copybookService.getCopybooksForDownloading().isEmpty());
  }

  private CopybookServiceImpl createCopybookService() {
    ClientProvider provider = new ClientProvider();
    provider.setClient(client);
    return new CopybookServiceImpl(
        provider, files, new CopybookCache(3, 3, "HOURS"));
  }

  private CopybookName createCopybook(String displayName) {
    return CopybookName.builder().displayName(displayName).build();
  }

  @Test
  void store() {
    CopybookName copybookName = createCopybook(VALID_CPY_NAME);
    CopybookService copybookService = createCopybookService();
    CopybookModel copybookModel =
        copybookService
            .resolve(
                CopybookId.fromString(copybookName.getDisplayName()),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                null)
            .getResult();
    CopybookModel resolve;
    resolve =
        copybookService
            .resolve(
                copybookName.toCopybookId(DOCUMENT_2_URI),
                copybookName,
                DOCUMENT_2_URI,
                DOCUMENT_2_URI,
                null)
            .getResult();
    assertNull(resolve.getContent());
    copybookService.store(copybookModel, null);
    resolve =
        copybookService
            .resolve(
                CopybookId.fromString(copybookName.getDisplayName()),
                copybookName,
                    DOCUMENT_URI,
                    DOCUMENT_URI,
                null)
            .getResult();
    assertEquals(CONTENT, resolve.getContent());
  }

  @Test
  void whenErrorInPreprocessOfCopybook_thenResolveReturnsPreprocessErrors() {
    CopybookName copybookName = createCopybook(VALID_CPY_NAME);
    CopybookService copybookService = createCopybookService();
    String copybookContent = "SOME TEXT";
    SyntaxError expectedSyntaxError =
        SyntaxError.syntaxError()
            .location(new OriginalLocation(null, VALID_CPY_NAME))
            .suggestion("some suggestion")
            .severity(ErrorSeverity.ERROR)
            .build();
    when(preprocessor.cleanUpCode(any(Uri.class), anyString()))
        .thenReturn(
            new ResultWithErrors<>(
                new ExtendedText(copybookContent, null),
                Collections.singletonList(expectedSyntaxError)));

    ResultWithErrors<CopybookModel> resolvedCopybook =
        copybookService.resolve(
            CopybookId.fromString(copybookName.getDisplayName()),
            copybookName,
            DOCUMENT_URI,
            DOCUMENT_URI,
            preprocessor);

    CopybookModel copybookModel = resolvedCopybook.getResult();
    assertEquals(copybookModel.getContent(), copybookContent);
    assertEquals(resolvedCopybook.getErrors().get(0), expectedSyntaxError);
  }
}
