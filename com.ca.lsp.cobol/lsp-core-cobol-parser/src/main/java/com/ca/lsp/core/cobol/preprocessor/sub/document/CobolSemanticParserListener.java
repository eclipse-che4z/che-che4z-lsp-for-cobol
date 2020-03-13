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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.document;

import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorListener;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolDocumentContext;
import com.ca.lsp.core.cobol.semantics.SemanticContext;

import java.util.List;

public interface CobolSemanticParserListener extends CobolPreprocessorListener {

  CobolDocumentContext context();

  List<SyntaxError> getErrors();

  SemanticContext getSemanticContext();
}
