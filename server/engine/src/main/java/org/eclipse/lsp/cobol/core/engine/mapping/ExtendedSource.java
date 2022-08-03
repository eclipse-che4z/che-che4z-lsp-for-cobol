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

  public String getCurrentUri() {
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

  public void commitTransformations() {
    documents.get(mainUri).commitTransformations();
  }

  /**
   * Map a range in an extended to its original location
   *
   * @param range in the extended documetn
   * @return a location of original source
   */
  public Location mapLocation(Range range) {
    String lastUri = mainUri;
    Location lastLocation = documents.get(lastUri).mapLocation(range);
    while (!Objects.equals(lastLocation.getUri(), lastUri)) {
      lastLocation = documents.get(lastUri).mapLocation(range);
    }
    return lastLocation;
  }

  public void extend(CopyNode copyNode, DocumentMap copybookMap) {
    documents.get(mainUri).extend(copyNode, TextTransformations.of(copybookMap.extendedText(), copybookMap.getUri()));
    documents.put(copybookMap.getUri(), copybookMap);
  }
}
