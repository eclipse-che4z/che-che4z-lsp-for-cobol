package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

public class TestOnRcuRangeException {
  final String TEXT =
            "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 A     PIC X.\n"
          + "       PROCEDURE DIVISION.\n"
          + "              MODIFY MAP MISMAP\n"
          + "                 FOR DFLD A ON RCU EDIT ERROR;\n"
          + "              SHOW ERROR 010\n"
          + "           CONTINUE.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(),
            DialectConfigs.getDaCoAnalysisConfig());
  }
}
