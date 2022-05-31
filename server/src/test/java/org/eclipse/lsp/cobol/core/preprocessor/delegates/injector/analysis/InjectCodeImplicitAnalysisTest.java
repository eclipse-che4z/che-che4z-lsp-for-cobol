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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonPrimitive;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.DialectType;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.FileContentProvider;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.copybooks.*;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.URI;
import java.nio.file.Path;

import static java.util.Collections.singletonList;
import static java.util.concurrent.CompletableFuture.supplyAsync;
import static org.eclipse.lsp.cobol.service.SQLBackend.DB2_SERVER;
import static org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode.ENABLED;
import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;
import static org.mockito.Mockito.mock;

/**
 * Test for PredefinedCopybookAnalysis class
 */
class InjectCodeImplicitAnalysisTest {

  private static final String VALID_CPY_NAME = "VALIDNAME";
  private static final String VALID_CPY_URI =
      "file:///c%3A/workspace/.c4z/.copybooks/VALIDNAME.CPY";
  private static final String INVALID_CPY_NAME = "INVALID";
  private static final String PARENT_CPY_URI = "file:///c%3A/workspace/.c4z/.copybooks/PARENT.CPY";
  private static final String CONTENT = "content";
  private static final String DFHEIBLC = "DFHEIBLC";
  private static final String SPECIALREGISTERS = "SPECIALREGISTERS";

  private final SettingsService settingsService = mock(SettingsService.class);
  private final FileSystemService files = mock(FileSystemService.class);
  private final TextPreprocessor preprocessor = mock(TextPreprocessor.class);
  private final MessageService messageService = mock(MessageService.class);
  private final Path cpyPath = mock(Path.class);
  private final Path parentPath = mock(Path.class);
  private CopybookConfig cpyConfig;

  @BeforeEach
  void setupMocks() throws IOException {
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
    when(files.readFromInputStream(any(), any())).thenReturn(CONTENT);

    cpyConfig = new CopybookConfig(ENABLED, DB2_SERVER, ImmutableList.of());
  }

  /**
   * Test if implicit copybook SPECIALREGISTERS for DB2 is resolved. For simplicity, we consider content is
   * null. Full use case test is in TestSqlIncludeStatementForImplicitlyDefinedCpy
   */
  @Test
  void testSpecialregistersIsResolved() {
    CopybookName copybookName = new CopybookName(SPECIALREGISTERS, DialectType.COBOL.name());
    InjectCodeImplicitAnalysis analysis = createCopybookAnalysis();

    when(files.getNameFromURI(DOCUMENT_URI)).thenReturn("document2");
    when(settingsService.getConfiguration("copybook-resolve", "document2", SPECIALREGISTERS, DialectType.COBOL.name()))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));
    CopybookModel cpy = analysis.getCopybookModel(copybookName, DOCUMENT_URI, DOCUMENT_URI, cpyConfig);

    assertEquals(
        new CopybookModel(copybookName, "implicit:///implicitCopybooks/SPECIALREGISTERS.cpy", CONTENT), cpy);
  }

  /**
   * Test if implicit copybook DFHEIBLC for DB2 is resolved. For simplicity, we consider content is
   * null. Full use case test is in TestSqlIncludeStatementForImplicitlyDefinedCpy
   */
  @Test
  void testDfheiblkIsResolved() {
    CopybookName copybookName = new CopybookName(DFHEIBLC, DialectType.COBOL.name());
    InjectCodeImplicitAnalysis analysis = createCopybookAnalysis();

    when(files.getNameFromURI(DOCUMENT_URI)).thenReturn("document2");
    when(settingsService.getConfiguration("copybook-resolve", "document2", DFHEIBLC, DialectType.COBOL.name()))
        .thenReturn(supplyAsync(() -> singletonList(new JsonPrimitive(""))));
    CopybookModel cpy = analysis.getCopybookModel(copybookName, DOCUMENT_URI, DOCUMENT_URI, cpyConfig);

    assertEquals(
        new CopybookModel(copybookName, "implicit:///implicitCopybooks/DFHEIBLC.cpy", CONTENT), cpy);
  }

  private InjectCodeImplicitAnalysis createCopybookAnalysis() {
    return new InjectCodeImplicitAnalysis(preprocessor,
        new FileContentProvider(files),
        messageService);
  }
}
