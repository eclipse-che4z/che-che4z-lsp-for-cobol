/*
 * Copyright (c) 2019 Broadcom.
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
import com.ca.lsp.core.cobol.model.CopybookDefinition;
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.google.common.collect.Multimap;
import lombok.AllArgsConstructor;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.concurrent.ForkJoinTask;
import java.util.function.Function;
import java.util.stream.Collectors;

@AllArgsConstructor
public class CopybookParallelAnalysis implements CopybookAnalysis {
  private static final String ERROR_SUGGESTION = "%s: Copybook not found";

  @Override
  public ResultWithErrors<List<CopybookSemanticContext>> analyzeCopybooks(
      String documentUri,
      Multimap<String, Position> copybooks,
      List<CopybookDefinition> copybookUsageTracker) {
    List<ResultWithErrors<CopybookSemanticContext>> contexts =
        runAnalysisAsynchronously(documentUri, copybooks, copybookUsageTracker);

    List<SyntaxError> errors = createMissingCopybookErrors(copybooks, contexts);

    errors.addAll(extractAnalysingErrors(contexts));

    return new ResultWithErrors<>(collectCorrectContexts(contexts), errors);
  }

  private List<ResultWithErrors<CopybookSemanticContext>> runAnalysisAsynchronously(
      String documentUri,
      Multimap<String, Position> copybooks,
      List<CopybookDefinition> copybookUsageTracker) {
    return ForkJoinTask.invokeAll(createTasks(documentUri, copybooks, copybookUsageTracker))
        .stream()
        .map(ForkJoinTask::join)
        .collect(Collectors.toList());
  }

  private List<CopybookSemanticContext> collectCorrectContexts(
      List<ResultWithErrors<CopybookSemanticContext>> contexts) {
    return contexts.stream()
        .map(ResultWithErrors::getResult)
        .filter(it -> it.getContext() != null)
        .collect(Collectors.toList());
  }

  private List<SyntaxError> extractAnalysingErrors(
      List<ResultWithErrors<CopybookSemanticContext>> contexts) {
    return contexts.stream()
        .map(ResultWithErrors::getErrors)
        .flatMap(List::stream)
        .collect(Collectors.toList());
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
        .collect(Collectors.toList());
  }

  @Nonnull
  private Function<String, List<SyntaxError>> defineErrors(Multimap<String, Position> copybooks) {
    return copybookName ->
        copybooks.get(copybookName).stream()
            .map(
                position ->
                    SyntaxError.syntaxError()
                        .position(position)
                        .suggestion(String.format(ERROR_SUGGESTION, copybookName))
                        .severity(1)
                        .build())
            .collect(Collectors.toList());
  }

  private List<ForkJoinTask<ResultWithErrors<CopybookSemanticContext>>> createTasks(
      String documentUri,
      Multimap<String, Position> names,
      List<CopybookDefinition> copybookUsageTracker) {
    return names.asMap().entrySet().stream()
        .map(
            it ->
                new AnalyseCopybookTask(
                    documentUri,
                    new CopybookDefinition(it.getKey(), documentUri, it.getValue()),
                    copybookUsageTracker))
        .collect(Collectors.toList());
  }
}
