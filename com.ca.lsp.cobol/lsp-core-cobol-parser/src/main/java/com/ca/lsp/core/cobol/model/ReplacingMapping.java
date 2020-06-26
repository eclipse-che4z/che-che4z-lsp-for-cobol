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
package com.ca.lsp.core.cobol.model;

import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplaceSameElementContext;
import lombok.Value;

/** A mapping from a replaceable to a replacement used in REPLACING statements. */
@Value
public class ReplacingMapping {
  private ReplaceSameElementContext replaceable;
  private ReplaceSameElementContext replacement;
}
