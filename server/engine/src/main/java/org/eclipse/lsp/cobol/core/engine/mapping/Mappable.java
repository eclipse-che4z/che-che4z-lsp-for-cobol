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

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

/** Represents mappable modifications on source code */
public abstract class Mappable {
  private final LinkedList<MappingService> mappings = new LinkedList<>();

  private final LinkedList<TextTransformations> transformations = new LinkedList<>();

  /**
   * Replace copy statement with result of copybook substitution
   *
   * @param copyNode node representation of copybook
   * @param copyTransform Copybook's transformations
   */
  public void extend(CopyNode copyNode, TextTransformations copyTransform) {
    topTransformations().extend(copyNode, copyNode.getLocality().getRange(), copyTransform);
  }

  /**
   * Commit current accumulated transformations. Create a new text transformation level on top of
   * current one.
   */
  public void commitTransformations() {
    mappings.push(new MappingService(topTransformations()));
    transformations.push(
        new TextTransformations(
            topTransformations().calculateExtendedText(), topTransformations().getUri()));
  }

  public String getCurrentUri() {
    return topTransformations().getUri();
  }

  /**
   * Calculates a list of all copy nodes include nested
   *
   * @return a list of all copy nodes
   */
  public List<CopyNode> calculateCopyNodes() {
    List<CopyNode> result = new ArrayList<>();
    transformations.forEach(t -> result.addAll(t.calculateCopyNodes()));
    return result;
  }

  /**
   * Substitute location of original document with a new content.
   *
   * @param range location
   * @param replacement new content
   */
  public void replace(Range range, String replacement) {
    topTransformations().replace(mapLocation(range).getRange(), replacement);
  }

  /**
   * Apply all transformations and form resulting text
   *
   * @return text with all transformations
   */
  public String extendedText() {
    return topTransformations().calculateExtendedText();
  }

  protected abstract TextTransformations getTextTransformations();

  /**
   * Map a range in an extended to its original location
   *
   * @param range in the extended documetn
   * @return a location of original source
   */
  public Location mapLocation(Range range) {
    Location extLocation = new Location();
    extLocation.setRange(range);
    extLocation.setUri(transformations.getLast().getUri());
    LinkedList<MappingService> maps = new LinkedList<>(mappings);
    return mapLocation(extLocation, maps);
  }

  private Location mapLocation(Location location, LinkedList<MappingService> maps) {
    if (maps.isEmpty() ||
            !Objects.equals(location.getUri(), topTransformations().getUri())) {
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
    if (transformations.isEmpty()) {
      transformations.push(getTextTransformations());
    }
    return transformations.peek();
  }
}
