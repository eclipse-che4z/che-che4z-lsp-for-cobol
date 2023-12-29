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
import java.net.URI;
import java.nio.file.Path;
import java.util.Collections;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.file.FileSystemService;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.utils.PredefinedCopybooks;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.providers.ClientProvider;
import org.eclipse.lsp4j.services.LanguageClient;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * This unit tests check the of the {@link CopybookServiceImpl} how it resolves the copybook
 * requests.
 */
class CopybookServiceTest {
  private static final String VALID_CPY_NAME = "VALIDNAME";
  private static final String VALID_CPY_URI = "file:///c:/workspace/.c4z/.copybooks/VALIDNAME.CPY";
  private static final String INVALID_CPY_NAME = "INVALID";
  private static final String INVALID_2_CPY_NAME = "INVALID_2";
  private static final String PARENT_CPY_NAME = "PARENT";
  private static final String PARENT_CPY_URI = "file:///c:/workspace/.c4z/.copybooks/PARENT.CPY";
  private static final String PARENT_CONTENT = "         COPY NESTED.";
  private static final String NESTED_CPY_NAME = "nested";
  private static final String CONTENT = "content";
  private static final String SQLCA = "SQLCA";
  private static final String SQLDA = "SQLDA";
  private static final String DOCUMENT_2_URI = "file:///c:/workspace/document2.cbl";
  private static final String DOCUMENT_3_URI = "implicit:///implicitCopybooks/SQLCA_DB2.cpy";
  private static final String COPYBOOK_3_NAME = "SQLCA_DB2";
  private final CobolLanguageClient client = mock(CobolLanguageClient.class);
  private final FileSystemService files = mock(FileSystemService.class);
  private final TextPreprocessor preprocessor = mock(TextPreprocessor.class);
  private final Path cpyPath = mock(Path.class);
  private final Path parentPath = mock(Path.class);

  @BeforeEach
  void setupMocks() throws IOException {

    when(client.resolveCopybook(DOCUMENT_URI, VALID_CPY_NAME, "COBOL"))
        .thenReturn(supplyAsync(() -> VALID_CPY_URI));
    when(client.resolveCopybook(DOCUMENT_URI, INVALID_CPY_NAME, "COBOL"))
        .thenReturn(supplyAsync(() -> null));

    when(cpyPath.toUri()).thenReturn(URI.create(VALID_CPY_URI));
    when(parentPath.toUri()).thenReturn(URI.create(PARENT_CPY_URI));

    when(files.getNameFromURI(VALID_CPY_URI)).thenReturn(VALID_CPY_NAME);
    when(files.getNameFromURI(DOCUMENT_URI)).thenReturn("document");
    when(files.getPathFromURI(VALID_CPY_URI)).thenReturn(cpyPath);
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
                false)
            .getResult();

    assertEquals(
        new CopybookModel(
            copybookName.toCopybookId(DOCUMENT_URI), copybookName, VALID_CPY_URI, CONTENT),
        copybookModel);
    verify(files, times(2)).getNameFromURI(DOCUMENT_URI);
    verify(files).getPathFromURI(VALID_CPY_URI);
    verify(files).getContentByPath(cpyPath);
  }

  /**
   * Test a main positive scenario when the copybook exists, and the request invoked while copybook
   * analysis is enabled.
   */
  @Test
  void testResponseIfFileNotExists() {
    CopybookName copybookName = createCopybook(VALID_CPY_NAME);
    CopybookService copybookService = createCopybookService();
    when(files.getPathFromURI(VALID_CPY_URI)).thenReturn(null);
    CopybookModel copybookModel =
        copybookService
            .resolve(
                CopybookId.fromString(copybookName.getDisplayName()),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                false)
            .getResult();

    assertEquals(
        new CopybookModel(copybookName.toCopybookId(DOCUMENT_URI), copybookName, null, null),
        copybookModel);
    verify(files, times(3)).getNameFromURI(DOCUMENT_URI);
    verify(files).getPathFromURI(VALID_CPY_URI);
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
                false)
            .getResult();

    assertEquals(
        new CopybookModel(copybookName.toCopybookId(DOCUMENT_URI), copybookName, null, null),
        copybookModel);
    verify(files, times(2)).getNameFromURI(DOCUMENT_URI);
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
                false)
            .getResult();
    CopybookModel copybookModelSkipped =
        copybookService
            .resolve(
                CopybookId.fromString(copybookName.getDisplayName()),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                false)
            .getResult();

    verify(files, times(1)).getContentByPath(cpyPath);
    verify(files, times(2)).getNameFromURI(DOCUMENT_URI);
    verify(files, times(1)).getPathFromURI(VALID_CPY_URI);

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
                false)
            .getResult();
    assertEquals(
        new CopybookModel(
            copybookName.toCopybookId(DOCUMENT_URI), copybookName, VALID_CPY_URI, CONTENT),
        copybookModel);

    copybookService.invalidateCache();

    copybookModel =
        copybookService
            .resolve(
                copybookName.toCopybookId(DOCUMENT_URI),
                copybookName,
                DOCUMENT_URI,
                DOCUMENT_URI,
                false)
            .getResult();
    assertEquals(
        new CopybookModel(
            copybookName.toCopybookId(DOCUMENT_URI), copybookName, VALID_CPY_URI, CONTENT),
        copybookModel);

    verify(files, times(2)).getContentByPath(cpyPath);
    verify(files, times(4)).getNameFromURI(DOCUMENT_URI);
    verify(files, times(2)).getPathFromURI(VALID_CPY_URI);
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
                false)
            .getResult();

    assertEquals(
        new CopybookModel(copybookName.toCopybookId(DOCUMENT_URI), copybookName, null, null),
        copybookModel);
    verify(files, times(2)).getNameFromURI(DOCUMENT_URI);
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

    when(files.getNameFromURI(DOCUMENT_2_URI)).thenReturn("document2");
    when(client.resolveCopybook(DOCUMENT_2_URI, INVALID_2_CPY_NAME, "COBOL"))
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
                false)
            .getResult();
    CopybookName copybookValid = createCopybook(VALID_CPY_NAME);
    CopybookModel validCpy =
        copybookService
            .resolve(
                CopybookId.fromString(VALID_CPY_NAME),
                copybookValid,
                DOCUMENT_URI,
                DOCUMENT_URI,
                false)
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
                false)
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

    // First document parsing done
    copybookService.sendCopybookDownloadRequest(DOCUMENT_URI, emptyList(), ENABLED);
    verify(client, times(1))
        .downloadCopybooks("document", ImmutableList.of(INVALID_CPY_NAME), "COBOL", true);

    // Others parsing done events for first document are not trigger settingsService
    copybookService.sendCopybookDownloadRequest(DOCUMENT_URI, emptyList(), ENABLED);

    verify(client, times(1))
        .downloadCopybooks("document", ImmutableList.of(INVALID_CPY_NAME), "COBOL", true);

    // Second document parsing done
    copybookService.sendCopybookDownloadRequest(DOCUMENT_2_URI, emptyList(), ENABLED);
    verify(client, times(1))
        .downloadCopybooks("document2", ImmutableList.of(INVALID_2_CPY_NAME), "COBOL", true);
  }

  /** Test that the service resolves the SQLDA predefined copybook */
  @Test
  void testSqldaCopybookResolutionDoesNotRelyOnBackend() {
    CopybookName copybookName = new CopybookName(SQLDA);
    CopybookServiceImpl copybookService = createCopybookService();

    when(files.getNameFromURI(DOCUMENT_URI)).thenReturn("document2");
    when(client.resolveCopybook("document2", SQLCA, "COBOL")).thenReturn(supplyAsync(() -> null));

    assertEquals(
        copybookService.resolve(
            CopybookId.fromString(copybookName.getDisplayName()),
            copybookName,
            DOCUMENT_URI,
            DOCUMENT_URI,
            false),
        copybookService.resolve(
            CopybookId.fromString(copybookName.getDisplayName()),
            copybookName,
            DOCUMENT_URI,
            DOCUMENT_URI,
            false));
  }

  /**
   * Test the service collects all the copybooks that were not resolved and sends a request to
   * resolve all of them, including nested ones
   */
  @Test
  void testServiceSendsDownloadingRequestForAllNotResolvedCopybooks() {
    CopybookServiceImpl copybookService = createCopybookService();

    when(files.getNameFromURI(PARENT_CPY_URI)).thenReturn(PARENT_CPY_NAME);
    when(files.getPathFromURI(PARENT_CPY_URI)).thenReturn(parentPath);
    when(files.getContentByPath(parentPath)).thenReturn(PARENT_CONTENT);
    when(files.getContentByPath(parentPath)).thenReturn(PARENT_CONTENT);

    when(client.resolveCopybook(DOCUMENT_URI, NESTED_CPY_NAME, "COBOL"))
        .thenReturn(supplyAsync(() -> null));
    when(client.resolveCopybook(DOCUMENT_URI, PARENT_CPY_NAME, "COBOL"))
        .thenReturn(supplyAsync(() -> PARENT_CPY_URI));

    CopybookName copybookInvalid = createCopybook(INVALID_CPY_NAME);
    CopybookModel invalidCpy =
        copybookService
            .resolve(
                copybookInvalid.toCopybookId(DOCUMENT_URI),
                copybookInvalid,
                DOCUMENT_URI,
                DOCUMENT_URI,
                false)
            .getResult();
    CopybookName copybookParent = createCopybook(PARENT_CPY_NAME);
    CopybookModel parentCpy =
        copybookService
            .resolve(
                copybookParent.toCopybookId(DOCUMENT_URI),
                copybookParent,
                DOCUMENT_URI,
                DOCUMENT_URI,
                false)
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
                false)
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
    copybookService.sendCopybookDownloadRequest(
        DOCUMENT_URI, asList(PARENT_CPY_URI, DOCUMENT_URI), ENABLED);
    verify(client, times(1))
        .downloadCopybooks("document", asList(INVALID_CPY_NAME, NESTED_CPY_NAME), "COBOL", true);
  }

  @Test
  void testPredefinedCopybooksResolvedInsteadOfStaticOnes() {
    final String copybookName = PredefinedCopybooks.Copybook.SQLCA.name();
    final String copybookUri = "file:///c:/workspace/.c4z/.copybooks/" + copybookName + ".cpy";

    when(client.resolveCopybook(DOCUMENT_URI, copybookName, "COBOL"))
        .thenReturn(supplyAsync(() -> copybookUri));
    when(files.getPathFromURI(copybookUri)).thenReturn(cpyPath);
    when(files.fileExists(cpyPath)).thenReturn(true);
    when(files.getContentByPath(cpyPath)).thenReturn("content");

    CopybookServiceImpl copybookService = createCopybookService();
    // Assert the copybook was resolved from the workspace
    final CopybookModel model =
        copybookService
            .resolve(
                CopybookId.fromString(copybookName),
                new CopybookName(copybookName),
                DOCUMENT_URI,
                DOCUMENT_URI,
                false)
            .getResult();

    // Assert the copybook was resolved from the workspace
    assertEquals(copybookUri, model.getUri());
    assertEquals("content", model.getContent());
    verify(client, times(1)).resolveCopybook(DOCUMENT_URI, copybookName, "COBOL");

    // Assert the copybook was not added to the download queue
    assertTrue(copybookService.getCopybooksForDownloading().isEmpty());
  }

  private CopybookServiceImpl createCopybookService() {
    ClientProvider provider = new ClientProvider();
    provider.setClient(client);
    return new CopybookServiceImpl(
        provider, files, preprocessor, new CopybookCache(3, 3, "HOURS"));
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
                false)
            .getResult();
    CopybookModel resolve;
    resolve =
        copybookService
            .resolve(
                copybookName.toCopybookId(DOCUMENT_2_URI),
                copybookName,
                DOCUMENT_2_URI,
                DOCUMENT_2_URI,
                false)
            .getResult();
    assertNull(resolve.getContent());
    copybookService.store(copybookModel, false);
    resolve =
        copybookService
            .resolve(
                CopybookId.fromString(copybookName.getDisplayName()),
                copybookName,
                    DOCUMENT_URI,
                    DOCUMENT_URI,
                false)
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
    when(preprocessor.cleanUpCode(anyString(), anyString()))
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
            true);

    CopybookModel copybookModel = resolvedCopybook.getResult();
    assertEquals(copybookModel.getContent(), copybookContent);
    assertEquals(resolvedCopybook.getErrors().get(0), expectedSyntaxError);
  }
}
