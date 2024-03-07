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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import org.eclipse.lsp.cobol.lsp.CobolLanguageId;

/**
 * Service class which gives appropriate {@link CobolLinesTransformation} based on the languageId
 */
@Singleton
public class CobolLineTransformationService {

  private CobolLinesTransformation cobolContinuationLinesTransformation;

  private CobolLinesTransformation hpCobolContinuationLinesTransformation;

  @Inject
  public CobolLineTransformationService(
      @Named("cobol") CobolLinesTransformation cobolContinuationLinesTransformation,
      @Named("hpcobol") CobolLinesTransformation hpCobolContinuationLinesTransformation) {
    this.cobolContinuationLinesTransformation = cobolContinuationLinesTransformation;
    this.hpCobolContinuationLinesTransformation = hpCobolContinuationLinesTransformation;
  }

  /**
   * returns {@link CobolLinesTransformation} based on languageId
   * @param languageId
   * @return {@link CobolLinesTransformation}
   */
  public CobolLinesTransformation getTransformer(CobolLanguageId languageId) {
    if (languageId == CobolLanguageId.HP_COBOL) return hpCobolContinuationLinesTransformation;
    else return cobolContinuationLinesTransformation;
  }
}
