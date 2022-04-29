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

package org.eclipse.lsp.cobol.core.semantics;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import lombok.Value;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp4j.Location;

import java.util.HashMap;
import java.util.Map;

/**
 * This class represents a semantic sub-context for specific types of elements that have names and
 * stores their definitions and variables.
 */
@Value
public class NamedSubContext {
  Multimap<String, Location> definitions = HashMultimap.create();
  Multimap<String, Location> usages = HashMultimap.create();
  Map<String, Locality> definitionStatements = new HashMap<>();

  /**
   * Add defined language element to the context
   *
   * @param name name of the element
   * @param location location of the used element
   */
  public void define(String name, Location location) {
    definitions.put(name, location);
  }

  /**
   * Add the position of a language element usage
   *
   * @param name name of the element
   * @param location location of the used element
   */
  public void addUsage(String name, Location location) {
    usages.put(name, location);
  }

  /**
   * Add the definition statement of an element
   *
   * @param id the id of the element
   * @param location the location of the definition statements
   */
  public void addStatement(String id, Locality location) {
    definitionStatements.put(id, location);
  }

  /**
   * Check if the context contains a language element with the provided name already defined
   *
   * @param name a language element name to check
   * @return true if the element already defined
   */
  public boolean contains(String name) {
    return definitions.containsKey(name);
  }

  /**
   * Copy the content of the given subContext into this one.
   *
   * @param subContext a subContext that should be merged into this one
   */
  public void merge(NamedSubContext subContext) {
    definitions.putAll(subContext.getDefinitions());
    usages.putAll(subContext.getUsages());
    definitionStatements.putAll(subContext.getDefinitionStatements());
  }
}
