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
package org.eclipse.lsp.cobol.core.preprocessor;

import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.model.CopybookUsage;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.service.CopybookProcessingMode;

import java.util.Deque;
import java.util.List;

/**
 * This interface describes the text preprocessor which prepares the given string for analysis by
 * the grammar
 */
public interface TextPreprocessor {

  ResultWithErrors<ExtendedDocument> process(
      String documentUri, String cobolCode, CopybookProcessingMode copybookProcessingMode);

  ResultWithErrors<ExtendedDocument> process(
      String documentUri,
      String cobolCode,
      Deque<CopybookUsage> semanticContext,
      CopybookProcessingMode copybookProcessingMode,
      Deque<List<Pair<String, String>>> recursiveReplaceStmtStack,
      List<Pair<String, String>> replacingClauses);
}
