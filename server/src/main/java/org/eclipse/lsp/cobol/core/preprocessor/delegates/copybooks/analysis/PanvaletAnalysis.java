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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis;

import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.service.CopybookService;

/**
 * This implementation of the {@link AbstractCopybookAnalysis} provides the logic and the default
 * parameters for the PANVALET library copybooks resolving
 */
class PanvaletAnalysis extends AbstractCopybookAnalysis {
  private static final int MAX_COPYBOOK_NAME_LENGTH_PANVALET = 10;

  PanvaletAnalysis(
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      MessageService messageService) {
    super(preprocessor, copybookService, messageService, MAX_COPYBOOK_NAME_LENGTH_PANVALET);
  }
}
