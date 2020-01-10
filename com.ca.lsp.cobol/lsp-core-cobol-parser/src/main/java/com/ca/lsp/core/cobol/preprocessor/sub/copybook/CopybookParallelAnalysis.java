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

import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.core.cobol.model.CopybookDefinition;
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
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
      Multimap<String, Position> copybooks,
      List<CopybookDefinition> copybookUsageTracker,
      CobolSourceFormat format) {
    List<ResultWithErrors<CopybookSemanticContext>> contexts =
        runAnalysisAsynchronously(copybooks, copybookUsageTracker, format);

    List<SyntaxError> errors = createMissingCopybookErrors(copybooks, contexts);

    errors.addAll(extractAnalysingErrors(contexts));

    return new ResultWithErrors<>(collectCorrectContexts(contexts), errors);
  }

  private List<ResultWithErrors<CopybookSemanticContext>> runAnalysisAsynchronously(
      Multimap<String, Position> copybooks,
      List<CopybookDefinition> copybookUsageTracker,
      CobolSourceFormat format) {
    return ForkJoinTask.invokeAll(createTasks(copybooks, copybookUsageTracker, format)).stream()
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
      Multimap<String, Position> names,
      List<CopybookDefinition> copybookUsageTracker,
      CobolSourceFormat format) {
    return names.asMap().entrySet().stream()
        .map(
            it ->
                new AnalyseCopybookTask(
                    new CopybookDefinition(it.getKey(), null, it.getValue()),
                    copybookUsageTracker,
                    format))
        .collect(Collectors.toList());
  }
}
