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

import lombok.Getter;
import lombok.NonNull;
import org.eclipse.lsp.cobol.core.model.Locality;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

/** This abstract class implements the functionality that is common for all the variables. */
public abstract class AbstractVariable implements Variable {
  public static final int DEFAULT_LEVEL = -1;
  private static final String GLOBAL_SUFFIX = " GLOBAL";
  @Getter protected final int levelNumber;
  @Getter protected final String name;
  @Getter protected final Locality definition;
  @Getter protected final boolean global;
  private final List<Locality> usages = new ArrayList<>();
  private final List<ConditionDataName> conditionChildren = new ArrayList<>();
  private final Variable parent;

  protected AbstractVariable(
      int levelNumber, String name, Locality definition, boolean global, Variable parent) {
    this.levelNumber = levelNumber;
    this.name = name;
    this.definition = definition;
    this.global = Optional.ofNullable(parent).map(Variable::isGlobal).orElse(global);
    this.parent = parent;
  }

  protected AbstractVariable(int levelNumber, String name, Locality definition, Variable parent) {
    this.levelNumber = levelNumber;
    this.name = name;
    this.definition = definition;
    this.global = Optional.ofNullable(parent).map(Variable::isGlobal).orElse(false);
    this.parent = parent;
  }

  @Override
  public @NonNull List<Locality> getUsages() {
    return usages;
  }

  @Override
  public void addUsage(@NonNull Locality usage) {
    usages.add(usage);
  }

  public Variable getParent() {
    return parent;
  }

  @Override
  public boolean isConditional() {
    return true;
  }

  @Override
  public void addConditionName(ConditionDataName variable) {
    conditionChildren.add(variable);
  }

  @Override
  public String getFormattedDisplayLine() {
    return getFormattedSuffix() + ".";
  }

  protected String getFormattedSuffix() {
    String globalSuffix = global ? GLOBAL_SUFFIX : "";
    return String.format("%1$02d %2$s%3$s", levelNumber, name, globalSuffix);
  }

  @Override
  public List<ConditionDataName> getConditionNames() {
    return conditionChildren;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    AbstractVariable that = (AbstractVariable) o;
    return levelNumber == that.levelNumber
        && Objects.equals(name, that.name)
        && Objects.equals(definition, that.definition)
        && global == that.global
        && Objects.equals(usages, that.usages)
        && Objects.equals(conditionChildren, that.conditionChildren)
        && Objects.equals(parent, that.parent);
  }

  @Override
  public int hashCode() {
    return Objects.hash(levelNumber, name, definition, global, usages, conditionChildren, parent);
  }
}
