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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.validator;

import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.CobolLine;

import java.util.List;

/**
 * Performs validation on the transformed cobol lines
 */
public interface ExtendedDocumentValidation {
  /**
   * Perform validation on {@link CobolLine}.
   *
   * @param extendedDocument the document URI
   * @return the validation result
   */
  List<SyntaxError> validateLines(ExtendedDocument extendedDocument);
}
