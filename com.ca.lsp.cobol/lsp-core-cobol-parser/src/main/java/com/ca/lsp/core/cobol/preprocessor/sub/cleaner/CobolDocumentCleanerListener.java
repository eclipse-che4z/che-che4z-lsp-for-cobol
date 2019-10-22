/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.cleaner;

import com.ca.lsp.core.cobol.parser.CobolCleanerListener;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolDocumentContext;

public interface CobolDocumentCleanerListener extends CobolCleanerListener {

  CobolDocumentContext context();
}
