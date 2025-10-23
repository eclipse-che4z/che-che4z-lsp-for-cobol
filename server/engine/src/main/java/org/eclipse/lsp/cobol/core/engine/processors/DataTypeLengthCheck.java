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
package org.eclipse.lsp.cobol.core.engine.processors;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;

/** Checks the length of data types to ensure they comply with COBOL limits. */
public class DataTypeLengthCheck implements Processor<VariableWithLevelNode> {

  private static final int MAX_NUMERIC_LENGTH = 18;
  private static final int MAX_ALPHABETIC_ALPHANUMERIC_LENGTH = 999999999;
  private static final int MAX_NATIONAL_UTF8_DBCS_LENGTH = 99999999;
  private static final int MAX_FLOATING_POINT_MANTISSA = 16;
  private static final int MAX_ALPHANUMERIC_EDITED_REPETITION_FACTOR = 32767;

  private static final Pattern NUMERIC_PATTERN = Pattern.compile("(?i)9\\((\\d+)\\)");
  private static final Pattern ALPHABETIC_PATTERN = Pattern.compile("(?i)A\\((\\d+)\\)");
  private static final Pattern ALPHANUMERIC_PATTERN = Pattern.compile("(?i)X\\((\\d+)\\)");
  private static final Pattern NATIONAL_PATTERN = Pattern.compile("(?i)N\\((\\d+)\\)");
  private static final Pattern UTF8_PATTERN = Pattern.compile("(?i)U\\((\\d+)\\)");
  private static final Pattern DBCS_PATTERN = Pattern.compile("(?i)G\\((\\d+)\\)");
  private static final Pattern NUMERIC_WITH_DECIMAL_PATTERN =
      Pattern.compile("(?i)S?9\\((\\d+)\\)V9\\((\\d+)\\)");
  private static final Pattern FLOATING_POINT_PATTERN =
      Pattern.compile("(?i)^([+-]?)(.*?)E([+-]?)(9+)$");

  @Override
  public void accept(
      VariableWithLevelNode variableWithLevelNode, ProcessingContext processingContext) {
    if (variableWithLevelNode instanceof ElementaryItemNode
        && !((ElementaryItemNode) variableWithLevelNode).isDb2HostVariable()
        && !((ElementaryItemNode) variableWithLevelNode).isLobWithSizeVariable()) {
      String pictureClause = ((ElementaryItemNode) variableWithLevelNode).getPicClause();
      if (pictureClause != null && !pictureClause.isEmpty()) {
        checkDataTypeLength(variableWithLevelNode, pictureClause, processingContext);
      }
    }
  }

  private void checkDataTypeLength(
      VariableWithLevelNode node, String pictureClause, ProcessingContext context) {

    if (checkFloatingPointPattern(node, pictureClause, context)) {
      return;
    }

    if (checkNumericWithDecimalPattern(node, pictureClause, context)) {
      return;
    }

    if (checkSimpleNumericWithDecimal(node, pictureClause, context)) {
      return;
    }

    if (checkSimpleNumericPattern(node, pictureClause, context)) {
      return;
    }

    if (checkSimpleNationalPattern(node, pictureClause, context)) {
      return;
    }

    if (checkSimpleUtf8Pattern(node, pictureClause, context)) {
      return;
    }

    if (checkSimpleDbcsPattern(node, pictureClause, context)) {
      return;
    }

    if (checkAlphanumericEditedPattern(node, pictureClause, context)) {
      return;
    }

    checkPatternBasedClause(
        node,
        pictureClause,
        context,
        NUMERIC_PATTERN,
        MAX_NUMERIC_LENGTH,
        "dataTypeLengthCheck.maxNumericLengthExceeded");

    checkPatternBasedClause(
        node,
        pictureClause,
        context,
        ALPHABETIC_PATTERN,
        MAX_ALPHABETIC_ALPHANUMERIC_LENGTH,
        "dataTypeLengthCheck.maxAlphabeticLengthExceeded");

    checkPatternBasedClause(
        node,
        pictureClause,
        context,
        ALPHANUMERIC_PATTERN,
        MAX_ALPHABETIC_ALPHANUMERIC_LENGTH,
        "dataTypeLengthCheck.maxAlphanumericLengthExceeded");

    checkPatternBasedClause(
        node,
        pictureClause,
        context,
        NATIONAL_PATTERN,
        MAX_NATIONAL_UTF8_DBCS_LENGTH,
        "dataTypeLengthCheck.maxNationalLengthExceeded");

    checkPatternBasedClause(
        node,
        pictureClause,
        context,
        UTF8_PATTERN,
        MAX_NATIONAL_UTF8_DBCS_LENGTH,
        "dataTypeLengthCheck.maxUtf8LengthExceeded");

    checkPatternBasedClause(
        node,
        pictureClause,
        context,
        DBCS_PATTERN,
        MAX_NATIONAL_UTF8_DBCS_LENGTH,
        "dataTypeLengthCheck.maxDbcsLengthExceeded");

    if (pictureClause.toUpperCase().startsWith("G")) {
      checkDbcsUsageDisplay1(node, context);
    }
  }

  private boolean checkFloatingPointPattern(
      VariableWithLevelNode node, String pictureClause, ProcessingContext context) {

    if (!pictureClause.toUpperCase().contains("E")) {
      return false;
    }

    Matcher matcher = FLOATING_POINT_PATTERN.matcher(pictureClause);
    if (!matcher.matches()) {
      return false;
    }

    String mantissaSign = matcher.group(1);
    String mantissaPart = matcher.group(2);
    String exponentSign = matcher.group(3);
    String exponentPart = matcher.group(4);

    if (mantissaSign.isEmpty()) {
      context
          .getErrors()
          .add(
              node.getError(
                  MessageTemplate.of(
                      "dataTypeLengthCheck.floatingPointMantissaMissingSign", node.getName())));
    }

    if (!mantissaPart.contains(".") && !mantissaPart.toUpperCase().contains("V")) {
      context
          .getErrors()
          .add(
              node.getError(
                  MessageTemplate.of(
                      "dataTypeLengthCheck.floatingPointMissingDecimal", node.getName())));
    }

    int digitCount = countDigitsInPictureString(mantissaPart);
    int mantissaLength = digitCount > 0 ? digitCount - 1 : 0;

    if (mantissaLength > MAX_FLOATING_POINT_MANTISSA) {
      context
          .getErrors()
          .add(
              node.getError(
                  MessageTemplate.of(
                      "dataTypeLengthCheck.floatingPointMantissaTooLong",
                      node.getName(),
                      String.valueOf(mantissaLength),
                      String.valueOf(MAX_FLOATING_POINT_MANTISSA))));
    }

    if (exponentSign.isEmpty()) {
      context
          .getErrors()
          .add(
              node.getError(
                  MessageTemplate.of(
                      "dataTypeLengthCheck.floatingPointExponentMissingSign", node.getName())));
    }

    if (!exponentPart.equals("99")) {
      context
          .getErrors()
          .add(
              node.getError(
                  MessageTemplate.of(
                      "dataTypeLengthCheck.floatingPointExponentNotTwoDigits", node.getName())));
    }

    return true;
  }

  private int countDigitsInPictureString(String pictureString) {
    int parenIndex = pictureString.indexOf('(');
    if (parenIndex == -1) {
      return 0;
    }
    String beforeParen = pictureString.substring(0, parenIndex);
    String digitsBeforeParen = beforeParen.replaceAll("[v.]", "");
    int lengthDigitsBeforeParen = digitsBeforeParen.length();
    int closeParen = pictureString.indexOf(')', parenIndex);
    if (closeParen == -1) {
      return 0;
    }
    String numberInParen = pictureString.substring(parenIndex + 1, closeParen);
    int size = Integer.parseInt(numberInParen);

    return lengthDigitsBeforeParen + size - 1;
  }

  private boolean checkNumericWithDecimalPattern(
      VariableWithLevelNode node, String pictureClause, ProcessingContext context) {

    Matcher matcher = NUMERIC_WITH_DECIMAL_PATTERN.matcher(pictureClause);
    if (!matcher.find()) {
      return false;
    }

    String integerPart = matcher.group(1);
    String decimalPart = matcher.group(2);
    int totalLength = parseLength(integerPart) + parseLength(decimalPart);

    if (totalLength > MAX_NUMERIC_LENGTH) {
      showError(
          context,
          node,
          "dataTypeLengthCheck.maxNumericLengthExceeded",
          String.valueOf(totalLength),
          MAX_NUMERIC_LENGTH);
    }

    return true;
  }

  private boolean checkSimpleNumericWithDecimal(
      VariableWithLevelNode node, String pictureClause, ProcessingContext context) {

    if (pictureClause.matches("(?i)([0]*9[09]*P[09]+)")) {
      showError(context, node, "dataTypeLengthCheck.invalidPictureString", "", 0);
      return true;
    }
    if (!pictureClause.matches("(?i)S?[09]*(V[09]*)?")
        && !pictureClause.matches("9+\\([0-9]+\\)9*")
        && !pictureClause.matches("(?i)([0]*P[09]*|[09]*P)")) {
      return false;
    }

    String numericPart =
        pictureClause.toUpperCase().startsWith("S") ? pictureClause.substring(1) : pictureClause;

    Pattern pattern = Pattern.compile("9\\((\\d+)\\)");
    int totalLength = calculateLength(numericPart, pattern);

    if (totalLength > MAX_NUMERIC_LENGTH) {
      showError(
          context,
          node,
          "dataTypeLengthCheck.maxNumericLengthExceeded",
          String.valueOf(totalLength),
          MAX_NUMERIC_LENGTH);
    }

    return true;
  }

  private boolean checkSimpleNumericPattern(
      VariableWithLevelNode node, String pictureClause, ProcessingContext context) {

    if (!pictureClause.matches("(?i)S?9+")) {
      return false;
    }

    String numericPart =
        pictureClause.toUpperCase().startsWith("S") ? pictureClause.substring(1) : pictureClause;

    if (numericPart.length() > MAX_NUMERIC_LENGTH) {
      showError(
          context,
          node,
          "dataTypeLengthCheck.maxNumericLengthExceeded",
          String.valueOf(numericPart.length()),
          MAX_NUMERIC_LENGTH);
    }

    return true;
  }

  private void checkPatternBasedClause(
      VariableWithLevelNode node,
      String pictureClause,
      ProcessingContext context,
      Pattern pattern,
      int maxLength,
      String errorMessageKey) {

    Matcher matcher = pattern.matcher(pictureClause);
    if (!matcher.find()) {
      return;
    }

    String lengthString = matcher.group(1);
    int length = parseLength(lengthString);

    if (length > maxLength) {
      showError(context, node, errorMessageKey, lengthString, maxLength);
    }
  }

  private int parseLength(String lengthString) {
    try {
      return Integer.parseInt(lengthString);
    } catch (NumberFormatException e) {
      return Integer.MAX_VALUE;
    }
  }

  private boolean checkSimpleNationalPattern(
      VariableWithLevelNode node, String pictureClause, ProcessingContext context) {
    if (!pictureClause.matches("(?i)N+")) {
      return false;
    }

    if (pictureClause.length() > MAX_NATIONAL_UTF8_DBCS_LENGTH) {
      showError(
          context,
          node,
          "dataTypeLengthCheck.maxNationalLengthExceeded",
          String.valueOf(pictureClause.length()),
          MAX_NATIONAL_UTF8_DBCS_LENGTH);
    }

    return true;
  }

  private boolean checkSimpleUtf8Pattern(
      VariableWithLevelNode node, String pictureClause, ProcessingContext context) {
    if (!pictureClause.matches("(?i)U+")) {
      return false;
    }

    if (pictureClause.length() > MAX_NATIONAL_UTF8_DBCS_LENGTH) {
      showError(
          context,
          node,
          "dataTypeLengthCheck.maxUtf8LengthExceeded",
          String.valueOf(pictureClause.length()),
          MAX_NATIONAL_UTF8_DBCS_LENGTH);
    }

    return true;
  }

  private boolean checkSimpleDbcsPattern(
      VariableWithLevelNode node, String pictureClause, ProcessingContext context) {
    if (!pictureClause.matches("(?i)G+")) {
      return false;
    }

    if (pictureClause.length() > MAX_NATIONAL_UTF8_DBCS_LENGTH) {
      showError(
          context,
          node,
          "dataTypeLengthCheck.maxDbcsLengthExceeded",
          String.valueOf(pictureClause.length()),
          MAX_NATIONAL_UTF8_DBCS_LENGTH);
    }
    if (pictureClause.toUpperCase().contains("G")) {
      checkDbcsUsageDisplay1(node, context);
    }
    return true;
  }

  private boolean checkAlphanumericEditedPattern(
      VariableWithLevelNode node, String pictureClause, ProcessingContext context) {

    String picWithoutRepetition = pictureClause.toUpperCase().replaceAll("\\([^)]*\\)", "");

    boolean hasAlpha = picWithoutRepetition.contains("A") || picWithoutRepetition.contains("X");
    boolean hasEditing =
        picWithoutRepetition.contains("B")
            || picWithoutRepetition.contains("0")
            || picWithoutRepetition.contains("/");

    if (!(hasAlpha && hasEditing)) {
      return false;
    }

    Pattern pattern = Pattern.compile("[ABX90/]\\((\\d+)\\)");
    int totalLength = calculateLength(pictureClause, pattern);

    if (totalLength > MAX_ALPHABETIC_ALPHANUMERIC_LENGTH) {
      showError(
          context,
          node,
          "dataTypeLengthCheck.maxAlphanumericEditedLengthExceeded",
          String.valueOf(totalLength),
          MAX_ALPHABETIC_ALPHANUMERIC_LENGTH);
    } else if (totalLength > MAX_ALPHANUMERIC_EDITED_REPETITION_FACTOR) {
      showError(
          context,
          node,
          "dataTypeLengthCheck.maxAlphanumericEditedRepetitionFactorExceeded",
          String.valueOf(MAX_ALPHANUMERIC_EDITED_REPETITION_FACTOR),
          0);
    }

    return true;
  }

  private int calculateLength(String numericPart, Pattern pattern) {
    if (numericPart.contains("(")) {
      int totalLength = 0;

      Matcher matcher = pattern.matcher(numericPart);
      int lastEnd = 0;

      while (matcher.find()) {
        String before = numericPart.substring(lastEnd, matcher.start());
        totalLength += before.length();

        int repetitions = Integer.parseInt(matcher.group(1));
        totalLength += repetitions;

        lastEnd = matcher.end();
      }

      if (lastEnd < numericPart.length()) {
        String remaining = numericPart.substring(lastEnd);
        totalLength += remaining.length();
      }
      return totalLength;
    } else {
      return numericPart.replace("0", "").replace("V", "").length();
    }
  }

  private void checkDbcsUsageDisplay1(VariableWithLevelNode node, ProcessingContext context) {
    if (node instanceof ElementaryItemNode) {
      ElementaryItemNode elementaryNode = (ElementaryItemNode) node;
      if (elementaryNode.getUsageFormat() != UsageFormat.DISPLAY_1) {
        context
            .getErrors()
            .add(
                node.getError(
                    MessageTemplate.of(
                        "dataTypeLengthCheck.dbcsMissingUsageDisplay1", node.getName())));
      }
    }
  }

  private void showError(
      ProcessingContext context,
      VariableWithLevelNode node,
      String template,
      String length,
      int maxAlphanumericLength) {
    context
        .getErrors()
        .add(
            node.getError(
                MessageTemplate.of(
                    template, node.getName(), length, String.valueOf(maxAlphanumericLength))));
  }
}
