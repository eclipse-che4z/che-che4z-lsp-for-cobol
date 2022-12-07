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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedSource;
import org.eclipse.lsp.cobol.common.mapping.TextTransformations;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.model.DocumentMapping;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.core.strategy.ErrorMessageHelper;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode.ENABLED;
import static org.eclipse.lsp.cobol.common.copybook.SQLBackend.DB2_SERVER;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * This test checks the logic of {@link CobolLanguageEngine}. It should first run {@link
 * TextPreprocessor} to clean up the given COBOL text, then apply syntax and semantic analysis. If
 * the text doesn't have any semantic elements, it should return an empty {@link Node}
 */
class CobolLanguageEngineTest {

  private static final String TEXT = "       IDENTIFICATION DIVISION.";
  private static final String URI = "document.cbl";

  @Test
  void testLanguageEngineRun() {
    TextPreprocessor preprocessor = mock(TextPreprocessor.class);
    MessageService mockMessageService = mock(MessageService.class);
    ErrorMessageHelper mockErrUtil = mock(ErrorMessageHelper.class);
    CobolErrorStrategy cobolErrorStrategy = new CobolErrorStrategy();
    ParseTreeListener treeListener = mock(ParseTreeListener.class);
    DialectService dialectService = mock(DialectService.class);
    cobolErrorStrategy.setMessageService(mockMessageService);
    cobolErrorStrategy.setErrorMessageHelper(mockErrUtil);
    AstProcessor astProcessor = mock(AstProcessor.class);
    SymbolsRepository symbolsRepository = mock(SymbolsRepository.class);

    CobolLanguageEngine engine =
        new CobolLanguageEngine(
            preprocessor, mockMessageService, treeListener, mock(SubroutineService.class), null,
            dialectService, astProcessor, symbolsRepository);
    when(mockMessageService.getMessage(anyString(), anyString(), anyString())).thenReturn("");
    Locality locality =
        Locality.builder()
            .uri(URI)
            .range(new Range(new Position(), new Position()))
            .build();
    SyntaxError error =
        SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
            .locality(locality)
            .suggestion("suggestion")
            .severity(ERROR)
            .build();
    SyntaxError eofError =
        SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
            .locality(
                Locality.builder()
                    .uri(URI)
                    .range(new Range(new Position(0, 31), new Position(0, 31)))
                    .token("<EOF>")
                    .build())
            .severity(ERROR)
            .build();

    ExtendedDocument extendedDocument =
        new ExtendedDocument(
            "",
            TEXT,
            new CopybooksRepository(),
            ImmutableMap.of(
                URI,
                new DocumentMapping(
                    ImmutableList.of(
                        Locality.builder()
                            .uri(URI)
                            .range(new Range(new Position(), new Position(0, 7)))
                            .token("       ")
                            .build(),
                        Locality.builder()
                            .uri(URI)
                            .range(new Range(new Position(0, 7), new Position(0, 20)))
                            .token("IDENTIFICATION")
                            .build(),
                        Locality.builder()
                            .uri(URI)
                            .range(new Range(new Position(0, 21), new Position(0, 22)))
                            .token(" ")
                            .build(),
                        Locality.builder()
                            .uri(URI)
                            .range(new Range(new Position(0, 22), new Position(0, 29)))
                            .token("DIVISION")
                            .build(),
                        Locality.builder()
                            .uri(URI)
                            .range(new Range(new Position(0, 30), new Position(0, 31)))
                            .token(".")
                            .build(),
                        Locality.builder()
                            .uri(URI)
                            .range(new Range(new Position(0, 31), new Position(0, 31)))
                            .token("<EOF>")
                            .build()),
                    ImmutableMap.of())));

    CopybookConfig cpyConfig = new CopybookConfig(ENABLED, DB2_SERVER, ImmutableList.of());

    DialectProcessingContext context = DialectProcessingContext.builder()
            .extendedSource(new ExtendedSource(TEXT, URI))
            .build();
    context.getExtendedSource().commitTransformations();
    when(dialectService.process(anyList(), any()))
        .thenReturn(new ResultWithErrors<>(new DialectOutcome(context), ImmutableList.of()));
    when(preprocessor.cleanUpCode(URI, TEXT))
        .thenReturn(new ResultWithErrors<>(TextTransformations.of(TEXT, URI), ImmutableList.of()));
    when(preprocessor.processCleanCode(
            eq(URI), eq(TEXT), eq(cpyConfig), any(CopybookHierarchy.class)))
            .thenReturn(new ResultWithErrors<>(extendedDocument, ImmutableList.of(error)));
    when(preprocessor.processCleanCode(
            anyString(), anyString(), any(CopybookConfig.class), any(CopybookHierarchy.class)))
            .thenReturn(new ResultWithErrors<>(extendedDocument, ImmutableList.of()));

    Range programRange = new Range(new Position(0, 7), new Position(0, 31));
    ResultWithErrors<AnalysisResult> actual = engine.run(URI, TEXT, AnalysisConfig.defaultConfig(ENABLED));
    Node root = actual.getResult().getRootNode();
    Node program = root.getChildren().get(0);
    Node division = program.getChildren().get(0);

    assertEquals(NodeType.ROOT, root.getNodeType());
    assertEquals(programRange, root.getLocality().getRange());
    assertEquals(NodeType.PROGRAM, program.getNodeType());
    assertEquals(programRange, program.getLocality().getRange());
    assertEquals(NodeType.DIVISION, division.getNodeType());
    assertEquals(programRange, division.getLocality().getRange());
    assertEquals(0, division.getChildren().size());
  }
}
