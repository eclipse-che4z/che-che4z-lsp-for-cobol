/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.core.cobol.preprocessor.sub.copybook;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import com.ca.lsp.core.cobol.model.CopybookUsage;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.google.common.collect.Multimap;
import com.google.inject.Inject;
import com.google.inject.Singleton;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.concurrent.ForkJoinTask;
import java.util.function.Function;

import static com.ca.lsp.core.cobol.model.ErrorCode.MISSING_COPYBOOK;
import static java.lang.String.format;
import static java.util.concurrent.ForkJoinTask.invokeAll;
import static java.util.stream.Collectors.toList;

@Singleton
public class CopybookParallelAnalysis implements CopybookAnalysis {
  private static final String ERROR_SUGGESTION = "%s: Copybook not found";
  private AnalyseCopybookTaskFactory factory;

  @Inject
  public CopybookParallelAnalysis(AnalyseCopybookTaskFactory factory) {
    this.factory = factory;
  }

  @Override
  public ResultWithErrors<List<CopybookSemanticContext>> analyzeCopybooks(
      String documentUri,
      Multimap<String, Position> copybooks,
      List<CopybookUsage> copybookUsageTracker,
      String textDocumentSyncType) {

    List<ResultWithErrors<CopybookSemanticContext>> contexts =
        runAnalysisAsynchronously(
            documentUri, copybooks, copybookUsageTracker, textDocumentSyncType);

    List<SyntaxError> errors = createMissingCopybookErrors(copybooks, contexts);

    errors.addAll(extractAnalysingErrors(contexts));

    return new ResultWithErrors<>(collectCorrectContexts(contexts), errors);
  }

  private List<ResultWithErrors<CopybookSemanticContext>> runAnalysisAsynchronously(
      String documentUri,
      Multimap<String, Position> copybooks,
      List<CopybookUsage> copybookUsageTracker,
      String textDocumentSyncType) {

    return invokeAll(
            createTasks(documentUri, copybooks, copybookUsageTracker, textDocumentSyncType))
        .stream()
        .map(ForkJoinTask::join)
        .collect(toList());
  }

  private List<CopybookSemanticContext> collectCorrectContexts(
      List<ResultWithErrors<CopybookSemanticContext>> contexts) {
    return contexts.stream()
        .map(ResultWithErrors::getResult)
        .filter(it -> it.getContext() != null)
        .collect(toList());
  }

  private List<SyntaxError> extractAnalysingErrors(
      List<ResultWithErrors<CopybookSemanticContext>> contexts) {
    return contexts.stream()
        .map(ResultWithErrors::getErrors)
        .flatMap(List::stream)
        .collect(toList());
  }

  private List<SyntaxError> createMissingCopybookErrors(
      Multimap<String, Position> copybooks,
      List<ResultWithErrors<CopybookSemanticContext>> contexts) {
    return contexts.stream()
        .map(ResultWithErrors::getResult)
        .filter(it -> it.getContext() == null)
        .map(CopybookSemanticContext::getName)
        .map(defineErrors(copybooks))
        .flatMap(List::stream)
        .collect(toList());
  }

  @Nonnull
  private Function<String, List<SyntaxError>> defineErrors(Multimap<String, Position> copybooks) {
    return copybookName ->
        copybooks.get(copybookName).stream()
            .map(
                position ->
                    SyntaxError.syntaxError()
                        .position(position)
                        .suggestion(format(ERROR_SUGGESTION, copybookName))
                        .severity(1)
                        .errorCode(MISSING_COPYBOOK)
                        .build())
            .collect(toList());
  }

  private List<ForkJoinTask<ResultWithErrors<CopybookSemanticContext>>> createTasks(
      String documentUri,
      Multimap<String, Position> names,
      List<CopybookUsage> copybookUsageTracker,
      String textDocumentSyncType) {

    return names.asMap().entrySet().stream()
        .map(
            it ->
                factory.create(
                    documentUri,
                    new CopybookUsage(it.getKey(), documentUri, it.getValue()),
                    copybookUsageTracker,
                    textDocumentSyncType))
        .collect(toList());
  }
}
