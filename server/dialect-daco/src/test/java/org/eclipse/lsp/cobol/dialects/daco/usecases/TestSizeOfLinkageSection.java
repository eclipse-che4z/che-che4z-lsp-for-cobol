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
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Test Size of the Linkage Section
 */
class TestSizeOfLinkageSection {
  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID.    BMDPHJ1M.\n"
      + "       ENVIRONMENT  DIVISION.\n"
      + "       IDMS-CONTROL SECTION.\n"
      + "       PROTOCOL.    MODE IS BATCH           DEBUG\n"
      + "                    IDMS-RECORDS            MANUAL.\n"
      + "       DATA   DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       01  WS-AREA.\n"
      + "           03 AREA-XW1.\n"
      + "             05 MDUOUD-XW1 PIC X(8) VALUE 'INACTIVE'.\n"
      + "       LINKAGE SECTION.\n"
      + "       01  COPY IDMS SUBSCHEMA-CTRL.\n"
      + "       01  TRAREC-XL1.\n"
      + "           03 F00-XL1.\n"
      + "             05 COPY MAID LDDPHJ1M INP.\n"
      + "       PROCEDURE DIVISION.\n"
      + "           MOVE MODULE-NAME TO MDUOUD-XW1.\n";

  private static final String COPY_SUBSCHEMA_CTRL = "*DACO: 01  SUBSCHEMA-CTRL.\n"
      + "*DACO:     03 IDBMSCOM-AREA.\n"
      + "*DACO:       05 IDBMSCOM               PIC X       OCCURS 100.\n"
      + "*DACO:     03 RIDBMSCOM REDEFINES IDBMSCOM-AREA.\n"
      + "*DACO:       05 PAGE-INFO.\n"
      + "*DACO:         07 PAGE-INFO-GROUP      PIC S9(4) COMP.\n"
      + "*DACO:         07 PAGE-INFO-DBK-FORMAT PIC 9(4) COMP.\n"
      + "*DACO:       05 FILLER PIC X(96).\n"
      + "*DACO:     03 MODULE-NAME              PIC X(8)    VALUE 'UNKNOWN'.\n"
      + "\n";

  private static final String COPY_LDDPHJ1M = "     1 01  LDDPHJ1M-X.                                                    1837\n"
      + "     2     03 TRAKOD-X                 PIC X(4)    VALUE SPACE.              1\n";

  @Test
  void test() {
    CobolText subschemaCopy = new CobolText("SUBSCHEMA-CTRL", IdmsDialect.NAME, COPY_SUBSCHEMA_CTRL);
    CobolText lddCopy = new CobolText("LDDPHJ1M", DaCoDialect.NAME, COPY_LDDPHJ1M);

    AnalysisResult analysisResult = UseCaseEngine.runTestForDiagnostics(TEXT, ImmutableList.of(subschemaCopy, lddCopy),
        ImmutableMap.of(), ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());

    Optional<SectionNode> linkageSection = analysisResult.getRootNode().getDepthFirstStream().filter(SectionNode.class::isInstance)
        .map(SectionNode.class::cast)
        .filter(s -> s.getSectionType() == SectionType.LINKAGE)
        .findFirst();

    assertTrue(linkageSection.isPresent());
    assertEquals(new Range(new Position(11, 7), new Position(15, 39)), linkageSection.get().getLocality().getRange());
  }

}
