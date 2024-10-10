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

import lombok.Getter;

import java.util.List;

import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * Extended document class
 */
public class ExtendedDocument {
  @Getter
  private final String originalText;
  private final ExtendedText baseText;
  @Getter
  private final ExtendedText currentText;
  @Getter
  private boolean dirty;

  public ExtendedDocument(String text, String uri) {
    originalText = text;
    baseText = new ExtendedText("", uri);
    currentText = new ExtendedText(text, uri);
    dirty = true;
    commitTransformations();
  }

  public ExtendedDocument(ExtendedText extendedText, String originalText) {
    this.originalText = originalText;
    baseText = new ExtendedText("", extendedText.getUri());
    currentText = extendedText;
    dirty = true;
    commitTransformations();
  }

  public String getUri() {
    return baseText.getUri();
  }

  /**
   * Returns original text, situated between the start and the end lines from the locality range
   * @param locality - the text locality
   * @return string value that represents a text from the original document
   */
  public String getBaseText(Locality locality) {
    int startLine = locality.getRange().getStart().getLine();
    int endLine = locality.getRange().getEnd().getLine();;

    if (!baseText.getUri().equals(locality.getUri())
        || baseText.getLines().size() <= endLine) {
      return "";
    }
    StringBuilder sb = new StringBuilder();
    for (int i = startLine; i <= endLine; i++) {
      sb.append(baseText.getLines().get(i).toString());
      if (i != endLine) {
        sb.append("\r\n");
      }
    }
    return sb.toString();
  }

  /**
   * Commit changes
   */
  public void commitTransformations() {
    if (isDirty()) {
      baseText.clear();
      for (ExtendedTextLine line : currentText.getLines()) {
        baseText.add(line.shadowCopy());
      }
      dirty = false;
    }
  }

  /**
   * Map a range in an extended to its original location
   *
   * @param range in the extended document
   * @return a location of original source
   */
  public Location mapLocation(Range range) {
    return baseText.mapLocation(range);
  }

  /**
   * Substitutes copybook statement range with a copybook extended text
   * @param copyStatementRange - a copybook statement range
   * @param copybook - a copybook extended text
   */
  public void insertCopybook(Range copyStatementRange, ExtendedText copybook) {
    copyStatementRange = updateRangeDueToChanges(copyStatementRange);
    currentText.insert(copyStatementRange, copybook);
    dirty = true;
  }

  /**
   * Substitutes copybook statement range with a copybook extended text with respect to spaces
   * @param copyStatementRange - a copybook statement range
   * @param copybook - a copybook extended text
   */
  public void insertCopybookWithPadding(Range copyStatementRange, ExtendedText copybook) {
    copyStatementRange = updateRangeDueToChanges(copyStatementRange);
    currentText.insertWithPadding(copyStatementRange, copybook);
    dirty = true;
  }

  /**
   * Inserts a copybook extended text to the given line number
   * @param line - a line number
   * @param copybook - a copybook extended text
   */
  public void insertCopybook(int line, ExtendedText copybook) {
    int updatedLine = updateLineDueToChanges(line);
    currentText.insert(updatedLine, copybook, new Location(currentText.getUri(), new Range(new Position(line, 0), new Position(line, 0))));
    dirty = true;
  }

  /**
   * Replaces given range of text with a new text
   * @param range - range of text to replace
   * @param newText - a new text
   */
  public void replace(Range range, String newText) {
    Range updatedRange = updateRangeDueToChanges(range);
    currentText.replace(updatedRange, newText, mapLocation(range));
    dirty = true;
  }

  /**
   * Replaces given range of text with a new text
   * @param range - range of text to replace
   * @param textLine - a new Extended text
   */
  public void replace(Range range, ExtendedTextLine textLine) {
    Range updatedRange = updateRangeDueToChanges(range);
    currentText.clear(updatedRange);
    currentText.append(updatedRange.getStart().getLine(), textLine);
    dirty = true;
  }

  /**
   * Cleares a range of text
   * @param range - a range of text
   */
  public void clear(Range range) {
    range = updateRangeDueToChanges(range);
    currentText.clear(range);
    dirty = true;
  }

  /**
   * Fill the range with the given character
   * @param range - a range of text
   * @param c - the character
   */
  public void fillArea(Range range, char c) {
    range = updateRangeDueToChanges(range);
    currentText.fillArea(range, c);
    dirty = true;
  }

  @Override
  public String toString() {
    return baseText.toString();
  }

  /**
   * Checks if a line segment can be trimmed to empty string
   * @param lineno line number to investigate
   * @param start start column
   * @param end end column (exclusive)
   * @return segment consists of trimmable characters only
   */
  public boolean isLineEmptyBetweenColumns(int lineno, int start, int end) {
    assert 0 <= lineno;
    assert 0 <= start;
    assert start <= end;
    List<ExtendedTextLine> lines = baseText.getLines();
    if (lineno >= lines.size())
      return true;
    List<MappedCharacter> chars = lines.get(lineno).getCharacters();
    for (int i = start; i < chars.size() && i < end; ++i) {
      // emulates behavior of trim function
      if (chars.get(i).getCharacter() > ' ')
        return false;
    }
    return true;
  }

  private Range updateRangeDueToChanges(Range range) {
    if (isDirty()) {
      range = new Range(updatePositionDueToChanges(range.getStart()), updatePositionDueToChanges(range.getEnd()));
    }
    return range;
  }

  private int updateLineDueToChanges(int lineNumber) {
    int result = lineNumber;
    if (isDirty()) {
      ExtendedTextLine line = baseText.getLines().get(lineNumber);
      if (line.getCharacters().size() > 0) {
        ExtendedTextLine parentLine = line.getCharacters().get(0).getParent();
        result = currentText.getLines().indexOf(parentLine);
      }
    }
    return result;
  }

  private Position updatePositionDueToChanges(Position position) {
    int currentLine = updateLineDueToChanges(position.getLine());
    int currentChar = position.getCharacter();

    ExtendedTextLine line = baseText.getLines().get(position.getLine());
    if (position.getCharacter() < line.size()) {
      MappedCharacter character = line.getCharacterAt(position.getCharacter());
      currentChar = currentText.getLines().get(currentLine).getCharacters().indexOf(character);
      if (currentChar < 0) {
        currentChar = position.getCharacter();
      }
    }
    return new Position(currentLine, currentChar);
  }
}
