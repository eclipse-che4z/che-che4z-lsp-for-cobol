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

package org.eclipse.lsp.cobol.core.semantics;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import lombok.Value;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp4j.Location;

import java.util.Map;

/**
 * This class represents a semantic sub-context for specific types of elements that have names and
 * stores their definitions and variables.
 */
@Value
public class CopybooksRepository {
  Multimap<String, Location> definitions = HashMultimap.create();
  Multimap<String, Location> usages = HashMultimap.create();
  Multimap<String, Locality> definitionStatements = HashMultimap.create();

  /**
   * Add defined language element to the context
   *
   * @param name     name of the element
   * @param dialect  the copybook dialect
   * @param location location of the used element
   */
  public void define(String name, String dialect, Location location) {
    definitions.put(toId(name, dialect), location);
  }

  /**
   * Add the position of a language element usage
   *
   * @param name     name of the element
   * @param dialect  the copybook dialect
   * @param location location of the used element
   */
  public void addUsage(String name, String dialect, Location location) {
    usages.put(toId(name, dialect), location);
  }

  /**
   * Add the definition statement of an element
   *
   * @param name     the of copybook
   * @param dialect  the copybook dialect
   * @param location the location of the definition statements
   */
  public void addStatement(String name, String dialect, Locality location) {
    definitionStatements.put(toId(name, dialect), location);
  }

  /**
   * Check if the context contains a language element with the provided name already defined
   *
   * @param name    a language element name to check
   * @param dialect the copybook dialectÒ
   * @return true if the element already defined
   */
  public boolean contains(String name, String dialect) {
    return definitions.containsKey(toId(name, dialect));
  }

  /**
   * Creates copybook id
   * @param name - name of the copybook
   * @param dialect - copybook dialect
   * @return the copybook id string value
   */
  public static String toId(String name, String dialect) {
    return dialect == null ? name : String.format("%s!%s", name, dialect);
  }

  /**
   * Returns copybook id (if exists) by copybook uri
   * @param uri - the uri of a copybook
   * @return a copybook id
   */
  public String getCopybookIdByUri(String uri) {
    return definitions.asMap().entrySet().stream()
        .filter(e -> e.getValue().stream().anyMatch(l -> l.getUri().equals(uri)))
        .findFirst()
        .map(Map.Entry::getKey)
        .orElse(null);
  }
}
