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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopybookUsage;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.service.CopybookService;

import java.util.Deque;

/**
 * This implementation of the {@link CopybookAnalysis} provides the logic and the default parameters
 * for the copybook analysis, required by the COBOL dialects.
 */
class DialectCopybookAnalysis extends CopybookAnalysis {
  private static final int MAX_COPYBOOK_NAME_LENGTH_DEFAULT = Integer.MAX_VALUE;

  DialectCopybookAnalysis(
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      Deque<CopybookUsage> copybookStack,
      MessageService messageService) {
    super(
        preprocessor,
        copybookService,
        copybookStack,
        messageService,
        MAX_COPYBOOK_NAME_LENGTH_DEFAULT);
  }
}
