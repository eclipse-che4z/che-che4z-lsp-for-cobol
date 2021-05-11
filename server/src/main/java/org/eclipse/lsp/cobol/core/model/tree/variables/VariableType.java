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
package org.eclipse.lsp.cobol.core.model.tree.variables;

/** Enumeration of variable node types */
public enum VariableType {
  CONDITION_DATA_NAME,
  ELEMENTARY_ITEM,
  GROUP_ITEM,
  STAND_ALONE_DATA_ITEM,
  INDEX_ITEM,
  MNEMONIC_NAME,
  MULTI_TABLE_DATA_NAME,
  RENAME_ITEM,
  TABLE_DATA_NAME,
}
