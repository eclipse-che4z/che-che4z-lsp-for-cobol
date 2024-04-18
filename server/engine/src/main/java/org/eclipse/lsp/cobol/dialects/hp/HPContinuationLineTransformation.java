/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.dialects.hp;

import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.ContinuationLineTransformation;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutUtil;

/**
 * {@link ContinuationLineTransformation} for "hpcobol"
 */
class HPContinuationLineTransformation extends ContinuationLineTransformation {
  private final CodeLayoutStore layoutStore;

  HPContinuationLineTransformation(
      MessageService messageService, CodeLayoutStore layoutStore) {
    super(messageService);
    this.layoutStore = layoutStore;
  }

  @Override
  public CobolProgramLayout getCodeLayout() {
    return layoutStore
        .getCodeLayout()
        .map(layout -> CodeLayoutUtil.mergeLayout(CobolLanguageId.HP_COBOL.getLayout(), layout))
        .orElse(CobolLanguageId.HP_COBOL.getLayout());
  }
}
