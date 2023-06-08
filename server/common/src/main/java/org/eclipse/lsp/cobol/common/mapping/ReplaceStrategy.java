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
package org.eclipse.lsp.cobol.common.mapping;

import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;

/**
 * Replacement text strategy
 */
interface ReplaceStrategy {
  /**
   * Execute replace strategy for extended text
   * @param extendedText to execute replace
   * @param range - replace range
   * @param newText - new text
   * @param originalLocation - original location (url + range) before updating range for dirty document
   * @return true if strategy was executed and false otherwise
   */
  boolean execute(ExtendedText extendedText, Range range, String newText, Location originalLocation);
}
