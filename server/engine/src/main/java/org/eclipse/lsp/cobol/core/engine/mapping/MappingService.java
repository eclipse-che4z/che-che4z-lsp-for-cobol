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

import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import lombok.Getter;
import lombok.Value;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.stream.Collectors;

/**
 * Provides mapping functionality for extended document
 */
public class MappingService {
  static final int LINE_LEN = 80;

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
  private final List<MappingItem> localityMap;

  public MappingService(TextTransformations textTransformations) {
    localityMap = new ArrayList<>(buildLocalityMap(textTransformations));
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

      MappingItem mappingItem = buildMappingItemForRange(textTransformations.getUri(), range, originalDocumentLine, extendedDocumentLine);
      if (MappingHelper.size(mappingItem.extendedRange) > 0) {
        result.add(mappingItem);
      }

      extendedDocumentLine += (range.getEnd().getLine() - originalDocumentLine);
      originalDocumentLine = range.getEnd().getLine() + 1;

      List<MappingItem> map = buildLocalityMap(textTransformations.getExtensions().get(range));
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

    String[] originalLines = textTransformations.getText().split("\r?\n", -1);
    int size = originalLines.length;

    MappingItem last = new MappingItem(new Range(new Position(extendedDocumentLine, 0), new Position(extendedDocumentLine + size - 1, LINE_LEN)),
        new Location(textTransformations.getUri(), new Range(new Position(originalDocumentLine, 0), new Position(originalDocumentLine + size - 1, LINE_LEN))), null);
    result.add(last);

    if (textTransformations.getReplacements().size() > 0) {
      result = applyReplacements(result, textTransformations.getReplacements(), textTransformations.getText());
    }

    return result;
  }

  private MappingItem buildMappingItemForRange(String uri, Range range, int originalDocumentLine, int extendedDocumentLine) {
    int size = range.getStart().getLine() - originalDocumentLine;
    int charPos = range.getStart().getCharacter() - 1;
    int originalEndLine = range.getStart().getLine();
    int extendedEndLine = extendedDocumentLine + size;
    if (charPos < 0) {
      charPos = LINE_LEN;
      originalEndLine -= 1;
      extendedEndLine -= 1;
    }
    Location originalLocation = new Location(uri, new Range(new Position(originalDocumentLine, 0), new Position(originalEndLine, charPos)));
    Range extended = new Range(new Position(extendedDocumentLine, 0), new Position(extendedEndLine, charPos));

    return new MappingItem(extended, originalLocation, null);
  }

  private static List<MappingItem> applyReplacements(List<MappingItem> localityMap, Map<Range, String> replacements, String text) {
    localityMap = new ArrayList<>(localityMap);
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
            charPos = LINE_LEN;
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

  private static boolean affectsToMapping(Range range, String text) {
    String[] lines = text.split("\\r?\n");
    if (lines.length < 1) {
      return false;
    }
    String last = lines[lines.length - 1];
    return (lines.length != MappingHelper.size(range) || range.getEnd().getCharacter() != last.length());
  }

  private static Range extendRangeIfNeeded(Range range, String[] lines, String text) {
    String firstLine = lines[range.getStart().getLine()];
    String lastLine = lines[range.getEnd().getLine()];
    String[] replaceLines = text.split("\\r?\\n");

    Position start = new Position(range.getStart().getLine(), range.getStart().getCharacter());
    Position end = new Position(range.getEnd().getLine(), range.getEnd().getCharacter());

    if (lastLine.length() <= range.getEnd().getCharacter() && text.length() == 0) {
      end.setCharacter(LINE_LEN);
    } else {
      if (replaceLines.length > 0) {
        end.setCharacter(range.getEnd().getCharacter() - replaceLines[replaceLines.length - 1].length() - 1);
      }
    }
    if (firstLine.length() <= start.getCharacter() && text.length() == 0) {
      start.setLine(range.getStart().getLine() + 1);
      start.setCharacter(0);
    }
    return new Range(start, end);
  }
}
