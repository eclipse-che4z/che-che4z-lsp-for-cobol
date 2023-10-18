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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.Synchronized;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.service.utils.BuildOutlineTreeFromSyntaxTree;
import org.eclipse.lsp4j.Diagnostic;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 * Provides document model management functionality
 */
@Singleton
class DocumentModelService {
  private final Map<String, CobolDocumentModel> docs = new ConcurrentHashMap<>();
  private final DiagnosticRepo diagnosticRepo = new DiagnosticRepo();
  private final CopybookReferenceRepo copybookReferenceRepo;

  @Inject
  DocumentModelService(CopybookReferenceRepo copybookReferenceRepo) {
    this.copybookReferenceRepo = copybookReferenceRepo;
  }

  /**
   * Mark the document as opened and stores document text
   * @param uri - document uri
   * @param text - document text
   */
  @Synchronized
  public void openDocument(String uri, String text) {
    docs.computeIfAbsent(uri, (u) -> new CobolDocumentModel(uri, text));
    CobolDocumentModel documentModel = docs.get(uri);
    documentModel.setOpened(true);
  }

  /**
   * Returns document model object
   * @param uri - document uri
   * @return the document model object
   */
  @Synchronized
  public CobolDocumentModel get(String uri) {
    return docs.get(uri);
  }

  /**
   * Process analysis result and store diagnostics
   * @param uri - document uri
   * @param analysisResult - analysis result
   */
  @Synchronized
  public void processAnalysisResult(String uri, AnalysisResult analysisResult) {
    Optional.ofNullable(docs.get(uri)).ifPresent(d -> {
      d.setAnalysisResult(analysisResult);
      updateDiagnosticRepo(uri, analysisResult.getDiagnostics());
      d.setOutlineResult(BuildOutlineTreeFromSyntaxTree.convert(analysisResult.getRootNode(), uri));
      analysisResult.getRootNode().getDepthFirstStream()
          .filter(n -> n.getNodeType() == NodeType.COPY)
          .filter(n -> n instanceof CopyNode)
              .map(CopyNode.class::cast)
                  .forEach(n -> copybookReferenceRepo.storeCopybookUsageReference(n.getNameLocation().getUri(), n.getUri()));
    });
  }

    private void updateDiagnosticRepo(String uri, Map<String, List<Diagnostic>> diagnostics) {
        diagnostics.forEach((key, diagnosticList) -> {
            if (key.equals(uri)) {
                diagnosticRepo.put(ImmutableMap.of(uri, diagnosticList));
            } else {
                List<Diagnostic> existingDiagnostics = Optional.ofNullable(diagnosticRepo.get(key)).orElse(new ArrayList<>());
                existingDiagnostics.addAll(diagnosticList);
                diagnosticRepo.put(ImmutableMap.of(key, existingDiagnostics));
            }
        });
  }

  /**
   * Mark the document as closed
   * @param uri - document uri
   */
  @Synchronized
  public void closeDocument(String uri) {
    Optional.ofNullable(docs.get(uri))
        .ifPresent(
            d -> {
              d.setOpened(false);
              removeAllRelatedDiagnostics(d);
            });
  }

  private void removeAllRelatedDiagnostics(CobolDocumentModel documentModel) {
    Optional.ofNullable(documentModel.getAnalysisResult())
        .map(AnalysisResult::getDiagnostics)
        .ifPresent(
            d ->
                d.forEach(
                    (uri, closedFileRelatedDiagnostics) -> {
                      List<Diagnostic> oldDiagnostics = diagnosticRepo.get(uri);
                      Optional.ofNullable(oldDiagnostics).ifPresent(dia -> dia.removeAll(closedFileRelatedDiagnostics));
                      diagnosticRepo.put(ImmutableMap.of(uri, Optional.ofNullable(oldDiagnostics).orElse(ImmutableList.of())));
                    }));
  }

  /**
   * Removes document from registry
   * @param uri - document uri
   */
  @Synchronized
  public void removeDocument(String uri) {
    Optional.ofNullable(docs.get(uri))
        .ifPresent(
            d -> {
              diagnosticRepo.delete(uri);
              docs.remove(uri);
            });
  }

  /**
   * Returns all opened documents
   * @return a list of opened documents
   */
  @Synchronized
  public List<CobolDocumentModel> getAllOpened() {
    return docs.values().stream()
        .filter(CobolDocumentModel::isOpened).collect(Collectors.toList());
  }

  /**
   * Returns true if document was analysed and false otherwise
   * @param uri - document uri
   * @return true if document was analysed and false otherwise
   */
  @Synchronized
  public boolean isDocumentSynced(String uri) {
    return Optional.ofNullable(docs.get(uri)).map(CobolDocumentModel::isDocumentSynced).orElse(false);
  }

  /**
   * Returns all available diagnostics for opened documents and empty diagnostics for clothed documents
   * @return map of diagnostics where the key is a document uri
   * and a value is a list of diagnostics for this document
   */
  @Synchronized
  public Map<String, List<Diagnostic>> getOpenedDiagnostic() {
    Map<String, List<Diagnostic>> result = new HashMap<>();
    docs.forEach((key, value) -> {
      List<Diagnostic> diagnostics = diagnosticRepo.get(value.getUri());
      if (diagnostics != null && value.isOpened()) {
        result.put(key, diagnostics);
      } else {
        result.put(key, ImmutableList.of());
      }
    });

    return result;
  }

  /**
   * Updates document with a new text
   * @param uri - document uri
   */
  @Synchronized
  public void updateDocument(String uri, String text) {
    Optional.ofNullable(docs.get(uri))
        .ifPresent(
            d -> {
              diagnosticRepo.delete(uri);
              removeAllRelatedDiagnostics(d);
              d.update(text);
            });
  }

  /**
   * Collects all documents with given uri list
   * @param programs - the uri list
   * @return a list of documents
   */
  @Synchronized
  public List<CobolDocumentModel> getAll(Set<String> programs) {
    return programs.stream().map(docs::get)
        .filter(Objects::nonNull)
        .collect(Collectors.toList());
  }

  /**
   * Updates copybook and returns all affected opened programs filtered by predicate
   * @param uri - copybook uri
   * @param predicate - filtering predicate for programs
   * @return set of affected opened programs
   */
  @Synchronized
  public Set<String> findAffectedDocumentsForCopybook(String uri, Predicate<CobolDocumentModel> predicate) {
    Set<String> affectedPrograms = new HashSet<>();
    copybookReferenceRepo
        .getCopybookUsageReference(uri)
        .forEach(
            curi -> {
              if (Optional.ofNullable(get(curi)).map(CobolDocumentModel::isOpened).orElse(false)) {
                affectedPrograms.add(curi);
              }
            });

    // Add all not synced programs
    affectedPrograms.addAll(docs.values().stream()
        .filter(d -> !d.isDocumentSynced())
        .filter(predicate)
        .map(CobolDocumentModel::getUri)
        .collect(Collectors.toList()));

    return affectedPrograms;
  }
}
