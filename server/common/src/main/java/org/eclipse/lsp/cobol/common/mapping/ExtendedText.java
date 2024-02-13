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

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Extended Text contains information about original text and current text with the mapping
 */
public class ExtendedText {
  private final List<ExtendedTextLine> lines = new ArrayList<>();
  private final List<Mapper> mappers;
  private final List<ReplaceStrategy> replacers;
  @Getter
  private final String uri;

  public ExtendedText(String text, String uri) {
    String[] textLines = MappingHelper.split(text);
    for (int i = 0; i < textLines.length; i++) {
      String line = textLines[i];
      lines.add(new ExtendedTextLine(line, i, uri));
    }
    this.uri = uri;
    mappers = ImmutableList.of(new InsertMapper(), new ReplaceMapper(), new StraightforwardMapper());
    replacers = ImmutableList.of(new OneToOneReplaceStrategy(), new SingleLineReplaceStrategy(), new MultilineReplaceStrategy());
  }

  @Override
  public String toString() {
    final StringBuilder builder = new StringBuilder();
    int index = 0;
    for (ExtendedTextLine line : lines) {
      String lineText = line.toString();
      if (!lineText.isEmpty()) {
        builder.append(lineText);
      }
      if (++index != lines.size()) {
        builder.append("\n");
      }
    }
    return builder.toString();
  }

  /**
   * Map a range in an extended to its original location
   *
   * @param range in the extended document
   * @return a location of original source
   */
  public Location mapLocation(Range range) {
    MappedCharacter startCharacter = getCharacterAt(range.getStart());
    MappedCharacter endCharacter = getCharacterAt(range.getEnd());
    if (endCharacter == null) {
      endCharacter = startCharacter;
    }
    if (startCharacter == null && endCharacter == null) {
      return new Location(uri, range);
    }
    for (Mapper mapper : mappers) {
      Location result = mapper.apply(startCharacter, endCharacter);
      if (result != null) {
        return result;
      }
    }
    throw new RuntimeException("Cannot find original position");
  }

  /**
   * Inserts an extended text to the given line number
   * @param line - a line number to insert
   * @param text - an extended text
   * @param originalLocation - an original (before changes) location for the statement
   */
  void insert(int line, ExtendedText text, Location originalLocation) {
    for (ExtendedTextLine textLine : text.lines) {
      updateLine(textLine, originalLocation);
      lines.add(line++, textLine);
    }
  }

  private ExtendedTextLine updateLine(ExtendedTextLine textLine, Location initialLocation) {
    textLine.getCharacters().forEach(c -> c.getInitialLocationMap().put(uri, initialLocation));
    return textLine;
  }

  /**
   * Inserts an extended text line to the given position
   * @param position - a position to insert
   * @param newLine - an extended line
   */
  public void insert(Position position, ExtendedTextLine newLine) {
    lines.get(position.getLine()).insert(position.getCharacter(), newLine);
  }

  /**
   * Inserts an extended text line to the given line number
   * @param line - a line number to insert
   * @param newLine - an extended line
   */
  public void insert(int line, ExtendedTextLine newLine) {
    lines.add(line, newLine);
  }

  /**
   * Substitutes copybook statement range with a copybook extended text
   * @param copyStatementRange - a copybook statement range
   * @param copybook - a copybook extended text
   */
  public void insert(Range copyStatementRange, ExtendedText copybook) {
    Location location = mapLocation(copyStatementRange);
    clear(copyStatementRange);
    // Add content of the copybook after copy statement
    addLineBreak(copyStatementRange.getStart());
    insert(copyStatementRange.getStart().getLine() + 1, copybook, location);
  }

  /**
   * Substitutes copybook statement range with a copybook extended text with respect to spaces
   * @param copyStatementRange - a copybook statement range
   * @param copybook - a copybook extended text
   */
  public void insertWithPadding(Range copyStatementRange, ExtendedText copybook) {
    clear(copyStatementRange);
    Location initialLocation = mapLocation(copyStatementRange);

    if (!copybook.lines.isEmpty()) {
      int initialLine = copyStatementRange.getStart().getLine();
      int initialChar = copyStatementRange.getStart().getCharacter();

      // First line
      ExtendedTextLine copybookLine = copybook.lines.get(0);
      ExtendedTextLine firstLine = lines.get(initialLine);
      copybookLine.trim();
      firstLine.insert(copyStatementRange.getEnd().getCharacter(), updateLine(copybookLine, initialLocation));

      for (int i = 1; i < copybook.lines.size() - 1; i++) {
        copybookLine = copybook.lines.get(i);
        copybookLine.trim();
        copybookLine.addPadding(initialChar);
        insert(initialLine + i, copybookLine);
      }

      if (copybook.lines.size() > 1) {
        // Last line
        copybookLine = copybook.lines.get(copybook.lines.size() - 1);
        copybookLine.trim();
        copybookLine.addPadding(initialChar);
        if (copyStatementRange.getStart().getLine() < copyStatementRange.getEnd().getLine()) {
          ExtendedTextLine lastLine = lines.get(initialLine + copybook.lines.size() - 1);
          lastLine.insert(0, updateLine(copybookLine, initialLocation));
        } else {
          insert(initialLine + copybook.lines.size() - 1, updateLine(copybookLine, initialLocation));
        }
      }
    }
  }

  /**
   * Removes given range of text
   * @param range - a range of text
   */
  public void delete(Range range) {
    if (range.getStart().getLine() == range.getEnd().getLine()) {
      lines.get(range.getStart().getLine()).delete(range.getStart().getCharacter(), range.getEnd().getCharacter());
    } else {
      lines.get(range.getStart().getLine()).trim(range.getStart().getCharacter());
      lines.get(range.getEnd().getLine()).delete(0, range.getEnd().getCharacter());
      if (range.getStart().getLine() + 1 <= range.getEnd().getLine() - 1) {
        lines.subList(range.getStart().getLine() + 1, range.getEnd().getLine()).clear();
      }
    }
  }

  /**
   * Removes text lines that are represents by the range
   * @param range - range representation of line list
   */
  public void deleteLines(Range range) {
    if (range.getEnd().getLine() >= range.getStart().getLine()) {
      lines.subList(range.getStart().getLine(), range.getEnd().getLine() + 1).clear();
    }
  }

  /**
   * Removes a given line from the text
   * @param lineNumber - a line number to remove
   */
  public void delete(int lineNumber) {
    lines.remove(lineNumber);
  }

  /**
   * Appends a line with an extended line
   * @param lineNumber - line number to append
   * @param line - an extended line
   */
  public void append(int lineNumber, ExtendedTextLine line) {
    lines.get(lineNumber).append(line);
  }

  /**
   * Clears a range of the text
   * @param range - a range to clear
   */
  public void clear(Range range) {
    if (range.getStart().getLine() == range.getEnd().getLine()) {
      lines.get(range.getStart().getLine()).clear(range.getStart().getCharacter(), range.getEnd().getCharacter());
    } else {
      ExtendedTextLine line = lines.get(range.getStart().getLine());
      line.clear(range.getStart().getCharacter(), line.size() - 1);

      if (range.getStart().getLine() + 1 <= range.getEnd().getLine() - 1) {
        lines.subList(range.getStart().getLine() + 1, range.getEnd().getLine()).forEach(ExtendedTextLine::clear);
      }
      lines.get(range.getEnd().getLine()).clear(0, range.getEnd().getCharacter());
    }
  }

  /**
   * Adds a line break to the given position
   * @param position - a position in the text
   */
  public void addLineBreak(Position position) {
    ExtendedTextLine line = lines.get(position.getLine());
    ExtendedTextLine newLine = line.subline(position.getCharacter(), line.size() - 1);
    line.trim(position.getCharacter());

    lines.add(position.getLine() + 1, newLine);
  }

  void clear() {
    lines.clear();
  }

  List<ExtendedTextLine> getLines() {
    return lines;
  }

  void add(ExtendedTextLine newLine) {
    lines.add(newLine);
  }

  /**
   * Replaces given range of text with a new text
   * @param range - range of text to replace
   * @param newText - a new text
   * @param instantLocation - an instant location for replaced block (can be null)
   */
  public void replace(Range range, String newText, Location instantLocation) {
    for (ReplaceStrategy replacer : replacers) {
      if (replacer.execute(this, range, newText, instantLocation)) {
        return;
      }
    }
  }

  private MappedCharacter getCharacterAt(Position position) {
    int lineNumber = position.getLine();
    int character = position.getCharacter();
    ExtendedTextLine line = lines.get(lineNumber);
    if (character >= line.size()) {
      return extrapolatedValue(line, character);
    }
    return line.getCharacterAt(character);
  }

  private MappedCharacter extrapolatedValue(ExtendedTextLine line, int character) {
    if (line.size() == 0) {
      return null;
    }
    int shift = character - (line.size() - 1);
    character = line.size() - 1;
    MappedCharacter result = line.getCharacterAt(character);
    Position originalPos = Optional.ofNullable(result.getOriginalPosition())
        .map(op -> new Position(op.getLine(), op.getCharacter() + shift))
        .orElse(null);
    return new MappedCharacter(result.getCharacter(), originalPos, result.getUri(), result.getParent(), result.getInstantLocation(), result.getInitialLocationMap());
  }
}
