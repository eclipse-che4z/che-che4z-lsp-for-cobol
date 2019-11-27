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
import org.eclipse.lsp4j.CompletionItemKind;

import java.util.Collection;
import java.util.Collections;
import java.util.Optional;

class VariableCompletion extends AbstractCompletion {

  @Override
  Collection<String> getCompletionSource(MyDocumentModel document) {
    return Optional.ofNullable(document)
        .map(MyDocumentModel::getAnalysisResult)
        .map(AnalysisResult::getVariables)
        .orElse(Collections.emptySet());
  }

  @Override
  String tryResolve(String label) {
    // Cannot resolve description for this type of completion
    return null;
  }

  @Override
  protected String getSortOrderPrefix() {
    return "0"; // Variables are supposed to be the first in the completions list
  }

  @Override
  protected CompletionItemKind getKind() {
    return CompletionItemKind.Variable;
  }
}
