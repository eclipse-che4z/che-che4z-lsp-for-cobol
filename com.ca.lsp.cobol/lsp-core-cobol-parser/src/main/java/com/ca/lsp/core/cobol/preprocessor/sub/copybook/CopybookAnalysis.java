/*
 * Copyright (c) 2019 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.core.cobol.preprocessor.sub.copybook;

import com.ca.lsp.core.cobol.model.Position;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.google.common.collect.Multimap;

import java.util.List;

public interface CopybookAnalysis {
  List<SemanticContext> analyzeCopybooks(
      Multimap<String, Position> copybookNames, CobolPreprocessor.CobolSourceFormatEnum format);

  List<SyntaxError> getCopybookErrors();
}
