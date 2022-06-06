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
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp4j.Location;

import java.util.HashMap;
import java.util.Map;

/**
 * This class represents a semantic sub-context for specific types of elements that have names and
 * stores their definitions and variables.
 */
@Value
public class CopybooksRepository {
  Multimap<String, Location> definitions = HashMultimap.create();
  Multimap<String, Location> usages = HashMultimap.create();
  Map<String, Locality> definitionStatements = new HashMap<>();

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
   * Copy the content of the given subContext into this one.
   *
   * @param subContext a subContext that should be merged into this one
   */
  public void merge(CopybooksRepository subContext) {
    definitions.putAll(subContext.getDefinitions());
    usages.putAll(subContext.getUsages());
    definitionStatements.putAll(subContext.getDefinitionStatements());
  }

  private static String toId(String name, String dialect) {
    return dialect == null ? name : String.format("%s!%s", name, dialect);
  }
}
