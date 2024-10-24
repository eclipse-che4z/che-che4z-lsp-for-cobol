/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.service.delegates.formations;

import com.google.common.collect.ImmutableList;
import lombok.*;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.eclipse.lsp4j.TextEdit;

import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;

public class CapitalFormation implements Formation {
  static final String UPPERCASE = "\"Uppercase\"";
  static final String LOWERCASE = "\"Lowercase\"";
  private static final int MAX_LEN = 72;
  private static final int MIN_LEN = 7;
  private static final String PROGRAM_ID = "PROGRAM-ID";

  @Data
  private static class Context {
    final List<TextEdit> result;
    final Function<Character, Character> modifier;
    int currentPos;
    boolean reachedProgramId;
    int dotCounter;
    Character startedLiteralValue;

    Context(Function<Character, Character> modifier) {
      this.modifier = modifier;
      this.result = new LinkedList<>();
      this.reachedProgramId = false;
      this.dotCounter = 2;
    }

    public boolean isSeekingProgramId() {
      return (reachedProgramId && dotCounter > 0);
    }

    public void decreaseDotCounter() {
      dotCounter--;
    }

    public void startNewLine() {
      currentPos = MIN_LEN;
      startedLiteralValue = null;
    }

    public boolean insideLiteralValue() {
      return (startedLiteralValue != null);
    }

    public void checkLiteralValue(Character ch) {
      if (ch == '"' || ch == '\'') {
        if (startedLiteralValue == null) {
          startedLiteralValue = ch;
        } else {
          if (ch.equals(startedLiteralValue)) {
            startedLiteralValue = null;
          }
        }
      }
    }
  }

  @Override
  public List<TextEdit> format(@NonNull List<CobolDocumentModel.Line> lines, @NonNull List<String> settings) {
    Function<Character, Character> modifier = getModifier(settings);
    if (modifier == null) {
      return ImmutableList.of();
    }
    Context context = new Context(modifier);

    for (CobolDocumentModel.Line line : lines) {
      StringBuilder builder = new StringBuilder();
      processLine(builder, line, context);
    }
    return context.getResult();
  }

  private void processLine(StringBuilder builder, CobolDocumentModel.Line line, Context context) {
    int maxLen = Math.min(line.getText().length(), MAX_LEN);
    context.startNewLine();

    // Check for commented line
    if (maxLen >= MIN_LEN) {
      if (line.getText().charAt(MIN_LEN - 1) == '*') {
        return;
      }
    }
    // Get PROGRAM-ID keyword index
    int programIdPos = 0;
    if (!context.isReachedProgramId()) {
      programIdPos = StringUtils.indexOfIgnoreCase(line.getText(), PROGRAM_ID);
      if (programIdPos > 0) {
        context.setReachedProgramId(true);
        programIdPos += PROGRAM_ID.length();
      }
    }

    for (int i = 7; i < maxLen; i++) {
      Character ch = line.getText().charAt(i);
      // Check for literal variable
      boolean literal = context.insideLiteralValue();
      context.checkLiteralValue(ch);

      if (!literal && context.insideLiteralValue() && builder.length() > 0) {
        context.getResult().add(constructEdit(line.getNumber(), builder, context.getCurrentPos(), i));
      }
      if (context.insideLiteralValue()) {
        continue;
      }

      // Check for PROGRAM-ID value
      if (i >= programIdPos && context.isSeekingProgramId()) {
        if (ch == '.') {
          context.decreaseDotCounter();
        }
      }

      // Continue if we are still in PROGRAM-ID value
      if (i > programIdPos && context.isSeekingProgramId()) {
        continue;
      }

      // Check if character was changed - add to the edited text structure
      Character newCh = context.getModifier().apply(ch);
      if (newCh == ch) {
        if (builder.length() > 0) {
          context.getResult().add(constructEdit(line.getNumber(), builder, context.getCurrentPos(), i));
        }
      } else {
        if (builder.length() == 0) {
          context.setCurrentPos(i);
        }
        builder.append(newCh);
      }
    }
    // Check after loop if we have not committed edit structure
    if (builder.length() > 0) {
      context.getResult().add(constructEdit(line.getNumber(), builder, context.getCurrentPos(), maxLen));
    }
  }

  private TextEdit constructEdit(int lineNumber, StringBuilder builder, int startPos, int endPosExcluded) {
    String text = builder.toString();
    builder.setLength(0);
    Range range = new Range(new Position(lineNumber, startPos), new Position(lineNumber, endPosExcluded));

    return new TextEdit(range, text);
  }

  private Function<Character, Character> getModifier(List<String> settings) {
    if (!settings.isEmpty() && settings.get(0).equals(UPPERCASE)) {
      return Character::toUpperCase;
    }

    if (!settings.isEmpty() && settings.get(0).equals(LOWERCASE)) {
      return Character::toLowerCase;
    }
    return null;
  }
}
