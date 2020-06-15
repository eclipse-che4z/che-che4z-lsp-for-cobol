/*
 *
 *  Copyright (c) 2020 Broadcom.
 *  The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 *  This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *  SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package com.ca.lsp.core.cobol.semantics;

import com.google.common.collect.Multimap;

import java.util.Collection;

/**
 * This class represents an abstract structure to store definitions and usages of semantic elements
 * of a specific type regarding the currently processing document
 *
 * @param <T> - type of semantic elements to store
 * @param <P> - type of positions of the semantic elements
 */
public interface SubContext<T, P> {
  /**
   * Add defined language element to the context
   *
   * @param element - a language element
   * @param position - position of the used element
   */
  void define(T element, P position);

  /**
   * Add the position of a language element usage
   *
   * @param element - a language element
   * @param position - position of the used element
   */
  void addUsage(String element, P position);

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
   * @return true if the element is already defined
   */
  boolean contains(String name);

  /**
   * Get all the definitions of the language elements
   *
   * @return - multimap of names to a list of positions of definitions
   */
  Multimap<String, P> getDefinitions();

  /**
   * Get all the registered usage of the language elements
   *
   * @return - multimap of names to a list of positions of usages
   */
  Multimap<String, P> getUsages();

  /**
   * Copy the content of the given subContext into this one.
   *
   * @param subContext - a subContext that should be merged into this one.
   */
  void merge(SubContext<T, P> subContext);
}
