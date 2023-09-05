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
package org.eclipse.lsp.cobol.common.model.tree;

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/** The class represents the Subroutine definition. */
@Getter
public class SubroutineDefinition {
  private final String subroutineName;
  private final Location location;
  @EqualsAndHashCode.Exclude private final List<SubroutineNameNode> usages = new ArrayList<>();

  public SubroutineDefinition(Location locality, String subroutineName) {
    this.location = locality;
    this.subroutineName = subroutineName;
  }

  /**
   * Add the references of the SubroutineNameNode
   *
   * @param node
   */
  public void addUsages(SubroutineNameNode node) {
    usages.add(node);
    node.setDefinition(this);
  }

  public List<Location> getDefinitions() {
    return ImmutableList.of(location);
  }

  public List<Location> getUsages() {
    return usages.stream()
        .map(Node::getLocality)
        .map(Locality::toLocation)
        .collect(Collectors.toList());
  }
}
