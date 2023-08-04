/*
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */

import * as assert from "assert";
import * as helper from "./testHelper";
import * as vscode from "vscode";
import { getWorkspacePath, pos, range } from "./testHelper";
import * as path from "path";

suite("Integration Test Suite", function () {
  suiteSetup(async function () {
    this.timeout(0);
    helper.updateConfig("basic.json");
    await helper.activate();
  });

  this.afterEach(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );

  test("TC152047, TC152052, TC152051, TC152050, TC152053: Error case - file has syntax errors and are marked with detailed hints", async () => {
    await helper.showDocument("USER2.cbl");
    const editor = helper.get_editor("USER2.cbl");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 2);
    assert.ok(diagnostics.length === 2);
    const d0 = diagnostics[0];
    const d1 = diagnostics[1];
    assert.strictEqual(
      d0.message,
      "Missing token PROGRAM-ID at programIdParagraph",
    );
    helper.assertRangeIsEqual(d0.range, range(pos(13, 30), pos(13, 31)));
    assert.strictEqual(d0.severity, diagnostics[1].severity);
    assert.strictEqual(
      d0.severity,
      vscode.DiagnosticSeverity.Error,
      "No syntax errors detected in USER2.cbl",
    );

    assert.strictEqual(
      d1.message,
      "Syntax error on 'HELLO-WORLD' expected {AUTHOR, CBL, DATA, DATE-COMPILED, DATE-WRITTEN, END, ENVIRONMENT, ID, IDENTIFICATION, INSTALLATION, PROCEDURE, PROCESS, SECURITY}",
    );
    helper.assertRangeIsEqual(d1.range, range(pos(14, 20), pos(14, 31)));
  });

  test("TC152050, TC152053: Error case - file has semantic errors and are marked with detailed hints", async () => {
    await helper.showDocument("REPLACING.CBL");
    const editor = helper.get_editor("REPLACING.CBL");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    const d0 = diagnostics[0];

    assert.strictEqual(d0.severity, vscode.DiagnosticSeverity.Error);
    assert.strictEqual(d0.message, "Variable ABC-ID is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(21, 21), pos(21, 27)));
  });

  test("TC288736 error message for 80chars limit", async () => {
    await helper.showDocument("TEST.CBL");
    const editor = helper.get_editor("TEST.CBL");
    const noise =
      "oi3Bd5kC1f3nMFp0IWg62ZZgWMxHPJnuLWm4DqplZDzMIX69C6vjeL24YbobdQnoQsDenL35omljznHd0l1fP";
    await helper.insertString(editor, pos(22, 7), noise);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length > 3,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    for (const d of diagnostics) {
      if (d.range.start.line === 22) {
        assert.strictEqual(d.message, "Source text cannot go past column 80");
        helper.assertRangeIsEqual(d.range, range(pos(22, 80), pos(22, 131)));
        return;
      }
    }
    assert.fail();
  })
    ?.timeout(helper.TEST_TIMEOUT)
    ?.slow(1000);

  test("TC312735 Check EXEC CICS is in Procedure Division", async () => {
    await helper.showDocument("ADSORT.cbl");
    let editor = helper.get_editor("ADSORT.cbl");
    await helper.deleteLine(editor, 58);
    await helper.insertString(
      editor,
      pos(34, 11),
      "           EXEC CICS XCTL PROGRAM (XCTL1) END-EXEC.",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 2);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(34, 11), pos(34, 15)),
    );
    assert.strictEqual(
      diagnostics[0].message,
      "Missing token SQL at execSqlStatement",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC266094 Underline the entire incorrect variable structure", async () => {
    await helper.showDocument("VAR.cbl");
    let editor = helper.get_editor("VAR.cbl");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 2);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(22, 23), pos(22, 43)),
    );
    assert.strictEqual(
      diagnostics[0].message,
      "Variable CHILD1 is not defined",
    );
    helper.assertRangeIsEqual(
      diagnostics[1].range,
      range(pos(23, 23), pos(23, 44)),
    );
    assert.strictEqual(
      diagnostics[1].message,
      "Variable CHILD2 is not defined",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("Load resource file", async () => {
    await helper.showDocument("RES.cbl");
    const editor = helper.get_editor("RES.cbl");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);

    assert.strictEqual(diagnostics.length, 1);
    assert.ok(
      diagnostics[0].message.includes("Syntax error on 'FILE-CONTROsL"),
    );
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(5, 7), pos(5, 20)),
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test(
    "TC266074 LSP analysis for extended sources - basic scenario",
    async () => {
      const extSrcUser1FilePath = path.join(".c4z", ".extsrcs", "USER1.cbl");
      const user1FilePath = "USER1.cbl";
      helper.recursiveCopySync(
        path.join(getWorkspacePath(), user1FilePath),
        path.join(getWorkspacePath(), extSrcUser1FilePath),
      );

      await helper.showDocument(extSrcUser1FilePath);
      let editor = helper.get_editor(extSrcUser1FilePath);
      await helper.insertString(editor, pos(25, 0), "           COPY ABC.");

      let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
      assert.strictEqual(diagnostics.length, 0);

      await editor.edit((edit) => {
        edit.delete(range(pos(25, 19), pos(25, 20)));
      });
      await helper.waitFor(
        () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
      );
      diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
      assert.strictEqual(diagnostics.length, 1);
      assert.ok(
        diagnostics[0].message.includes("Syntax error on 'COPY' expected"),
      );

      await helper.insertString(editor, pos(25, 20), "\n           Mov");
      await helper.waitFor(
        () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
      );
      assert.strictEqual(
        vscode.languages.getDiagnostics(editor.document.uri).length,
        1,
      );

      await helper.showDocument("USER1.cbl");
      editor = helper.get_editor("USER1.cbl");
      await helper.insertString(editor, pos(40, 0), "           COPY ABC.");
      await helper.waitFor(
        () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
      );
      diagnostics = vscode.languages.getDiagnostics(editor.document.uri);

      assert.strictEqual(diagnostics.length, 1);
      const d0 = diagnostics[0];
      assert.ok(d0.message.includes("ABC: Copybook not found"));
      assert.ok(d0.source.includes("COBOL Language Support (copybook)"));

      await helper.insertString(editor, pos(40, 21), "\n           Mov");
      await helper.waitFor(
        () => vscode.languages.getDiagnostics(editor.document.uri).length === 4,
      );
      diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
      assert.strictEqual(diagnostics.length, 4);
      assert.ok(
        diagnostics[2].message.includes(
          "A misspelled word, maybe you want to put MOVE",
        ),
      );
    },
  )
    ?.timeout(helper.TEST_TIMEOUT)
    ?.slow(1000);

  test("TC250108 Test Program Name", async () => {
    await helper.showDocument("USER1.cbl");
    const editor = helper.get_editor("USER1.cbl");
    await editor.edit((edit) => {
      edit.replace(range(pos(48, 30), pos(48, 32)), "1.");
    });
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(
      diagnostics[0].message,
      "Program-name must be identical to the program-name of the corresponding PROGRAM-ID paragraph: HELLO-WORLD",
    );
  })
    ?.timeout(helper.TEST_TIMEOUT)
    ?.slow(1000);

  test("TC250109 Test Area B", async () => {
    if (process.platform === "win32") {
      // TODO: fix this test in windows environment
      return;
    }
    await helper.showDocument("USER1.cbl");
    const editor = helper.get_editor("USER1.cbl");
    await editor.edit((edit) =>
      edit.replace(range(pos(32, 0), pos(32, 3)), ""),
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(
      diagnostics[0].message,
      "The following token must start in Area B: Move",
    );

    await editor.edit((edit) => {
      edit.replace(range(pos(41, 0), pos(41, 3)), "");
    });
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 2,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 2);
    assert.strictEqual(
      diagnostics[1].message,
      "The following token must start in Area B: Display",
    );
  })
    ?.timeout(helper.TEST_TIMEOUT)
    ?.slow(1000);

  test("TC250107 Test Area A, Check FD/SD level data", async () => {
    await helper.showDocument("USER1.cbl");
    let editor = helper.get_editor("USER1.cbl");
    await helper.insertString(editor, pos(17, 0), "       FILE SECTION.\n");
    await helper.insertString(
      editor,
      pos(18, 0),
      "           FD  TRANS-FILE-IN IS EXTERNAL.\n",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 2,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(
      diagnostics.length,
      2,
      "got: " + JSON.stringify(diagnostics),
    );
    assert.strictEqual(
      diagnostics[0].message,
      "The following token must start in Area A: FD",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC250107 Test Area A, check DIVISION and paragraph name warnings", async () => {
    await helper.showDocument("USER1.cbl");
    let editor = helper.get_editor("USER1.cbl");
    await helper.insertString(editor, pos(13, 0), "      ");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(
      diagnostics[0].message,
      "The following token must start in Area A: Identification",
    );

    await helper.insertString(editor, pos(16, 0), "      ");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 2,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 2);
    assert.strictEqual(
      diagnostics[1].message,
      "The following token must start in Area A: Data",
    );

    await helper.insertString(editor, pos(26, 0), "      ");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 3,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 3);
    assert.strictEqual(
      diagnostics[2].message,
      "The following token must start in Area A: Procedure",
    );

    await helper.insertString(editor, pos(31, 0), "      ");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 4,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 4);
    assert.strictEqual(
      diagnostics[3].message,
      "The following token must start in Area A: 100-Print-User",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("Show errors only for opened files", async () => {
    // Open program with error inside a copybook
    await helper.showDocument("TESTCPY1.cbl");
    const progUri = await helper.getUri("TESTCPY1.cbl");

    const copybookPath = path.join("testing", "COPYE");
    const copybookUri = await helper.getUri(copybookPath);

    await helper.waitFor(
      () => vscode.languages.getDiagnostics(progUri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(progUri);
    assert.strictEqual(
      diagnostics.length,
      1,
      "got: " + JSON.stringify(diagnostics),
    );
    assert.strictEqual(diagnostics[0].message, "Errors inside the copybook");

    // No diagnostic for copybook so far
    let copyDiagnostics = vscode.languages.getDiagnostics(copybookUri);
    assert.strictEqual(copyDiagnostics.length, 0);

    // Open copybook with an error
    await helper.showDocument(copybookPath);

    await helper.waitFor(
      () => vscode.languages.getDiagnostics(copybookUri).length === 1,
    );
    copyDiagnostics = vscode.languages.getDiagnostics(copybookUri);
    assert.strictEqual(
      copyDiagnostics.length,
      1,
      "got: " + JSON.stringify(diagnostics),
    );
    assert.strictEqual(
      copyDiagnostics[0].message,
      "Extraneous input 'VvvALUE' expected {BINARY, BLANK, COMP, COMPUTATIONAL, COMPUTATIONAL-1, COMPUTATIONAL-2, COMPUTATIONAL-3, COMPUTATIONAL-4, COMPUTATIONAL-5, COMP-1, COMP-2, COMP-3, COMP-4, COMP-5, DISPLAY, DISPLAY-1, DYNAMIC, EXTERNAL, FUNCTION-POINTER, GLOBAL, GROUP-USAGE, INDEX, IS, JUST, JUSTIFIED, LEADING, NATIONAL, OBJECT, OCCURS, PACKED-DECIMAL, PIC, PICTURE, POINTER, POINTER-32, PROCEDURE-POINTER, REDEFINES, SIGN, SYNC, SYNCHRONIZED, TRAILING, USAGE, UTF-8, VALUE, VALUES, VOLATILE, '.'}",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("Show transition copybook errors", async () => {
    // Open program with error inside a copybook
    await helper.showDocument("TESTCPY2.cbl");
    const progUri = await helper.getUri("TESTCPY2.cbl");

    const copybookPath = path.join("testing", "COPYC");
    const copybookUri = await helper.getUri(copybookPath);

    // Open copybook with an error
    await helper.showDocument(copybookPath);

    await helper.waitFor(
      () => vscode.languages.getDiagnostics(copybookUri).length === 1,
    );
    const diagnostic = vscode.languages.getDiagnostics(copybookUri);
    assert.strictEqual(
      diagnostic.length,
      1,
      "got: " + JSON.stringify(diagnostic),
    );
    assert.strictEqual(diagnostic[0].message, "Errors inside the copybook");
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);
});
