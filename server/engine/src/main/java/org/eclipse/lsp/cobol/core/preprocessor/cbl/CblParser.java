/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.cbl;

import static org.apache.commons.lang3.StringUtils.isBlank;
import static org.apache.commons.lang3.StringUtils.repeat;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.WARNING;

import java.util.*;
import lombok.Getter;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSDialect;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** CBL Parser */
public class CblParser {
  public static final String[] SIMPLE_CICS_OPTIONS =
      new String[] {
        "APOST",
        "QUOTE",
        "CBLCARD",
        "NOCBLCARD",
        "CICS",
        "COBOL2",
        "CO2",
        "COBOL3",
        "CO3",
        "CPSM",
        "NOCPSM",
        "DBCS",
        "DEBUG",
        "NODEBUG",
        "DLI",
        "EDF",
        "NOEDF",
        "EXCI",
        "FEPI",
        "NOFEPI",
        "LENGTH",
        "NOLENGTH",
        "LIN",
        "LINKAGE",
        "NOLINKAGE",
        "NUM",
        "NONUM",
        "OP",
        "OPTIONS",
        "NOP",
        "NOOPTIONS",
        "Q",
        "SEQ",
        "NOSEQ",
        "SP",
        "SPIE",
        "NOSPIE",
        "SYSEIB",
        "VBREF",
        "NOVBREF"
      };
  @Getter private final List<CompilerDirectiveNode> directiveNodes = new ArrayList<>();
  @Getter private final List<SyntaxError> diagnostics = new ArrayList<>();
  private final String[] segments;
  private final int[] ranges;
  private final String uri;
  private final int lineNumber;
  private Integer pos = 0;

  public CblParser(String line, String uri, int lineNumber) {
    this.uri = uri;
    this.segments = line.split("(?<=[(),'\"]|\\w\\b)|(?=[(),'\"]|\\b\\w+)");
    this.ranges = new int[segments.length + 1];
    this.lineNumber = lineNumber;
    for (int i = 0; i < segments.length; ++i) {
      ranges[i + 1] = ranges[i] + segments[i].length();
    }
  }

  /**
   * Parse CBL and produce the new CBL line without cics options
   *
   * @return new CBL line
   */
  public String extractCicsOptions() {
    boolean empty = true;
    try {
      or("CBL", "PROCESS");
      while (hasMore()) {
        boolean hasFragment = parseFragment();
        if (empty) {
          empty = !hasFragment;
        }
      }
      removePrevComma(0, pos);
    } catch (CblDiagnosticException e) {
      empty = false;
      removePrevComma(0, pos - 1);
      diagnostics.add(e.toSyntaxError(lineNumber));
    }
    if (empty) {
      removeSegments(0, segments.length);
    }
    return serialize();
  }

  private boolean parseFragment() throws CblDiagnosticException {
    String first = peek();
    if (first == null) {
      return false;
    }
    if (first.equalsIgnoreCase("XOPTS") || first.equalsIgnoreCase("XOPT")) {
      return parseXOpts();
    }

    if (first.equalsIgnoreCase("CICS")) {
      return parseCics();
    }
    parseOption();
    return true;
  }

  private boolean parseCics() throws CblDiagnosticException {
    one("CICS");
    int start = pos - 1;
    if (isNext("(")) {
      if (parseCicsOptions(true)) {
        return true;
      } else {
        removeSegments(start, pos);
        return false;
      }
    }
    return true;
  }

  private boolean parseXOpts() throws CblDiagnosticException {
    or("XOPT", "XOPTS");
    int start = pos - 1;

    if (parseCicsOptions(false)) {
      return true;
    } else {
      removeSegments(start, pos);
      return false;
    }
  }

  private boolean parseCicsOptions(boolean force) throws CblDiagnosticException {
    boolean hasNonCics = false;
    int optStart = pos;
    one("(");
    boolean inApostrophesOrQuotes = isNext("'") || isNext("\"");
    if (inApostrophesOrQuotes) {
      or("'", "\"");
    }
    while (hasMore() && !(inApostrophesOrQuotes && (isNext("'") || isNext("\""))) && !isNext(")")) {
      if (isNext("FLAG") || isNext("F")) {
        or("FLAG", "F");
        int start = pos - 1;
        one("(");
        or("E", "I", "S", "U", "W");
        one(")");
        directiveNodes.add(createDirectiveNode(start, pos));
        removeSegments(start, pos);
      } else if (isNext("LINECOUNT") || isNext("LC")) {
        or("LINECOUNT", "LC");
        int start = pos - 1;
        one("(");
        String argument = next();
        int i = checkIntegerLiteral(argument);
        one(")");
        directiveNodes.add(createDirectiveNode(start, pos));
        removeSegments(start, pos);
        if (isLineNumberWrong(i)) {
          semanticError(argument, "LINECOUNT must be an integer between 1 and 255");
        }
      } else if (isNext("SPACE")) {
        one("SPACE");
        int start = pos - 1;
        one("(");
        String next = next();
        int i = checkIntegerLiteral(next);
        if (i != 1 && i != 2 && i != 3) {
          semanticError(next, "SPACE must be 1, 2 or 3.");
        }
        one(")");
        directiveNodes.add(createDirectiveNode(start, pos));
        removeSegments(start, pos);
      } else if (isNext("NATLANG")) {
        one("NATLANG");
        int start = pos - 1;
        one("(");
        or("CS", "EN", "KA");
        one(")");
        directiveNodes.add(createDirectiveNode(start, pos));
        removeSegments(start, pos);
      } else {
        try {
          or(SIMPLE_CICS_OPTIONS);
          int start = pos - 1;
          directiveNodes.add(createDirectiveNode(start, start + 1));
          removeSegments(start, start + 1);
        } catch (CblDiagnosticException e) {
          hasNonCics = true;
          if (force) {
            throw e;
          } else {
            parseOption();
          }
        }
      }
      opt(",");
    }
    if (segments[pos].equals(")")) {
      removePrevComma(optStart, pos);
    }
    if (inApostrophesOrQuotes) {
      opt("'");
      opt("\"");
    }
    one(")");
    opt(",");
    return hasNonCics;
  }

  private void removePrevComma(int from, int to) {
    for (int i = to - 1; i >= from; i--) {
      if (segments[i] == null || isBlank(segments[i])) {
        continue;
      }
      if (",".equals(segments[i])) {
        segments[i] = null;
      }
      return;
    }
  }

  private void removeSegments(int start, int end) {
    Arrays.fill(segments, start, end, null);
  }

  private CompilerDirectiveNode createDirectiveNode(int start, int end) {
    StringBuilder text = new StringBuilder();
    for (int i = start; i < end; i++) {
      text.append(segments[i].trim());
    }
    Range range =
        new Range(new Position(lineNumber, ranges[start]), new Position(lineNumber, ranges[end]));
    Locality locality = Locality.builder().uri(uri).range(range).build();
    return new CompilerDirectiveNode(locality, text.toString(), CICSDialect.DIALECT_NAME);
  }

  private void semanticError(String next, String message) {
    diagnostics.add(
        new CblDiagnosticException(makeCurrentLocation(), next, WARNING, message)
            .toSyntaxError(lineNumber));
  }

  private boolean isLineNumberWrong(int nnn) {
    // nnn must be an integer between 1 and 255.
    if (nnn == 0) {
      return true;
    }
    return nnn > 255;
  }

  private int checkIntegerLiteral(String next) throws CblDiagnosticException {
    try {
      return Integer.parseInt(next);
    } catch (NumberFormatException e) {
      throw CblDiagnosticException.expect("integer", makeCurrentLocation(), "integer");
    }
  }

  private Location makeCurrentLocation() {
    Position start = new Position(lineNumber, ranges[pos - 1]);
    Position end = new Position(lineNumber, ranges[pos]);
    Range range = new Range(start, end);
    return new Location(uri, range);
  }

  private void parseOption() {
    int depth = 0;
    while (hasMore()) {
      if (depth == 0 && (isNext(")") || isNext(","))) {
        break;
      }
      String next = next();
      if (next.equalsIgnoreCase("(")) {
        depth++;
      } else if (next.equalsIgnoreCase(")")) {
        depth--;
      }
    }
    opt(",");
  }

  private boolean isNext(String expected) {
    return hasMore() && peek().equalsIgnoreCase(expected);
  }

  private void or(String... variants) throws CblDiagnosticException {
    String token = next();
    for (String text : variants) {
      if (text.equalsIgnoreCase(token)) {
        return;
      }
    }
    throw CblDiagnosticException.expect(token, makeCurrentLocation(), variants);
  }

  private void opt(String expected) {
    String peek = peek();
    if (peek != null && peek.equalsIgnoreCase(expected)) {
      next();
    }
  }

  private void one(String expected) throws CblDiagnosticException {
    or(expected);
  }

  private boolean hasMore() {
    return peek() != null;
  }

  private String peek() {
    for (int i = pos; i < segments.length; i++) {
      if (isBlank(segments[i])) {
        continue;
      }
      return segments[i];
    }
    return null;
  }

  private String next() {
    int counter = pos;
    try {
      if (counter >= segments.length) {
        return null;
      }
      String segment = segments[counter];
      if (isBlank(segment)) {
        counter++;
      }
      if (counter >= segments.length) {
        return null;
      }
      segment = segments[counter];
      counter++;
      return segment;
    } finally {
      pos = counter;
    }
  }

  private String serialize() {
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < segments.length; i++) {
      if (segments[i] == null) {
        sb.append(repeat(" ", ranges[i + 1] - ranges[i]));
      } else {
        sb.append(segments[i]);
      }
    }
    return sb.toString();
  }
}
