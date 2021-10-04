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

package org.eclipse.lsp.cobol.usecases.engine;

import lombok.Builder;
import lombok.Getter;
import lombok.Singular;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.SQLBackend;

import java.util.List;

/** Defines all the required data for the test */
@Getter
@Builder
public class UseCase {
  /** Text to analyze */
  String text;
  /** Name of the processing file */
  @Builder.Default String fileName = UseCaseUtils.DOCUMENT_URI;
  /** List of the copybooks need for the analysis */
  @Singular List<CobolText> copybooks;
  /** List of available subroutine names */
  @Singular List<String> subroutines;
  /** Copybook processing mode for the analysis */
  @Builder.Default CopybookProcessingMode copybookProcessingMode = CopybookProcessingMode.ENABLED;
  /** SQL Backend for the analysis */
  @Builder.Default SQLBackend sqlBackend = SQLBackend.DB2_SERVER;

  /**
   * Get the {@link CopybookConfig} using the specified processing mode and the {@link SQLBackend}
   *
   * @return CopybookConfig for the analysis
   */
  public CopybookConfig getCopybookConfig() {
    return new CopybookConfig(copybookProcessingMode, sqlBackend);
  }
}
