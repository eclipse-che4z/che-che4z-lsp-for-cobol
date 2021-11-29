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

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/** The class represents the CopyBookDefinition Node. */
@ToString(callSuper = true)
@Getter
public class CopyDefinition {
  private final String copyBookName;
  private final Location location;
  @EqualsAndHashCode.Exclude private final List<CopyNode> usages = new ArrayList<>();

  public CopyDefinition(Location locality, String copyBookName) {
    this.location = locality;
    this.copyBookName = copyBookName;
  }

  void addUsages(CopyNode node) {
    usages.add(node);
    node.setDefinition(this);
  }

  public List<Location> getDefinitions() {
    return ImmutableList.of(location);
  }

  public List<Location> getUsages() {
    return usages.stream().map(Node::getLocality).map(Locality::toLocation).collect(Collectors.toList());
  }
}
