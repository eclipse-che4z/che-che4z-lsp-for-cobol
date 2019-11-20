package com.ca.lsp.cobol.usecases;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.mocks.MockWorkspaceService;
import org.junit.Test;

import java.util.Collections;

/**
 * This test verifies that the variable structure can be built correctly with copybooks and that
 * error is not thrown if there are no ambiguous definitions, even with skipped hierarchical levels
 * on usage.
 */
public class TestVariableStructureInCopybooksWithMissingLevels extends PositiveUseCase {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  PARENT.   COPY STRUCT.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       MOVE 00 TO CHILD1 OF PARENT.";

  private static final String STRUCT =
      "       02  PARENT2.\n"
          + "           03  CHILD1         PIC 9   VALUE IS '0'.\n"
          + "           03  CHILD2         PIC 9   VALUE IS '1'.\n"
          + "           03  CHILD3         PIC 9   VALUE IS '2'.";

  public TestVariableStructureInCopybooksWithMissingLevels() {
    super(TEXT);

    MockWorkspaceService workspaceService =
        LangServerCtx.getInjector().getInstance(MockWorkspaceService.class);
    workspaceService.setCopybooks(() -> Collections.singletonList(new CobolText("STRUCT", STRUCT)));
  }

  @Test
  public void test() {
    super.test();
  }
}
