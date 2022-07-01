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
package org.eclipse.lsp.cobol.core.engine;

import lombok.Getter;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;

/**
 * Provides mapping functionality for extended document
 */
public class MappingService {

  @Getter
  private final ArrayList<Pair<Range, Location>> localityMap;

  public MappingService(TextTransformations textTransformations) {
    localityMap = new ArrayList<>(buildLocalityMap(textTransformations));
  }

  /**
   * Returns a original location with document's uri
   * @param range is a range from extendes source
   * @return a Location object
   */
  public Optional<Location> getOriginalLocation(Range range) {
    return Optional.ofNullable(findRangeAndLocation(range.getStart().getLine(), 0, localityMap.size() - 1))
        .map(rangeAndLocation -> {
          int lineShift = range.getStart().getLine() - rangeAndLocation.getKey().getStart().getLine();

          int originalLine = rangeAndLocation.getValue().getRange().getStart().getLine() + lineShift;
          int originalCharacter = range.getStart().getCharacter();
          Position startPos = new Position(originalLine, originalCharacter);

          originalLine = originalLine + range.getEnd().getLine() - range.getStart().getLine();
          originalCharacter = range.getEnd().getCharacter();
          Position endPos = new Position(originalLine, originalCharacter);

          Range newRange = new Range(startPos, endPos);
          return new Location(rangeAndLocation.getValue().getUri(), newRange);
        });
  }

  private Pair<Range, Location> findRangeAndLocation(int line, int start, int end) {
    Pair<Range, Location> startRange = localityMap.get(start);
    Pair<Range, Location> endRange = localityMap.get(end);

    if (start == end) {
      if (inRange(line, startRange.getKey()) == 0) {
        return startRange;
      }
      return null;
    }

    int inRange = inRange(line, startRange.getKey());
    if (inRange == -1) {
      return null;
    }

    if (inRange == 0) {
      return startRange;
    }

    inRange = inRange(line, endRange.getKey());
    if (inRange == 1) {
      return null;
    }

    if (inRange == 0) {
      return endRange;
    }

    int middleIndex = (start + end) / 2;
    inRange = inRange(line, localityMap.get(middleIndex).getKey());
    if (inRange == 0) {
      return localityMap.get(middleIndex);
    }

    if (inRange == -1) {
      return findRangeAndLocation(line, start, middleIndex);
    }
    return findRangeAndLocation(line, middleIndex, end);
  }

  private int inRange(int line, Range range) {
    if (line < range.getStart().getLine()) {
      return -1;
    }
    if (line > range.getEnd().getLine()) {
      return 1;
    }
    return 0;
  }

  /**
   * Builds an extended document token locality to original source locality map
   * @param textTransformations is a text transformations object
   * @return a map
   */
  private List<Pair<Range, Location>> buildLocalityMap(TextTransformations textTransformations) {
    List<Pair<Range, Location>> result = new LinkedList<>();
    LinkedList<Range> ranges = new LinkedList<>(textTransformations.getExtensions().keySet());
    ranges.sort(Comparator.comparingInt(e -> e.getStart().getLine()));
    int originalDocumentLine = 0;
    int extendedDocumentLine = 0;
    for (Range range : ranges) {
      List<Pair<Range, Location>> map = buildLocalityMap(textTransformations.getExtensions().get(range));
      Pair<Range, Location> last = map.get(map.size() - 1);

      result.add(buildRange(textTransformations.getUri(), originalDocumentLine, extendedDocumentLine, range, last.getKey()));

      extendedDocumentLine += (range.getEnd().getLine() - originalDocumentLine);
      originalDocumentLine = range.getEnd().getLine() + 1;

      for (Pair<Range, Location> pair : map) {
        Position start = pair.getKey().getStart();
        Position end = pair.getKey().getEnd();
        int size = end.getLine() - start.getLine() + 1;

        start.setLine(extendedDocumentLine);
        start.setCharacter(range.getStart().getCharacter());
        end.setLine(extendedDocumentLine + size - 1);
        pair.getKey().setStart(start);
        pair.getKey().setEnd(end);
        extendedDocumentLine += size;
      }
      result.addAll(map);
    }

    String[] originalLines = textTransformations.getText().split("\r?\n");
    int size = originalLines.length - originalDocumentLine;

    Pair<Range, Location> last = Pair.of(new Range(new Position(extendedDocumentLine, 0), new Position(extendedDocumentLine + size, 0)),
        new Location(textTransformations.getUri(), new Range(new Position(originalDocumentLine, 0), new Position(originalDocumentLine + size - 1, 0))));
    result.add(last);
    return result;
  }

  private Pair<Range, Location> buildRange(String uri, int originalDocumentLine, int extendedDocumentLine, Range originalRange, Range extendedRange) {
    Position posStart = new Position(originalDocumentLine, 0);
    Position posEnd = new Position(originalRange.getEnd().getLine() - 1, 0);
    Range newOriginalRange = new Range(posStart, posEnd);

    posStart = new Position(extendedDocumentLine, 0);
    extendedDocumentLine += originalRange.getEnd().getLine() - originalDocumentLine - 1;
    posEnd = new Position(extendedDocumentLine, 0/*originalRange.getStart().getCharacter() + extendedRange.getEnd().getCharacter()*/);
    Range newExtendedRange = new Range(posStart, posEnd);
    return Pair.of(newExtendedRange, new Location(uri, newOriginalRange));
  }

}
