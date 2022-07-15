/*
 * Copyright (c) 2020 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine;

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

    Position startPoint = new Position(split.getEnd().getLine(), split.getEnd().getCharacter() + 1);
    Position endPoint = range.getEnd();
    Range secondRange = new Range(startPoint, endPoint);

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

    Position startPoint = new Position(split.getEnd().getLine() - size(split) + 1, split.getEnd().getCharacter() - charSize(split));
    Position endPoint = new Position(range.getEnd().getLine() - size(split) + 1, range.getEnd().getCharacter() - charSize(split));
    Range secondRange = new Range(startPoint, endPoint);

    if (size(secondRange) > 0 || charSize(secondRange) > 0) {
      result.add(secondRange);
    }
    return result;
  }

  private List<Range> takeFirstPart(Range split, Range range) {
    if (!rangeIn(split, range)) {
      return ImmutableList.of(range);
    }
    List<Range> result = new LinkedList<>();
    Position startPoint = range.getStart();
    Position endPoint = new Position(split.getStart().getLine(), Math.max(split.getStart().getCharacter() - 1, 0));
    Range firstRange = new Range(startPoint, endPoint);

    if (size(firstRange) > 0 || charSize(firstRange) > 0) {
      result.add(firstRange);
    }
    return result;
  }

}
