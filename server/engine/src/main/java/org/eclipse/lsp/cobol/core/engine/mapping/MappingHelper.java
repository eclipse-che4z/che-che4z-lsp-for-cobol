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
package org.eclipse.lsp.cobol.core.engine.mapping;

import com.google.common.collect.ImmutableList;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.LinkedList;
import java.util.List;

/**
 * Mapping helper class
 */
@UtilityClass
public class MappingHelper {

  /**
   * Detects if range is into the bigger range
   * @param smallRange range to test
   * @param bigRange the bigger range
   * @return true if smallRange fits into bigRange
   */
  public boolean rangeIn(Range smallRange, Range bigRange) {
    if (smallRange.getStart().getLine() > bigRange.getStart().getLine()
      && smallRange.getStart().getLine() < bigRange.getEnd().getLine()) {
      return true;
    }

    if (smallRange.getStart().getLine() == bigRange.getStart().getLine()) {
      return smallRange.getStart().getCharacter() >= bigRange.getStart().getCharacter();
    }

    if (smallRange.getStart().getLine() == bigRange.getEnd().getLine()) {
      return smallRange.getStart().getCharacter() <= bigRange.getEnd().getCharacter();
    }

    return false;
  }

  /**
   * Calculates the line count of the Range
   * @param range is a range to test
   * @return the line count
   */
  public int size(Range range) {
    return range.getEnd().getLine() - range.getStart().getLine() + 1;
  }

  /**
   * Calculates the character count of the Range
   * @param range is a range to test
   * @return the character size
   */
  public int charSize(Range range) {
    return range.getEnd().getCharacter() - range.getStart().getCharacter();
  }

  /**
   * Split a range into parts
   * @param split is a splitter
   * @param range original range
   * @return a list of separated ranges
   */
  public List<Range> split(Range split, Range range) {
    List<Range> result = takeFirstPart(split, range);

    int line = split.getEnd().getLine();
    int charPos = split.getEnd().getCharacter() + 1;
    if (charPos >= MappingService.LINE_LEN) {
      charPos = 0;
      line += 1;
    }
    Position startPoint = new Position(line, charPos);
    Position endPoint = new Position(line, MappingService.LINE_LEN);
    Range secondRange = new Range(startPoint, endPoint);
    if (size(secondRange) > 0 || charSize(secondRange) > 0) {
      result.add(secondRange);
    }

    startPoint = new Position(line + 1, 0);
    endPoint = new Position(range.getEnd().getLine(), range.getEnd().getCharacter());

    secondRange = new Range(startPoint, endPoint);
    if (size(secondRange) > 0 || charSize(secondRange) > 0) {
      result.add(secondRange);
    }
    return result;
  }

  /**
   * Concatenate two parts of the range divided by splitter range
   * @param split is a splitter
   * @param range original range
   * @return parts of concatenated parts of the range
   */
  public List<Range> concat(Range split, Range range) {
    List<Range> result = takeFirstPart(split, range);

    Position startPoint = new Position(split.getStart().getLine(), split.getStart().getCharacter());
    Position endPoint = new Position(split.getStart().getLine(), 80);
    Range secondRange = new Range(startPoint, endPoint);
    if (size(secondRange) > 0 || charSize(secondRange) > 0) {
      result.add(secondRange);
    }

    startPoint = new Position(split.getStart().getLine() + 1, 0);
    endPoint = new Position(range.getEnd().getLine() - size(split) + (split.getEnd().getCharacter() < 80 ? 1 : 0), range.getEnd().getCharacter());
    secondRange = new Range(startPoint, endPoint);

    if (size(secondRange) > 0 || charSize(secondRange) > 0) {
      result.add(secondRange);
    }

    return result;
  }

  private List<Range> takeFirstPart(Range split, Range range) {
    if (!rangeIn(split, range)) {
      return ImmutableList.of(range);
    }
    if (split.getStart().getLine() == range.getStart().getLine() && split.getStart().getCharacter() == range.getStart().getCharacter()) {
      return new LinkedList<>();
    }
    List<Range> result = new LinkedList<>();
    Position startPoint = range.getStart();

    int linePos = split.getStart().getLine();
    int charPos = split.getStart().getCharacter() - 1;
    if (charPos < 0) {
      charPos = 80;
      linePos -= 1;
    }

    Position endPoint = new Position(linePos, charPos);
    Range firstRange = new Range(startPoint, endPoint);

    if (size(firstRange) > 0 || charSize(firstRange) > 0) {
      result.add(firstRange);
    }
    return result;
  }

}
