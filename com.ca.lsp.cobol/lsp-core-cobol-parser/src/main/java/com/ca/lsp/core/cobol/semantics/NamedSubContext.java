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

package com.ca.lsp.core.cobol.semantics;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import lombok.Getter;

import java.util.Collection;

/**
 * This class represents a semantic sub-context for specific types of elements that have names and
 * stores their definitions and variables.
 *
 * @param <T> - type of positions of the semantic elements
 */
public class NamedSubContext<T> implements SubContext<String, T> {

  @Getter private final Multimap<String, T> definitions = HashMultimap.create();

  @Getter private final Multimap<String, T> usages = HashMultimap.create();

  @Override
  public void define(String name, T token) {
    definitions.put(name, token);
  }

  @Override
  public void addUsage(String name, T token) {
    usages.put(name, token);
  }

  @Override
  public Collection<String> getAll() {
    return definitions.keySet();
  }

  @Override
  public boolean contains(String name) {
    return definitions.containsKey(name);
  }

  @Override
  public void merge(SubContext<String, T> subContext) {
    definitions.putAll(subContext.getDefinitions());
    usages.putAll(subContext.getUsages());
  }
}
