/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.core.model.tree;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp4j.Location;

import java.util.List;

/** The class represents the Subroutine Usage node. */
@ToString(callSuper = true)
@Getter
public class SubroutineNameNode extends Node implements Context {
  private final String name;
  @Setter private SubroutineDefinition definition;

  public SubroutineNameNode(Locality locality, String subroutineName) {
    super(locality, NodeType.SUBROUTINE_NAME_NODE);
    this.name = subroutineName;
  }

  @Override
  public List<Location> getDefinitions() {
    return definition.getDefinitions();
  }

  @Override
  public List<Location> getUsages() {
    return definition.getUsages();
  }
}
