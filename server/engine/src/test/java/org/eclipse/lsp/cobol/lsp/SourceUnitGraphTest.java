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

import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Stream;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.io.ResolveFileContent;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp.cobol.lsp.analysis.AnalysisState;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
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
  @Mock private AsyncAnalysisService asyncAnalysisService;

  @Test
  void testNotifyState() {
    ResolveFileContent resolveFileContent = mock(ResolveFileContent.class);
    when(resolveFileContent.getFileContent(anyString()))
        .thenReturn(CompletableFuture.completedFuture("some dummy text"));
    SourceUnitGraph sourceUnitGraph = new SourceUnitGraph(resolveFileContent);
    String initialDocumentText = "sample text for test";
    String updatedContent = "Updated content";
    sourceUnitGraph.notifyState(
        AnalysisState.STARTED, new CobolDocumentModel(URI, initialDocumentText));

    assertEquals(initialDocumentText, sourceUnitGraph.getContent(URI));
    assertTrue(sourceUnitGraph.isFileOpened(URI));
    assertFalse(sourceUnitGraph.isUserSuppliedCopybook(URI));

    sourceUnitGraph.updateContent(URI, updatedContent);
    assertEquals(updatedContent, sourceUnitGraph.getContent(URI));
    assertTrue(sourceUnitGraph.getAllAssociatedFilesForACopybook(URI).isEmpty());
  }

  @Test
  void testLinksBetweenCopybookAndSourceCode() {
    String copy1Uri = "file://copy1.cpy";
    String copy2Uri = "file://copy2.cpy";
    String copy3Uri = "file://copy3.cpy";
    ResolveFileContent resolveFileContent = mock(ResolveFileContent.class);
    when(resolveFileContent.getFileContent(anyString()))
        .thenReturn(CompletableFuture.completedFuture("some dummy text"));
    SourceUnitGraph sourceUnitGraph = new SourceUnitGraph(resolveFileContent);
    RootNode rootNode = mock(RootNode.class);
    CopyNode copyNode1 =
        new CopyNode(
            Locality.builder().uri(URI).build(),
            new Location(URI, new Range(new Position(2, 7), new Position(2, 14))),
            "COPY1",
            copy1Uri);
    CopyNode copyNode2 =
        new CopyNode(
            Locality.builder().uri(copy1Uri).build(),
            new Location(copy1Uri, new Range(new Position(0, 7), new Position(0, 14))),
            "COPY2",
            copy2Uri);
    CopyNode copyNode3 =
        new CopyNode(
            Locality.builder().uri(copy2Uri).build(),
            new Location(copy2Uri, new Range(new Position(0, 7), new Position(0, 16))),
            "COPY3",
            copy3Uri);
    when(rootNode.getDepthFirstStream()).thenReturn(Stream.of(copyNode1, copyNode2, copyNode3));
    AnalysisResult analysisResult = AnalysisResult.builder().rootNode(rootNode).build();
    CobolDocumentModel model = new CobolDocumentModel(URI, "text", analysisResult);
    sourceUnitGraph.notifyState(AnalysisState.COMPLETED, model);

    assertEquals("some dummy text", sourceUnitGraph.getCopyNodeContent(copyNode3));
    assertTrue(sourceUnitGraph.isUserSuppliedCopybook(copy1Uri));
    assertTrue(sourceUnitGraph.isUserSuppliedCopybook(copy2Uri));
    assertTrue(sourceUnitGraph.isUserSuppliedCopybook(copy3Uri));
    assertFalse(sourceUnitGraph.isUserSuppliedCopybook(URI));

    List<SourceUnitGraph.NodeV> injectedCopybookNode =
        sourceUnitGraph.getInjectedCopybookNode(URI, new Position(2, 9));
    assertEquals(1, injectedCopybookNode.size());
    assertEquals(copy1Uri, injectedCopybookNode.get(0).getUri());
    List<String> allAssociatedFilesForACopybook =
        sourceUnitGraph.getAllAssociatedFilesForACopybook(copy3Uri);
    assertEquals(1, allAssociatedFilesForACopybook.size());
    assertEquals(URI, allAssociatedFilesForACopybook.get(0));
  }
}
