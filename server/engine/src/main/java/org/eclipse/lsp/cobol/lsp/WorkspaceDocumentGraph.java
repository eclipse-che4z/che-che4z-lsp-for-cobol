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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Lists;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.file.WorkspaceFileService;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.lsp.analysis.AnalysisState;
import org.eclipse.lsp.cobol.lsp.analysis.AnalysisStateListener;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;

/** Workspace document graph object */
@Singleton
@Slf4j
public class WorkspaceDocumentGraph implements AnalysisStateListener {
  private final WorkspaceFileService fileService;

  // doc-a-uri --> copy-a Node. copy-b node, copy-c node
  // doc-1-uri --> copy-a Node. copy-2 node, copy-3 node
  private final Map<String, List<NodeV>> documentGraph = new ConcurrentHashMap<>();

  // doc-a-uri <==> doc-a node
  // copy-a-uri <--> copy-a node
  private final Map<String, NodeV> objectRef = new ConcurrentHashMap<>();

  // copy-2-uri <--> doc-a-uri, doc-1-uri
  private final Map<String, List<String>> documentGraphIndexedByCopybook =
      new ConcurrentHashMap<>();

  @Inject
  public WorkspaceDocumentGraph(
      WorkspaceFileService fileService, AsyncAnalysisService asyncAnalysisService) {
    this.fileService = fileService;
    asyncAnalysisService.register(ImmutableList.of(this));
  }

  @Override
  public void notifyState(AnalysisState state, CobolDocumentModel model, EventSource eventSource) {
    switch (state) {
      case SKIPPED:
      case STARTED:
      case ANALYSING:
      case SCHEDULED:
        updateDocumentGraphUponSchedule(model, eventSource);
        break;
      case COMPLETED:
        updateDocumentGraphUponCompletion(model, eventSource);
        break;
      case EXCEPTIONALLY_FINISHED:
      default:
    }
  }

  private void updateDocumentGraphUponSchedule(CobolDocumentModel model, EventSource eventSource) {
    updateGraphNodes(model, eventSource);
  }

  private String getContent(CobolDocumentModel model) {
    return Optional.ofNullable(model.getText()).orElse(getContent(model.getUri()));
  }

  private synchronized void updateDocumentGraphUponCompletion(
      CobolDocumentModel model, EventSource eventSource) {
    updateGraphNodes(model, eventSource);

    if (isCopybook(model.getUri()) || model.getAnalysisResult() == null) {
      return;
    }

    List<CopyNode> copyNodes =
        model
            .getAnalysisResult()
            .getRootNode()
            .getDepthFirstStream()
            .filter(CopyNode.class::isInstance)
            .map(CopyNode.class::cast)
            .collect(Collectors.toList());
    List<NodeV> references = new ArrayList<>();
    for (CopyNode copyNode : copyNodes) {
      String parentUri = copyNode.getLocality().getUri();
      NodeV copyNodeV = getNode(copyNode, eventSource);
      objectRef.computeIfPresent(
          copyNode.getUri(),
          (k, v) -> {
            List<Location> referencedLocation = v.getReferencedLocation();
            referencedLocation.add(copyNode.getNameLocation());
            return v;
          });
      objectRef.putIfAbsent(copyNode.getUri(), copyNodeV);
      references.add(copyNodeV);

      documentGraphIndexedByCopybook.putIfAbsent(copyNode.getUri(), new ArrayList<>());
      List<String> strings = documentGraphIndexedByCopybook.get(copyNode.getUri());
      if (!strings.contains(parentUri)) {
        strings.add(parentUri);
      }
    }
    documentGraph.remove(model.getUri());
    documentGraph.put(model.getUri(), references);
  }

  /**
   * Is the passed uri treated as copybook by LSP engine
   *
   * @param uri document uri
   * @return true if copybook, false otherwise.
   */
  public boolean isCopybook(String uri) {
    return documentGraphIndexedByCopybook.containsKey(uri);
  }

  private void updateGraphNodes(CobolDocumentModel model, EventSource eventSource) {
    Location location = new Location();
    location.setUri(model.getUri());
    NodeV defaultNodeForModel =
        new NodeV(
            model.getUri(),
            eventSource,
            Lists.newArrayList(location),
            false,
            false,
            getContent(model),
            true);
    objectRef.compute(
        model.getUri(),
        (uri, node) -> {
          if (node == null) return defaultNodeForModel;
          node.setOpenInIde(true);
          node.setLastUpdatedBy(eventSource);
          node.setContent(model.getText());
          return node;
        });
  }

  private String getContent(String uri) {
    return Optional.ofNullable(fileService.getPathFromURI(uri))
        .map(fileService::getContentByPath)
        .orElse(null);
  }

  private NodeV getNode(CopyNode copyNode, EventSource eventSource) {
    return new NodeV(
        copyNode.getUri(),
        eventSource,
        Lists.newArrayList(copyNode.getNameLocation()),
        true,
        false,
        getContent(copyNode.getUri()),
        false);
  }

  /**
   * returns true if the passed document uri is opened in the IDE
   *
   * @param uri document uri
   * @return returns true if the passed document uri is opened in the IDE, false otherwise.
   */
  public boolean isFileOpened(String uri) {
    return Optional.ofNullable(objectRef.get(uri)).map(node -> node.isOpenInIde).orElse(false);
  }

  /**
   * Gives the list of all uri's which consumes the passed URI as a copybook.
   *
   * @param uri document uri
   * @return returns a list of all uri's which consumes the passed URI as a copybook. An empty list
   *     is returned if uri is not a copybook
   */
  public List<String> getAllAssociatedFilesForACopybook(String uri) {
    List<String> result = new ArrayList<>();
    List<String> linkedUris =
        documentGraphIndexedByCopybook.getOrDefault(uri, Collections.emptyList());
    for (String linkedUri : linkedUris) {
      if (documentGraphIndexedByCopybook.containsKey(linkedUri)) {
        result.addAll(getAllAssociatedFilesForACopybook(linkedUri));
      } else {
        result.add(linkedUri);
      }
    }
    return result;
  }

  /**
   * Update the graph with the latest content from the file system
   *
   * @param uri
   */
  public synchronized void updateContent(String uri) {
    if (objectRef.containsKey(uri)) {
      NodeV nodeV = objectRef.get(uri);
      nodeV.setContent(getContent(uri));
    }
  }

  /**
   * remove all association of the passed uri from the graph
   *
   * @param uri
   */
  public synchronized void remove(String uri) {
    if (documentGraph.containsKey(uri)) {
      documentGraph
          .get(uri)
          .forEach(
              node -> {
                List<String> strings = documentGraphIndexedByCopybook.get(node.uri);
                strings.remove(uri);
                if (strings.isEmpty()) {
                  documentGraphIndexedByCopybook.remove(node.uri);
                  objectRef.remove(node.uri);
                }
              });
      documentGraph.remove(uri);
      Optional.ofNullable(objectRef.get(uri)).ifPresent(node -> node.setOpenInIde(false));
    }
  }

  /**
   * return content of a copyNode
   *
   * @param node
   * @return content of a copyNode
   */
  public String getCopyNodeContent(CopyNode node) {
    return Optional.ofNullable(objectRef.get(node.getUri()))
        .map(node1 -> node1.content)
        .orElse(null);
  }

  /**
   * Get associated file content injected at the passed document uri and position
   *
   * @param uri
   * @param usage
   * @return content of the copybook in the provided range, or else null
   */
  public List<NodeV> getInjectedCopybookNode(String uri, Position usage) {
    List<NodeV> result = new ArrayList<>();
    List<NodeV> cobolDocLinks = documentGraph.get(uri);
    List<Map.Entry<String, List<String>>> containedCopybook =
        this.documentGraphIndexedByCopybook.entrySet().stream()
            .filter(enn -> enn.getValue().contains(uri))
            .collect(Collectors.toList());
    for (Map.Entry<String, List<String>> entry : containedCopybook) {
      NodeV nodeV = objectRef.get(entry.getKey());
      if (isContainedInside(usage, nodeV)) result.add(nodeV);
    }
    if (cobolDocLinks != null) {
      Optional<NodeV> linkedNode =
          cobolDocLinks.stream().filter(node -> isContainedInside(usage, node)).findFirst();
      linkedNode.ifPresent(result::add);
    }
    return result;
  }

  private static boolean isContainedInside(Position usage, NodeV nodeV) {
    boolean isContained;
    List<Location> referencedLocations = nodeV.referencedLocation;
    for (Location referencedLocation : referencedLocations) {
      Position start = referencedLocation.getRange().getStart();
      Position end = referencedLocation.getRange().getEnd();
      isContained =
          (RangeUtils.isAfter(usage, start) || usage.equals(start))
              && (RangeUtils.isBefore(usage, end) || usage.equals(end));
      if (isContained) return true;
    }
    return false;
  }

  /**
   * Nodes in the {@link WorkspaceDocumentGraph} representing document and their links in a workspace
   */
  @AllArgsConstructor
  @EqualsAndHashCode(onlyExplicitlyIncluded = true)
  @Getter
  public class NodeV {
    @EqualsAndHashCode.Include private String uri;
    @Setter private EventSource lastUpdatedBy;
    @EqualsAndHashCode.Include private List<Location> referencedLocation;
    private boolean isCopybook;
    @Setter private boolean isDirty;
    @Setter private String content;
    @Setter private boolean isOpenInIde;
  }

  /**
   * Represent different source for event for the LSP server
   */
  public enum EventSource {
    FILE_SYSTEM,
    IDE;
  }
}
