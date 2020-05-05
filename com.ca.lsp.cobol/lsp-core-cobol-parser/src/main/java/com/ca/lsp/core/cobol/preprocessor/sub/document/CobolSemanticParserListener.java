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

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorListener;
import com.ca.lsp.core.cobol.semantics.NamedSubContext;

import java.util.List;
import java.util.Map;

public interface CobolSemanticParserListener extends CobolPreprocessorListener {

  String getResult();

  List<SyntaxError> getErrors();

  NamedSubContext<Position> getCopybooks();

  Map<String, List<Position>> getDocumentMappings();
}
