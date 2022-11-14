/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.common.utils;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.variable.EffectiveDataType;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;

import java.util.Collections;
import java.util.EnumMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

import static org.eclipse.lsp.cobol.common.model.tree.variable.EffectiveDataType.*;
import static org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat.*;

/** The utility class is for handling usage clause of a data description entry. */
@UtilityClass
public class UsageFormatUtils {

  public final List<UsageFormat> blankAndSignNotAllowedUsage = ImmutableList.of(UTF_8, NATIONAL);
  final ImmutableList<UsageFormat> stringUsageFormat =
      ImmutableList.of(NATIONAL, DISPLAY_1, UTF_8, DISPLAY);
  public final ImmutableList<UsageFormat> numericDatatypeUsageFormat =
      ImmutableList.of(
          COMP_1,
          COMPUTATIONAL_1,
          COMP_2,
          COMPUTATIONAL_2,
          COMP,
          COMPUTATIONAL,
          COMPUTATIONAL_3,
          COMP_3,
          COMP_4,
          COMPUTATIONAL_4,
          COMP_5,
          COMPUTATIONAL_5,
          NATIONAL,
          DISPLAY);
  public final List<UsageFormat> noPicClauseUsage =
      ImmutableList.of(
          INDEX,
          POINTER_32,
          POINTER,
          PROCEDURE_POINTER,
          FUNCTION_POINTER,
          OBJECT_REFERENCE,
          COMP_1,
          COMP_2,
          COMPUTATIONAL_1,
          COMPUTATIONAL_2);
  private final String picAndUsageConflict = "semantics.picAndUsageConflict";
  private final List<EffectiveDataType> numericDataTypes = ImmutableList.of(REAL, INTEGER);
  private final Function<ElementaryNode, List<SyntaxError>> checkStringUsage =
      variableNode -> {
        if (isStringNode(variableNode))
          return ImmutableList.of(
              variableNode.getError(
                  MessageTemplate.of(picAndUsageConflict), ErrorSeverity.WARNING));
        return Collections.emptyList();
      };

  private final Function<ElementaryNode, List<SyntaxError>> checkNumericUsage =
      variableNode -> {
        if (numericDatatypeUsageFormat.contains(variableNode.getUsageFormat())
            && isNumericNode(variableNode))
          return ImmutableList.of(
              variableNode.getError(
                  MessageTemplate.of(picAndUsageConflict), ErrorSeverity.WARNING));
        return Collections.emptyList();
      };

  public Map<EffectiveDataType, Function<ElementaryNode, List<SyntaxError>>> picAndUsageClauseValidator =
      new EnumMap<>(
          ImmutableMap.of(
              STRING, checkStringUsage,
              REAL, checkNumericUsage,
              INTEGER, checkNumericUsage));

  private boolean isStringNode(ElementaryNode variableNode) {
    return !stringUsageFormat.contains(variableNode.getUsageFormat())
        && variableNode.getUsageFormat() != UNDEFINED;
  }

  private static boolean isNumericNode(ElementaryNode variableNode) {
    return !numericDataTypes.contains(variableNode.getEffectiveDataType());
  }
}
