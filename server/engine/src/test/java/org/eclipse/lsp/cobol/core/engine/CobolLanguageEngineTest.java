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

import static org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode.ENABLED;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkService;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkSession;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.ParserUtils;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.errors.ErrorFinalizerService;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.core.strategy.ErrorMessageHelper;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

/**
 * This test checks the logic of {@link CobolLanguageEngine}. It should first run {@link
 * TextPreprocessor} to clean up the given COBOL text, then apply syntax and semantic analysis. If
 * the text doesn't have any semantic elements, it should return an empty {@link Node}
 */
class CobolLanguageEngineTest {
  private static final String ERROR_MSG = "Ensure that you have Java installed and that your serverRuntime is set to JAVA for dialect support.";

  private static final String TEXT = "       IDENTIFICATION DIVISION.";
  private static final String URI = "document.cbl";
  private final TextPreprocessor preprocessor = mock(TextPreprocessor.class);
  private final GrammarPreprocessor grammarPreprocessor = mock(GrammarPreprocessor.class);
  private final MessageService mockMessageService = mock(MessageService.class);
  private final ErrorMessageHelper mockErrUtil = mock(ErrorMessageHelper.class);
  private final CobolErrorStrategy cobolErrorStrategy = new CobolErrorStrategy();
  private final ParseTreeListener treeListener = mock(ParseTreeListener.class);
  private final DialectService dialectService = mock(DialectService.class);
  private final AstProcessor astProcessor = mock(AstProcessor.class);
  private final SymbolsRepository symbolsRepository = mock(SymbolsRepository.class);

  @Test
  void testLanguageEngineRun() {
    cobolErrorStrategy.setMessageService(mockMessageService);
    cobolErrorStrategy.setErrorMessageHelper(mockErrUtil);
    AstProcessor astProcessor = mock(AstProcessor.class);
    SymbolsRepository symbolsRepository = mock(SymbolsRepository.class);
    CodeLayoutStore codeLayoutStore = mock(CodeLayoutStore.class);

    BenchmarkService benchmarkService = mock(BenchmarkService.class);
    when(benchmarkService.startSession()).thenReturn(new BenchmarkSession());
    CobolLanguageEngine engine =
            new CobolLanguageEngine(
                    preprocessor, grammarPreprocessor, mockMessageService, treeListener, mock(SubroutineService.class), null,
                    dialectService, astProcessor, symbolsRepository, mock(ErrorFinalizerService.class),
                    benchmarkService, codeLayoutStore);
    when(mockMessageService.getMessage(anyString(), anyString(), anyString())).thenReturn("");
    Locality locality =
            Locality.builder()
                    .uri(URI)
                    .range(new Range(new Position(), new Position()))
                    .build();
    SyntaxError error =
            SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .location(locality.toOriginalLocation())
                    .suggestion("suggestion")
                    .severity(ERROR)
                    .build();
    SyntaxError eofError =
            SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .location(
                            Locality.builder()
                                    .uri(URI)
                                    .range(new Range(new Position(0, 31), new Position(0, 31)))
                                    .token("<EOF>")
                                    .build().toOriginalLocation())
                    .severity(ERROR)
                    .build();

    DialectProcessingContext context = DialectProcessingContext.builder()
            .extendedDocument(new ExtendedDocument(TEXT, URI))
            .build();
    context.getExtendedDocument().commitTransformations();
    when(dialectService.process(anyList(), any()))
            .thenReturn(new ResultWithErrors<>(new DialectOutcome(context), ImmutableList.of()));
    when(dialectService.processImplicitDialects(any(), anyList(), any()))
            .thenReturn(new ResultWithErrors<>(new DialectOutcome(context), ImmutableList.of()));
    when(preprocessor.cleanUpCode(URI, TEXT))
            .thenReturn(new ResultWithErrors<>(new ExtendedText(TEXT, URI), ImmutableList.of()));

    when(grammarPreprocessor.preprocess(any())).thenReturn(new ResultWithErrors<>(new CopybooksRepository(), ImmutableList.of()));

    Range sourceRange = ParserUtils.isHwParserEnabled()
            ? new Range(new Position(0, 0), new Position(0, 32))
            : new Range(new Position(0, 7), new Position(0, 31));
    Range programRange = ParserUtils.isHwParserEnabled()
            ? new Range(new Position(0, 7), new Position(0, 32))
            : new Range(new Position(0, 7), new Position(0, 31));
    Range divisionRange = ParserUtils.isHwParserEnabled()
            ? new Range(new Position(0, 7), new Position(0, 31))
            : new Range(new Position(0, 7), new Position(0, 31));
    AnalysisResult actual = engine.run(URI, TEXT, AnalysisConfig.defaultConfig(ENABLED));
    Node root = actual.getRootNode();
    Node program = root.getChildren().get(0);
    Node division = program.getChildren().get(0);

    assertEquals(NodeType.ROOT, root.getNodeType());
    assertEquals(sourceRange, root.getLocality().getRange());
    assertEquals(NodeType.PROGRAM, program.getNodeType());
    assertEquals(programRange, program.getLocality().getRange());
    assertEquals(NodeType.DIVISION, division.getNodeType());
    assertEquals(divisionRange, division.getLocality().getRange());
    assertEquals(0, division.getChildren().size());
  }

  @Test
  void testLanguageEngineRunWhenNativeServerWithDialects() {
    cobolErrorStrategy.setMessageService(mockMessageService);
    cobolErrorStrategy.setErrorMessageHelper(mockErrUtil);
    when(mockMessageService.getMessage("workspaceError.ServerType")).thenReturn(ERROR_MSG);
    System.setProperty("serverType", "NATIVE");
    CodeLayoutStore codeLayoutStore = mock(CodeLayoutStore.class);
    BenchmarkService benchmarkService = mock(BenchmarkService.class);
    when(benchmarkService.startSession()).thenReturn(mock(BenchmarkSession.class));
    CobolLanguageEngine engine =
            new CobolLanguageEngine(
                    preprocessor, grammarPreprocessor, mockMessageService, treeListener, mock(SubroutineService.class), null,
                    dialectService, astProcessor, symbolsRepository,
                    mock(ErrorFinalizerService.class), benchmarkService, codeLayoutStore);

    AnalysisResult actual = engine.run(URI, TEXT, DialectConfigs.getDaCoAnalysisConfig());
    Assertions.assertEquals(1, actual.getDiagnostics().size());
    Assertions.assertEquals(ERROR_MSG, actual.getDiagnostics().get(URI).get(0).getMessage());
  }

  @AfterAll
  static void unsetSystemProperty() {
    System.setProperty("serverType", "JAVA");
  }
}
