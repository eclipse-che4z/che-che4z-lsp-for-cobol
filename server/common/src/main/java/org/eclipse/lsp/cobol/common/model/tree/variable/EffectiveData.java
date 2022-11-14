/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.common.model.tree.variable;

/** Contract for the Nodes which has a data type associated with it. */
public interface EffectiveData {
  /**
   * Gives the dataType associated with a node.
   *
   * @return dataType associated with a node.
   */
  EffectiveDataType getEffectiveDataType();
}
