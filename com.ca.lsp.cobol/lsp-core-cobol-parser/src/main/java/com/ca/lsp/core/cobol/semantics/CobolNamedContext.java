/*
 *
 *  Copyright (c) 2019 Broadcom.
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

import com.ca.lsp.core.cobol.model.Position;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;

import java.util.Collection;

class CobolNamedContext implements SubContext<String> {

  private Multimap<String, Position> namedDefinitions = HashMultimap.create();
  private Multimap<String, Position> namedUsages = HashMultimap.create();

  @Override
  public void define(String paragraph, Position position) {
    namedDefinitions.put(paragraph, position);
  }

  @Override
  public void addUsage(String paragraph, Position position) {
    namedUsages.put(paragraph, position);
  }

  @Override
  public Collection<String> getAll() {
    return namedDefinitions.keySet();
  }

  @Override
  public boolean contains(String name) {
    return namedDefinitions.containsKey(name);
  }

  @Override
  public Multimap<String, Position> getUsages() {
    return namedDefinitions;
  }

  @Override
  public void merge(SubContext<String> subContext) {
    namedDefinitions.putAll(subContext.getDefinitions());
    namedUsages.putAll(subContext.getUsages());
  }

  @Override
  public Multimap<String, Position> getDefinitions() {
    return namedUsages;
  }
}
