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
package org.eclipse.lsp.cobol.dialects.ibm;

import java.util.Optional;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.LineIndicatorProcessor;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutUtil;

/** This class represents {@link LineIndicatorProcessor} for Cobol language */
class IbmCobolLineIndicatorProcessor extends LineIndicatorProcessor {
  private final CodeLayoutStore layoutStore;

  IbmCobolLineIndicatorProcessor(CodeLayoutStore layoutStore) {
    this.layoutStore = layoutStore;
  }

  @Override
  protected CobolProgramLayout getLayout() {
    return Optional.ofNullable(layoutStore)
        .map(
            store ->
                store
                    .getCodeLayout()
                    .map(
                        layout ->
                            CodeLayoutUtil.mergeLayout(CobolLanguageId.COBOL.getLayout(), layout))
                    .orElse(CobolLanguageId.COBOL.getLayout()))
        .orElse(CobolLanguageId.COBOL.getLayout());
  }
}
