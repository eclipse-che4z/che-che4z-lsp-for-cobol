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

import java.util.ArrayList;
import java.util.List;

/** The class represents paragraphs name node in COBOL grammar. */
@Getter
public class ParagraphDefinitionNameNode extends Node implements Context {
  private final String paragraphName;
  List<Location> definitions = new ArrayList<>();
  List<Location> usageLocations = new ArrayList<>();

  public ParagraphDefinitionNameNode(String name, Locality location) {
    super(location, NodeType.PARAGRAPH_DEFINITION_NAME_NODE);
    paragraphName = name.toUpperCase();
    addProcessStep(this::processNode);
  }

  private List<SyntaxError> processNode() {
    return registerParagraph();
  }

  @Override
  public List<Location> getDefinitions() {
    return getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .map(ProgramNode::getParagraphNodes)
        .get()
        .get(paragraphName)
        .definitions;
  }

  public List<Location> getUsages() {
    return getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .map(ProgramNode::getParagraphNodes)
        .get()
        .get(paragraphName)
        .usageLocations;
  }

  private List<SyntaxError> registerParagraph() {
    return getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .flatMap(parent -> parent.registerParagraphNameNode(this))
        .map(ImmutableList::of)
        .orElseGet(() -> ImmutableList.of());
  }

  void addUsage(Location location) {
    usageLocations.add(location);
  }

  void addDefinition(Location location) {
    definitions.add(location);
  }
}
