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
package org.eclipse.lsp.cobol.core.model.tree;

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.engine.symbols.CodeBlockReference;
import org.eclipse.lsp.cobol.core.engine.symbols.Context;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp4j.Location;

import java.util.List;
import java.util.function.Function;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.PROGRAM;

/** The class represents section name node in COBOL grammar. */
@Getter
public class SectionNameNode extends Node implements Context {
  private final String name;
  @EqualsAndHashCode.Exclude @ToString.Exclude
  private final MessageService messageService;

  public SectionNameNode(Locality location, String name, MessageService messageService) {
    super(location, NodeType.SECTION_NAME_NODE);
    this.name = name.toUpperCase();
    this.messageService = messageService;
  }

  @Override
  public List<Location> getDefinitions() {
    return getLocations(CodeBlockReference::getDefinitions);
  }

  @Override
  public List<Location> getUsages() {
    return getLocations(CodeBlockReference::getUsage);
  }

  private List<Location> getLocations(
      Function<CodeBlockReference, List<Location>> retrieveLocations) {
    return getNearestParentByType(PROGRAM)
        .map(ProgramNode.class::cast)
        .map(ProgramNode::getSectionMap)
        .map(it -> it.get(getName()))
        .map(retrieveLocations)
        .orElse(ImmutableList.of());
  }
}
