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
package org.eclipse.lsp.cobol.core.engine.dialects;

import org.eclipse.lsp.cobol.core.engine.TextTransformations;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** Text Transformation tests */
public class TestTextTransformations {
  private static final String TEST = "0: abcd\n1: TEST\n";

  @Test
  void replace() {
    TextTransformations tt = new TextTransformations(TEST, "https://example.com/text1.txt");
    tt.replace(new Range(new Position(1, 3), new Position(1, 7)), "1234");
    assertEquals("0: abcd\n1: 1234\n", tt.calculateExtendedText());
  }

  @Test
  void replaceMultiline() {
    TextTransformations tt = new TextTransformations(TEST, "https://example.com/text1.txt");
    tt.replace(new Range(new Position(0, 3), new Position(1, 7)), "hi");
    assertEquals("0: hi\n", tt.calculateExtendedText());
  }

  @Test
  void replaceMultiline2() {
    TextTransformations tt = new TextTransformations(TEST, "https://example.com/text1.txt");
    tt.replace(new Range(new Position(0, 0), new Position(0, 2)), "hi");
    tt.replace(new Range(new Position(0, 3), new Position(1, 7)), "hi");
    assertEquals("hi hi\n", tt.calculateExtendedText());
  }

  @Test
  void replaceExtend() {
    TextTransformations tt = new TextTransformations(TEST, "https://example.com/text1.txt");
    tt.replace(new Range(new Position(0, 3), new Position(1, 7)), "Hello, World!\n123\ntest11");
    assertEquals("0: Hello, World!\n123\ntest11\n", tt.calculateExtendedText());
  }

  @Test
  void replaces() {
    TextTransformations tt = new TextTransformations(TEST, "https://example.com/text1.txt");
    tt.replace(new Range(new Position(1, 3), new Position(1, 7)), "123");
    tt.replace(new Range(new Position(0, 3), new Position(0, 7)), "4321");
    assertEquals("0: 4321\n1: 123\n", tt.calculateExtendedText());
  }

  @Test
  void mixed() {
    TextTransformations tt = new TextTransformations(TEST, "https://example.com/text1.txt");
    // extend starts with 0
    Range range = new Range(new Position(1, 0), new Position(1, 7));
    CopyNode copyNode = new CopyNode(Locality.builder().range(range).build(), "BOOM");
    tt.extend(copyNode, TextTransformations.of("123\n", ""));
    tt.replace(new Range(new Position(0, 3), new Position(0, 7)), "4321");
    assertEquals("0: 4321\n123\n\n", tt.calculateExtendedText());
  }

  @Test
  void eol() {
    TextTransformations tt = new TextTransformations(TEST, "https://example.com/text1.txt");
    assertEquals(TEST, tt.calculateExtendedText());
  }

  @Test
  void extRegionsTest() {
    TextTransformations tt = new TextTransformations(TEST, "https://example.com/text1.txt");
    Range range1 = new Range(new Position(0, 7), new Position(0, 7));
    Range range2 = new Range(new Position(0, 0), new Position(0, 1));
    Range range3 = new Range(new Position(1, 0), new Position(1, 3));
    Range exRange1 = new Range(new Position(0, 8), new Position(0, 9));
    Range exRange2 = new Range(new Position(0, 0), new Position(0, 2));
    tt.replace(range1, "e");
    tt.replace(range2, "00");
    tt.replace(range3, "");
    assertEquals("00: abcde\nTEST\n", tt.calculateExtendedText());
    assertEquals(2, tt.getExtendedDocumentMap().size());
    assertEquals(range1, tt.getExtendedDocumentMap().get(exRange1).getRange());
    assertEquals(range2, tt.getExtendedDocumentMap().get(exRange2).getRange());
  }

  @Test
  void extRegionsTestRecursive() {
    TextTransformations tt = new TextTransformations("Hi!\n" + TEST, "https://example.com/text1.txt");
    Range range = new Range(new Position(1, 0), new Position(1, 7));
    CopyNode copyNode = new CopyNode(Locality.builder().range(range).build(), "BOOM");
    String boomUri = "BOOM.cpy";
    TextTransformations boom = TextTransformations.of("Line 1\nLine 2\n", boomUri);
    boom.replace(new Range(new Position(1, 2), new Position(1, 3)), "M");
    tt.extend(copyNode, boom);
    assertEquals("Hi!\nLine 1\nLiMe 2\n\n1: TEST\n", tt.calculateExtendedText());
    Map<Range, Location> map = tt.getExtendedDocumentMap();
    assertEquals(2, map.size());
    Range extBoomRange = new Range(new Position(1, 0), new Position(3, 0));
    Range extMRange = new Range(new Position(2, 2), new Position(2, 3));
    assertEquals(range, map.get(extBoomRange).getRange());
    assertEquals(boomUri, map.get(extMRange).getUri());
  }
}
