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
package org.eclipse.lsp.cobol.service.delegates.completions;

import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.google.inject.Singleton;
import org.eclipse.lsp4j.CompletionItemKind;

import lombok.NonNull;
import java.util.Collection;
import java.util.Collections;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp4j.CompletionItemKind.Constant;

/** This class resolves the predefined variables' completion requests */
@Singleton
public class ConstantCompletion implements Completion {

  @NonNull
  @Override
  public Collection<String> getCompletionSource(CobolDocumentModel document) {
    return ofNullable(document)
        .map(CobolDocumentModel::getAnalysisResult)
        .map(AnalysisResult::getConstants)
        .orElse(Collections.emptySet());
  }

  @NonNull
  @Override
  public String getSortOrderPrefix() {
    return CompletionOrder.CONSTANTS.prefix;
  }

  @NonNull
  @Override
  public CompletionItemKind getKind() {
    return Constant;
  }
}
