/*
 * Copyright (c) 2020 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.core.CobolPreprocessorListener;

/** A listener that processes the text of the COBOL document */
public interface GrammarPreprocessorListener<T>
    extends CobolPreprocessorListener {

  /**
   * Get the result of the processing
   *
   * @return instance of T
   */
  ResultWithErrors<T> getResult();
}
