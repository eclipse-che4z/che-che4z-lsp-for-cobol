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
package com.broadcom.lsp.cobol.service.delegates.references;

import com.broadcom.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.Location;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.Map;

/**
 * This interface defines API for location providers of semantic elements that are defined and/or
 * used in the document
 */
public interface SemanticLocations {

  /**
   * Retrieve the map with a token names and list of locations of the elements of the required type
   * usages in the given document
   *
   * @param document - document model that contains a semantic context
   * @return map with a token name and list of locations of the elements of the required type
   */
  @Nonnull
  Map<String, List<Location>> references(@Nonnull CobolDocumentModel document);

  /**
   * Retrieve the map with a token names and list of locations of the elements of the required type
   * definitions in the given document
   *
   * @param document - document model that contains a semantic context
   * @return map with a token name and list of locations of the elements of the required type
   */
  @Nonnull
  Map<String, List<Location>> definitions(@Nonnull CobolDocumentModel document);

  /**
   * Check if the given document model contains the given token in its element definitions
   *
   * @param document - document model that contains a semantic context
   * @return true if an element with the given name is defined
   */
  boolean containsToken(@Nonnull CobolDocumentModel document, @Nonnull String token);
}
