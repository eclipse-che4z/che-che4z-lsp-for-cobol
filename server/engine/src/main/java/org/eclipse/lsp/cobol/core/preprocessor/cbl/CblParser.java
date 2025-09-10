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
import static org.eclipse.lsp.cobol.core.preprocessor.cbl.CblDiagnosticException.expect;

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

  public CblParser(String line, String uri, int lineNumber, int column) {
    this.uri = uri;
    this.segments = line.split("(?<=[(),'\"]|\\w\\b)|(?=[(),'\"]|\\b\\w+)");
    this.ranges = new int[segments.length + 1];
    this.ranges[0] = column;
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
    try {
      boolean empty = true;
      while (hasMore()) {
        boolean hasFragment = parseFragment();
        if (empty) {
          empty = !hasFragment;
        }
      }
      if (empty) {
        removeSegments(0, segments.length);
      }
    } catch (CblDiagnosticException e) {
      diagnostics.add(e.toSyntaxError(lineNumber));
    }
    removePrevComma();
    return serialize();
  }

  private boolean parseFragment() throws CblDiagnosticException {
    String first = peek();
    int start = pos;
    try {
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
    } catch (CblDiagnosticException exception) {
      skipAfter(",");
      removeSegments(start, pos);
      diagnostics.add(exception.toSyntaxError(lineNumber));
    }
    return true;
  }

  private void skipAfter(String lexeme) {
    while (hasMore()) {
      if (lexeme.equalsIgnoreCase(next())) {
        return;
      }
    }
  }

  private boolean parseCics() throws CblDiagnosticException {
    int start = one("CICS");
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
    int start = or("XOPT", "XOPTS");

    if (parseCicsOptions(false)) {
      return true;
    } else {
      removeSegments(start, pos);
      return false;
    }
  }

  private boolean nextCicsOptionCondition(String lexemeChar) {
    if (!hasMore()) {
      return false;
    }

    if (lexemeChar != null) {
      if (isNext(")")) {
        semanticError(")", lexemeChar + " expected.");
        return false;
      }
      if ("'".equals(lexemeChar) && isNext("\"")) {
        semanticError("\"", lexemeChar + " expected.");
        return false;
      }
      if ("\"".equals(lexemeChar) && isNext("'")) {
        semanticError("'", lexemeChar + " expected.");
        return false;
      }
      return !isNext(lexemeChar);
    }
    return !isNext(")");
  }

  private boolean parseCicsOptions(boolean force) throws CblDiagnosticException {
    boolean hasNonCics = false;
    int optStart = pos;
    one("(");
    String lexemeChar = isNext("'") ? "'" : isNext("\"") ? "\"" : null;
    if (lexemeChar != null) {
      one(lexemeChar);
    }
    while (nextCicsOptionCondition(lexemeChar)) {
      if (isNext("FLAG") || isNext("F")) {
        parseFlag();
      } else if (isNext("LINECOUNT") || isNext("LC")) {
        parseLineCount();
      } else if (isNext("SPACE")) {
        parseSpace();
      } else if (isNext("NATLANG")) {
        parseNatlang();
      } else {
        try {
          int start = or(SIMPLE_CICS_OPTIONS);
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
    if (isNext(")")) {
      removePrevComma();
    }
    if (lexemeChar != null) {
      opt("'");
      opt("\"");
    }
    one(")");
    opt(",");
    return hasNonCics;
  }

  private void parseNatlang() throws CblDiagnosticException {
    int start = one("NATLANG");
    one("(");
    or("CS", "EN", "KA");
    one(")");
    directiveNodes.add(createDirectiveNode(start, pos));
    removeSegments(start, pos);
  }

  private void parseSpace() throws CblDiagnosticException {
    int start = one("SPACE");
    one("(");
    String next = next();
    int i = checkIntegerLiteral(next);
    if (i != 1 && i != 2 && i != 3) {
      semanticError(next, "SPACE must be 1, 2 or 3.");
    }
    one(")");
    directiveNodes.add(createDirectiveNode(start, pos));
    removeSegments(start, pos);
  }

  private void parseLineCount() throws CblDiagnosticException {
    int start = or("LINECOUNT", "LC");
    one("(");
    String argument = next();
    int i = checkIntegerLiteral(argument);
    one(")");
    directiveNodes.add(createDirectiveNode(start, pos));
    removeSegments(start, pos);
    if (isLineNumberWrong(i)) {
      semanticError(argument, "LINECOUNT must be an integer between 1 and 255");
    }
  }

  private void parseFlag() throws CblDiagnosticException {
    int start = or("FLAG", "F");
    one("(");
    or("E", "I", "S", "U", "W");
    one(")");
    directiveNodes.add(createDirectiveNode(start, pos));
    removeSegments(start, pos);
  }

  private void removePrevComma() {
    for (int i = pos - 1; i >= 0; i--) {
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
    return nnn <= 0 || nnn > 255;
  }

  private int checkIntegerLiteral(String next) throws CblDiagnosticException {
    try {
      return Integer.parseInt(next);
    } catch (NumberFormatException e) {
      throw expect("integer", makeCurrentLocation(), "integer");
    }
  }

  private Location makeCurrentLocation() {
    Position start = new Position(lineNumber, ranges[pos - 1]);
    Position end = new Position(lineNumber, ranges[pos]);
    Range range = new Range(start, end);
    return new Location(uri, range);
  }

  private void parseOption() throws CblDiagnosticException {
    int depth = 0;
    while (hasMore()) {
      if ("'".equals(segments[pos]) || "\"".equals(segments[pos])) {
        skipAfter(segments[pos++]);
        continue;
      }
      if (depth == 0)
        if (isNext(")")) {
          throw expect(next(), makeCurrentLocation());
        } else if (isNext(",")) {
          break;
        }
      String next = next();
      if ("(".equals(next)) {
        depth++;
      } else if (")".equals(next)) {
        depth--;
      }
    }
    if (depth > 0) {
      throw expect(peek(), makeCurrentLocation(), ")");
    }
    opt(",");
  }

  private boolean isNext(String expected) {
    return expected.equalsIgnoreCase(peek());
  }

  private int or(String... variants) throws CblDiagnosticException {
    String token = next();
    for (String text : variants) {
      if (text.equalsIgnoreCase(token)) {
        return pos - 1;
      }
    }
    throw expect(token, makeCurrentLocation(), variants);
  }

  private void opt(String expected) {
    if (expected.equalsIgnoreCase(peek())) {
      next();
    }
  }

  private int one(String expected) throws CblDiagnosticException {
    return or(expected);
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
    for (; pos < segments.length; ++pos) {
      String segment = segments[pos];
      if (!isBlank(segment)) {
        ++pos;
        return segment;
      }
    }
    return null;
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
