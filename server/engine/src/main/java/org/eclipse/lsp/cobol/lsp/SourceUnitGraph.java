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
import com.google.common.collect.Sets;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import java.io.IOException;
import java.net.URI;
import java.net.URL;
import java.nio.file.FileSystemNotFoundException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.file.WorkspaceFileService;
import org.eclipse.lsp.cobol.common.model.Uri;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
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
public class SourceUnitGraph implements AnalysisStateListener {
  private final WorkspaceFileService fileService;

  // doc-a-uri --> copy-a Node. copy-b node, copy-c node
  // doc-1-uri --> copy-a Node. copy-2 node, copy-3 node
  private final Map<Uri, List<NodeV>> documentGraph = new ConcurrentHashMap<>();

  // doc-a-uri <==> doc-a node
  // copy-a-uri <--> copy-a node
  private final Map<Uri, NodeV> objectRef = new ConcurrentHashMap<>();

  // copy-2-uri <--> doc-a-uri, doc-1-uri
  private final Map<Uri, List<Uri>> documentGraphIndexedByCopybook =
      new ConcurrentHashMap<>();

  @Inject
  public SourceUnitGraph(
      WorkspaceFileService fileService,
      AsyncAnalysisService asyncAnalysisService) {
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
    return Optional.ofNullable(model.getText()).orElseGet(() -> getContent(model.getUri()));
  }

  private synchronized void updateDocumentGraphUponCompletion(
      CobolDocumentModel model, EventSource eventSource) {
    updateGraphNodes(model, eventSource);
    invalidateGraphLinks(model.getUri());
    if (isUserSuppliedCopybook(model.getUri()) || model.getAnalysisResult() == null) {
      return;
    }
    updateGraphLink(model, eventSource);
  }

  private void updateGraphLink(CobolDocumentModel model, EventSource eventSource) {
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
      Uri parentUri = copyNode.getLocality().getUri();
      NodeV copyNodeV = getNode(copyNode, eventSource);
      if (!copyNodeV.isDirty) {
        objectRef.computeIfPresent(
            copyNode.getUri(),
            (k, v) -> {
              Set<Location> referencedLocation = v.getReferencedLocation();
              referencedLocation.add(copyNode.getNameLocation());
              return v;
            });
        objectRef.putIfAbsent(copyNode.getUri(), copyNodeV);
        references.add(copyNodeV);
        Uri decodedUri = copyNode.getUri();
        documentGraphIndexedByCopybook.putIfAbsent(decodedUri, new ArrayList<>());
        List<Uri> strings = documentGraphIndexedByCopybook.get(decodedUri);
        if (!strings.contains(parentUri)) {
          strings.add(parentUri);
        }
      }
    }
    documentGraph.remove(model.getUri());
    documentGraph.put(model.getUri(), references);
  }

  private void invalidateGraphLinks(Uri uri) {
    if (documentGraph.containsKey(uri)) {
      List<NodeV> prevLinks = documentGraph.get(uri);
      for (NodeV prevLink : prevLinks) {
        invalidateCopybookIndexedCache(uri, prevLink.getUri());
        Optional.ofNullable(objectRef.get(prevLink.getUri()))
            .ifPresent(
                nodeV -> {
                  Optional.ofNullable(nodeV.getReferencedLocation())
                      .ifPresent(val -> val.removeAll(prevLink.getReferencedLocation()));
                  if (nodeV.getReferencedLocation() == null
                      || nodeV.getReferencedLocation().isEmpty()) {
                    objectRef.remove(prevLink.getUri());
                  }
                });
      }
      documentGraph.remove(uri);
    }
  }

  private void invalidateCopybookIndexedCache(Uri referUri, Uri copybookUri) {
    documentGraphIndexedByCopybook.computeIfPresent(
        copybookUri,
        (k, v) -> {
          v.remove(referUri);
          return v;
        });
  }

  /**
   * Is the passed uri treated as copybook by LSP engine
   *
   * @param uri document uri
   * @return true if copybook, false otherwise.
   */
  public boolean isUserSuppliedCopybook(Uri uri) {
    return documentGraphIndexedByCopybook.keySet().stream()
        .anyMatch(
            copyUri -> {
              try {
                // FIXME uri decoding looks off. Actually all logic here looks strange
                String decodeUri = uri.decode().replace(" ", "%20");
                copyUri = new Uri(copyUri.decode().replace(" ", "%20"));
                return new URL(decodeUri).sameFile(new URL(copyUri.decode()));
              } catch (IOException e) {
                LOG.error("IOException encountered while comparing paths {} and {}", copyUri, uri);
                return false;
              }
            });
  }

  private void updateGraphNodes(CobolDocumentModel model, EventSource eventSource) {
    Location location = new Location();
    location.setUri(model.getUri().toString());
    NodeV defaultNodeForModel =
            new NodeV(
                    model.getUri(),
                    eventSource,
                    Sets.newConcurrentHashSet(Sets.newHashSet(location)),
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

  /**
   * Get content for a passed uri
   *
   * @param uri uri
   * @return content
   */
  public String getContent(Uri uri) {
    if (ImplicitCodeUtils.isImplicit(uri)) {
      return null;
    }
    return Optional.ofNullable(objectRef.get(uri))
        .map(NodeV::getContent)
        .orElse(getFileContent(uri));
  }

  private String getFileContent(Uri uri) {
    return Optional.ofNullable(uri.getPath())
        .map(fileService::getContentByPath)
        .orElse(null);
  }

  private NodeV getNode(CopyNode copyNode, EventSource eventSource) {
    String content = null;
    Uri uri = null;
    boolean isDirty = true;
    Set<Location> references =
        Sets.newConcurrentHashSet(Sets.newHashSet(copyNode.getNameLocation()));
    if (copyNode.getUri() != null) {
      content = getContent(copyNode.getUri());
      uri = copyNode.getUri();
      isDirty = false;
    }
    return new NodeV(uri, eventSource, references, true, isDirty, content, false);
  }

  /**
   * returns true if the passed document uri is opened in the IDE
   *
   * @param uri document uri
   * @return returns true if the passed document uri is opened in the IDE, false otherwise.
   */
  public boolean isFileOpened(Uri uri) {
    return Optional.ofNullable(objectRef.get(uri)).map(node -> node.isOpenInIde).orElse(false);
  }

  /**
   * Gives the list of all uri's which consumes the passed URI as a copybook.
   *
   * @param uri document uri
   * @return returns a list of all uri's which consumes the passed URI as a copybook. An empty list
   *     is returned if uri is not a copybook
   */
  public List<Uri> getAllAssociatedFilesForACopybook(Uri uri) {
    List<Uri> result = new ArrayList<>();
    List<Uri> linkedUris =
        documentGraphIndexedByCopybook.getOrDefault(uri, Collections.emptyList());
    linkedUris.remove(uri);
    for (Uri linkedUri : linkedUris) {
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
  public synchronized void updateContent(Uri uri) {
    if (objectRef.containsKey(uri)) {
      NodeV nodeV = objectRef.get(uri);
      nodeV.setContent(getFileContent(uri));
    }
  }

  /**
   * Update the graph with the passed content
   *
   * @param uri
   * @param content
   */
  public synchronized void updateContent(Uri uri, String content) {
    if (objectRef.containsKey(uri)) {
      NodeV nodeV = objectRef.get(uri);
      nodeV.setContent(content);
    }
  }

  /**
   * remove all association of the passed uri from the graph
   *
   * @param uri
   */
  public synchronized void remove(Uri uri) {
    if (documentGraph.containsKey(uri)) {
      documentGraph
          .get(uri)
          .forEach(
              node ->
                  Optional.ofNullable(documentGraphIndexedByCopybook.get(node.uri))
                      .ifPresent(
                          strings -> {
                            strings.remove(uri);
                            if (strings.isEmpty()) {
                              documentGraphIndexedByCopybook.remove(node.uri);
                              updateReferences(uri, node);
                            }
                          }));
      documentGraph.remove(uri);
      if (documentGraph.isEmpty()) {
        documentGraphIndexedByCopybook.clear();
        objectRef.clear();
      }
    }
    Optional.ofNullable(objectRef.get(uri)).ifPresent(node -> node.setOpenInIde(false));
  }

  private void updateReferences(Uri uri, NodeV node) {
    NodeV nodeV = objectRef.get(node.getUri());
    Set<Location> updatedReferences =
        nodeV.getReferencedLocation().stream()
            .filter(loc -> !loc.getUri().equals(uri.decode()))
            .collect(Collectors.toSet());
    nodeV.setReferencedLocation(updatedReferences);
  }

  /**
   * return content of a copyNode
   *
   * @param node
   * @return content of a copyNode
   */
  public String getCopyNodeContent(CopyNode node) {
    return Optional.ofNullable(objectRef.get(node.getUri())).map(NodeV::getContent).orElse(null);
  }

  /**
   * Get associated file content injected at the passed document uri and position
   *
   * @param uri
   * @param usage
   * @return content of the copybook in the provided range, or else null
   */
  public List<NodeV> getInjectedCopybookNode(Uri uri, Position usage) {
    List<NodeV> result = new ArrayList<>();
    List<NodeV> cobolDocLinks = documentGraph.get(uri);
    List<Map.Entry<Uri, List<Uri>>> containedCopybook =
        this.documentGraphIndexedByCopybook.entrySet().stream()
            .filter(enn -> enn.getValue().contains(uri))
            .collect(Collectors.toList());
    for (Map.Entry<Uri, List<Uri>> entry : containedCopybook) {
      if (objectRef.containsKey(entry.getKey())) {
        NodeV nodeV = objectRef.get(entry.getKey());
        if (isContainedInside(usage, nodeV)) result.add(nodeV);
      }
    }
    if (cobolDocLinks != null) {
      Optional<NodeV> linkedNode =
          cobolDocLinks.stream()
              .filter(node -> !result.contains(node))
              .filter(node -> isContainedInside(usage, node) && !node.isDirty)
              .findFirst();
      linkedNode.ifPresent(result::add);
    }
    return result;
  }

  private static boolean isContainedInside(Position usage, NodeV nodeV) {
    boolean isContained;
    Set<Location> referencedLocations = nodeV.referencedLocation;
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
   * Gives a list of all the copybooks contained inside a parent dir.
   *
   * @param parentFolder parent directory
   * @return List of copybooks contained inside a parent directory
   */
  public List<Uri> getCopybookUriInsideFolder(String parentFolder) {
    List<Uri> result = new ArrayList<>();
    Path parentPath;

    try {
      parentPath = Paths.get(URI.create(parentFolder));
    } catch (FileSystemNotFoundException | SecurityException e) {
      return result;
    }

    Set<Uri> allCopybooks = documentGraphIndexedByCopybook.keySet();
    for (Uri copybookUri : allCopybooks) {
      try {
        Path copybookPath = Paths.get(URI.create(copybookUri.decode()));
        if (copybookPath.startsWith(parentPath)) {
          result.add(copybookUri);
        }
      } catch (Exception e) {
        LOG.error("{} not found", copybookUri);
      }
    }
    return result;
  }

  /** Nodes in the {@link SourceUnitGraph} representing document and their links in a workspace */
  @AllArgsConstructor
  @EqualsAndHashCode(onlyExplicitlyIncluded = true)
  @Getter
  public static class NodeV {
    @EqualsAndHashCode.Include private Uri uri;
    @Setter private EventSource lastUpdatedBy;
    @Setter private Set<Location> referencedLocation;
    private boolean isCopybook;
    @Setter private boolean isDirty;
    @Setter private String content;
    @Setter private boolean isOpenInIde;
  }

  /** Represent different source for event for the LSP server */
  public enum EventSource {
    FILE_SYSTEM,
    IDE
  }
}
