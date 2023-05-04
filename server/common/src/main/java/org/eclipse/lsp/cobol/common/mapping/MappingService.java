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
package org.eclipse.lsp.cobol.common.mapping;

import java.util.*;

import lombok.Getter;
import lombok.Value;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.stream.Collectors;

/**
 * Provides mapping functionality for extended document
 */
public class MappingService {
  static final int LINE_LEN = 80;
  private static final String SEPARATOR = "\\r?\\n";

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
   * Shift object
   */
  @Value
  public static class CharShift {
    int lineNumber;
    int charShiftCount;
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
    Optional<Pair<Position, String>> start = getOriginalPosition(range.getStart());
    List<Optional<Pair<Position, String>>> optionalEnds = new LinkedList<>();

    optionalEnds.add(getOriginalPosition(range.getEnd()));
    optionalEnds.add(getOriginalPosition(new Position(range.getEnd().getLine() + 1, 0)));
    optionalEnds.add(getOriginalPosition(new Position(range.getEnd().getLine(), 80)));

    List<Pair<Position, String>> ends = optionalEnds.stream()
        .filter(Optional::isPresent)
        .map(Optional::get)
        .collect(Collectors.toList());

    if (!start.isPresent() || ends.isEmpty()) {
      return getUncheckedOriginalLocation(range);
    }

    Optional<Pair<Position, String>> end = ends.stream().filter(e -> e.getValue().equals(start.get().getValue())).findFirst();
    Optional<Location> result = end.map(endPair -> new Location(start.get().getValue(), new Range(start.get().getKey(), endPair.getKey())));
    if (!result.isPresent()) {
      result = getUncheckedOriginalLocation(range);
    }

    // Adjust for lines more than 80
    if (result.isPresent()
        && MappingHelper.size(range) == 1
        && MappingHelper.size(result.get().getRange()) == 1
        && MappingHelper.charSize(range) > MappingHelper.charSize(result.get().getRange())) {
      Range oldRange = result.get().getRange();
      Range newRange = new Range(oldRange.getStart(), new Position(oldRange.getEnd().getLine(), range.getEnd().getCharacter()));
      result.get().setRange(newRange);
    }

    return result;
  }

  /**
   * Returns a original location with document's uri
   * @param range is a range from extendes source
   * @return a Location object
   */
  private Optional<Location> getUncheckedOriginalLocation(Range range) {
    return
        findRangeAndLocation(range)
            .map(mappingItem -> {

              int lineShift = range.getStart().getLine() - mappingItem.extendedRange.getStart().getLine();
              int charShift = mappingItem.originalLocation.getRange().getStart().getCharacter() - mappingItem.extendedRange.getStart().getCharacter();
              if (lineShift != 0 && lineShift != (range.getEnd().getLine() - range.getStart().getLine())) {
                charShift = 0;
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

  private Optional<Pair<Position, String>> getOriginalPosition(Position position) {
    return
        findRangeAndLocation(new Range(position, position))
            .map(mappingItem -> {
              int lineShift = position.getLine() - mappingItem.extendedRange.getStart().getLine();
              int charShift = mappingItem.originalLocation.getRange().getStart().getCharacter() - mappingItem.extendedRange.getStart().getCharacter();
              if (lineShift != 0) {
                charShift = 0;
              }

              int originalLine = mappingItem.originalLocation.getRange().getStart().getLine() + lineShift;
              int originalCharacter = position.getCharacter() + charShift;
              Position originalPosition = new Position(originalLine, originalCharacter);

              return Pair.of(originalPosition, mappingItem.originalLocation.getUri());
            });
  }

  private Optional<MappingItem> findRangeAndLocation(Range range) {
    List<MappingItem> list = localityMap.stream().filter(p -> MappingHelper.rangeIn(range, p.extendedRange)).collect(Collectors.toList());
    if (list.size() == 0) {
      return Optional.empty();
    }
    return Optional.of(list.get(list.size() - 1));
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
      TextTransformations rangeText = textTransformations.getExtensions().get(range);

      if (textTransformations.isInsert(range.getStart().getLine()) && rangeText.getText().length() == 0) {
        continue;
      }

      MappingItem mappingItem = buildMappingItemForRange(textTransformations.getUri(), range, originalDocumentLine,
          extendedDocumentLine,
          textTransformations.isInsert(range.getStart().getLine()));
      if (MappingHelper.size(mappingItem.extendedRange) > 0) {
        result.add(mappingItem);
      }

      extendedDocumentLine += (range.getEnd().getLine() - originalDocumentLine - MappingHelper.size(range) + 1);
      originalDocumentLine = range.getEnd().getLine() + 1;

      if (textTransformations.isInsert(range.getStart().getLine())) {
        extendedDocumentLine++;
      }

      List<MappingItem> map = buildLocalityMap(rangeText);
      for (MappingItem item : map) {
        Position start = item.extendedRange.getStart();
        Position end = item.extendedRange.getEnd();
        int size = end.getLine() - start.getLine() + 1;

        if (textTransformations.isInsert(range.getStart().getLine())) {
          size--;
        }

        start.setLine(extendedDocumentLine);
        start.setCharacter(range.getStart().getCharacter());
        end.setLine(extendedDocumentLine + size - 1);
        item.extendedRange.setStart(start);
        item.extendedRange.setEnd(end);
        extendedDocumentLine += size;
      }
      result.addAll(map);
    }

    String[] originalLines = textTransformations.getText().split(SEPARATOR, -1);
    int size = originalLines.length;

    MappingItem last = new MappingItem(new Range(new Position(extendedDocumentLine, 0), new Position(extendedDocumentLine + size - 1, LINE_LEN)),
        new Location(textTransformations.getUri(), new Range(new Position(originalDocumentLine, 0), new Position(originalDocumentLine + size - 1, LINE_LEN))), null);
    result.add(last);

    if (textTransformations.getReplacements().size() > 0) {
      result = applyReplacements(result, textTransformations.getReplacements(), textTransformations.getText());
    }

    return result;
  }

  private MappingItem buildMappingItemForRange(String uri, Range range, int originalDocumentLine, int extendedDocumentLine, boolean insert) {
    int size = range.getStart().getLine() - originalDocumentLine;
    int charPos = range.getStart().getCharacter() - 1;
    int originalEndLine = range.getStart().getLine();
    int extendedEndLine = extendedDocumentLine + size;
    if (charPos < 0) {
      charPos = LINE_LEN;
      if (!insert) {
        originalEndLine -= 1;
        extendedEndLine -= 1;
      }
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

      String[] lines =  text.split(SEPARATOR);
      List<MappingItem> iterationMap = new LinkedList<>(localityMap);
      for (MappingItem item : iterationMap) {
        if (MappingHelper.rangeIn(range, item.originalLocation.getRange())) {
          Range adjustedRange = extendRangeIfNeeded(range, lines, replacements.get(range));

          List<Location> newLocations = MappingHelper.split(adjustedRange, item.originalLocation.getRange())
              .stream().map(r -> new Location(item.originalLocation.getUri(), r)).collect(Collectors.toList());

          Range extendedRange = calculateExtendedRange(adjustedRange, item);

          List<Range> newRanges = MappingHelper.concat(extendedRange, item.extendedRange);
          if (newLocations.size() == newRanges.size()) {
            for (int i = 0; i < newLocations.size(); i++) {
              Range newRange = newRanges.get(i);
              if (MappingHelper.size(newRange) > 1 || MappingHelper.charSize(newRange) > 0) {
                CharShift shift = null;
                if (newRange.getStart().getCharacter() > 0) {
                  shift = new CharShift(newRange.getStart().getLine(), MappingHelper.charSize(range));
                }
                if (newRange.getStart().getLine() <= newRange.getEnd().getLine()) {
                  localityMap.add(new MappingItem(newRange, newLocations.get(i), shift));
                }
              }
            }
          }
          localityMap.remove(item);
          break;
        }
      }
    }
    return localityMap;
  }

  private static Range calculateExtendedRange(Range range, MappingItem item) {
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

    return new Range(startPosition, endPosition);
  }

  private static boolean affectsToMapping(Range range, String text) {
    String[] lines = text.split(SEPARATOR);
    if (lines.length < 1) {
      return false;
    }
    String last = lines[lines.length - 1];
    return (lines.length != MappingHelper.size(range) || range.getEnd().getCharacter() != last.length());
  }

  private static Range extendRangeIfNeeded(Range range, String[] lines, String text) {
    String firstLine = lines[range.getStart().getLine()];
    String lastLine = lines[range.getEnd().getLine()];
    String[] replaceLines = text.split(SEPARATOR);

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
