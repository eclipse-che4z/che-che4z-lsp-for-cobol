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

import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.core.cobol.model.CopybookDefinition;
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.google.common.collect.Multimap;

import java.util.List;

public interface CopybookAnalysis {
  List<CopybookSemanticContext> analyzeCopybooks(
      Multimap<String, Position> copybookNames,
      List<CopybookDefinition> copybookUsageTracker,
      CobolPreprocessor.CobolSourceFormatEnum format);
}
