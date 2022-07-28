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

import java.util.List;
import java.util.Objects;

/** Represents mappable modifications on source code */
public abstract class Mappable {
  private MappingService mappingService;

  /**
   * Replace copy statement with result of copybook substitution
   *
   * @param copyNode node representation of copybook
   * @param copyTransform Copybook's transformations
   */
  public void extend(CopyNode copyNode, TextTransformations copyTransform) {
    getTextTransformations().extend(copyNode, mapRange(copyNode.getLocality().getRange()), copyTransform);
  }

  /**
   * Recalculate  mapping for current transformations
   */
  public void rebuildMapping() {
    mappingService = new MappingService(getTextTransformations());
  }

  public String getCurrentUri() {
    return getTextTransformations().getUri();
  }

  /**
   * Calculates a list of all copy nodes include nested
   *
   * @return a list of all copy nodes
   */
  public List<CopyNode> calculateCopyNodes() {
    return getTextTransformations().calculateCopyNodes();
  }

  /**
   * Substitute location of original document with a new content.
   *
   * @param range location
   * @param replacement new content
   */
  public void replace(Range range, String replacement) {
    getTextTransformations().replace(mapRange(range), replacement);
  }

  protected abstract TextTransformations getTextTransformations();

  /**
   * Apply all transformations and form resulting text
   *
   * @return text with all transformations
   */
  public String extendedText() {
    return getTextTransformations().calculateExtendedText();
  }

  protected Range mapRange(Range range) {
    Location originalLocation =
        mappingService.getOriginalLocation(range).orElseThrow(IllegalArgumentException::new);
    if (!Objects.equals(getTextTransformations().getUri(), originalLocation.getUri())) {
      throw new IllegalArgumentException("Uri mismatch");
    }
    return originalLocation.getRange();
  }

  // TODO probably it's possible to make this method private
  public MappingService getMappingService() {
    return mappingService;
  }
}
