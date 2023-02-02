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

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;

import java.util.*;

/**
 * A container for text transformations and mappings of a document
 */
public class DocumentMap {
  private final String uri;
  private final LinkedList<TextTransformations> transformations = new LinkedList<>();
  private final LinkedList<MappingService> mappings = new LinkedList<>();
  private final Multimap<TextTransformations, CopyNode> copyNodeMap = ArrayListMultimap.create();

  public DocumentMap(String uri, String text) {
    this.uri = uri;
    transformations.push(new TextTransformations(text, uri));
  }

  public DocumentMap(TextTransformations textTransformations) {
    this.uri = textTransformations.getUri();
    transformations.push(textTransformations);
  }

  /**
   * Replace copy statement with result of copybook substitution
   *
   * @param copyNode node representation of copybook
   * @param copyTransform Copybook's transformations
   */
  public void extend(CopyNode copyNode, TextTransformations copyTransform) {
    copyNodeMap.put(copyTransform, copyNode);
    topTransformations().extend(copyNode.getLocality().getRange(), copyTransform);
  }

  /**
   * Insert copybook as a text after defined line
   *
   * @param copyNode node representation of copybook
   * @param copyTransform Copybook's transformations
   */
  public void insert(CopyNode copyNode, TextTransformations copyTransform) {
    copyNodeMap.put(copyTransform, copyNode);
    topTransformations().insert(copyNode.getLocality().getRange().getStart().getLine(), copyTransform);
  }

  /**
   * Substitute location of original document with a new content.
   *
   * @param range location
   * @param replacement new content
   */
  public void replace(Range range, String replacement) {
    topTransformations().replace(range, replacement);
  }

  /**
   * Apply all transformations and form resulting text
   *
   * @return text with all transformations
   */
  public String extendedText() {
    return topTransformations().calculateExtendedText();
  }

  /**
   * Calculates a list of all copy nodes include nested
   *
   * @return a list of all copy nodes
   */
  public List<CopyNode> calculateCopyNodes() {
    return new LinkedList<>(copyNodeMap.values());
  }

  /**
   * Commit current accumulated transformations. Create a new text transformation level on top of
   * current one.
   */
  public void commitTransformations() {
    if (topTransformations().isChanged()) {
      mappings.push(new MappingService(topTransformations()));
      transformations.push(
          new TextTransformations(topTransformations().calculateExtendedText(), topTransformations().getUri()));
    }
  }

  public String getUri() {
    return uri;
  }

  /**
   * Map a range in an extended to its original location
   *
   * @param range in the extended documetn
   * @param checkCommitted check if all changes were committed
   * @return a location of original source
   */
  public Location mapLocation(Range range, boolean checkCommitted) {
    Location extLocation = new Location();
    extLocation.setRange(range);
    extLocation.setUri(uri);
    if (checkCommitted && topTransformations().isChanged()) {
      throw new IllegalStateException("There are uncommitted changes in document map " + uri);
    }
    if (mappings.isEmpty()) {
      return extLocation;
    }
    LinkedList<MappingService> maps = new LinkedList<>(mappings);
    return mapLocation(extLocation, maps);
  }

  private Location mapLocation(Location location, LinkedList<MappingService> maps) {
    if (maps.isEmpty() || !Objects.equals(location.getUri(), uri)) {
      return location;
    }
    MappingService mappingService = maps.pop();
    Location originalLocation =
        mappingService
            .getOriginalLocation(location.getRange())
            .orElseThrow(IllegalStateException::new);

    return mapLocation(originalLocation, maps);
  }

  private TextTransformations topTransformations() {
    return transformations.peek();
  }

  public String getText() {
    return topTransformations().getText();
  }
}
