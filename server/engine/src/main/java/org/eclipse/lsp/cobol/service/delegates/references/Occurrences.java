/*
 * Copyright (c) 2020 Broadcom.
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

package org.eclipse.lsp.cobol.service.delegates.references;

import lombok.NonNull;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.DocumentHighlight;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.ReferenceContext;
import org.eclipse.lsp4j.TextDocumentPositionParams;

import java.util.List;

/**
 * This class is a service delegate to resolve the location requests of document elements, i.e Go to
 * Definition, Find All References and Highlights. The locations may be not for the current
 * document, but also for the copybooks that are used.
 */
public interface Occurrences {

  /**
   * Resolve the definition location of a symbol at a given text document position in a given
   * document.
   *
   * @param document - document model that contains a semantic context *
   * @param position - position of the required token
   * @return list of locations of the definitions for the required token or empty list if token is
   *     empty or not of a supported type
   */
  @NonNull
  List<Location> findDefinitions(
      @NonNull CobolDocumentModel document, @NonNull TextDocumentPositionParams position);

  /**
   * Resolve project-wide references for the symbol denoted by the given text document position. The
   * context specifies if the definitions should be added to the list of usages.
   *
   * @param document - document model that contains a semantic context
   * @param position - position of the required token
   * @param context - reference context of the request
   * @return list of locations of the references for the required token or empty list if token is
   *     empty or not of a supported type
   */
  @NonNull
  List<Location> findReferences(
      @NonNull CobolDocumentModel document,
      @NonNull TextDocumentPositionParams position,
      @NonNull ReferenceContext context);

  /**
   * Resolve a document highlights for a given text document position. Return the highlight
   * positions for the definitions and usages.
   *
   * @param document - document document that contains a semantic context
   * @param position - position of the required token
   * @return list of document highlights for the required token or empty list if token is empty or
   *     not of a supported type
   */
  @NonNull
  List<DocumentHighlight> findHighlights(
      @NonNull CobolDocumentModel document, @NonNull TextDocumentPositionParams position);
}
