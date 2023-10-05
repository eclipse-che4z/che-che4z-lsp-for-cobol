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
package org.eclipse.lsp.cobol.lsp.handlers.text;

import com.google.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.delegates.formations.Formations;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.DocumentFormattingParams;
import org.eclipse.lsp4j.TextEdit;

import java.util.List;

/**
 * LSP Formatting Handler
 */
@Slf4j
public class FormattingHandler {
  private final DocumentModelService documentService;
  private final Formations formations;

  @Inject
  public FormattingHandler(DocumentModelService documentService, Formations formations) {
    this.documentService = documentService;
    this.formations = formations;
  }

  /**
   * Handle LSP formatting request.
   * @param params DocumentFormattingParams.
   * @return TextEdit.
   */
  public List<? extends TextEdit> formatting(DocumentFormattingParams params) {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    return formations.format(documentService.get(uri));
  }
}
