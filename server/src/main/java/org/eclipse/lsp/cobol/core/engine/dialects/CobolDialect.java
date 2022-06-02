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
package org.eclipse.lsp.cobol.core.engine.dialects;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMultimap;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;

/** A COBOL dialect */
public interface CobolDialect {
  String FILLER = "\u200B";
  /**
   * Gets the name of the dialect
   * @return the name of the dialect
   */
  String getName();

  /**
   * Processing the text
   *
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return the dialect processing result
   */
  default ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    return new ResultWithErrors<>(new DialectOutcome(context.getText(), ImmutableList.of(), ImmutableMultimap.of()), ImmutableList.of());
  }
}
