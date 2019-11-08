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
package com.ca.lsp.cobol.service.delegates.completions;

import com.ca.lsp.cobol.service.MyDocumentModel;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import java.util.Collection;
import java.util.Collections;
import java.util.Optional;
import org.eclipse.lsp4j.CompletionItemKind;

public class ParagraphCompletion extends AbstractCompletion {

  @Override
  Collection<String> getCompletionSource(MyDocumentModel document) {
    return Optional.ofNullable(document)
        .map(MyDocumentModel::getAnalysisResult)
        .map(AnalysisResult::getParagraphs)
        .orElse(Collections.emptySet());
  }

  @Override
  String tryResolve(String label) {
    // Not yet supported
    return null;
  }

  @Override
  protected String getSortOrderPrefix() {
    return "1"; // paragraphs are supposed to be the second in the completions list
  }

  @Override
  protected CompletionItemKind getKind() {
    return CompletionItemKind.Method;
  }
}
