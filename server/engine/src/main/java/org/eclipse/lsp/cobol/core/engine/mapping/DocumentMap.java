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

/**
 * A container for text transformations and mappings of a document
 */
public class DocumentMap {
    private final String uri;
    private final LinkedList<TextTransformations> transformations = new LinkedList<>();
    private final LinkedList<MappingService> mappings = new LinkedList<>();

    public DocumentMap(String uri, String text) {
        this.uri = uri;
        transformations.push(new TextTransformations(text, uri));
    }

    @Deprecated
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
        topTransformations().extend(copyNode, copyNode.getLocality().getRange(), copyTransform);
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
        List<CopyNode> result = new ArrayList<>();
        transformations.forEach(t -> result.addAll(t.calculateCopyNodes()));
        return result;
    }

  /**
   * Commit current accumulated transformations. Create a new text transformation level on top of
   * current one.
   */
    public void commitTransformations() {
      if (topTransformations().isChanged()) {
        String uri = topTransformations().getUri();
        mappings.push(new MappingService(topTransformations()));
        transformations.push(
            new TextTransformations(topTransformations().calculateExtendedText(), uri));
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
