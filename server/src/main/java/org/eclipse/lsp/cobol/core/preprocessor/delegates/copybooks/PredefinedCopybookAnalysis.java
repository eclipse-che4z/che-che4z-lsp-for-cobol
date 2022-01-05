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

import org.antlr.v4.runtime.ParserRuleContext;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopybookUsage;
import org.eclipse.lsp.cobol.core.model.DocumentMapping;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.PreprocessorStack;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookService;

import java.util.Deque;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

import static org.eclipse.lsp.cobol.service.PredefinedCopybooks.Copybook.DFHEIBLC;

/**
 * This implementation of the {@link CopybookAnalysis} resolves only the DFHEIBLC copybook under the
 * LINKAGE SECTION.
 */
public class PredefinedCopybookAnalysis extends CopybookAnalysis {
  public PredefinedCopybookAnalysis(
      NamedSubContext copybooks,
      Map<String, DocumentMapping> nestedMappings,
      Map<String, Locality> copybookStatements,
      List<Pair<String, String>> replacingClauses,
      String documentUri,
      CopybookConfig copybookConfig,
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      Deque<CopybookUsage> copybookStack,
      MessageService messageService,
      Deque<List<Pair<String, String>>> recursiveReplaceStmtStack) {
    super(
        copybooks,
        nestedMappings,
        copybookStatements,
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
  protected String retrieveCopybookName(
      ParserRuleContext mainContext, ParserRuleContext copySource) {
    return DFHEIBLC.name();
  }

  @Override
  protected void storeCopyStatementSemantics(
      String copybookName, Locality copybookNameLocality, String uri) {
    // do nothing in this implementation
  }

  @Override
  protected Consumer<PreprocessorStack> beforeWriting() {
    return it -> {};
  }

  @Override
  protected Consumer<PreprocessorStack> afterWriting(ParserRuleContext context) {
    return it -> {};
  }
}
