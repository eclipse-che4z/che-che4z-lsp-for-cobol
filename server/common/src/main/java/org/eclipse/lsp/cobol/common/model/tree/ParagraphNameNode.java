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
package org.eclipse.lsp.cobol.common.model.tree;

import lombok.Getter;
import lombok.Setter;
import org.eclipse.lsp.cobol.common.model.DefinedAndUsedStructure;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp4j.Location;

import com.google.common.collect.ImmutableList;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** The class represents paragraphs or section name node in COBOL grammar. */
public class ParagraphNameNode extends Node implements DefinedAndUsedStructure {
  @Getter
  private final String name;
  private final List<Location> definitions = new ArrayList<>();
  private final List<Location> usages = new ArrayList<>();

  public ParagraphNameNode(Locality location, String paragraphName) {
    super(location, NodeType.PARAGRAPH_NAME_NODE);
    this.name = paragraphName.toUpperCase();
  }

  @Override
  public List<Location> getDefinitions() {
    return Collections.unmodifiableList(definitions);
  }

  @Override
  public List<Location> getUsages() {
    return Collections.unmodifiableList(usages);
  }

  public void addUsages(List<Location> usages) {
    this.usages.addAll(usages);
  }

  public void addDefinitions(List<Location> definitions) {
    this.definitions.addAll(definitions);
  }
}
