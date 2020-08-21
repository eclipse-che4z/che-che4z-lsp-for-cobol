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

import com.broadcom.lsp.domain.common.model.Position;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import lombok.Value;

import java.util.Collection;

/**
 * This class represents a semantic sub-context for specific types of elements that have names and
 * stores their definitions and variables.
 */
@Value
public class NamedSubContext implements SubContext<String> {

  private final Multimap<String, Position> definitions = HashMultimap.create();

  private final Multimap<String, Position> usages = HashMultimap.create();

  @Override
  public void define(String name, Position token) {
    definitions.put(name, token);
  }

  @Override
  public void addUsage(String name, Position token) {
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
  public void merge(SubContext<String> subContext) {
    definitions.putAll(subContext.getDefinitions());
    usages.putAll(subContext.getUsages());
  }
}
