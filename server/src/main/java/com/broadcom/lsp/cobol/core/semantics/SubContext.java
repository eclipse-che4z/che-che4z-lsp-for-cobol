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

package com.broadcom.lsp.cobol.core.semantics;

import com.google.common.collect.Multimap;
import org.eclipse.lsp4j.Location;

import java.util.Collection;

/**
 * This class represents an abstract structure to store definitions and usages of semantic elements
 * of a specific type regarding the currently processing document
 *
 * @param <T> - type of semantic elements to store
 */
public interface SubContext<T> {
  /**
   * Add defined language element to the context
   *
   * @param element - a language element
   * @param location - location of the used element
   */
  void define(T element, Location location);

  /**
   * Add the position of a language element usage
   *
   * @param element - a language element
   * @param location - location of the used element
   */
  void addUsage(String element, Location location);

  /**
   * Get list of names of defined elements
   *
   * @return list of names
   */
  Collection<T> getAll();

  /**
   * Check if the context contains a language element with the provided name already defined
   *
   * @param name - a language element name to check
   * @return true if the element already defined
   */
  boolean contains(String name);

  /**
   * Get all the definitions of the language elements
   *
   * @return - multimap of names to a list of locations of definitions
   */
  Multimap<String, Location> getDefinitions();

  /**
   * Get all the registered usage of the language elements
   *
   * @return - multimap of names to a list of locations of usages
   */
  Multimap<String, Location> getUsages();

  /**
   * Copy the content of the given subContext into this one.
   *
   * @param subContext - a subContext that should be merged into this one.
   */
  void merge(SubContext<T> subContext);
}
