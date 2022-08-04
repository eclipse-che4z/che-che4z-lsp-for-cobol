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

package org.eclipse.lsp.cobol.core.engine.mapping;

import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;

import java.util.*;

/** Container fot mappable modifications on source code files */
public class ExtendedSource {

  private final Map<String, DocumentMap> documents = new HashMap<>();
  private final String mainUri;

  public ExtendedSource(String text, String uri) {
    mainUri = uri;
    documents.put(uri, new DocumentMap(uri, text));
  }

  @Deprecated
  public ExtendedSource(TextTransformations textTransformations) {
    mainUri = textTransformations.getUri();
    documents.put(textTransformations.getUri(), new DocumentMap(textTransformations));
  }

  public String getUri() {
    return mainUri;
  }

  /**
   * Calculates a list of all copy nodes include nested
   *
   * @return a list of all copy nodes
   */
  public List<CopyNode> calculateCopyNodes() {
    List<CopyNode> result = new ArrayList<>();
    documents.values().forEach(doc -> result.addAll(doc.calculateCopyNodes()));
    return result;
  }

  /**
   * Substitute location of original document with a new content.
   *
   * @param range location
   * @param replacement new content
   */
  public void replace(Range range, String replacement) {
    documents.get(mainUri).replace(range, replacement);
  }

  /**
   * Apply all transformations and form resulting text
   *
   * @return text with all transformations
   */
  public String extendedText() {
    return documents.get(mainUri).extendedText();
  }

  /**
   * Commit current accumulated transformations. Create a new text transformation level on top of
   * current one.
   */
  public void commitTransformations() {
    documents.get(mainUri).commitTransformations();
  }

  /**
   * Map a range in an extended to its original location
   *
   * @param range in the extended document
   * @return a location of original source
   */
  public Location mapLocation(Range range) {
    String lastUri = mainUri;
    Location lastLocation = documents.get(lastUri).mapLocation(range, true);
    while (!Objects.equals(lastLocation.getUri(), lastUri)) {
      lastUri = lastLocation.getUri();
      lastLocation = documents.get(lastUri).mapLocation(lastLocation.getRange(), true);
    }
    return lastLocation;
  }

  /**
   * Map a range in an extended to its original location even if there are uncommitted changed
   *
   * @param range in the extended document
   * @return a location of original source
   */
  public Location mapLocationUnsafe(Range range) {
    String lastUri = mainUri;
    Location lastLocation = documents.get(lastUri).mapLocation(range, false);
    while (!Objects.equals(lastLocation.getUri(), lastUri)) {
      lastUri = lastLocation.getUri();
      lastLocation = documents.get(lastUri).mapLocation(lastLocation.getRange(), false);
    }
    return lastLocation;
  }


  /**
   * Replace copy statement with result of copybook substitution
   *
   * @param document document to extend
   * @param copyNode node representation of copybook
   * @param copybookMap a map of a copybook
   */
  public void extend(DocumentMap document, CopyNode copyNode, DocumentMap copybookMap) {
    documents.computeIfAbsent(document.getUri(), uri -> document)
            .extend(copyNode, TextTransformations.of(copybookMap.extendedText(), copybookMap.getUri()));
    documents.put(copybookMap.getUri(), copybookMap);
  }

  public DocumentMap getMainMap() {
    return documents.get(mainUri);
  }

  public String getText() {
    return documents.get(mainUri).getText();
  }
}
