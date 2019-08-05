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

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.lsp4j.Position;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * This class stores a Cobol program text to be processed. Provides a list of lines and text tokens
 * by position.
 *
 * @author zacan01, teman02
 */
public class MyDocumentModel {
  private static final Logger LOG = LogManager.getLogger(MyDocumentModel.class);

  private final List<Line> lines = new ArrayList<>();
  private final String text;

  MyDocumentModel(String text) {
    this.text = text;
    parse(text);
  }

  public String getText() {
    return text;
  }

  public List<Line> getLines() {
    return Collections.unmodifiableList(lines);
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
  public String getToken(Position position) {
    Line route = getLine(position.getLine());
    if (route == null) {
      return "";
    }
    return retrieveLastWordInString(position, route);
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
      LOG.error(e.getMessage());
    }
  }

  private String retrieveLastWordInString(Position position, Line route) {
    if (!checkCharacterInBounds(position, route)) {
      return "";
    }
    String leftPart = route.getText().substring(0, position.getCharacter());
    return leftPart.substring(leftPart.lastIndexOf(' ') + 1);
  }

  private boolean checkCharacterInBounds(Position position, Line route) {
    return position.getCharacter() >= 0 && position.getCharacter() <= route.getText().length();
  }

  /** A value object to store program lines */
  public static class Line {
    private final int number;
    private final String text;

    Line(int number, String text) {
      this.number = number;
      this.text = text;
    }

    public int getNumber() {
      return number;
    }

    public String getText() {
      return text;
    }
  }
}
