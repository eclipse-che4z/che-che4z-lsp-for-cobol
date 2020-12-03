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

/**
 * This interface contains methods to apply the RENAME function (e.g. add the given variable to the
 * structure of the caller). Not all the variable types allow this function, so each implementation
 * should apply own check. For the variable renaming means creating a new one with the qualifier
 * which top point to the caller.
 *
 * <p>NOTICE: This interface does not have anything to do with the renaming from LSP point of view.
 */
public interface Renameable {

  /**
   * Create a new variable which qualifier points to a different structure. Effectively, copy the
   * variable to add it as a child to the variable with the given name. Used in RENAME clause.
   * Should return null if the variable type doesn't allow renaming
   *
   * @param renameItemName - the name of the new structure
   * @return a new variable with a different qualifier or null if not renameable
   */
  default Variable rename(String renameItemName) {
    return null;
  }
}
