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

import static org.eclipse.lsp.cobol.common.model.NodeType.VARIABLE_DEFINITION_NAME;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import com.google.common.collect.ImmutableList;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
        createNodes(item, ImmutableList.of(new Token("ABCDE", location)), new HashSet<>());

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
  void rejectsMultipleDefinitionTokens() {
    Location childLocation = location(4, 10, 15);
    Location parentLocation = location(4, 19, 25);
    ReplacementTokens item =
        item(
            new ReplacementToken("CHILD", null, childLocation, "CHILD DISPLAY", 5),
            new ReplacementToken("PARENT", null, parentLocation, "PARENT DISPLAY", 1));

    Set<Locality> definitions = new HashSet<>();
    List<Node> nodes =
        createNodes(
            item,
            ImmutableList.of(
                new Token("CHILD", childLocation), new Token("PARENT", parentLocation)),
            definitions);

    assertEquals(0, nodes.size());
    assertEquals(0, definitions.size());
  }

  @Test
  void rejectsDuplicateDefinitionLocation() {
    Location location = location(6, 20, 26);
    ReplacementTokens item = item(new ReplacementToken("MAP", null, location, "MAP ABCDE."));
    List<Token> mappedTokens = ImmutableList.of(new Token("ABCDE", location));
    Set<Locality> definitions = new HashSet<>();

    assertEquals(1, createNodes(item, mappedTokens, definitions).size());
    assertEquals(0, createNodes(item, mappedTokens, definitions).size());
    assertEquals(1, definitions.size());
  }

  private static ReplacementTokens item(ReplacementToken... tokens) {
    return new ReplacementTokens(tokens, "DIALECT_VARIABLE_DEFINITION");
  }

  private static List<Node> createNodes(
      ReplacementTokens item, List<Token> mappedTokens, Set<Locality> definitions) {
    return NodeHelper.createNodesIfNeeded(item, mappedTokens, URI, COPYBOOK_ID, definitions)
        .orElseGet(ArrayList::new);
  }

  private static Location location(int line, int start, int end) {
    return new Location(URI, new Range(new Position(line, start), new Position(line, end)));
  }
}
