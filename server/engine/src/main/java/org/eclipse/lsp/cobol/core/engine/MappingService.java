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
import lombok.Value;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Provides mapping functionality for extended document
 */
public class MappingService {

  /**
   * Mapping item object
   */
  @Value
  public static class MappingItem {
    Range extendedRange;
    Location originalLocation;
    CharShift charShift;
  }

  /**
   * Chift object
   */
  @Value
  public static class CharShift {
    int lineNumber;
    int charShift;
  }

  @Getter
  private ArrayList<MappingItem> localityMap;

  public MappingService(TextTransformations textTransformations) {
    localityMap = new ArrayList<>(buildLocalityMap(textTransformations));
    if (textTransformations.getReplacements().size() > 0) {
      localityMap = applyReplacements(textTransformations.getReplacements(), textTransformations.getText());
    }
  }

  /**
   * Returns a original location with document's uri
   * @param range is a range from extendes source
   * @return a Location object
   */
  public Optional<Location> getOriginalLocation(Range range) {
    return
        findRangeAndLocation(range)
        .map(mappingItem -> {
          int lineShift = range.getStart().getLine() - mappingItem.extendedRange.getStart().getLine();
          int charShift = mappingItem.originalLocation.getRange().getStart().getCharacter() - mappingItem.extendedRange.getStart().getCharacter();
          if (charShift != 0) {
            charShift -= 1;
          }

          int originalLine = mappingItem.originalLocation.getRange().getStart().getLine() + lineShift;
          int originalCharacter = range.getStart().getCharacter() + charShift;
          Position startPos = new Position(originalLine, originalCharacter);

          originalLine = originalLine + range.getEnd().getLine() - range.getStart().getLine();
          originalCharacter = originalCharacter + MappingHelper.charSize(range);
          Position endPos = new Position(originalLine, originalCharacter);

          Range newRange = new Range(startPos, endPos);
          return new Location(mappingItem.originalLocation.getUri(), newRange);
        });
  }

  private Optional<MappingItem> findRangeAndLocation(Range range) {
    return localityMap.stream().filter(p -> MappingHelper.rangeIn(range, p.extendedRange)).findFirst();
  }

  /**
   * Builds an extended document token locality to original source locality map
   * @param textTransformations is a text transformations object
   * @return a map
   */
  private List<MappingItem> buildLocalityMap(TextTransformations textTransformations) {
    List<MappingItem> result = new LinkedList<>();
    LinkedList<Range> ranges = new LinkedList<>(textTransformations.getExtensions().keySet());
    ranges.sort(Comparator.comparingInt(e -> e.getStart().getLine()));
    int originalDocumentLine = 0;
    int extendedDocumentLine = 0;
    for (Range range : ranges) {
      List<MappingItem> map = buildLocalityMap(textTransformations.getExtensions().get(range));
      MappingItem last = map.get(map.size() - 1);

      result.add(buildMappingItem(textTransformations.getUri(), originalDocumentLine, extendedDocumentLine, range, last.extendedRange));

      extendedDocumentLine += (range.getEnd().getLine() - originalDocumentLine);
      originalDocumentLine = range.getEnd().getLine() + 1;

      for (MappingItem item : map) {
        Position start = item.extendedRange.getStart();
        Position end = item.extendedRange.getEnd();
        int size = end.getLine() - start.getLine() + 1;

        start.setLine(extendedDocumentLine);
        start.setCharacter(range.getStart().getCharacter());
        end.setLine(extendedDocumentLine + size - 1);
        item.extendedRange.setStart(start);
        item.extendedRange.setEnd(end);
        extendedDocumentLine += size;
      }
      result.addAll(map);
    }

    String[] originalLines = textTransformations.getText().split("\r?\n");
    int size = originalLines.length - originalDocumentLine + (textTransformations.getText().endsWith("\n") ? 1 : 0);

    MappingItem last = new MappingItem(new Range(new Position(extendedDocumentLine, 0), new Position(extendedDocumentLine + size - 1, 80)),
        new Location(textTransformations.getUri(), new Range(new Position(originalDocumentLine, 0), new Position(originalDocumentLine + size - 1, 80))), null);
    result.add(last);

    return result;
  }

  private ArrayList<MappingItem> applyReplacements(Map<Range, String> replacements, String text) {
    List<Range> ranges = new LinkedList<>(replacements.keySet());
    ranges = ranges.stream().filter(r -> affectsToMapping(r, replacements.get(r))).collect(Collectors.toList());
    ranges.sort(Comparator.comparingInt(e -> e.getStart().getLine()));

    for (Range range : ranges) {
      if (MappingHelper.size(range) <= 1) {
        continue;
      }

      String[] lines =  text.split("\\r?\\n");
      List<MappingItem> iterationMap = new LinkedList<>(localityMap);
      for (MappingItem item : iterationMap) {
        if (MappingHelper.rangeIn(range, item.originalLocation.getRange())) {

          range = extendRangeIfNeeded(range, lines, replacements.get(range));
          List<Location> newLocations = MappingHelper.split(range, item.originalLocation.getRange())
              .stream().map(r -> new Location(item.originalLocation.getUri(), r)).collect(Collectors.toList());

          int lineShift = range.getStart().getLine() - item.originalLocation.getRange().getStart().getLine();
          int charShift = range.getStart().getCharacter() - item.originalLocation.getRange().getStart().getCharacter();

          int charPos = item.extendedRange.getStart().getCharacter() + charShift;
          int linePos = item.extendedRange.getStart().getLine() + lineShift;
          if (charPos < 0) {
            charPos = 80;
            linePos -= 1;
          }
          Position startPosition = new Position(linePos, charPos);

          Position endPosition = new Position(item.extendedRange.getStart().getLine()
              + lineShift + MappingHelper.size(range) - 1,
              item.extendedRange.getStart().getCharacter() + charShift + MappingHelper.charSize(range));

          Range extendedRange = new Range(startPosition, endPosition);

          List<Range> newRanges = MappingHelper.concat(extendedRange, item.extendedRange);
          if (newLocations.size() == newRanges.size()) {
            for (int i = 0; i < newLocations.size(); i++) {
              Range newRange = newRanges.get(i);
              if (MappingHelper.size(newRange) > 1 || MappingHelper.charSize(newRange) > 0) {
                CharShift shift = null;
                if (newRange.getStart().getCharacter() > 0) {
                  shift = new CharShift(newRange.getStart().getLine(), MappingHelper.charSize(range));
                }
                localityMap.add(new MappingItem(newRange, newLocations.get(i), shift));
              }
            }
          }
          localityMap.remove(item);
        }
      }
    }
    return localityMap;
  }

  private boolean affectsToMapping(Range range, String text) {
    String[] lines = text.split("\\r?\n");
    if (lines.length < 1) {
      return false;
    }
    String last = lines[lines.length - 1];
    return (lines.length != MappingHelper.size(range) || range.getEnd().getCharacter() != last.length());
  }

  private Range extendRangeIfNeeded(Range range, String[] lines, String text) {
    String line = lines[range.getEnd().getLine()];
    String[] replaceLines = text.split("\\r?\\n");
    if (line.length() <= range.getEnd().getCharacter() && text.length() == 0) {
      return new Range(range.getStart(), new Position(range.getEnd().getLine(), 80));
    }
    if (replaceLines.length > 0) {
      return new Range(new Position(range.getStart().getLine(), range.getStart().getCharacter()),
          new Position(range.getEnd().getLine(), range.getEnd().getCharacter() - replaceLines[replaceLines.length - 1].length()));
    }
    return range;
  }

  private MappingItem buildMappingItem(String uri, int originalDocumentLine, int extendedDocumentLine, Range originalRange, Range extendedRange) {
    Position posStart = new Position(originalDocumentLine, 0);
    Position posEnd = new Position(originalRange.getEnd().getLine() - 1, 80);
    Range newOriginalRange = new Range(posStart, posEnd);

    posStart = new Position(extendedDocumentLine, 0);
    extendedDocumentLine += originalRange.getEnd().getLine() - originalDocumentLine - 1;
    posEnd = new Position(extendedDocumentLine, 80/*originalRange.getStart().getCharacter() + extendedRange.getEnd().getCharacter()*/);
    Range newExtendedRange = new Range(posStart, posEnd);
    return new MappingItem(newExtendedRange, new Location(uri, newOriginalRange), null);
  }

}
