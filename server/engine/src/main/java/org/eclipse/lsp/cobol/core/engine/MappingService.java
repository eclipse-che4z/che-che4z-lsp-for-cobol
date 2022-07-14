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
import java.util.stream.Collectors;

/**
 * Provides mapping functionality for extended document
 */
public class MappingService {

  @Getter
  private ArrayList<Pair<Range, Location>> localityMap;

  public MappingService(TextTransformations textTransformations) {
    localityMap = new ArrayList<>(buildLocalityMap(textTransformations));
    if (textTransformations.getReplacements().size() > 0) {
      localityMap = applyReplacements(textTransformations.getReplacements(), textTransformations.getUri());
    }
  }

  /**
   * Returns a original location with document's uri
   * @param range is a range from extendes source
   * @return a Location object
   */
  public Optional<Location> getOriginalLocation(Range range) {
    return /*Optional.ofNullable(findRangeAndLocation(range.getStart().getLine(), 0, localityMap.size() - 1))*/
        findRangeAndLocation(range)
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

  private Optional<Pair<Range, Location>> findRangeAndLocation(Range range) {
    return localityMap.stream().filter(p -> MappingHelper.rangeIn(range, p.getKey())).findFirst();
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
    int size = originalLines.length - originalDocumentLine + (textTransformations.getText().endsWith("\n") ? 1 : 0);

    Pair<Range, Location> last = Pair.of(new Range(new Position(extendedDocumentLine, 0), new Position(extendedDocumentLine + size - 1, 80)),
        new Location(textTransformations.getUri(), new Range(new Position(originalDocumentLine, 0), new Position(originalDocumentLine + size - 1, 80))));
    result.add(last);

    return result;
  }

  private ArrayList<Pair<Range, Location>> applyReplacements(Map<Range, String> replacements, String documentUri) {
    LinkedList<Range> ranges = new LinkedList<>(replacements.keySet());
    ranges.sort(Comparator.comparingInt(e -> e.getStart().getLine()));

    for (Range range : ranges) {
      if (MappingHelper.size(range) <= 1) {
        continue;
      }

      List<Pair<Range, Location>> iterationMap = new LinkedList<>(localityMap);
      for (Pair<Range, Location> pair : iterationMap) {
        if (MappingHelper.rangeIn(range, pair.getValue().getRange())) {

          List<Location> newLocations = MappingHelper.split(range, pair.getValue().getRange())
              .stream().map(r -> new Location(pair.getValue().getUri(), r)).collect(Collectors.toList());

          int lineShift = range.getStart().getLine() - pair.getValue().getRange().getStart().getLine();
          int charShift = range.getStart().getCharacter() - pair.getValue().getRange().getStart().getCharacter();

          Position startPosition = new Position(pair.getKey().getStart().getLine()
              + lineShift, pair.getKey().getStart().getCharacter() + charShift + 1);

          Position endPosition = new Position(pair.getKey().getStart().getLine()
              + lineShift + MappingHelper.size(range) - 1,
              pair.getKey().getStart().getCharacter() + charShift + MappingHelper.charSize(range));

          Range extendedRange = new Range(startPosition, endPosition);

          List<Range> newRanges = MappingHelper.concat(extendedRange, pair.getLeft());
          if (newLocations.size() == newRanges.size()) {
            for (int i = 0; i < newLocations.size(); i++) {
              localityMap.add(Pair.of(newRanges.get(i), newLocations.get(i)));
            }
          }
          localityMap.remove(pair);
        }
      }
    }
    return localityMap;
  }

  private Pair<Range, Location> buildRange(String uri, int originalDocumentLine, int extendedDocumentLine, Range originalRange, Range extendedRange) {
    Position posStart = new Position(originalDocumentLine, 0);
    Position posEnd = new Position(originalRange.getEnd().getLine() - 1, 80);
    Range newOriginalRange = new Range(posStart, posEnd);

    posStart = new Position(extendedDocumentLine, 0);
    extendedDocumentLine += originalRange.getEnd().getLine() - originalDocumentLine - 1;
    posEnd = new Position(extendedDocumentLine, 80/*originalRange.getStart().getCharacter() + extendedRange.getEnd().getCharacter()*/);
    Range newExtendedRange = new Range(posStart, posEnd);
    return Pair.of(newExtendedRange, new Location(uri, newOriginalRange));
  }

}
