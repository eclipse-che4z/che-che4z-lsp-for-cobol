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
import org.eclipse.lsp.cobol.common.copybook.CopybookId;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp4j.Location;

import java.util.Map;

/**
 * This class represents a semantic sub-context for specific types of elements that have names and
 * stores their definitions and variables.
 */
@Value
public class CopybooksRepository {
  Multimap<String, String> definitions = HashMultimap.create();
  Multimap<String, Location> usages = HashMultimap.create();
  Multimap<String, Locality> definitionStatements = HashMultimap.create();

  /**
   * Add defined language element to the context
   *
   * @param name     name of the element
   * @param dialect  the copybook dialect
   * @param documentUri uri of the document that contains a coopybook definition
   * @param copybookUri - the uri of a copybook
   */
  public void define(String name, String dialect, String documentUri, String copybookUri) {
    definitions.put(toId(name, dialect, documentUri), copybookUri);
  }

  /**
   * Add the position of a language element usage
   *
   * @param name     name of the element
   * @param dialect  the copybook dialect
   * @param location location of the used element
   */
  public void addUsage(String name, String dialect, Location location) {
    usages.put(toId(name, dialect, location.getUri()), location);
  }

  /**
   * Add the definition statement of an element
   *
   * @param name     the of copybook
   * @param dialect  the copybook dialect
   * @param location the location of the definition statements
   */
  public void addStatement(String name, String dialect, Locality location) {
    definitionStatements.put(toId(name, dialect, location.getUri()), location);
  }

  /**
   * Check if the context contains a language element with the provided name already defined
   *
   * @param name    a language element name to check
   * @param dialect the copybook dialectÒ
   * @param uri - the uri of a copybook
   * @return true if the element already defined
   */
  public boolean contains(String name, String dialect, String uri) {
    return definitions.containsKey(toId(name, dialect, uri));
  }

  /**
   * Creates copybook id
   * @param name - name of the copybook
   * @param dialect - copybook dialect
   * @param uri - the uri of a copybook
   * @return the copybook id string value
   */
  public static String toId(String name, String dialect, String uri) {
    return dialect == null ? name : CopybookId.create(name, dialect, uri).toString();
  }

  /**
   * Returns copybook id (if exists) by copybook uri
   * @param uri - the uri of a copybook
   * @return a copybook id
   */
  public String getCopybookIdByUri(String uri) {
    return definitions.asMap().entrySet().stream()
        .filter(e -> e.getValue().stream().anyMatch(u -> u.equals(uri)))
        .findFirst()
        .map(Map.Entry::getKey)
        .orElse(null);
  }
}
