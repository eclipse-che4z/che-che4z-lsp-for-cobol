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
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionNode;
import org.eclipse.lsp.cobol.core.model.variables.SectionType;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.*;

/** Test {@link Node} */
class NodeTest {
  private static final Locality LOCALITY = Locality.builder().build();
  private static final NamedSubContext COPYBOOK = new NamedSubContext();

  @Test
  void getDepthFirstStream() {
    Node rootNode = new RootNode(LOCALITY, COPYBOOK);
    Node firstProg = new ProgramNode(LOCALITY);
    Node sectionNode = new SectionNode(LOCALITY, SectionType.WORKING_STORAGE);
    Node definition = VariableDefinitionNode.builder().build();
    Node nestedProg = new ProgramNode(LOCALITY);
    Node secondProg = new ProgramNode(LOCALITY);
    Node anotherDefinition = VariableDefinitionNode.builder().build();

    rootNode.addChild(firstProg);
    firstProg.addChild(sectionNode);
    sectionNode.addChild(definition);
    firstProg.addChild(nestedProg);
    rootNode.addChild(secondProg);
    secondProg.addChild(anotherDefinition);

    List<Node> expectedResult =
        ImmutableList.of(
            rootNode,
            firstProg,
            sectionNode,
            definition,
            nestedProg,
            secondProg,
            anotherDefinition);
    assertEquals(expectedResult, rootNode.getDepthFirstStream().collect(Collectors.toList()));
  }

  @Test
  void getParentByType() {
    Node rootNode = new RootNode(LOCALITY, COPYBOOK);
    Node program = new ProgramNode(LOCALITY);
    rootNode.addChild(program);
    Node nestedProgram = new ProgramNode(LOCALITY);
    program.addChild(nestedProgram);
    Node section = new SectionNode(LOCALITY, SectionType.WORKING_STORAGE);
    nestedProgram.addChild(section);
    Node definition = VariableDefinitionNode.builder().build();
    section.addChild(definition);

    assertFalse(rootNode.getNearestParentByType(NodeType.PROGRAM).isPresent());

    Optional<Node> progFromDefinition = definition.getNearestParentByType(NodeType.PROGRAM);
    assertTrue(progFromDefinition.isPresent());
    assertEquals(nestedProgram, progFromDefinition.get());

    Optional<Node> rootFromSection = section.getNearestParentByType(NodeType.ROOT);
    assertTrue(rootFromSection.isPresent());
    assertEquals(rootNode, rootFromSection.get());
  }
}
