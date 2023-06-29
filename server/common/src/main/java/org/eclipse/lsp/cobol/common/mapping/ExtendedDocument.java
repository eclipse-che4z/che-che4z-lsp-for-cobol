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
   * Cleares a range of text
   * @param range - a range of text
   */
  public void clear(Range range) {
    range = updateRangeDueToChanges(range);
    currentText.clear(range);
    dirty = true;
  }

  @Override
  public String toString() {
    return baseText.toString();
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
