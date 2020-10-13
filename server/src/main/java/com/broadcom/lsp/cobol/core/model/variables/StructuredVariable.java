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
 * This interface represents a structured variable that may contain children ones. The children may
 * be variables or also structures.
 */
public interface StructuredVariable extends Variable {

  /**
   * Add a new nested variable to this structure
   *
   * @param variable - a nested variable. Can be a group or element, or all the other allowed type
   *     item.
   */
  void addChild(Variable variable);

  /**
   * Return an immutable list of already defined nested variables
   *
   * @return defined nested variables.
   */
  List<Variable> getChildren();
}
