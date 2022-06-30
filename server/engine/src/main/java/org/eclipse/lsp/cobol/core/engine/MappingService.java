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

import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;

/**
 * Provides mapping functionality for extended document
 */
@UtilityClass
public class MappingService {

  /**
   * Builds an extended document token locality to original source locality map
   * @param textTransformations is a text transformations object
   * @return a map
   */
  public List<Pair<Range, Location>> buildLocalityMap(TextTransformations textTransformations) {
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
        end.setLine(extendedDocumentLine + size - 1);
        pair.getKey().setStart(start);
        pair.getKey().setEnd(end);
        extendedDocumentLine += size;
      }
      result.addAll(map);
    }

    String[] originalLines = textTransformations.getText().split("\r?\n");
    int size = originalLines.length - originalDocumentLine;

    Pair<Range, Location> last = Pair.of(new Range(new Position(extendedDocumentLine, 0), new Position(extendedDocumentLine + size - 1, 0)),
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
