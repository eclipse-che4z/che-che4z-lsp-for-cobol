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
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp4j.Location;

import java.util.List;

/** The class represents paragraphs or section name node in COBOL grammar. */
@Getter
public class CodeBlockNameNode extends Node implements Context {
  private final String name;

  public CodeBlockNameNode(Locality location, String name) {
    super(location, NodeType.PARAGRAPH_SECTION_NAME_NODE);
    this.name = name.toUpperCase();
    addProcessStep(this::processNode);
  }

  private List<SyntaxError> processNode() {
    return registerNode();
  }

  @Override
  public List<Location> getDefinitions() {
    return getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .map(ProgramNode::getBlockReference)
        .map(it -> it.get(getName()).getDefinitions())
        .orElse(ImmutableList.of());
  }

  @Override
  public List<Location> getUsages() {
    return getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .map(ProgramNode::getBlockReference)
        .map(it -> it.get(getName()).getUsage())
        .orElse(ImmutableList.of());
  }

  private List<SyntaxError> registerNode() {
    return getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .flatMap(parent -> parent.registerNameNode(this))
        .map(ImmutableList::of)
        .orElseGet(() -> ImmutableList.of());
  }
}
