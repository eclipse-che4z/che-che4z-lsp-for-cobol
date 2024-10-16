/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.common.mapping;

import org.eclipse.lsp.cobol.common.model.Uri;
import org.eclipse.lsp4j.Position;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test for ExtendedTextLine
 */
class ExtendedTextLineTest {
  @Test
  void testToString() {
    ExtendedTextLine line = new ExtendedTextLine("text", 0, new Uri("uri"));
    assertEquals("text", line.toString());
  }

  @Test
  void testGetCharacter() {
    ExtendedTextLine line = new ExtendedTextLine("text text", 5, new Uri("uri"));
    MappedCharacter character = line.getCharacterAt(6);

    assertEquals('e', character.getCharacter());
    assertEquals(new Uri("uri"), character.getUri());
    assertEquals(new Position(5, 6).toString(), character.getOriginalPosition().toString());
  }

  @Test
  void testTrim() {
    ExtendedTextLine line = new ExtendedTextLine("text trim", 5, new Uri("uri"));
    line.trim(4);
    assertEquals("text", line.toString());
  }

  @Test
  void testInsert() {
    ExtendedTextLine line = new ExtendedTextLine("text <-i", 5, new Uri("uri"));
    line.insert(5, new ExtendedTextLine("INSERT", new Position(11, 0), new Uri("copybook")));

    MappedCharacter character = line.getCharacterAt(5);
    assertEquals("text INSERT<-i", line.toString());
    assertEquals('I', character.getCharacter());
    assertEquals(new Uri("copybook"), character.getUri());
    assertEquals(new Position(11, 0).toString(), character.getOriginalPosition().toString());
  }

  @Test
  void testDelete() {
    ExtendedTextLine line = new ExtendedTextLine("text DELETE end", 5, new Uri("uri"));
    line.delete(5, 10);
    assertEquals("text  end", line.toString());
  }

  @Test
  void testAppend() {
    ExtendedTextLine line = new ExtendedTextLine("text end", 7, new Uri("uri"));
    line.append(new ExtendedTextLine(" append", 11, new Uri("copybook")));

    assertEquals("text end append", line.toString());

    MappedCharacter character = line.getCharacterAt(9);
    assertEquals('a', character.getCharacter());
    assertEquals(new Position(11, 1).toString(), character.getOriginalPosition().toString());
    assertEquals(new Uri("copybook"), character.getUri());
  }

  @Test
  void testNewLineCharacter() {
    RuntimeException thrown = Assertions.assertThrows(RuntimeException.class,
            () -> new ExtendedTextLine("text \r\n end", 6, new Uri("uri")));
    Assertions.assertEquals("Text line contains a new line characters", thrown.getMessage());
  }

  @Test
  void testClear() {
    ExtendedTextLine line = new ExtendedTextLine("text end", 7, new Uri("uri"));
    line.clear(2, 5);
    assertEquals("te    nd", line.toString());
  }

  @Test
  void testSubline() {
    ExtendedTextLine line = new ExtendedTextLine("text end", 7, new Uri("uri"));
    ExtendedTextLine subline = line.subline(2, 5);
    assertEquals("xt e", subline.toString());
  }
}
