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
import static org.junit.jupiter.api.Assertions.assertNull;

import java.util.List;
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
  void createsStandaloneDefinitionsAndRejectsDuplicateLocations() {
    String source = "DEFINE MAP FIRST, SECOND.";
    Range statementRange = new Range(new Position(0, 0), new Position(0, source.length()));
    Location firstLocation = location(source, "FIRST");
    ReplacementTokens firstDefinition =
        new ReplacementTokens(
            new ReplacementToken[] {token("FIRST", firstLocation, 1)},
            "DIALECT_VARIABLE_DEFINITION");
    ReplacementTokens duplicateDefinition =
        new ReplacementTokens(
            new ReplacementToken[] {token("FIRST_DUPLICATE", firstLocation, 1)},
            "DIALECT_VARIABLE_DEFINITION");
    ReplacementTokens secondDefinition =
        new ReplacementTokens(
            new ReplacementToken[] {token("SECOND", location(source, "SECOND"), 1)},
            "DIALECT_VARIABLE_DEFINITION");
    DocumentReplacementMap replacement =
        new DocumentReplacementMap(
            statementRange,
            statementRange,
            new ReplacementTokens[] {firstDefinition, duplicateDefinition, secondDefinition},
            " ");
    ExtendedDocument document = new ExtendedDocument(source, URI);
    List<Node> nodes =
        DialectProcessingService.applyReplacements(
            document,
            new DocumentReplacement[0],
            new DocumentReplacementMap[] {replacement},
            new DocumentInsertionMap[0],
            null);

    assertEquals(2, nodes.size());
    DialectVariableNode firstNode = (DialectVariableNode) nodes.get(0);
    DialectVariableNode secondNode = (DialectVariableNode) nodes.get(1);
    assertEquals("FIRST", firstNode.getName());
    assertEquals("SECOND", secondNode.getName());
    assertNull(firstNode.getParent());
    assertNull(secondNode.getParent());
  }

  private static ReplacementToken token(String name, Location location, int level) {
    return new ReplacementToken(name, null, location, name, level);
  }

  private static Location location(String source, String name) {
    int start = source.indexOf(name);
    return new Location(
        URI, new Range(new Position(0, start), new Position(0, start + name.length())));
  }
}
