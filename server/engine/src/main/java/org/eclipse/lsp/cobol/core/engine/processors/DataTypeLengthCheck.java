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
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;

/** Checks the length of data types to ensure they comply with COBOL limits. */
public class DataTypeLengthCheck implements Processor<VariableWithLevelNode> {

  private static final int MAX_NUMERIC_LENGTH = 18;
  private static final int MAX_ALPHABETIC_ALPHANUMERIC_LENGTH = 999999999;

  private static final Pattern NUMERIC_PATTERN = Pattern.compile("(?i)9\\((\\d+)\\)");
  private static final Pattern ALPHABETIC_PATTERN = Pattern.compile("(?i)A\\((\\d+)\\)");
  private static final Pattern ALPHANUMERIC_PATTERN = Pattern.compile("(?i)X\\((\\d+)\\)");

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

    Matcher numericMatcher = NUMERIC_PATTERN.matcher(pictureClause);
    if (numericMatcher.find()) {
      try {
        int length = Integer.parseInt(numericMatcher.group(1));
        if (length > MAX_NUMERIC_LENGTH) {
          showError(
              context,
              node,
              "dataTypeLengthCheck.maxNumericLengthExceeded",
              String.valueOf(length),
              MAX_NUMERIC_LENGTH);
        }
      } catch (NumberFormatException e) {
        showError(
            context,
            node,
            "dataTypeLengthCheck.maxNumericLengthExceeded",
            String.valueOf(numericMatcher.group(1)),
            MAX_NUMERIC_LENGTH);
      }
      return;
    }

    Matcher alphabeticMatcher = ALPHABETIC_PATTERN.matcher(pictureClause);
    if (alphabeticMatcher.find()) {
      try {
        int length = Integer.parseInt(alphabeticMatcher.group(1));
        if (length > MAX_ALPHABETIC_ALPHANUMERIC_LENGTH) {
          showError(
              context,
              node,
              "dataTypeLengthCheck.maxAlphabeticLengthExceeded",
              String.valueOf(length),
              MAX_ALPHABETIC_ALPHANUMERIC_LENGTH);
        }
      } catch (NumberFormatException e) {
        showError(
            context,
            node,
            "dataTypeLengthCheck.maxAlphabeticLengthExceeded",
            String.valueOf(alphabeticMatcher.group(1)),
            MAX_ALPHABETIC_ALPHANUMERIC_LENGTH);
      }
      return;
    }

    Matcher alphanumericMatcher = ALPHANUMERIC_PATTERN.matcher(pictureClause);
    if (alphanumericMatcher.find()) {
      try {
        int length = Integer.parseInt(alphanumericMatcher.group(1));
        if (length > MAX_ALPHABETIC_ALPHANUMERIC_LENGTH) {
          showError(
              context,
              node,
              "dataTypeLengthCheck.maxAlphanumericLengthExceeded",
              String.valueOf(length),
              MAX_ALPHABETIC_ALPHANUMERIC_LENGTH);
        }
      } catch (NumberFormatException e) {
        showError(
            context,
            node,
            "dataTypeLengthCheck.maxAlphanumericLengthExceeded",
            alphanumericMatcher.group(1),
            MAX_ALPHABETIC_ALPHANUMERIC_LENGTH);
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
