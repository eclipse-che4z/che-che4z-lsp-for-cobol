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

package com.broadcom.lsp.cobol.core.model.variables;

import java.util.List;

/**
 * This interface represents a conditional data name that may have related a list of {@link
 * ConditionDataName}
 */
public interface Conditional {

  /**
   * Check if this variable supports nesting {@link ConditionDataName}
   *
   * @return true if may have a list of {@link ConditionDataName}
   */
  boolean isConditional();

  /**
   * Add a new {@link ConditionDataName} to this conditional variable
   *
   * @param variable - a {@link ConditionDataName} to add
   */
  void addConditionName(ConditionDataName variable);

  /**
   * Get a list of nested {@link ConditionDataName}
   *
   * @return a list of {@link ConditionDataName}
   */
  List<ConditionDataName> getConditionNames();
}
