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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.writer;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import org.eclipse.lsp.cobol.lsp.CobolLanguageId;

/** service class which gives {@link CobolLineWriter} based on the languageId */
@Singleton
public class CobolLineWriterService {

  private CobolLineWriter cobolWriter;

  private CobolLineWriter hpCobolWriter;

  @Inject
  public CobolLineWriterService(
      @Named("cobol") CobolLineWriter cobolWriter,
      @Named("hpcobol") CobolLineWriter hpCobolWriter) {
    this.cobolWriter = cobolWriter;
    this.hpCobolWriter = hpCobolWriter;
  }

  /**
   * returns a {@link CobolLineWriter} based on the languageId
   * @param languageId
   * @return {@link CobolLineWriter}
   */
  public CobolLineWriter getCobolLineWriter(CobolLanguageId languageId) {
    if (languageId == CobolLanguageId.HP_COBOL) return hpCobolWriter;
    else return cobolWriter;
  }
}
