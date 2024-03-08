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
package org.eclipse.lsp.cobol.service.delegates.hover;

import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp4j.TextDocumentIdentifier;
import org.eclipse.lsp4j.TextDocumentPositionParams;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 *  Test {@link CopybookHoverProvider}
 */
@ExtendWith(MockitoExtension.class)
class CopybookHoverProviderTest {
    @Mock
    private UriDecodeService uriDecodeService;
    private CopybookHoverProvider copybookHoverProvider;

    @BeforeEach
    void setUp() {
        copybookHoverProvider = new CopybookHoverProvider(uriDecodeService);
    }

    @Test
    void testGetHover() {
        TextDocumentPositionParams position = mock(TextDocumentPositionParams.class);
        when(position.getTextDocument()).thenReturn(mock(TextDocumentIdentifier.class));
        SourceUnitGraph sourceUnitGraph = mock(SourceUnitGraph.class);
        copybookHoverProvider.getHover(mock(CobolDocumentModel.class), position, sourceUnitGraph);

        verify(sourceUnitGraph, times(1)).isCopybook(any());
    }

    @Test
    void testGetHover_graphIsCopybook() {
        TextDocumentPositionParams position = mock(TextDocumentPositionParams.class);
        when(position.getTextDocument()).thenReturn(mock(TextDocumentIdentifier.class));
        SourceUnitGraph sourceUnitGraph = mock(SourceUnitGraph.class);
        when(sourceUnitGraph.isCopybook(any())).thenReturn(true);
        SourceUnitGraph.NodeV nodeV = mock(SourceUnitGraph.NodeV.class);
        List<SourceUnitGraph.NodeV> containedCopybookNode =  new ArrayList<>();
        containedCopybookNode.add(nodeV);
        when(sourceUnitGraph.getInjectedCopybookNode(any(), any())).thenReturn(containedCopybookNode);
        when(containedCopybookNode.get(0).getContent()).thenReturn("Content");
        copybookHoverProvider.getHover(mock(CobolDocumentModel.class), position, sourceUnitGraph);

        verify(nodeV, times(1)).getContent();
    }
}
