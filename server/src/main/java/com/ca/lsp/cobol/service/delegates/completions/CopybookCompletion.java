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
 */
package com.ca.lsp.cobol.service.delegates.completions;

import com.ca.lsp.cobol.service.MyDocumentModel;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.google.inject.Singleton;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.Optional;
import javax.annotation.Nonnull;
import org.eclipse.lsp4j.CompletionItemKind;

/** implementation for adding copybook names in the autocomplete list as identified by the parser */
@Singleton
public class CopybookCompletion implements Completion {

  @Nonnull
  @Override
  public Collection<String> getCompletionSource(MyDocumentModel document) {
    return Optional.ofNullable(document)
        .map(MyDocumentModel::getAnalysisResult)
        .map(AnalysisResult::getCopybookUsages)
        .map(Map::keySet)
        .orElse(Collections.emptySet());
  }

  @Nonnull
  @Override
  public String getSortOrderPrefix() {
    return "2"; // copybooks are supposed to be the third in the completions list after paragraphs
  }

  @Nonnull
  @Override
  public CompletionItemKind getKind() {
    return CompletionItemKind.Class;
  }
}
