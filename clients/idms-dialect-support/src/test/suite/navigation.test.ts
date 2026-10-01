/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 */

import * as helper from "./testHelper";

suite("IDMS variable navigation", function () {
  this.timeout(helper.TEST_TIMEOUT);
  suiteSetup(async () => helper.activate());
  this.afterEach(async () => helper.closeAllEditors());
  this.afterAll(async () => helper.closeAllEditors());

  // Java usecase: https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob/development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol/dialects/idms/usecases/TestIdmsSetStatement.java
  suite("TestIdmsSetStatement", function () {
    test("SET_ABEND_ON", async () => {
      const editor = await helper.openWithoutIdmsErrors(
        "usecase/TestIdmsSetStatement_SET_ABEND_ON.cbl",
      );
      await helper.checkSymbolActions(editor, "ANY-ERROR-STATUS");
    });

    test("SET_ABEND_ON_1", async () => {
      const editor = await helper.openWithoutIdmsErrors(
        "usecase/TestIdmsSetStatement_SET_ABEND_ON_1.cbl",
      );
      await helper.checkSymbolActions(editor, "ANY-ERROR-STATUS");
    });
  });

  // Java usecase: https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob/development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol/dialects/idms/usecases/TestIdmsInquireMapStatement.java
  suite("TestIdmsInquireMapStatement", function () {
    test("TST7", async () => {
      const editor = await helper.openWithoutIdmsErrors(
        "usecase/TestIdmsInquireMapStatement_TST7.cbl",
      );
      await helper.checkSymbolActions(editor, "S1");
    });
  });

  // Java usecase: https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob/development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol/dialects/idms/usecases/TestIdmsModifyMapStatement.java
  suite("TestIdmsModifyMapStatement", function () {
    test("TST9", async () => {
      const editor = await helper.openWithoutIdmsErrors(
        "usecase/TestIdmsModifyMapStatement_TST9.cbl",
      );
      await helper.checkSymbolActions(editor, "S1");
    });

    test("TST9_ON", async () => {
      // ANY-STATUS is implicit and must not cause an undefined-variable error.
      await helper.openWithoutIdmsErrors(
        "usecase/TestIdmsModifyMapStatement_TST9_ON.cbl",
      );
    });
  });
});
