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

import lombok.NonNull;

import java.util.List;

/**
 * This interface represents a Table declaration, effectively an array. Contains a list of IndexItem
 * for that table and integer occurs times, effectively the arrays size.
 */
public interface TableDeclaration {
  /**
   * Get index items for this table from INDEXED BY clause
   *
   * @return list of IndexItem
   */
  @NonNull
  List<IndexItem> getIndexes();

  /**
   * Get occurs times of this table from OCCURS TIMES clause
   *
   * @return int of occurs times
   */
  int getOccursTimes();

  /**
   * Get USAGE FORMAT of this table declaration
   *
   * @return a UsageFormat instance
   */
  @NonNull
  UsageFormat getUsageFormat();
}
