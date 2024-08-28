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

/** The class represents program ID. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class ProgramIdNode extends Node implements DefinedAndUsedStructure {
  String programId;
  final ProgramSubtype subtype;
  @Setter
  private List<Location> definitions = ImmutableList.of();
  @Setter
  private List<Location> usages = ImmutableList.of();

  public ProgramIdNode(Locality locality, String programId, ProgramSubtype subtype) {
    super(locality, NodeType.PROGRAM_ID);
    this.programId = programId;
    this.subtype = subtype;
  }

  @Override
  public List<Location> getDefinitions() {
    return definitions;
  }

  @Override
  public List<Location> getUsages() {
    return usages;
  }

  @Override
  public String getName() {
    return getProgramId();
  }
}
