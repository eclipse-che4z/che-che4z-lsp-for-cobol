package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.positive.CobolText;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks that the copybook name with quotes processed successfully
 */
class TestCopybookNameWithQuotes {
  private static final String TEXT =
          "        IDENTIFICATION DIVISION.\n"
          + "          PROGRAM-ID. PARTEST.\n"
          + "          DATA DIVISION.\n"
          + "          WORKING-STORAGE SECTION.\n"
          + "          PROCEDURE DIVISION.\n";

  private static final String QUITES_LOWERCASE = "            COPY {~'cpbtest'}.\n";
  private static final String DOUBLE_QUITES = "            COPY {~\"CPBTEST\"}.\n";

  private static final String COPYBOOK =
      "         {#*PROGA}.";

  @Test
  void assertCopybookWithQuotesProcessing() {
    UseCaseEngine.runTest(TEXT + QUITES_LOWERCASE, List.of(new CobolText("CPBTEST", COPYBOOK)), Map.of());
  }

  @Test
  void assertCopybookWithDoubleQuotesProcessing() {
    UseCaseEngine.runTest(TEXT + DOUBLE_QUITES, List.of(new CobolText("CPBTEST", COPYBOOK)), Map.of());
  }

}
