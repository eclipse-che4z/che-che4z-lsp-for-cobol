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

package org.eclipse.lsp.cobol.common.mapping;

import org.apache.commons.lang3.StringUtils;
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

  public ExtendedSource(TextTransformations textTransformations) {
    mainUri = textTransformations.getUri();
    documents.put(textTransformations.getUri(), new DocumentMap(textTransformations));
  }

  public String getUri() {
    return mainUri;
  }


  /**
   * Substitute location of original document with a new final copybook document.
   *
   * @param document document to extend
   * @param replaceRange location to replace
   * @param copybookMap copybook document to extend main document,
   *                    should be final (already extended with other documents)
   */
  public void replace(DocumentMap document, Range replaceRange, DocumentMap copybookMap) {
    documents.computeIfAbsent(document.getUri(), uri -> document)
        .replace(replaceRange, TextTransformations.of(copybookMap.extendedText(), copybookMap.getUri()));
    documents.put(copybookMap.getUri(), copybookMap);
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
   * @param extendRange copybook position in the document
   * @param copybookMap a map of a copybook
   */
  public void extend(DocumentMap document, Range extendRange, DocumentMap copybookMap) {
    documents.computeIfAbsent(document.getUri(), uri -> document)
            .extend(extendRange, TextTransformations.of(copybookMap.extendedText(), copybookMap.getUri()));
    documents.put(copybookMap.getUri(), copybookMap);
  }

  public DocumentMap getMainMap() {
    return documents.get(mainUri);
  }

  public String getText() {
    return documents.get(mainUri).getText();
  }

  /**
   * Insert copybook content as a text document after defined line
   *
   * @param document document to extend
   * @param line copybook line position in the document
   * @param copybookMap a map of a copybook
   */
  public void insert(DocumentMap document, int line, DocumentMap copybookMap) {
    String copybookText = copybookMap.extendedText();
    if (!StringUtils.isEmpty(copybookText)) {
      copybookText += "\n";
    }
    documents.computeIfAbsent(document.getUri(), uri -> document)
        .insert(line, TextTransformations.of(copybookText, copybookMap.getUri()));
    documents.put(copybookMap.getUri(), copybookMap);
  }
}
