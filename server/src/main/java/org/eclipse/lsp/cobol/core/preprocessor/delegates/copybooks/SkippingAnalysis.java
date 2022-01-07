/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import com.google.common.collect.ImmutableList;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookService;

import java.util.Deque;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Consumer;

/**
 * This implementation of the {@link CopybookAnalysis} doesn't resolve copybook content, and only
 * collects the usage of the copybook
 */
class SkippingAnalysis extends CopybookAnalysis {
  SkippingAnalysis(
      Map<String, DocumentMapping> nestedMappings,
      List<Pair<String, String>> replacingClauses,
      String documentUri,
      CopybookConfig copybookConfig,
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      Deque<CopybookUsage> copybookStack,
      MessageService messageService,
      Deque<List<Pair<String, String>>> recursiveReplaceStmtStack) {
    super(
        nestedMappings,
        replacingClauses,
        documentUri,
        copybookConfig,
        preprocessor,
        copybookService,
        copybookStack,
        messageService,
        recursiveReplaceStmtStack);
  }

  @Override
  protected ResultWithErrors<Optional<ExtendedDocument>> processCopybook(
      String copybookName, String uri, String copybookId, String content, Locality locality) {
    return new ResultWithErrors<>(Optional.empty(), ImmutableList.of());
  }

  @Override
  protected ResultWithErrors<CopybookModel> getCopyBookContent(
      String copybookName, Locality locality, CopybookConfig copybookConfig) {
    return emptyModel(copybookName, ImmutableList.of());
  }

  @Override
  protected Consumer<NamedSubContext> addCopybookDefinition(String copybookName, String uri) {
    return it -> {};
  }
}
