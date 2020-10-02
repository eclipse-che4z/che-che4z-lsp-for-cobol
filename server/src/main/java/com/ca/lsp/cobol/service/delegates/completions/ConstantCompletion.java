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
package com.ca.lsp.cobol.service.delegates.completions;

import com.ca.lsp.cobol.service.MyDocumentModel;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.google.inject.Singleton;
import org.eclipse.lsp4j.CompletionItemKind;

import javax.annotation.Nonnull;
import java.util.Collection;
import java.util.Set;

import static com.ca.lsp.cobol.service.delegates.completions.CompletionOrder.CONSTANTS;
import static java.util.Optional.ofNullable;
import static org.eclipse.lsp4j.CompletionItemKind.Constant;

/** This class resolves the predefined variables' completion requests */
@Singleton
public class ConstantCompletion implements Completion {

  @Nonnull
  @Override
  public Collection<String> getCompletionSource(MyDocumentModel document) {
    return ofNullable(document)
        .map(MyDocumentModel::getAnalysisResult)
        .map(AnalysisResult::getConstants)
        .orElse(Set.of());
  }

  @Nonnull
  @Override
  public String getSortOrderPrefix() {
    return CONSTANTS.prefix;
  }

  @Nonnull
  @Override
  public CompletionItemKind getKind() {
    return Constant;
  }
}
