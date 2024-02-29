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

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

import com.google.common.collect.ImmutableList;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.LanguageEngineFacade;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp.cobol.service.copybooks.CopybookIdentificationService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.settings.ConfigurationService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

/**
 * Test for AnalysisService
 */
@ExtendWith(MockitoExtension.class)
class AnalysisServiceTest {
  private AnalysisService service;
  @Mock
  private LanguageEngineFacade engine;
  @Mock
  private ConfigurationService configurationService;
  @Mock
  private CopybookIdentificationService copybookIdentificationService;
  @Mock
  private Communications communications;
  @Mock
  private DocumentModelService documentService;
  @Mock
  private CopybookService copybookService;

  @BeforeEach
  void init() {
    service =
            new AnalysisService(engine,
                    configurationService,
                    copybookIdentificationService,
                    copybookService, documentService
            );
    service.setExtensionConfig(ImmutableList.of());
  }

  @Test
  void testIsCopybook() throws InterruptedException {
    service =
            new AnalysisService(engine,
                    configurationService,
                    copybookIdentificationService,
                    copybookService, documentService
            );

    CompletableFuture<Boolean> booleanCompletableFuture = CompletableFuture.supplyAsync(() -> service.isCopybook("", ""));

    Thread.sleep(10);
    verify(copybookIdentificationService, times(0)).isCopybook(any(), any(), any());

    service.setExtensionConfig(ImmutableList.of());

    booleanCompletableFuture.join();
    verify(copybookIdentificationService, times(1)).isCopybook(any(), any(), any());
  }

  @Test
  void testAnalyzeDocument_copybook() {
    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();
    when(copybookIdentificationService.isCopybook(any(), any(), any())).thenReturn(true);

    service.analyzeDocument(uri, text, true);
    verify(documentService, times(0)).processAnalysisResult(eq(uri), any(), anyString());
    verify(engine, times(0)).analyze(any(), any(), any());
  }

  @Test
  void testAnalyzeDocument_program() {
    AnalysisResult result = mock(AnalysisResult.class);
    when(result.getRootNode()).thenReturn(new RootNode());

    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();
    when(copybookIdentificationService.isCopybook(any(), any(), any())).thenReturn(false);
    when(engine.analyze(any(), any(), any())).thenReturn(result);

    service.analyzeDocument(uri, text, true);
    verify(documentService, times(1)).processAnalysisResult(eq(uri), any(), anyString());
    verify(engine, times(1)).analyze(any(), any(), any());
  }

  @Test
  void testReanalyzeDocument_copybook() {
    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();
    when(copybookIdentificationService.isCopybook(any(), any(), any())).thenReturn(true);

    service.analyzeDocument(uri, text, false);
    verify(engine, times(0)).analyze(any(), any(), any());
  }

  @Test
  void testReanalyzeDocument_program() {
    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();
    when(copybookIdentificationService.isCopybook(any(), any(), any())).thenReturn(false);
    when(engine.analyze(any(), any(), any())).thenReturn(prepareAnalysisResult());

    service.analyzeDocument(uri, text, false);
    verify(engine, times(1)).analyze(any(), any(), any());
  }

  private AnalysisResult prepareAnalysisResult() {
    return AnalysisResult.builder().rootNode(new RootNode()).build();
  }
}
