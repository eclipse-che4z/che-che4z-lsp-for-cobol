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
    return ForkJoinTask.invokeAll(createTasks(names, format, params)).stream()
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
