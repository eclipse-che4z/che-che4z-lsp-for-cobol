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
  this.timeout(helper.TEST_TIMEOUT);
  suiteSetup(async function () {
    await helper.updateConfig("basic.json");
    await helper.activate();
  });

  this.afterEach(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  this.afterAll(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  test("TC152047, TC152052, TC152051, TC152050, TC152053: Error case - file has syntax errors and are marked with detailed hints", async () => {
    const editor = await helper.showDocument("USER2.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    const d0 = diagnostics[0];
    assert.strictEqual(d0.message, "Syntax error on 'Program1-id'");
    helper.assertRangeIsEqual(d0.range, range(pos(14, 7), pos(14, 18)));
  });

  test("TC152050, TC152053: Error case - file has semantic errors and are marked with detailed hints", async () => {
    const editor = await helper.showDocument("REPLACING.CBL");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    const d0 = diagnostics[0];

    assert.strictEqual(d0.severity, vscode.DiagnosticSeverity.Error);
    assert.strictEqual(d0.message, "Variable ABC-ID is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(21, 21), pos(21, 27)));
  });

  test("TC288736 error message for 80chars limit", async () => {
    const editor = await helper.showDocument("TEST.CBL");
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
    const editor = await helper.showDocument("ADSORT.cbl");
    await helper.deleteLine(editor, 58);
    await helper.insertString(
      editor,
      pos(34, 11),
      "           EXEC CICS XCTL PROGRAM (XCTL1) END-EXEC.",
    );
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(34, 11), pos(34, 50)),
    );
    assert.strictEqual(diagnostics[0].message, "Invalid CICS EXEC block");
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test.skip("TC312753 Check EXEC CICS allows free arguments order", async () => {
    const editor = await helper.showDocument("ADSORT.cbl");
    await helper.deleteLine(editor, 58);
    await helper.insertString(
      editor,
      pos(39, 0),
      "           EXEC CICS\n" +
        "               SEN MAP('DETAIL') MAPSET(MODULE-NAME-1)    ERASE\n" +
        "           END-EXEC.",
    );
    let diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(diagnostics.length, 1);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(40, 15), pos(40, 18)),
    );
    assert.ok(diagnostics[0].message.includes("Extraneous input 'SEN'"));
    await helper.deleteLine(editor, 40);
    await helper.insertString(
      editor,
      pos(40, 0),
      "               SEND MAP('DETAIL') MAPSET(MODULE-NAME-1)    ERASE",
    );
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 0);
    assert.strictEqual(diagnostics.length, 0);
  });
  // .timeout(helper.TEST_TIMEOUT)
  // .slow(1000);

  test("TC312745 Error check", async () => {
    const editor = await helper.showDocument("ADSORT.cbl");
    await helper.deleteLine(editor, 58);
    await helper.insertString(
      editor,
      pos(58, 0),
      "           EXEC CICS XCTL123 PROGRAM (XCTL1) END-EXEC.",
    );
    let diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(diagnostics.length, 1);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(58, 21), pos(58, 28)),
    );
    helper.hasDiagnosticMatches(editor.document.uri, (d) =>
      d.message.includes("Syntax error on 'XCTL123'"),
    );

    await helper.deleteLine(editor, 58);
    await helper.insertString(
      editor,
      pos(58, 0),
      "           EXEC CICS XCTL PROGRAM (XCTL1) END-EXEC.",
    );
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 0);
    assert.strictEqual(diagnostics.length, 0);
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC312738 CICS variables and paragraphs support", async () => {
    const editor = await helper.showDocument("ADSORT.cbl");
    await helper.waitFor(async () => {
      await helper.sleep(100);
      const result = await vscode.commands.executeCommand<vscode.Location[]>(
        "vscode.executeDefinitionProvider",
        editor.document.uri,
        pos(58, 36),
      );
      return result?.length > 0;
    });
    const result = await vscode.commands.executeCommand<vscode.Location[]>(
      "vscode.executeDefinitionProvider",
      editor.document.uri,
      pos(58, 36),
    );
    assert.strictEqual(
      result?.length,
      1,
      "Checks behavior of go to definition action (size)",
    );
    assert.strictEqual(
      result[0].uri.fsPath,
      editor.document.fileName,
      "Checks behavior of go to definition action (path)",
    );
    assert.strictEqual(
      result[0].range.start.line,
      27,
      "Checks behavior of go to definition action (line)",
    );
    assert.strictEqual(
      result[0].range.start.character,
      7,
      "Checks behavior of go to definition action (char)",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC314992 CICS as a Variable Name", async () => {
    const editor = await helper.showDocument("ADSORT.cbl");
    await helper.insertString(
      editor,
      pos(28, 0),
      "       88  CICS VALUE 'CICS '",
    );
    let diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(diagnostics.length, 1);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(29, 7), pos(29, 14)),
    );
    assert.ok(
      diagnostics[0].message.includes('A period was assumed before "LINKAGE".'),
      diagnostics[0].message,
    );
    await helper.deleteLine(editor, 28);
    await helper.insertString(
      editor,
      pos(28, 0),
      "       88  CICS VALUE 'CICS '.",
    );
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 0);
    assert.strictEqual(diagnostics.length, 0);
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC266094 Underline the entire incorrect variable structure", async () => {
    const editor = await helper.showDocument("VAR.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
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
    const editor = await helper.showDocument("RES.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);

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

  test("TC266074 LSP analysis for extended sources - basic scenario", async () => {
    const extSrcUser1FilePath = path.join(".c4z", ".extsrcs", "USER1.cbl");
    const user1FilePath = "USER1.cbl";
    await vscode.workspace.fs.copy(
      vscode.Uri.joinPath(vscode.Uri.file(getWorkspacePath()), user1FilePath),
      vscode.Uri.joinPath(
        vscode.Uri.file(getWorkspacePath()),
        extSrcUser1FilePath,
      ),
      { overwrite: true },
    );

    let editor = await helper.showDocument(extSrcUser1FilePath);
    await helper.insertString(editor, pos(25, 0), "           COPY ABC.");

    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);

    await editor.edit((edit) => {
      edit.delete(range(pos(25, 19), pos(25, 20)));
    });
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 1);
    assert.strictEqual(diagnostics.length, 1);
    assert.ok(diagnostics[0].message.includes("Syntax error on 'COPY'"));

    await helper.insertString(editor, pos(25, 20), "\n           Mov");
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 1);
    assert.strictEqual(diagnostics.length, 1);

    editor = await helper.showDocument("USER1.cbl");
    await helper.insertString(editor, pos(40, 0), "           COPY ABC.");
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 1);

    assert.strictEqual(diagnostics.length, 1);
    const d0 = diagnostics[0];
    assert.ok(d0.message.includes("ABC: Copybook not found"));
    assert.ok(
      d0 &&
        d0.source &&
        d0.source.includes("COBOL Language Support (copybook)"),
    );

    await helper.insertString(editor, pos(40, 21), "\n           Mov");
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 3);
    assert.strictEqual(diagnostics.length, 3);

    helper.hasDiagnosticMatches(editor.document.uri, (d) =>
      d.message.includes("A misspelled word, maybe you want to put MOD"),
    );
  })
    ?.timeout(helper.TEST_TIMEOUT)
    ?.slow(1000);

  test("TC250108 Test Program Name", async () => {
    const editor = await helper.showDocument("USER1.cbl");
    await editor.edit((edit) => {
      edit.replace(range(pos(48, 30), pos(48, 32)), "1.");
    });
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(
      diagnostics[0].message,
      "Program-name must be identical to the program-name of the corresponding PROGRAM-ID paragraph: HELLO-WORLD",
    );
  })
    ?.timeout(helper.TEST_TIMEOUT)
    ?.slow(1000);

  test("TC250109 Test Area B", async () => {
    const editor = await helper.showDocument("USER1.cbl");
    await editor.edit((edit) => edit.delete(range(pos(32, 0), pos(32, 3))));
    let diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(
      diagnostics[0].message,
      "The following token must start in Area B: Move",
    );

    await editor.edit((edit) => {
      edit.delete(range(pos(41, 0), pos(41, 3)));
    });
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 2);
    assert.strictEqual(diagnostics.length, 2);
    helper.hasDiagnosticMatches(
      editor.document.uri,
      (d) => d.message === "The following token must start in Area B: Display",
    );
  })
    ?.timeout(helper.TEST_TIMEOUT)
    ?.slow(1000);

  test("TC250107 Test Area A, Check FD/SD level data", async () => {
    const editor = await helper.showDocument("USER1.cbl");
    await helper.insertString(editor, pos(17, 0), "       FILE SECTION.\n");
    await helper.insertString(
      editor,
      pos(18, 0),
      "           FD  TRANS-FILE-IN IS EXTERNAL.\n",
    );

    await helper.waitFor(
      () =>
        vscode.languages
          .getDiagnostics(editor.document.uri)
          .map((d) => d.message)
          .filter((m) => m === "The following token must start in Area A: FD")
          .length > 0,
    );

    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(
      diagnostics.length,
      2,
      "got: " + JSON.stringify(diagnostics),
    );

    assert.ok(
      () =>
        vscode.languages
          .getDiagnostics(editor.document.uri)
          .map((d) => d.message)
          .filter((m) => m === "The following token must start in Area A: FD")
          .length === 1,
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC250107 Test Area A, check DIVISION and paragraph name warnings", async () => {
    const editor = await helper.showDocument("USER1.cbl");
    await helper.insertString(editor, pos(13, 0), "      ");
    let diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(
      diagnostics[0].message,
      "The following token must start in Area A: Identification",
    );

    await helper.insertString(editor, pos(16, 0), "      ");
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 2);
    assert.strictEqual(diagnostics.length, 2);

    helper.hasDiagnosticMatches(
      editor.document.uri,
      (d) => d.message === "The following token must start in Area A: Data",
    );

    await helper.insertString(editor, pos(26, 0), "      ");
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 3);
    assert.strictEqual(diagnostics.length, 3);

    helper.hasDiagnosticMatches(
      editor.document.uri,
      (d) =>
        d.message === "The following token must start in Area A: Procedure",
    );

    await helper.insertString(editor, pos(31, 0), "      ");
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 4);
    assert.strictEqual(diagnostics.length, 4);

    helper.hasDiagnosticMatches(
      editor.document.uri,
      (d) =>
        d.message ===
        "The following token must start in Area A: 100-Print-User",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC314771: Support INCLUDE in EXEC SQL to build extended document", async () => {
    const editor = await helper.showDocument("ADSORT.cbl");
    await helper.deleteLine(editor, 58);
    await helper.insertString(
      editor,
      pos(36, 11),
      "           EXEC SQL SQL_STATEMENT END-EXEC.",
    );
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(36, 20), pos(36, 33)),
    );
    const syntaxErrors = diagnostics.filter((diag) =>
      diag.message.startsWith("Syntax error on 'SQL_STATEMENT'"),
    );
    assert.strictEqual(syntaxErrors.length, 1);
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test.skip("TC335192 COPY MAID scenarios", async () => {
    const editor = await helper.showDocument("cobol-dc/ABCD.cbl");
    let diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      0,
    );
    assert.strictEqual(diagnostics.length, 0);

    await helper.deleteLine(editor, 18);
    await helper.insertString(editor, pos(18, 0), "       COPY MAID ABCD.");
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 1);
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(diagnostics[0].message, "Variable ABCD1 is not defined");
  });
  // .timeout(helper.TEST_TIMEOUT)
  // .slow(1000);

  test("Show errors only for opened files", async () => {
    // Open program with error inside a copybook
    const editor = await helper.showDocument("TESTCPY1.cbl");

    const copybookPath = path.join("testing", "COPYE");
    const copybookUri = await helper.getUri(copybookPath);

    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(
      diagnostics.length,
      1,
      "got: " + JSON.stringify(diagnostics),
    );
    assert.ok(
      diagnostics.some((d) => d.message === "Errors inside the copybook"),
    );

    // No diagnostic for copybook so far
    let copyDiagnostics = vscode.languages.getDiagnostics(copybookUri);
    assert.strictEqual(copyDiagnostics.length, 0);

    // Open copybook with an error
    await helper.showDocument(copybookPath);

    copyDiagnostics = await helper.waitForDiagnosticCount(copybookUri, 1);
    assert.strictEqual(
      copyDiagnostics.length,
      1,
      "got: " + JSON.stringify(diagnostics),
    );
    assert.strictEqual(
      copyDiagnostics[0].message,
      'A period was assumed before "VvvALUE".',
      copyDiagnostics[0].message,
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("Show transition copybook errors", async () => {
    // Open program with error inside a copybook
    const editor = await helper.showDocument("TESTCPY2.cbl");
    const diagnostic = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(diagnostic.length, 1);

    // Open copybook with an error
    const editorCopy = await helper.showDocument("testing/COPYC");
    const diagnosticCopy = await helper.waitForDiagnosticCount(
      editorCopy.document.uri,
      1,
    );
    assert.strictEqual(
      diagnosticCopy.length,
      1,
      "got: " + JSON.stringify(diagnosticCopy),
    );
    assert.strictEqual(
      diagnosticCopy[0].message,
      "Errors inside the copybook",
      "Test: Show transition copybook errors",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("Diagnostics are updated for related files in accordance with the open/close files", async () => {
    // Open program which introduces error inside a copybook
    const editor = await helper.showDocument("DIAGNOSTIC_TEST_B.CBL");

    const diagnostic = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.ok(
      diagnostic.some((d) => d.message === "Errors inside the copybook"),
    );

    //open copybook
    const copybookPath = "testing/DIAGNOS.CPY";
    let editorCopy = await helper.showDocument(copybookPath);

    let copybookDiag = await helper.waitForDiagnosticCount(
      editorCopy.document.uri,
      1,
    );
    assert.strictEqual(
      copybookDiag.length,
      1,
      "got: " + JSON.stringify(copybookDiag),
    );
    assert.strictEqual(copybookDiag[0].message, "Extraneous input 'D'");

    // open a prgram without any issues (diagnostics)
    await helper.showDocument("DIAGNOSTIC_TEST_A.CBL");
    await helper.sleep(100);

    // assert diagnostics doesn't change
    assert.strictEqual(
      vscode.languages.getDiagnostics(editorCopy.document.uri)[0].message,
      "Extraneous input 'D'",
    );

    assert.ok(
      diagnostic.some((d) => d.message === "Errors inside the copybook"),
    );

    // close the DIAGNOSTIC_TEST_B, which is source of all errors
    await helper.showDocument("DIAGNOSTIC_TEST_B.CBL");
    await helper.closeActiveEditor();

    copybookDiag = await helper.waitForDiagnosticCount(
      editorCopy.document.uri,
      0,
    );

    // expect no diagnostics for copybook
    assert.strictEqual(copybookDiag.length, 0);

    await helper.closeAllEditors();

    // Open 2 similar program, which introduces same issue as same location and same message
    await helper.showDocument("DIAGNOSTIC_TEST_B.CBL");
    await helper.showDocument("DIAGNOSTIC_TEST_C.CBL");
    editorCopy = await helper.showDocument(copybookPath);

    copybookDiag = await helper.waitForDiagnosticCount(
      editorCopy.document.uri,
      2,
    );

    // closing active editor would remove the diagnostics for one of the file
    await helper.showDocument("DIAGNOSTIC_TEST_C.CBL");
    await helper.closeActiveEditor();
    editorCopy = await helper.showDocument(copybookPath);
    copybookDiag = await helper.waitForDiagnosticCount(
      editorCopy.document.uri,
      1,
    );
    assert.equal(copybookDiag.length, 1);
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test(
    "TC314993: TITLE Statement is allowed before ID DIVISION" +
      "TC315392: PROGRAM-ID Check Is Not Case Sensitive",
    async () => {
      const extSrcPath = path.join("TEST_TITLE.CBL");
      const editor = await helper.showDocument(extSrcPath);
      const diagnostics = await helper.waitForDiagnosticCount(
        editor.document.uri,
        1,
      );
      assert.strictEqual(diagnostics.length, 1);
      const message = diagnostics[0].message;
      assert.match(message, /^Variable ABC-ID is not defined/);
    },
  )
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC288730: Underscore a copy statement if its copybook contains error", async () => {
    const editor = await helper.showDocument(path.join("TEST8.CBL"));
    await helper.deleteLine(editor, 12);
    const extSrcPath = path.join("testing", "REPLERR");
    await helper.showDocument(extSrcPath);
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(18, 11), pos(18, 24)),
    );
  });

  test("TC247997: Info message for copybooks cannot be downloaded", async () => {
    const editor = await helper.showDocument(path.join("USERC1F.cbl"));
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length > 1,
    );
    helper.hasDiagnosticMatches(
      editor.document.uri,
      (d) => d.message === "BOOK3: Copybook not found",
    );
  });

  test("No info message for missing copybooks if diagnostics analysis mode is BASIC", async () => {
    await helper.updateConfig("low_severity_settings.json");
    const editor = await helper.showDocument(path.join("USERC1F.cbl"));
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
  });
});
