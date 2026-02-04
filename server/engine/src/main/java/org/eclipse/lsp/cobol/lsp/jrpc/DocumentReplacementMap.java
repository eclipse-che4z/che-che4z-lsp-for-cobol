/*
 * Copyright (c) 2026 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.jrpc;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import org.eclipse.lsp4j.Range;

/**
 * Data transport object that contains information of the replacements with map for the document *
 */
@Data
@NoArgsConstructor
public class DocumentReplacementMap {
  private @NonNull Range range;
  private @NonNull Range statementRange;
  private @NonNull ReplacementTokens[] tokenItems;
  private @NonNull String replacementMap;
}
