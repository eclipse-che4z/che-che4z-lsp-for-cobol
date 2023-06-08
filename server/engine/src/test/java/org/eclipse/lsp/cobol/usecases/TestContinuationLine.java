/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** The test for various cases with the continuation line */
class TestContinuationLine {
  private static final String TEXT =
      "       Identification Division.\n"
          + "       Program-id. HELLO-WORLD.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*COD-RETOUR} PIC X(9).\n"
          + "       Procedure Division.\n"
          + "                   DISPLAY '* CODE RETOUR : ' {$COD-RETOUR} 'd\n"
          + "      -\n"
          + "       .\n"
          + "                   DISPLAY '* CODE RETOUR : ' {$COD-RETOUR} 'd\n"
          + "      -{asdf|1}asdf\n"
          + "       .\n"
          + "                   DISPLAY '* CODE RETOUR : ' {$COD-RETOUR} 'd\n"
          + "      -   {a|1}sdfasdf\n"
          + "       .\n"
          + "                   DISPLAY '* CODE RETOUR : ' {$COD-RETOUR} 'd\n"
          + "      -    asdfasdf\n"
          + "       .\n";

  private static final String TEXT2 =
      "       IDENTIFICATION DIVISION.                                         \n"
          + "       PROGRAM-ID.                                                      \n"
          + "           NC215A.                                                      \n"
          + "       ENVIRONMENT DIVISION.                                            \n"
          + "       CONFIGURATION SECTION.                                           \n"
          + "       SOURCE-COMPUTER.                                                 \n"
          + "           XXXXX082.                                                    \n"
          + "       OBJECT-COMPUTER.                                                 \n"
          + "           XXXXX083                                                     \n"
          + "           PROGRAM COLLATING SEQUENCE IS THE-WILD-ONE.                  \n"
          + "       SPECIAL-NAMES.                                                   \n"
          + "           ALPHABET                                                     \n"
          + "           THE-WILD-ONE IS \"A\" THRU \"H\" \"I\" ALSO \"J\", ALSO \"K\", ALSO    \n"
          + "           \"L\" ALSO \"M\" ALSO \"N\" \"O\" THROUGH \"Z\" \"0\" THRU \"9\",          \n"
          + "           ALPHABET                                                     \n"
          + "           THE-BIG-OL-LITERAL-ALPHABET IS \"A+0B-1C*2D/3E=4Fl5G,6H;7I.8J\"\n"
          + "      -    \"\"9K(L)M>N<O PQRSTUVWXYZ\".                                   \n"
          + "      *                                                                 \n"
          + "      *                                                                 ";

  private static final String TEXT3 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*WRK-XN-160-1} PIC X(160) VALUE                                \n"
          + "           \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\n"
          + "      -    \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\n"
          + "      -    \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\n"
          + "      -    \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\n"
          + "      -    \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\n"
          + "      -    \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\".                                      \n"
          + "       77 {$*DATA-T}              PICTURE X(20) VALUE          \"RANDOM TEXT \n"
          + "      -                                                     \"RANDOM TEXT\n"
          + "      -    \" CONTINUED LINE ENDS HERE\".\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE \"TEST\" to {$DATA-T}.\n"
          + "           DISPLAY {$WRK-XN-160-1}.";

  private static final String TEXT4 = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID. TEST1.\n"
      + "       DATA DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       01  {$*CCVS-C-1}.                                                    NC2354.2\n"
      + "           02 FILLER  PIC IS X(99)    VALUE IS \" FEATURE              PANC2354.2\n"
      + "      -    \"SS  PARAGRAPH-NAME                                          NC2354.2\n"
      + "      -    \"       REMARKS\".                                            NC2354.2\n"
      + "       01  {$*HYPHEN-LINE}.                                                 NC2354.2\n"
      + "           02 FILLER  PIC IS X VALUE IS SPACE.                          NC2354.2\n"
      + "           02 FILLER  PIC IS X(65)    VALUE IS \"************************NC2354.2\n"
      + "      -    \"*****************************************\".                 NC2354.2\n"
      + "           02 FILLER  PIC IS X(54)    VALUE IS \"************************NC2354.2\n"
      + "      -    \"******************************\".";

  @Test
  void testWhenContinuousLineStartsWithOneQuote_thenOneLiteralIsIdentified() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "A continuation line cannot contain values in the Content Area A",
                DiagnosticSeverity.Error,
                ErrorSource.PREPROCESSING.getText())));
  }

  @Test
  void testWhenContinuousLineStartsWithTwoQuotes_thenTwoLiteralsAreIdentified() {
    UseCaseEngine.runTest(TEXT2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void
  testWhenContinuousLineStartsWithOneQuoteAndContinuedLineIsOpenLiteral_thenOneLiteralIdentified() {
    UseCaseEngine.runTest(TEXT3, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void
  testWhenThereAre2ContinuousLines() {
    AnalysisResult result = UseCaseEngine.runTest(TEXT4, ImmutableList.of(), ImmutableMap.of());
    Optional<VariableNode> node = result.getRootNode().getDepthFirstStream().filter(n -> n.getNodeType() == NodeType.VARIABLE)
        .map(VariableNode.class::cast)
        .filter(v -> v.getName().equals("HYPHEN-LINE"))
        .findFirst();

    assertTrue(node.isPresent());
    assertEquals(Locality.builder()
        .uri("file:///c:/workspace/document.cbl")
        .range(new Range(new Position(8, 7), new Position(13, 44)))
        .build(), node.get().getLocality());
  }

}
