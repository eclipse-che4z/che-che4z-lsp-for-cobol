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
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import com.ca.lsp.core.cobol.parser.listener.FormatListener;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.google.common.collect.Multimap;
import lombok.AllArgsConstructor;
import org.jetbrains.annotations.NotNull;

import java.util.List;
import java.util.Set;
import java.util.concurrent.ForkJoinTask;
import java.util.function.Consumer;
import java.util.stream.Collectors;

@AllArgsConstructor
public class CopybookParallelAnalysis implements CopybookAnalysis {
  private static final String ERROR_SUGGESTION = "Copybook not found";
  private final FormatListener listener;

  @Override
  public List<CopybookSemanticContext> analyzeCopybooks(
      Multimap<String, Position> copybooks, CobolPreprocessor.CobolSourceFormatEnum format) {
    List<CopybookSemanticContext> contexts =
        ForkJoinTask.invokeAll(createTasks(copybooks.keySet(), format)).stream()
            .map(ForkJoinTask::join)
            .collect(Collectors.toList());

    contexts.stream()
        .filter(it -> it.getContext() == null)
        .map(CopybookSemanticContext::getName)
        .forEach(defineErrors(copybooks));

    return contexts.stream().filter(it -> it.getContext() != null).collect(Collectors.toList());
  }

  @NotNull
  private Consumer<String> defineErrors(Multimap<String, Position> copybooks) {
    return copybookName -> copybooks.get(copybookName).forEach(defineError(copybookName));
  }

  @NotNull
  private Consumer<Position> defineError(String copybookName) {
    return position ->
        listener.syntaxError(
            position.getLine(),
            position.getCharPositionInLine(),
            ERROR_SUGGESTION,
            copybookName.length());
  }

  private List<ForkJoinTask<CopybookSemanticContext>> createTasks(
      Set<String> names, CobolPreprocessor.CobolSourceFormatEnum format) {
    return names.stream()
        .map(it -> new AnalyseCopybookTask(it, format))
        .collect(Collectors.toList());
  }
}
