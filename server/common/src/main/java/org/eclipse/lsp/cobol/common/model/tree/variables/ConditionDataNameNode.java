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
package org.eclipse.lsp.cobol.common.model.tree.variables;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.ValueInterval;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableType;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;

import java.util.List;
import java.util.function.Function;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.joining;
import static org.eclipse.lsp.cobol.common.VariableConstants.LEVEL_88;

/**
 * This value class represents a conditional data name entry, that has a level number 88. It cannot
 * be a top element in the structure. It always contains a variable name and a value, but not PIC
 * clause.
 */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class ConditionDataNameNode extends VariableWithLevelNode {
  private final List<ValueInterval> valueIntervals;
  private final String valueToken;

  public ConditionDataNameNode(
      Locality location,
      String name,
      boolean redefines,
      List<ValueInterval> valueIntervals,
      String valueToken) {
    super(location, LEVEL_88, name, redefines, VariableType.CONDITION_DATA_NAME);
    this.valueIntervals = valueIntervals;
    this.valueToken = valueToken;
  }

  @Override
  protected String getVariableDisplayString() {
    final String formattedSuffix = getFormattedSuffix();
    int thruPadding = formattedSuffix.length() + valueToken.length() + 2; // number of spaces

    return String.format(
        "%s %s %s.",
        formattedSuffix,
        valueToken,
        valueIntervals.stream()
            .map(intervalToText())
            .collect(joining("\n" + StringUtils.repeat(' ', thruPadding))));
  }

  private Function<ValueInterval, String> intervalToText() {
    return it -> it.getFrom() + ofNullable(it.getTo()).map(addThru(it)).orElse("");
  }

  private Function<String, String> addThru(ValueInterval interval) {
    return it ->
        ofNullable(interval.getThruToken()).map(thru -> " " + thru + " ").orElse("")
            + interval.getTo();
  }
}
