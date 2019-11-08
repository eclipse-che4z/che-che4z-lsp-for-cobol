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
import org.eclipse.lsp4j.CompletionItemKind;

import java.util.Collection;

class KeywordCompletion extends AbstractCompletion {
  private static final Keywords KEYWORDS = new Keywords();

  @Override
  Collection<String> getCompletionSource(MyDocumentModel document) {
    return KEYWORDS.getLabels();
  }

  @Override
  String tryResolve(String label) {
    return KEYWORDS.getInformationFor(label);
  }

  @Override
  protected String getSortOrderPrefix() {
    return "3"; // Keywords should go after Paragraphs in the completions list
  }

  @Override
  protected CompletionItemKind getKind() {
    return CompletionItemKind.Keyword;
  }
}
