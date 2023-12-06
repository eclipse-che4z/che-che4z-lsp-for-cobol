/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.lsp;

/**
 * Contains event execution precondition.
 */
@FunctionalInterface
public interface LspEventCancelCondition {
  /**
   * Chech if it's ok to cancel the event.
   * @return true if execution should be canceled.
   */
  boolean shouldBeCanceled();
}
