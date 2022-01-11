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
import com.google.common.collect.ImmutableMap;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.CopybookUsage;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.CopybookService;

import java.util.Deque;
import java.util.List;
import java.util.function.Consumer;

/**
 * This implementation of the {@link CopybookAnalysis} doesn't resolve copybook content, and only
 * collects the usage of the copybook
 */
class SkippingAnalysis extends CopybookAnalysis {
  SkippingAnalysis(
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      Deque<CopybookUsage> copybookStack,
      MessageService messageService) {
    super(preprocessor, copybookService, copybookStack, messageService);
  }

  @Override
  protected ResultWithErrors<ExtendedDocument> processCopybook(
      Deque<List<Pair<String, String>>> recursiveReplaceStmtStack,
      List<Pair<String, String>> replacingClauses,
      CopybookMetaData metaData,
      String uri,
      String content) {
    return new ResultWithErrors<>(
        new ExtendedDocument("", "", new NamedSubContext(), ImmutableMap.of()), ImmutableList.of());
  }

  @Override
  protected ResultWithErrors<CopybookModel> getCopyBookContent(CopybookMetaData metaData) {
    return emptyModel(metaData.getName(), ImmutableList.of());
  }

  @Override
  protected Consumer<NamedSubContext> addCopybookDefinition(CopybookMetaData metaData, String uri) {
    return it -> {};
  }
}
