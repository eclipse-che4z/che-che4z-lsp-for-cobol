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
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.service.CopybookConfig;

/** A COBOL dialect */
public interface CobolDialect {

  /**
   * Gets the name of the dialect
   * @return the name of the dialect
   */
  String getName();

  /**
   * Processing the text
   *
   * @param uri document URI
   * @param text document text
   * @param messageService error message service
   * @param copybookConfig is a copybook config
   * @return the dialect processing result
   */
  default ResultWithErrors<DialectOutcome> processText(String uri,
                                                       String text,
                                                       MessageService messageService,
                                                       CopybookConfig copybookConfig) {
    return new ResultWithErrors<>(new DialectOutcome(text, ImmutableList.of()), ImmutableList.of());
  }
}
