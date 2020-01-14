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
import com.ca.lsp.core.cobol.parser.listener.PreprocessorListener;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.google.common.collect.Multimap;
import lombok.AllArgsConstructor;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.concurrent.ForkJoinTask;
import java.util.function.Consumer;
import java.util.stream.Collectors;

@AllArgsConstructor
public class CopybookParallelAnalysis implements CopybookAnalysis {
  private static final String ERROR_SUGGESTION = "%s: Copybook not found";
  private final PreprocessorListener listener;

  @Override
  public List<CopybookSemanticContext> analyzeCopybooks(
      Multimap<String, Position> copybooks,
      List<CopybookDefinition> copybookUsageTracker,
      CobolPreprocessor.CobolSourceFormatEnum format) {
    List<CopybookSemanticContext> contexts =
        ForkJoinTask.invokeAll(createTasks(copybooks, copybookUsageTracker, format)).stream()
            .map(ForkJoinTask::join)
            .collect(Collectors.toList());

    contexts.stream()
        .filter(it -> it.getContext() == null)
        .map(CopybookSemanticContext::getName)
        .forEach(defineErrors(copybooks));

    return contexts.stream().filter(it -> it.getContext() != null).collect(Collectors.toList());
  }

  @Nonnull
  private Consumer<String> defineErrors(Multimap<String, Position> copybooks) {
    return copybookName -> copybooks.get(copybookName).forEach(defineError(copybookName));
  }

  @Nonnull
  private Consumer<Position> defineError(String copybookName) {
    return position ->
        listener.syntaxError(
            null,
            position.getLine(),
            position.getCharPositionInLine(),
            String.format(ERROR_SUGGESTION, copybookName),
            copybookName.length());
  }

  private List<ForkJoinTask<CopybookSemanticContext>> createTasks(
      Multimap<String, Position> names,
      List<CopybookDefinition> copybookUsageTracker,
      CobolPreprocessor.CobolSourceFormatEnum format) {
    return names.asMap().entrySet().stream()
        .map(
            it ->
                new AnalyseCopybookTask(
                    new CopybookDefinition(it.getKey(), null, it.getValue()),
                    copybookUsageTracker,
                    format,
                    listener))
        .collect(Collectors.toList());
  }
}
