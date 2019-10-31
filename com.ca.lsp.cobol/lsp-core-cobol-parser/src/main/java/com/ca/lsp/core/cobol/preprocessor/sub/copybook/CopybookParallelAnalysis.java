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

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.semantics.SemanticContext;

import java.util.Collection;
import java.util.List;
import java.util.concurrent.ForkJoinTask;
import java.util.stream.Collectors;

public class CopybookParallelAnalysis implements CopybookAnalysis {

  @Override
  public List<SemanticContext> analyzeCopybooks(
      Collection<String> names,
      CobolPreprocessor.CobolSourceFormatEnum format,
      CobolParserParams params) {
    return ForkJoinTask.invokeAll(createTasks(names, format, params))
        .stream() // TODO:add filtration to avoid duplication of requests to workspace service for
                  // copybooks with the same names / Low priority
        .map(ForkJoinTask::join)
        .collect(Collectors.toList());
  }

  private List<ForkJoinTask<SemanticContext>> createTasks(
      Collection<String> names,
      CobolPreprocessor.CobolSourceFormatEnum format,
      CobolParserParams params) {
    return names.stream()
        .map(it -> new AnalyseCopybookTask(it, params, format))
        .collect(Collectors.toList());
  }
}
