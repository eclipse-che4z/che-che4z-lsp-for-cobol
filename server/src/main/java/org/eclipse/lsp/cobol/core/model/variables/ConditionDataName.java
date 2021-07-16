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

package org.eclipse.lsp.cobol.core.model.variables;

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.Value;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.variables.ValueInterval;

import java.util.List;
import java.util.function.Function;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.joining;
import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.LEVEL_88;
import static org.eclipse.lsp.cobol.core.model.variables.StructureType.CONDITION_ITEM;

/**
 * This value class represents a conditional data name entry, that has a level number 88. It cannot
 * be a top element in the structure. It always contains a variable name and a value, but not PIC
 * clause.
 */
@Value
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class ConditionDataName extends AbstractVariable {
  List<ValueInterval> valueIntervals;
  String valueToken;

  public ConditionDataName(
      String name,
      Locality definition,
      Variable parent,
      List<ValueInterval> valueIntervals,
      String valueToken) {
    super(LEVEL_88, name, definition, parent);
    this.valueIntervals = valueIntervals;
    this.valueToken = valueToken;
  }

  @Override
  public boolean isConditional() {
    return false;
  }

  @Override
  public void addConditionName(ConditionDataName variable) {
    throw new UnsupportedOperationException("This variable is not conditional");
  }

  @Override
  public List<ConditionDataName> getConditionNames() {
    return ImmutableList.of();
  }

  @Override
  public Variable rename(RenameItem newParent) {
    return new ConditionDataName(name, definition, newParent, valueIntervals, valueToken);
  }

  @Override
  public StructureType getStructureType() {
    return CONDITION_ITEM;
  }

  @Override
  public String getFormattedDisplayLine() {
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
