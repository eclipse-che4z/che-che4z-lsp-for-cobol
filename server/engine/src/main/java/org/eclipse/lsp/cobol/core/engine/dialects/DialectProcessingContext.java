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
package org.eclipse.lsp.cobol.core.engine.dialects;

import lombok.*;
import org.eclipse.lsp.cobol.core.engine.mapping.MappingService;
import org.eclipse.lsp.cobol.core.engine.mapping.TextTransformations;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp4j.Range;

import java.util.List;

/**
 * Contains all needed data for dialect processing
 */
@Value
@Builder(toBuilder = true)
public class DialectProcessingContext {
  @Getter(AccessLevel.NONE) @Setter(AccessLevel.NONE) TextTransformations textTransformations;
  CopybookConfig copybookConfig;
  String programDocumentUri;
  MappingService mappingService;

  /**
   * Apply all transformations and form resulting text
   * @return text with all transformations
   */
  public String extendedText() {
    return textTransformations.calculateExtendedText();
  }

  /**
   * Substitute location of original document with a new content.
   * @param range location
   * @param replacement new content
   */
  public void replace(Range range, String replacement) {
    textTransformations.replace(range, replacement);
  }

  public String getCurrentUri() {
    return textTransformations.getUri();
  }

  /**
   * Replace copy statement with result of copybook substitution
   *
   * @param copyNode node representation of copybook
   * @param copyTransform Copybook's transformations
   */
  public void extend(CopyNode copyNode, TextTransformations copyTransform) {
    textTransformations.extend(copyNode, copyTransform);
  }

  /**
   * Calculates a list of all copy nodes include nested
   *
   * @return a list of all copy nodes
   */
  public List<CopyNode> calculateCopyNodes() {
    return textTransformations.calculateCopyNodes();
  }
}
