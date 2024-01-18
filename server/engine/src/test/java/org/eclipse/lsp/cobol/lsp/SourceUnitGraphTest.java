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
package org.eclipse.lsp.cobol.lsp;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Stream;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.file.WorkspaceFileService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.lsp.analysis.AnalysisState;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

/** Test {@link SourceUnitGraph} */
@ExtendWith(MockitoExtension.class)
class SourceUnitGraphTest {
  public static final String URI = "file://document.cbl";
  @Mock private WorkspaceFileService fileService;
  @Mock private AsyncAnalysisService asyncAnalysisService;
  @Mock private UriDecodeService uriDecodeService;

  @Test
  void testNotifyState() {
    SourceUnitGraph sourceUnitGraph =
        new SourceUnitGraph(fileService, asyncAnalysisService, uriDecodeService);
    String initialDocumentText = "sample text for test";
    String updatedContent = "Updated content";
    sourceUnitGraph.notifyState(
        AnalysisState.STARTED,
        new CobolDocumentModel(URI, initialDocumentText),
        SourceUnitGraph.EventSource.FILE_SYSTEM);

    assertEquals(initialDocumentText, sourceUnitGraph.getContent(URI));
    assertTrue(sourceUnitGraph.isFileOpened(URI));
    assertFalse(sourceUnitGraph.isCopybook(URI));

    sourceUnitGraph.updateContent(URI, updatedContent);
    assertEquals(updatedContent, sourceUnitGraph.getContent(URI));
    assertTrue(sourceUnitGraph.getAllAssociatedFilesForACopybook(URI).isEmpty());
  }

  @Test
  void testLinksBetweenCopybookAndSourceCode() {
    String COPY1_URI = "file://copy1.cpy";
    String COPY2_URI = "file://copy2.cpy";
    String COPY3_URI = "file://copy3.cpy";
    SourceUnitGraph sourceUnitGraph =
        new SourceUnitGraph(fileService, asyncAnalysisService, uriDecodeService);
    Node rootNode = mock(Node.class);
    when(fileService.getPathFromURI(anyString())).thenReturn(Paths.get(""));
    when(fileService.getContentByPath(any()))
        .thenReturn("COPY 1 TEXT")
        .thenReturn("COPY 2 TEXT")
        .thenReturn("COPY 3 TEXT");
    CopyNode copyNode1 =
        new CopyNode(
            Locality.builder().uri(URI).build(),
            new Location(URI, new Range(new Position(2, 7), new Position(2, 14))),
            "COPY1",
            COPY1_URI);
    CopyNode copyNode2 =
        new CopyNode(
            Locality.builder().uri(COPY1_URI).build(),
            new Location(COPY1_URI, new Range(new Position(0, 7), new Position(0, 14))),
            "COPY2",
            COPY2_URI);
    CopyNode copyNode3 =
        new CopyNode(
            Locality.builder().uri(COPY2_URI).build(),
            new Location(COPY2_URI, new Range(new Position(0, 7), new Position(0, 16))),
            "COPY3",
            COPY3_URI);
    when(rootNode.getDepthFirstStream()).thenReturn(Stream.of(copyNode1, copyNode2, copyNode3));
    AnalysisResult analysisResult = AnalysisResult.builder().rootNode(rootNode).build();
    CobolDocumentModel model = new CobolDocumentModel(URI, "text", analysisResult);
    sourceUnitGraph.notifyState(
        AnalysisState.COMPLETED, model, SourceUnitGraph.EventSource.FILE_SYSTEM);

    assertEquals("COPY 3 TEXT", sourceUnitGraph.getCopyNodeContent(copyNode3));
    assertTrue(sourceUnitGraph.isCopybook(COPY1_URI));
    assertTrue(sourceUnitGraph.isCopybook(COPY2_URI));
    assertTrue(sourceUnitGraph.isCopybook(COPY3_URI));
    assertFalse(sourceUnitGraph.isCopybook(URI));

    List<SourceUnitGraph.NodeV> injectedCopybookNode =
        sourceUnitGraph.getInjectedCopybookNode(URI, new Position(2, 9));
    assertEquals(1, injectedCopybookNode.size());
    assertEquals(COPY1_URI, injectedCopybookNode.get(0).getUri());
    List<String> allAssociatedFilesForACopybook =
        sourceUnitGraph.getAllAssociatedFilesForACopybook(COPY3_URI);
    assertEquals(1, allAssociatedFilesForACopybook.size());
    assertEquals(URI, allAssociatedFilesForACopybook.get(0));
  }
}
