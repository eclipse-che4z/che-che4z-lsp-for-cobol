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
package org.eclipse.lsp.cobol.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import lombok.*;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.Position;

/**
 * This class stores a COBOL program text to be processed. Provides a list of lines and text tokens
 * by position.
 */
@Getter
@RequiredArgsConstructor
@Slf4j
public class CobolDocumentModel {
  private static final String DELIMITER = "[ .\\[\\]()<>,*\"']+";
  private final List<Line> lines = new CopyOnWriteArrayList<>();
  private String text;
  private final String uri;
  @Setter private volatile boolean opened = true;
  private volatile AnalysisResult analysisResult;
  private volatile AnalysisResult lastAnalysisResult;
  @Setter private volatile List<DocumentSymbol> outlineResult;

  public CobolDocumentModel(String uri, String text, AnalysisResult analysisResult) {
    this.uri = uri;
    this.text = text;
    this.analysisResult = analysisResult;
    this.lastAnalysisResult = analysisResult;
    parse(text);
  }

  public CobolDocumentModel(String uri, String text) {
    this.text = text;
    this.uri = uri;
    parse(text);
  }

  public boolean isDocumentSynced() {
    return (analysisResult != null && outlineResult != null);
  }

  Line getLine(int number) {
    return lines.stream().filter(line -> line.getNumber() == number).findFirst().orElse(null);
  }

  /**
   * Return a word at the specified position or an empty string.
   *
   * @param position - the position object containing line and char number.
   * @return the word at the specified position.
   */
  public String getTokenBeforePosition(Position position) {
    Line route = getLine(position.getLine());
    if (route == null) {
      return "";
    }
    return retrieveTokenBeginning(position, route);
  }

  /**
   * Assign analysis result to the document.
   *
   * @param analysisResult the analysis result.
   */
  public void setAnalysisResult(AnalysisResult analysisResult) {
    LOG.debug("setAnalysisResult: " + uri);
    if (analysisResult != null) {
      this.lastAnalysisResult = analysisResult;
    }
    this.analysisResult = analysisResult;
  }

  /**
   * Update CobolDocumentModel with a new text
   *
   * @param text - the new document text
   */
  public void update(String text) {
    this.text = text;
    parse(text);
    analysisResult = null;
  }

  String getFullTokenAtPosition(Position position) {
    Line route = getLine(position.getLine());
    if (route == null) {
      return "";
    }
    return retrieveToken(position, route);
  }

  private void parse(String text) {
    lines.clear();
    try (BufferedReader reader = new BufferedReader(new StringReader(text))) {
      String lineText;
      int lineNumber = 0;

      while ((lineText = reader.readLine()) != null) {
        lines.add(new Line(lineNumber, lineText));
        lineNumber++;
      }
    } catch (IOException e) {
      LOG.error(e.getMessage());
    }
  }

  private String retrieveToken(Position position, Line route) {

    String beginning = retrieveTokenBeginning(position, route);
    String ending = retrieveTokenEnding(position, route);

    return beginning + ending;
  }

  private String retrieveTokenBeginning(Position position, Line route) {
    if (isPositionIncorrect(position, route)) {
      return "";
    }
    String[] beginning = route.getText().substring(0, position.getCharacter()).split(DELIMITER);
    return beginning.length > 0 ? beginning[beginning.length - 1] : "";
  }

  private String retrieveTokenEnding(Position position, Line route) {
    if (isPositionIncorrect(position, route)) {
      return "";
    }
    String[] rightPart = route.getText().substring(position.getCharacter()).split(DELIMITER);

    return rightPart.length > 0 ? rightPart[0] : "";
  }

  private boolean isPositionIncorrect(Position position, Line route) {
    return !isCharacterInBounds(position, route) || isPositionAtDelimiter(position, route);
  }

  private boolean isCharacterInBounds(Position position, Line route) {
    return position.getCharacter() >= 0 && position.getCharacter() <= route.getText().length();
  }

  private boolean isPositionAtDelimiter(Position position, Line route) {
    return position.getCharacter() > 1
        && DELIMITER.contains(String.valueOf(route.getText().charAt(position.getCharacter() - 1)));
  }

  /** A value object to store program lines */
  @Value
  public static class Line {
    int number;
    String text;

    Line(int number, String text) {
      this.number = number;
      this.text = text;
    }
  }
}
