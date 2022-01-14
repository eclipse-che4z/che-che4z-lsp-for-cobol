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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import com.google.inject.Inject;
import com.google.inject.assistedinject.Assisted;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.core.CobolPreprocessorBaseListener;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.LocalityUtils;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.TokenUtils;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;

import static org.eclipse.lsp.cobol.core.CobolPreprocessor.*;

/**
 * ANTLR listener, which deals only with the REPLACE compiler directives. So, that the rest of the
 * pre-processing works on the replaced source.
 */
@Slf4j
public class ReplacePreProcessorListener extends CobolPreprocessorBaseListener
    implements GrammarPreprocessorListener<String> {
  private final List<SyntaxError> errors = new ArrayList<>();
  private final ReplacingService replacingService;
  private final String documentUri;
  private final BufferedTokenStream tokens;
  private final CopybookHierarchy hierarchy;
  Deque<StringBuilder> textAccumulator = new ArrayDeque<>();

  @Inject
  public ReplacePreProcessorListener(
      @Assisted String documentUri,
      @Assisted BufferedTokenStream tokens,
      @Assisted CopybookHierarchy hierarchy,
      ReplacingService replacingService) {
    this.replacingService = replacingService;
    this.tokens = tokens;
    this.documentUri = documentUri;
    this.hierarchy = hierarchy;
    textAccumulator.push(new StringBuilder());
  }

  @Override
  public Deque<StringBuilder> getTextAccumulator() {
    return textAccumulator;
  }

  @Override
  public ResultWithErrors<String> getResult() {
    if (hierarchy.requiresReplacing()) {
      replace();
    }
    return new ResultWithErrors<>(accumulate(), errors);
  }

  @Override
  public void enterReplaceAreaStart(@NonNull ReplaceAreaStartContext ctx) {
    if (hierarchy.requiresReplacing()) {
      replace();
    }
    push();
  }

  @Override
  public void enterReplacePseudoText(ReplacePseudoTextContext ctx) {
    push();
  }

  @Override
  public void exitReplacePseudoText(ReplacePseudoTextContext ctx) {
    if ((ctx.getParent() instanceof ReplaceAreaStartContext)) {
      replacingService
          .retrievePseudoTextReplacingPattern(read(), retrieveLocality(ctx))
          .processIfNoErrorsFound(hierarchy::addTextReplacing, errors::addAll);
      push();
    } else {
      write(pop());
    }
  }

  @Override
  public void enterReplaceOffStatement(ReplaceOffStatementContext ctx) {
    push();
  }

  @Override
  public void exitReplaceOffStatement(ReplaceOffStatementContext ctx) {
    String replaceOffStmt = pop();
    String content = replacingService.applyReplacing(pop(), hierarchy.getTextReplacingClauses());
    hierarchy.clearTextReplacing();
    write(content + replaceOffStmt);
  }

  private void replace() {
    String content = replacingService.applyReplacing(pop(), hierarchy.getTextReplacingClauses());
    hierarchy.clearTextReplacing();
    if (getTextAccumulator().isEmpty()) push();
    write(content);
  }

  @Override
  public void visitTerminal(TerminalNode node) {
    TokenUtils.writeHiddenTokens(tokens, this::write).accept(node);
  }

  private Locality retrieveLocality(ReplacePseudoTextContext ctx) {
    return LocalityUtils.buildLocality(ctx, documentUri);
  }
}
