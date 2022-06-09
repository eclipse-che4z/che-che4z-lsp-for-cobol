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
import lombok.Getter;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp4j.Location;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.*;

/** The class represents section name node in COBOL grammar. */
@Getter
public class SectionNameNode extends Node implements Context {
  private final String name;

  public SectionNameNode(Locality location, String name, MessageService messageService) {
    super(location, NodeType.SECTION_NAME_NODE);
    this.name = name.toUpperCase();
    addProcessStep(() -> registerNode(messageService));
  }

  @Override
  public List<Location> getDefinitions() {
    return getLocations(CodeBlockReference::getDefinitions);
  }

  @Override
  public List<Location> getUsages() {
    return getLocations(CodeBlockReference::getUsage);
  }

  private List<SyntaxError> registerNode(MessageService messageService) {
    if (getParent().getNodeType() != PROCEDURE_SECTION) {
      // TODO: register usage
      return Collections.emptyList();
    }
    return getNearestParentByType(PROGRAM)
        .map(ProgramNode.class::cast)
        .flatMap(parent -> parent.verifySectionNodeDuplication(this, messageService).map(Optional::of)
                .orElse(parent.registerSectionNameNode(this)))
        .map(ImmutableList::of)
        .orElseGet(ImmutableList::of);
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
