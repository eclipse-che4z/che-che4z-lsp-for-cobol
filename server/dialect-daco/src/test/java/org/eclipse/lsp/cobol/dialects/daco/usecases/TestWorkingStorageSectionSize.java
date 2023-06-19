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
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
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
 * Test Working Storage section size when it ends with copybooks
 */
class TestWorkingStorageSectionSize {
  private static final String TEXT = "000200 IDENTIFICATION DIVISION.\n"
      + "000300 PROGRAM-ID.    BADPA61M.                                           D-----\n"
      + "001100 ENVIRONMENT  DIVISION.\n"
      + "001200 IDMS-CONTROL SECTION.\n"
      + "001300 PROTOCOL.    MODE IS BATCH           DEBUG\n"
      + "001400              IDMS-RECORDS            MANUAL.\n"
      + "001500 CONFIGURATION    SECTION.\n"
      + "001700 DATA   DIVISION.\n"
      + "001800 WORKING-STORAGE SECTION.\n"
      + "006400 01  COPY MAID {~LDDATE1M!DaCo}.\n"
      + "006600 01  COPY IDMS {~SUBSCHEMA-NAMES!IDMS}.\n";

    private static final String LINKAGE = "006800 LINKAGE SECTION.                                                   D00443\n"
      + "006900 01  COPY IDMS {~SUBSCHEMA-CTRL!IDMS}.                                      D00014\n"
      + "008400 PROCEDURE DIVISION.\n";

  private static final String DACO_COPY = "     1 01  {$*LDDATE1M-XDT}.\n"
      + "     2     03 {$*F00-XDT.                                                     1\n"
      + "     3       05 {$*JMDPRSGDV-XDT}          PIC X(8)    VALUE SPACE.            1\n"
      + "     4       05 {$*TYD-NDT}                PIC 9(8)    VALUE ZERO.             9\n"
      + "     5       05 {$*JMD-NDT}                PIC 9(6)    VALUE ZERO.            17\n";

  private static final String NAMES_COPY = "       01  {$*SUBSCHEMA-SETNAMES}.\n"
      + "           03 {$*POLBSS-POLCRI}            PIC X(16)   VALUE\n"
      + "           'POLBSS-POLCRI   '.\n"
      + "           03 {$*POLHDR-POLOPT}            PIC X(16)   VALUE\n"
      + "           'POLHDR-POLOPT   '.\n"
      + "           03 {$*POLOPT-POLBSS}            PIC X(16)   VALUE\n"
      + "           'POLOPT-POLBSS   '.\n";

  private static final String CTRL_COPY = "*DACO: 01  {$*SUBSCHEMA-CTRL}.\n"
      + "*DACO:     03 {$*PROGRAM-NAME}             PIC X(8)    VALUE SPACE.\n"
      + "*DACO:     03 {$*ERROR-STATUS}             PIC X(4)    VALUE '1400'.\n"
      + "*DACO:       88 {$*DB-STATUS-OK}                       VALUE '0000'.\n"
      + "*DACO:       88 {$*ANY-ERROR-STATUS}                   VALUE '0001'.\n";

  @Test
  void test() {
    AnalysisResult analysisResult = UseCaseEngine.runTest(TEXT + LINKAGE,
        ImmutableList.of(
            new CobolText("LDDATE1M", DaCoDialect.NAME, DACO_COPY),
            new CobolText("SUBSCHEMA-NAMES", IdmsDialect.NAME, NAMES_COPY),
            new CobolText("SUBSCHEMA-CTRL", IdmsDialect.NAME, CTRL_COPY)),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());

    Locality locality = getWorkingSectionLocality(analysisResult);
    assertEquals(new Range(new Position(8, 7), new Position(10, 37)), locality.getRange());
  }

  @Test
  void testWithoutLinkage() {
    AnalysisResult analysisResult = UseCaseEngine.runTest(TEXT,
        ImmutableList.of(
            new CobolText("LDDATE1M", DaCoDialect.NAME, DACO_COPY),
            new CobolText("SUBSCHEMA-NAMES", IdmsDialect.NAME, NAMES_COPY)),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());

    Locality locality = getWorkingSectionLocality(analysisResult);
    assertEquals(new Range(new Position(8, 7), new Position(10, 37)), locality.getRange());
  }

  private Locality getWorkingSectionLocality(AnalysisResult analysisResult) {
    Optional<Locality> locality = analysisResult.getRootNode().getDepthFirstStream()
        .filter(n -> n instanceof SectionNode)
        .map(SectionNode.class::cast)
        .filter(s -> s.getSectionType() == SectionType.WORKING_STORAGE)
        .map(Node::getLocality)
        .findFirst();
    assertTrue(locality.isPresent());
    return locality.get();
  }
}
