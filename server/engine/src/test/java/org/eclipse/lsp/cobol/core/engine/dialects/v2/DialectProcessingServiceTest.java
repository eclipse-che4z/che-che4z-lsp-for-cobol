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

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertSame;

import java.util.List;
import java.util.stream.Collectors;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variables.DialectVariableNode;
import org.eclipse.lsp.cobol.lsp.jrpc.DocumentInsertionMap;
import org.eclipse.lsp.cobol.lsp.jrpc.DocumentReplacement;
import org.eclipse.lsp.cobol.lsp.jrpc.DocumentReplacementMap;
import org.eclipse.lsp.cobol.lsp.jrpc.ReplacementToken;
import org.eclipse.lsp.cobol.lsp.jrpc.ReplacementTokens;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests dialect replacements that produce semantic nodes. */
class DialectProcessingServiceTest {
  private static final String URI = "file:///program.cbl";

  @Test
  void returnsOneRootForBranchingDefinitionPaths() {
    String source = "DEFINE TREE ROOT > PARENT > LEAF-A, LEAF-B.";
    Range statementRange = new Range(new Position(0, 0), new Position(0, source.length()));
    Location rootLocation = location(source, "ROOT");
    Location parentLocation = location(source, "PARENT");
    ReplacementToken root = token("ROOT", rootLocation, 1);
    ReplacementToken parent = token("PARENT", parentLocation, 5);
    ReplacementTokens firstPath =
        new ReplacementTokens(
            new ReplacementToken[] {token("LEAF_A", location(source, "LEAF-A"), 10), parent, root},
            "DIALECT_VARIABLE_DEFINITION");
    ReplacementTokens secondPath =
        new ReplacementTokens(
            new ReplacementToken[] {token("LEAF_B", location(source, "LEAF-B"), 10), parent, root},
            "DIALECT_VARIABLE_DEFINITION");
    DocumentReplacementMap replacement =
        new DocumentReplacementMap(
            statementRange, statementRange, new ReplacementTokens[] {firstPath, secondPath}, " ");
    ExtendedDocument document = new ExtendedDocument(source, URI);
    List<Node> nodes =
        DialectProcessingService.applyReplacements(
            document,
            new DocumentReplacement[0],
            new DocumentReplacementMap[] {replacement},
            new DocumentInsertionMap[0],
            null);

    assertEquals(1, nodes.size());
    DialectVariableNode rootNode = (DialectVariableNode) nodes.get(0);
    assertEquals("ROOT", rootNode.getName());
    DialectVariableNode parentNode = variableChildren(rootNode).get(0);
    assertEquals("PARENT", parentNode.getName());
    assertSame(rootNode, parentNode.getParent());
    List<DialectVariableNode> leaves = variableChildren(parentNode);
    assertEquals(2, leaves.size());
    assertEquals("LEAF-A", leaves.get(0).getName());
    assertEquals("LEAF-B", leaves.get(1).getName());
    leaves.forEach(leaf -> assertSame(parentNode, leaf.getParent()));
  }

  private static ReplacementToken token(String name, Location location, int level) {
    return new ReplacementToken(name, null, location, name, level);
  }

  private static Location location(String source, String name) {
    int start = source.indexOf(name);
    return new Location(
        URI, new Range(new Position(0, start), new Position(0, start + name.length())));
  }

  private static List<DialectVariableNode> variableChildren(DialectVariableNode parent) {
    return parent.getChildren().stream()
        .filter(DialectVariableNode.class::isInstance)
        .map(DialectVariableNode.class::cast)
        .collect(Collectors.toList());
  }
}
