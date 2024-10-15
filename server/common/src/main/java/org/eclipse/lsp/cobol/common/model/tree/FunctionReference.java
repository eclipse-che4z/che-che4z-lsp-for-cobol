/*
 * Copyright (c) 2024 Broadcom.
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

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

import org.eclipse.lsp.cobol.common.model.DefinedAndUsedStructure;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp4j.Location;

import com.google.common.collect.ImmutableList;

@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class FunctionReference extends Node implements DefinedAndUsedStructure {
  final String name;
  @Setter
  private List<Location> definitions = ImmutableList.of();
  @Setter
  private List<Location> usages = ImmutableList.of();

  public FunctionReference(Locality locality, String name) {
    super(locality, NodeType.FUNCTION_REFERENCE);
    this.name = name;
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
