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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter;

import com.google.inject.Inject;
import com.google.inject.name.Named;
import org.eclipse.lsp.cobol.lsp.CobolLanguageId;

/** Service class which gives {@link CobolLineReWriter} based on the languageId. */
public class CobolLineReWriterService {

  private CobolLineReWriter cobolLineIndicatorProcessor;

  private CobolLineReWriter hpCobolLineIndicatorProcessor;

  @Inject
  public CobolLineReWriterService(
      @Named("cobol") CobolLineReWriter cobolLineIndicatorProcessor,
      @Named("hpcobol") CobolLineReWriter hpCobolLineIndicatorProcessor) {
    this.cobolLineIndicatorProcessor = cobolLineIndicatorProcessor;
    this.hpCobolLineIndicatorProcessor = hpCobolLineIndicatorProcessor;
  }

  /**
   * gives {@link CobolLineReWriter} based on languageId
   * @param languageId
   * @return {@link CobolLineReWriter}
   */
  public CobolLineReWriter getLineReWriter(CobolLanguageId languageId) {
    if (languageId == CobolLanguageId.HP_COBOL) return hpCobolLineIndicatorProcessor;
    else return cobolLineIndicatorProcessor;
  }
}
