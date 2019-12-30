/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service;

import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import lombok.Data;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.Position;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

/**
 * This class stores a Cobol program text to be processed. Provides a list of lines and text tokens
 * by position.
 */
@Data
@Slf4j
public class MyDocumentModel {
  private static final String DELIMITER = "[ .\\[\\]()<>,*]+";
  private final List<Line> lines = new ArrayList<>();
  private final String text;
  private AnalysisResult analysisResult;

  public MyDocumentModel(String text, AnalysisResult analysisResult) {
    this.text = text;
    this.analysisResult = analysisResult;
    parse(text);
  }

  public MyDocumentModel(String text) {
    this.text = text;
    parse(text);
  }

  public Line getLine(int number) {
    return lines.stream().filter(line -> line.getNumber() == number).findFirst().orElse(null);
  }

  /**
   * Return a word at the specified position or an empty string.
   *
   * @param position - the position object containing line and char number.
   * @return
   */
  public String getTokenBeforePosition(Position position) {
    Line route = getLine(position.getLine());
    if (route == null) {
      return "";
    }
    return retrieveTokenBeginning(position, route);
  }

  public String getFullTokenAtPosition(Position position) {
    Line route = getLine(position.getLine());
    if (route == null) {
      return "";
    }
    return retrieveToken(position, route);
  }

  private void parse(String text) {
    try (BufferedReader reader = new BufferedReader(new StringReader(text))) {
      String lineText;
      int lineNumber = 0;

      while ((lineText = reader.readLine()) != null) {
        lines.add(new Line(lineNumber, lineText));
        lineNumber++;
      }
    } catch (IOException e) {
      log.error(e.getMessage());
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
    private final int number;
    private final String text;

    Line(int number, String text) {
      this.number = number;
      this.text = text;
    }
  }
}
