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
package org.eclipse.lsp.cobol.core.engine;

import static java.util.Collections.emptyList;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.error.ErrorSource.WORKSPACE_SETTINGS;
import static org.eclipse.lsp.cobol.common.model.NodeType.COPY;
import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;

import com.google.common.collect.ImmutableMap;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import java.util.*;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.*;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkService;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkSession;
import org.eclipse.lsp.cobol.common.dialects.TrueDialectService;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Uri;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.errors.ErrorFinalizerService;
import org.eclipse.lsp.cobol.common.pipeline.Pipeline;
import org.eclipse.lsp.cobol.common.pipeline.PipelineResult;
import org.eclipse.lsp.cobol.common.pipeline.StageResult;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.dialects.ibm.ProcessingResult;
import org.eclipse.lsp.cobol.lsp.handlers.HandlerUtility;
import org.eclipse.lsp.cobol.service.utils.ServerTypeUtil;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * This class is responsible for run the syntax and semantic analysis of an input cobol document.
 * Its run method used by the service facade layer CobolLanguageEngineFacade.
 */
@Slf4j
@Singleton
@SuppressWarnings("WeakerAccess")
public class CobolLanguageEngine {
  private static final int FIRST_LINE_SEQ_AND_EXTRA_OP = 8;

  private final MessageService messageService;
  private final ErrorFinalizerService errorFinalizerService;
  private final BenchmarkService benchmarkService;
  private final TrueDialectService trueDialectService;

  @Inject
  public CobolLanguageEngine(
      TrueDialectService trueDialectService,
      MessageService messageService,
      ErrorFinalizerService errorFinalizerService,
      BenchmarkService benchmarkService) {
    this.messageService = messageService;
    this.errorFinalizerService = errorFinalizerService;
    this.benchmarkService = benchmarkService;
    this.trueDialectService = trueDialectService;
  }

  private static AnalysisResult toAnalysisResult(
      ResultWithErrors<AnalysisResult> result, Uri uri) {
    RootNode rootNode = result.getResult().getRootNode();

    List<Uri> copyUriList =
        rootNode
            .getDepthFirstStream()
            .filter(hasType(COPY))
            .map(CopyNode.class::cast)
            .map(CopyNode::getDefinitions)
            .flatMap(Collection::stream)
            .map(Location::getUri)
            .map(Uri::new)
            .filter(it -> !ImplicitCodeUtils.isImplicit(it))
            .distinct()
            .collect(toList());

    return AnalysisResult.builder()
        .symbolTableMap(result.getResult().getSymbolTableMap())
        .diagnostics(
            collectDiagnosticsForAffectedDocuments(
                HandlerUtility.convertErrors(result.getErrors()), copyUriList, uri))
        .rootNode(rootNode)
        .build();
  }

  /**
   * Collect diagnostics for each document, used in the analysis - the main COBOL file and all the
   * copybooks. If there were no errors for some URI, then provide an empty list to clean up the
   * errors after the previous analysis.
   *
   * @param diagnostics - list of found syntax and semantic errors
   * @param copybookUris - URIs of copybook definitions used in this analysis
   * @param uri - current document URI
   * @return map with file URI as a key, and lists of diagnostics as values
   */
  private static Map<Uri, List<Diagnostic>> collectDiagnosticsForAffectedDocuments(
      Map<Uri, List<Diagnostic>> diagnostics, List<Uri> copybookUris, Uri uri) {
    Map<Uri, List<Diagnostic>> result = new HashMap<>(diagnostics);
    copybookUris.forEach(it -> result.putIfAbsent(it, emptyList()));
    result.putIfAbsent(uri, emptyList());
    return result;
  }

  /**
   * Perform syntax and semantic analysis for the given text document
   *
   * @param documentUri    unique resource identifier of the processed document
   * @param text           the content of the document that should be processed
   * @param analysisConfig contains analysis processing features info and copybook config with
   *                       following information: target backend sql server, copybook processing mode which reflect
   *                       the sync status of the document (DID_OPEN|DID_CHANGE)
   * @param languageId     language identifier
   * @return Semantic information wrapper object and list of syntax error that might send back to
   * the client
   */
  @NonNull
  public AnalysisResult run(
          @NonNull Uri documentUri, @NonNull String text, @NonNull AnalysisConfig analysisConfig, CobolLanguageId languageId) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    if (shouldNotAnalyse(text, languageId)) {
      return AnalysisResult.builder().build();
    }

    if (ServerTypeUtil.isInCompatibleServerTypeRegistered(analysisConfig)) {
      return toAnalysisResult(
          getErrorForIncompatibleServerTypeAndDialects(documentUri), documentUri);
    }

    BenchmarkSession session = benchmarkService.startSession();
    AnalysisContext ctx = new AnalysisContext(analysisConfig, session, documentUri, text, languageId);

    Pipeline pipeline = trueDialectService.getPipeline(languageId);

    PipelineResult pipelineResult = pipeline.run(ctx);
    StageResult<?> result = pipelineResult.getLastStageResult();

    session.attr("uri", ctx.getExtendedDocument().getUri().toString());
    session.attr("language", ctx.getLanguageId().getId());
    session.attr("lines", String.valueOf(ctx.getExtendedDocument().toString().split("\n").length));
    session.attr("size", String.valueOf(ctx.getExtendedDocument().toString().length()));
    session.attr("result", result.stopProcessing() ? "stopped" : "done");
    benchmarkService.logTiming();
    if (result.stopProcessing() || !(result.getData() instanceof ProcessingResult)) {
      return toAnalysisResult(
          new ResultWithErrors<>(
              AnalysisResult.builder()
                  .rootNode(new RootNode())
                  .symbolTableMap(ImmutableMap.of())
                  .build(),
              ctx.getAccumulatedErrors().stream()
                  .map(errorFinalizerService::localizeErrorMessage)
                  .collect(toList())),
          documentUri);
    } else {
      ProcessingResult processingResult = (ProcessingResult) result.getData();
      errorFinalizerService.processLateErrors(ctx, ctx.getCopybooksRepository());

      return toAnalysisResult(
          new ResultWithErrors<>(
              AnalysisResult.builder()
                  .rootNode(processingResult.getRootNode())
                  .symbolTableMap(processingResult.getSymbolTableMap())
                  .build(),
              ctx.getAccumulatedErrors().stream()
                  .map(errorFinalizerService::localizeErrorMessage)
                  .collect(toList())),
          documentUri);
    }
  }

  private static boolean shouldNotAnalyse(String text, CobolLanguageId languageId) {
    return isEmpty(text) || languageId == CobolLanguageId.HP_COBOL;
  }

  /**
   * Don't analyze the document if it is empty or contains only sequence area
   *
   * @param text - document to analyze
   * @return true if the document is empty from the engine point of view
   */
  private static boolean isEmpty(String text) {
    return text.length() <= FIRST_LINE_SEQ_AND_EXTRA_OP;
  }

  private ResultWithErrors<AnalysisResult> getErrorForIncompatibleServerTypeAndDialects(
      Uri documentUri) {
    return new ResultWithErrors<>(
        AnalysisResult.builder().build(),
        Collections.singletonList(
            SyntaxError.syntaxError()
                .severity(ErrorSeverity.ERROR)
                .suggestion(messageService.getMessage("workspaceError.ServerType"))
                .errorSource(WORKSPACE_SETTINGS)
                .errorCode(ErrorCodes.INCOMPATIBLE_SERVER_TYPE)
                .location(
                    new OriginalLocation(
                        new Location(
                            documentUri.decode(), new Range(new Position(0, 0), new Position(0, 6))),
                        null))
                .build()));
  }
}
