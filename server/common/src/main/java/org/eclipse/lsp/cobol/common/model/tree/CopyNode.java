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
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.*;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

/** The class represents the copyBookNode. */
@ToString(callSuper = true)
@Getter
public class CopyNode extends Node implements DefinedAndUsedStructure {
  private final String name;
  @EqualsAndHashCode.Exclude @ToString.Exclude private final Location nameLocation;
  private final String uri;
  private final List<Location> usages = new LinkedList<>();

  public CopyNode(Locality statementLocality, Location nameLocation, String copyBookName, String uri) {
    super(statementLocality, NodeType.COPY);
    this.name = copyBookName;
    this.nameLocation = nameLocation;
    this.uri = uri;
    usages.add(nameLocation);
  }

  public CopyNode(Locality statementLocality, Location nameLocation, String copyBookName, String dialect, String uri) {
    super(statementLocality, NodeType.COPY, dialect);
    this.name = copyBookName;
    this.nameLocation = nameLocation;
    this.uri = uri;
    usages.add(nameLocation);
  }

  @Override
  public List<Location> getDefinitions() {
    return Optional.ofNullable(uri).map(u -> ImmutableList.of(new Location(u, new Range(new Position(), new Position()))))
        .orElse(ImmutableList.of());
  }

  @Override
  public List<Location> getUsages() {
    return ImmutableList.copyOf(usages);
  }

  @Override
  public String getDialect() {
    return super.getDialect();
  }

  /**
   * Add a copybook usage
   * @param nameLocation is the copybook name location
   */
  public void addUsage(Location nameLocation) {
    usages.add(nameLocation);
  }
}
