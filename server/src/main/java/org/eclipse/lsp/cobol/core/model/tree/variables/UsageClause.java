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

/**
 * Contract for the data description entry which supports USAGE clause. Important thing to note that
 * elementary items as well as group item can have a usage clause. When specified at the group
 * level, the USAGE clause applies to each elementary item in the group.
 */
public interface UsageClause {

  /**
   * Return usageFormat of a node
   *
   * @return UsageFormat of a node
   */
  UsageFormat getUsageFormat();
}
