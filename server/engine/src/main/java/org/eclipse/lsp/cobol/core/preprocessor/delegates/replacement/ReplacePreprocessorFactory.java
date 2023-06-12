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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement;

import lombok.NonNull;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;

/** A factory for {@link ReplacePreProcessorListener} */
public interface ReplacePreprocessorFactory {
  /**
   * Create a new {@link ReplacePreProcessorListener} for pre-processing of a COBOL text with the
   * grammar
   *
   * @param extendedDocument an extended document
   * @param hierarchy the hierarchy of the copybooks
   * @return a new listener
   */
  ReplacePreProcessorListener create(
          @NonNull ExtendedDocument extendedDocument,
          @NonNull CopybookHierarchy hierarchy);
}
