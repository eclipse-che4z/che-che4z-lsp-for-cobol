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
package com.ca.lsp.core.cobol.model.variables;

/**
 * This interface describes a COBOL Variable. Variable has a name, and a level number that shows its
 * position in the hierarchy.
 */
public interface Variable {
  /**
   * Get name of the variable
   *
   * @return String variable name
   */
  String getName();
}
