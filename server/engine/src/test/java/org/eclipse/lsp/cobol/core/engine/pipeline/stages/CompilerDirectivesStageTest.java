/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.pipeline.stages;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Test CompilerDirectivesStage
 */
class CompilerDirectivesStageTest {
  @ParameterizedTest(name = "{index}: {0} ''{1}''")
  @MethodSource("positiveCases")
  void positive(String name, String code, List<String> options) {
    List<String> co = new ArrayList<>();
    CompilerDirectivesStage stage = new CompilerDirectivesStage(mock(MessageService.class));
    AnalysisConfig configuration = mock(AnalysisConfig.class);
    when(configuration.getCompilerOptions()).thenReturn(co);
    AnalysisContext ctx = mock(AnalysisContext.class);
    ExtendedDocument doc = new ExtendedDocument(code, "http://doc.cbl");
    when(ctx.getExtendedDocument()).thenReturn(doc);
    when(ctx.getConfig()).thenReturn(configuration);

    stage.run(ctx, null);
    assertEquals(options, ctx.getConfig().getCompilerOptions());
    assertEquals(code.length(), doc.getCurrentText().toString().length());
    assertNotEquals(code, doc.getCurrentText().toString());
  }

  @ParameterizedTest(name = "{index}: {0} ''{1}''")
  @MethodSource("negativeCases")
  void negative(String name, String code, List<String> options) {
    List<String> co = new ArrayList<>();
    CompilerDirectivesStage stage = new CompilerDirectivesStage(mock(MessageService.class));
    AnalysisConfig configuration = mock(AnalysisConfig.class);
    when(configuration.getCompilerOptions()).thenReturn(co);
    AnalysisContext ctx = mock(AnalysisContext.class);
    ExtendedDocument doc = new ExtendedDocument(code, "http://doc.cbl");
    when(ctx.getExtendedDocument()).thenReturn(doc);
    when(ctx.getConfig()).thenReturn(configuration);

    stage.run(ctx, null);
    assertEquals(options, ctx.getConfig().getCompilerOptions());
    assertEquals(code.length(), doc.getCurrentText().toString().length());
  }

  static Stream<Arguments> positiveCases() {
    return Stream.of(
            Arguments.of("Compiler Directive at the beginnig of a line", "CBL NOCICS", ImmutableList.of("NOCICS")),
            Arguments.of("Compiler Directives at the beginnig of a line", "CBL NOCICS\nCBL CICS", ImmutableList.of("NOCICS", "CICS")),
            Arguments.of("Compiler Directive after 3 spaces", "   CBL NOCICS", ImmutableList.of("NOCICS")),
            Arguments.of("Compiler Directive after 6 spaces", "      CBL NOCICS", ImmutableList.of("NOCICS")),
            Arguments.of("Compiler Directive after 7 spaces", "       CBL NOCICS", ImmutableList.of("NOCICS")),
            Arguments.of("Compiler Directive after spaces 8 spaces", "        CBL NOCICS", ImmutableList.of("NOCICS")),
            Arguments.of("Compiler Directive after more spaces", "           CBL NOCICS", ImmutableList.of("NOCICS")),
            Arguments.of("Compiler Directive after 'sequence number'", "0abcdePROCESS NOCICS", ImmutableList.of("NOCICS")),
            Arguments.of("Compiler Directive in column 8 - SEQ", "000010 PROCESS NOCICS", ImmutableList.of("NOCICS")),
            Arguments.of("Compiler Directive after column 8 - SEQ", "000010     CBL NOCICS", ImmutableList.of("NOCICS")),
            Arguments.of("Listing control in column 8 - SEQ", "000010 *PROCESS NOCICS", ImmutableList.of("NOCICS")),
            Arguments.of("Listing control in column 8 - NOSEQ", "       *CBL NOCICS", ImmutableList.of("NOCICS")),
            Arguments.of("Listing control after column 8 - SEQ ", "000010    *CBL NOCICS", ImmutableList.of("NOCICS")),
            Arguments.of("Listing control after column 8 - NOSEQ ", "          *PROCESS NOCICS", ImmutableList.of("NOCICS"))
    );
  }
  static Stream<Arguments> negativeCases() {
    return Stream.of(
            Arguments.of("Incorrect compiler directive", "a    CBL NOCICS", ImmutableList.of()),
            Arguments.of("Incorrect compiler directive", "           PROCESSING PROCEDURE XML-HANDLER", ImmutableList.of())
    );
  }
}
