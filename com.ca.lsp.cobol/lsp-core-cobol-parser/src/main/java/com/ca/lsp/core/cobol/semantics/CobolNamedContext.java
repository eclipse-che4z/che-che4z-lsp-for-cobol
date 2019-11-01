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
import lombok.Getter;

import java.util.Collection;

class CobolNamedContext implements SubContext<String> {

  @Getter private Multimap<String, Position> definitions = HashMultimap.create();
  @Getter private Multimap<String, Position> usages = HashMultimap.create();

  @Override
  public void define(String paragraph, Position position) {
    definitions.put(paragraph, position);
  }

  @Override
  public void addUsage(String paragraph, Position position) {
    usages.put(paragraph, position);
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
