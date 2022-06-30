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
import lombok.Setter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp4j.Location;

import java.util.List;
import java.util.Optional;

/** The class represents the copyBookNode. */
@ToString(callSuper = true)
@Getter
public class CopyNode extends Node implements Context {
  private final String name;
  @Setter @EqualsAndHashCode.Exclude @ToString.Exclude private CopyDefinition definition;

  public CopyNode(Locality locality, String copyBookName) {
    super(locality, NodeType.COPY);
    this.name = copyBookName;
  }

  public CopyNode(Locality locality, String copyBookName, String dialect) {
    super(locality, NodeType.COPY, dialect);
    this.name = copyBookName;
  }

  @Override
  public List<Location> getDefinitions() {
    return Optional.ofNullable(definition).map(CopyDefinition::getDefinitions).orElse(ImmutableList.of());
  }

  @Override
  public List<Location> getUsages() {
    return Optional.ofNullable(definition)
        .map(CopyDefinition::getUsages)
        .orElseGet(ImmutableList::of);
  }

  @Override
  public String getDialect() {
    return super.getDialect();
  }
}
