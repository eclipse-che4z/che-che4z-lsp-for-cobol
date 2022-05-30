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

import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;

/** This interface defines a common API for all the implementation of the copybook analysis logic */
public interface CopybookAnalysis {
  /**
   * Handle the copy statement applying the logic according to the specific implementation.
   *
   * @param copybookName the copybook name
   * @param context the context of the statement
   * @param copySource the context of the copybook name
   * @param config the configuration required for the copybook analysis
   * @param documentUri uri of the current document
   * @return the functions that should be applied to the preprocessor
   */
  PreprocessorFunctor handleCopybook(
      CopybookName copybookName,
      ParserRuleContext context,
      ParserRuleContext copySource,
      CopybookConfig config,
      String documentUri);
}
