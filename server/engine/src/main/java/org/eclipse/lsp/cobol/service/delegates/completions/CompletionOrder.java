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

package org.eclipse.lsp.cobol.service.delegates.completions;

/** This enum explicitly defines the order for completions suggestions with sorting prefixes */
public enum CompletionOrder {
  VARIABLES,
  PARAGRAPHS,
  SECTIONS,
  COPYBOOKS,
  SUBROUTINES,
  CONSTANTS,
  KEYWORDS;
  final String prefix = String.valueOf(this.ordinal());
}
