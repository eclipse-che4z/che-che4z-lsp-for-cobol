/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonPrimitive;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.DialectType;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.copybooks.*;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.ContentProviderFactory;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;

import static java.util.Collections.singletonList;
import static java.util.concurrent.CompletableFuture.supplyAsync;
import static org.eclipse.lsp.cobol.service.SQLBackend.DATACOM_SERVER;
import static org.eclipse.lsp.cobol.service.SQLBackend.DB2_SERVER;
import static org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode.ENABLED;
import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;
import static org.mockito.Mockito.mock;

/**
 * Test for PredefinedCopybookAnalysis class
 */
class PredefinedCopybookAnalysisTest {

  private static final String VALID_CPY_NAME = "VALIDNAME";
  private static final String VALID_CPY_URI =
      "file:///c%3A/workspace/.c4z/.copybooks/VALIDNAME.CPY";
  private static final String INVALID_CPY_NAME = "INVALID";
  private static final String PARENT_CPY_URI = "file:///c%3A/workspace/.c4z/.copybooks/PARENT.CPY";
  private static final String CONTENT = "content";
  private static final String SQLCA = "SQLCA";
  private static final String DOCUMENT_3_URI = "implicit:///implicitCopybooks/SQLCA_DB2.cpy";
  private static final String DFHEIBLC = "DFHEIBLC";

  private final SettingsService settingsService = mock(SettingsService.class);
  private final FileSystemService files = mock(FileSystemService.class);
  private final TextPreprocessor preprocessor = mock(TextPreprocessor.class);
  private final MessageService messageService = mock(MessageService.class);
  private final ContentProviderFactory contentProviderFactory = new ContentProviderFactory(files);
  private final Path cpyPath = mock(Path.class);
  private final Path parentPath = mock(Path.class);
  private CopybookConfig cpyConfig;

  @BeforeEach
  void setupMocks() {
    when(settingsService.getConfiguration("copybook-resolve", "document", VALID_CPY_NAME, DialectType.COBOL.name()))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(VALID_CPY_URI))));
    when(settingsService.getConfiguration("copybook-resolve", "document", INVALID_CPY_NAME, DialectType.COBOL.name()))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));

    when(cpyPath.toUri()).thenReturn(URI.create(VALID_CPY_URI));
    when(parentPath.toUri()).thenReturn(URI.create(PARENT_CPY_URI));

    when(files.getNameFromURI(VALID_CPY_URI)).thenReturn(VALID_CPY_NAME);
    when(files.getNameFromURI(DOCUMENT_URI)).thenReturn("document");
    when(files.getPathFromURI(VALID_CPY_URI)).thenReturn(cpyPath);
    when(files.getContentByPath(cpyPath)).thenReturn(CONTENT);
    when(files.fileExists(cpyPath)).thenReturn(true);
    when(files.fileExists(parentPath)).thenReturn(true);

    cpyConfig = new CopybookConfig(ENABLED, DB2_SERVER, ImmutableList.of());
  }

  /**
   * Test if implicit copybook SQLCA for DB2 is resolved. For simplicity, we consider content is
   * null. Full use case test is in TestSqlIncludeStatementForImplicitlyDefinedCpy
   */
  @Test
  void testServiceResolvesImplicitCopybook() {
    CopybookName copybookName = new CopybookName(SQLCA, DialectType.COBOL.name());
    PredefinedCopybookAnalysis analysis = createCopybookAnalysis();

    when(files.getNameFromURI(DOCUMENT_3_URI)).thenReturn("document2");
    when(settingsService.getConfiguration("copybook-resolve", "document2", SQLCA, DialectType.COBOL.name()))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));
    CopybookModel cpy = analysis.getCopybookModel(copybookName, DOCUMENT_3_URI, DOCUMENT_3_URI, cpyConfig);

    assertEquals(new CopybookModel(copybookName, DOCUMENT_3_URI, null), cpy);
  }

  /** Test if implicit copybook SQLCA for DATACOM is resolved. */
  @Test
  void testServiceResolvesImplicitCopybookForDataCom() {
    CopybookName copybookName = new CopybookName(SQLCA, DialectType.COBOL.name());
    PredefinedCopybookAnalysis analysis = createCopybookAnalysis();

    when(files.getNameFromURI(DOCUMENT_URI)).thenReturn("document2");
    when(settingsService.getConfiguration("copybook-resolve", "document2", SQLCA, DialectType.COBOL.name()))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));
    CopybookModel cpy =
        analysis.getCopybookModel(copybookName, DOCUMENT_URI, DOCUMENT_URI, new CopybookConfig(ENABLED, DATACOM_SERVER, ImmutableList.of()));

    assertEquals(
        new CopybookModel(copybookName, "implicit:///implicitCopybooks/SQLCA_DATACOM.cpy", null), cpy);
  }

  @Test
  void testPredefinedCopybooksLoaded() throws IOException {
    final String copybookName = PredefinedCopybooks.Copybook.SQLCA.name();
    PredefinedCopybookAnalysis analysis = createCopybookAnalysis();
    when(settingsService.getConfiguration("copybook-resolve", "document", copybookName, DialectType.COBOL.name()))
        .thenReturn(supplyAsync(() -> ImmutableList.of(new JsonPrimitive(""))));
    final CopybookModel model =
        analysis.getCopybookModel(
            new CopybookName(copybookName, DialectType.COBOL.name()), DOCUMENT_URI, DOCUMENT_URI, new CopybookConfig(ENABLED, DB2_SERVER, ImmutableList.of()));

    assertEquals("implicit:///implicitCopybooks/SQLCA_DB2.cpy", model.getUri());
    verify(files, times(1)).readFromInputStream(any(), eq(StandardCharsets.UTF_8));
  }

  /**
   * Test if implicit copybook SQLCA for DB2 is resolved. For simplicity, we consider content is
   * null. Full use case test is in TestSqlIncludeStatementForImplicitlyDefinedCpy
   */
  @Test
  void testDfheiblkIsResolved() {
    CopybookName copybookName = new CopybookName(DFHEIBLC, DialectType.COBOL.name());
    PredefinedCopybookAnalysis analysis = createCopybookAnalysis();

    when(files.getNameFromURI(DOCUMENT_3_URI)).thenReturn("document2");
    when(settingsService.getConfiguration("copybook-resolve", "document2", DFHEIBLC, DialectType.COBOL.name()))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));
    CopybookModel cpy = analysis.getCopybookModel(copybookName, DOCUMENT_3_URI, DOCUMENT_3_URI, cpyConfig);

    assertEquals(
        new CopybookModel(copybookName, "implicit:///implicitCopybooks/DFHEIBLC.cpy", null), cpy);
  }

  private PredefinedCopybookAnalysis createCopybookAnalysis() {
    return new PredefinedCopybookAnalysis(preprocessor,
        contentProviderFactory,
        messageService,
        new CopybookCache(3, 3, "HOURS"));
  }
}
