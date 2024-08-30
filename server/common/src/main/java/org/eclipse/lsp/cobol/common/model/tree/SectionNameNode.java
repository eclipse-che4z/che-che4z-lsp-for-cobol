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

import java.util.List;

/** The class represents section name node in COBOL grammar. */
@Getter
public class SectionNameNode extends Node implements DefinedAndUsedStructure {
  private final String name;

  @Setter
  private List<Location> definitions;
  @Setter
  private List<Location> usages;

  public SectionNameNode(
      Locality location, String name) {
    super(location, NodeType.SECTION_NAME_NODE);
    this.name = name.toUpperCase();
  }

  @Override
  public List<Location> getDefinitions() {
    return definitions;
  }

  @Override
  public List<Location> getUsages() {
    return usages;
  }
}
