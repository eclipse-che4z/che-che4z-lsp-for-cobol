/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.engine.dialects.v2;

import static org.eclipse.lsp.cobol.common.model.NodeType.VARIABLE;
import static org.eclipse.lsp.cobol.common.model.NodeType.VARIABLE_DEFINITION_NAME;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertSame;

import com.google.common.collect.ImmutableList;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.eclipse.lsp.cobol.common.mapping.Token;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variables.DialectVariableNode;
import org.eclipse.lsp.cobol.lsp.jrpc.ReplacementToken;
import org.eclipse.lsp.cobol.lsp.jrpc.ReplacementTokens;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests creation of semantic nodes from dialect replacement tokens. */
class NodeHelperTest {
  private static final String URI = "file:///program.cbl";
  private static final String COPYBOOK_ID = "copybook-id";

  @Test
  void createsVariableDefinitionWithDisplayText() {
    Location location = location(2, 15, 20);
    ReplacementTokens item = item(new ReplacementToken("MAP", null, location, "MAP ABCDE."));

    List<Node> nodes =
        createNodes(item, ImmutableList.of(new Token("ABCDE", location)), new HashMap<>());

    DialectVariableNode definition = (DialectVariableNode) nodes.get(0);
    assertEquals("ABCDE", definition.getName());
    assertEquals("MAP ABCDE.", definition.getDisplayText());
    assertNull(definition.getLevel());
    assertEquals(COPYBOOK_ID, definition.getLocality().getCopybookId());
    assertEquals(1, definition.getChildren().size());
    assertEquals(VARIABLE_DEFINITION_NAME, definition.getChildren().get(0).getNodeType());
    assertEquals(location.getRange(), definition.getChildren().get(0).getLocality().getRange());
  }

  @Test
  void createsQualifiedDefinitionFromChildToParentTokens() {
    Location childLocation = location(4, 10, 15);
    Location parentLocation = location(4, 19, 25);
    ReplacementTokens item =
        item(
            new ReplacementToken("CHILD", null, childLocation, "CHILD DISPLAY", 5),
            new ReplacementToken("PARENT", null, parentLocation, "PARENT DISPLAY", 1));

    List<Node> nodes =
        createNodes(
            item,
            ImmutableList.of(
                new Token("CHILD", childLocation), new Token("PARENT", parentLocation)),
            new HashMap<>());

    DialectVariableNode parent = (DialectVariableNode) nodes.get(0);
    DialectVariableNode child =
        parent.getChildren().stream()
            .filter(Node.hasType(VARIABLE))
            .map(DialectVariableNode.class::cast)
            .findFirst()
            .orElseThrow(AssertionError::new);
    assertEquals("PARENT", parent.getName());
    assertEquals("PARENT DISPLAY", parent.getDisplayText());
    assertEquals(1, parent.getLevel());
    assertEquals("CHILD", child.getName());
    assertEquals("CHILD DISPLAY", child.getDisplayText());
    assertEquals(5, child.getLevel());
    assertSame(parent, child.getParent());
  }

  @Test
  void reusesAParentDefinitionAcrossItems() {
    Location parentLocation = location(6, 20, 26);
    Map<Locality, DialectVariableNode> definitions = new HashMap<>();

    DialectVariableNode firstParent =
        (DialectVariableNode)
            createNodes(
                    item(
                        new ReplacementToken("FIRST", null, location(6, 10, 15), "FIRST"),
                        new ReplacementToken("PARENT", null, parentLocation, "PARENT")),
                    ImmutableList.of(
                        new Token("FIRST", location(6, 10, 15)),
                        new Token("PARENT", parentLocation)),
                    definitions)
                .get(0);
    DialectVariableNode secondParent =
        (DialectVariableNode)
            createNodes(
                    item(
                        new ReplacementToken("SECOND", null, location(7, 10, 16), "SECOND"),
                        new ReplacementToken("PARENT", null, parentLocation, "PARENT")),
                    ImmutableList.of(
                        new Token("SECOND", location(7, 10, 16)),
                        new Token("PARENT", parentLocation)),
                    definitions)
                .get(0);

    assertSame(firstParent, secondParent);
    assertEquals(2, firstParent.getChildren().stream().filter(Node.hasType(VARIABLE)).count());
  }

  private static ReplacementTokens item(ReplacementToken... tokens) {
    return new ReplacementTokens(tokens, "DIALECT_VARIABLE_DEFINITION");
  }

  private static List<Node> createNodes(
      ReplacementTokens item,
      List<Token> mappedTokens,
      Map<Locality, DialectVariableNode> definitions) {
    return NodeHelper.createNodesIfNeeded(item, mappedTokens, URI, COPYBOOK_ID, definitions)
        .orElseGet(ArrayList::new);
  }

  private static Location location(int line, int start, int end) {
    return new Location(URI, new Range(new Position(line, start), new Position(line, end)));
  }
}
