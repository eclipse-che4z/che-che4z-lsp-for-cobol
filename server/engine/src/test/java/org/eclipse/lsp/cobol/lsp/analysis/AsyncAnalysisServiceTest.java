/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.analysis;

import static org.mockito.Mockito.*;

import com.google.common.collect.ImmutableList;
import java.lang.reflect.Field;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookServiceImpl;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

/**
 *  Test {@link AsyncAnalysisService}
 */
@ExtendWith(MockitoExtension.class)
class AsyncAnalysisServiceTest {
    @Mock
    private DocumentModelService documentModelService;
    @Mock
    private AnalysisService analysisService;
    @Mock
    private CopybookServiceImpl copybookService;
    @Mock
    private SubroutineService subroutineService;
    @Mock
    private Communications communication;

    private AsyncAnalysisService asyncAnalysisService;

    @BeforeEach
    void setUp() {
        asyncAnalysisService = new AsyncAnalysisService(documentModelService, analysisService, copybookService,
                subroutineService, communication);
    }

    @Test
    void testReanalyseOpenedPrograms() {
        try {
            asyncAnalysisService.reanalyseOpenedPrograms();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        verify(copybookService, times(1)).invalidateCache();
        verify(subroutineService, times(1)).invalidateCache();
    }

    @Test
    void testReanalyseCopybooksAssociatedPrograms() {
        Map<String, Integer> analysisResultsRevisionsMock = mock(Map.class);
        try {
            Field field = AsyncAnalysisService.class.getDeclaredField("analysisResultsRevisions");
            field.setAccessible(true);
            field.set(asyncAnalysisService, analysisResultsRevisionsMock);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        List<String> uris = Stream.of("URI1", "URI2").collect(Collectors.toList());
        SourceUnitGraph.EventSource eventSource = mock(SourceUnitGraph.EventSource.class);
        CobolDocumentModel cobolDocumentModel = mock(CobolDocumentModel.class);
        when(cobolDocumentModel.getUri()).thenReturn("URI1");
        when(cobolDocumentModel.getText()).thenReturn("code");
        when(documentModelService.getAllOpened()).thenReturn(ImmutableList.of(cobolDocumentModel));
        when(documentModelService.get(any())).thenReturn(cobolDocumentModel);
        when(analysisService.isCopybook(anyString(), anyString())).thenReturn(false);
        when(analysisResultsRevisionsMock.get(cobolDocumentModel.getUri())).thenReturn(1);
        asyncAnalysisService.reanalyseCopybooksAssociatedPrograms(uris, "copybookUri", "copybookContent", eventSource);

        verify(cobolDocumentModel, times(2)).getText();
    }

    @Test
    void testCancelAnalysis() {
        try {
            asyncAnalysisService.cancelAnalysis("URI");
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        verify(communication, times(1)).publishDiagnostics(any());
    }
}
