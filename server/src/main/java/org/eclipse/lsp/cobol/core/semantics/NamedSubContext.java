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
import org.eclipse.lsp4j.Location;

import java.util.Collection;

/**
 * This class represents a semantic sub-context for specific types of elements that have names and
 * stores their definitions and variables.
 */
@Value
public class NamedSubContext implements SubContext<String> {

  Multimap<String, Location> definitions = HashMultimap.create();
  Multimap<String, Location> usages = HashMultimap.create();

  @Override
  public void define(String name, Location location) {
    definitions.put(name, location);
  }

  @Override
  public void addUsage(String name, Location location) {
    usages.put(name, location);
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
