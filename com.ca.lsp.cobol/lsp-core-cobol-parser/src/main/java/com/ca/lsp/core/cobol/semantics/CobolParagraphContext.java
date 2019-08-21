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

public class CobolParagraphContext implements LanguageContext<String> {

  private Multimap<String, Position> paragraphDefinitions = HashMultimap.create();
  private Multimap<String, Position> paragraphUsages = HashMultimap.create();

  @Override
  public void define(String paragraph, Position position) {
    paragraphDefinitions.put(paragraph, position);
  }

  @Override
  public void addUsage(String paragraph, Position position) {
    paragraphUsages.put(paragraph, position);
  }

  @Override
  public Collection<String> getAll() {
    return paragraphDefinitions.keySet();
  }

  @Override
  public boolean contains(String name) {
    return paragraphDefinitions.containsKey(name);
  }

  @Override
  public Multimap<String, Position> getUsages() {
    return paragraphDefinitions;
  }

  @Override
  public Multimap<String, Position> getDefinitions() {
    return paragraphUsages;
  }
}
