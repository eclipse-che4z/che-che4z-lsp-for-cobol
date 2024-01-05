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
    await helper.waitForDiagnostics(editor.document.uri);
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

    assert.strictEqual(d1.message, "Syntax error on 'HELLO-WORLD'");
    helper.assertRangeIsEqual(d1.range, range(pos(14, 20), pos(14, 31)));
  });

  test("TC152050, TC152053: Error case - file has semantic errors and are marked with detailed hints", async () => {
    await helper.showDocument("REPLACING.CBL");
    const editor = helper.get_editor("REPLACING.CBL");
    await helper.waitForDiagnostics(editor.document.uri);
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
    await helper.waitForDiagnostics(editor.document.uri);
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(34, 11), pos(34, 51)),
    );
    assert.strictEqual(diagnostics[0].message, "Invalid CICS EXEC block");
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test.skip("TC312753 Check EXEC CICS allows free arguments order", async () => {
    await helper.showDocument("ADSORT.cbl");
    let editor = helper.get_editor("ADSORT.cbl");
    await helper.deleteLine(editor, 58);
    await helper.insertString(
      editor,
      pos(39, 0),
      "           EXEC CICS\n" +
        "               SEN MAP('DETAIL') MAPSET(MODULE-NAME-1)    ERASE\n" +
        "           END-EXEC.",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
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
    editor = helper.get_editor("ADSORT.cbl");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
  });
  // .timeout(helper.TEST_TIMEOUT)
  // .slow(1000);

  test("TC312745 Error check", async () => {
    await helper.showDocument("ADSORT.cbl");
    let editor = helper.get_editor("ADSORT.cbl");
    await helper.deleteLine(editor, 58);
    await helper.insertString(
      editor,
      pos(58, 0),
      "           EXEC CICS XCTL123 PROGRAM (XCTL1) END-EXEC.",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(58, 21), pos(58, 28)),
    );
    assert.ok(diagnostics[0].message.includes("Extraneous input 'XCTL123'"));
    await helper.deleteLine(editor, 58);
    await helper.insertString(
      editor,
      pos(58, 0),
      "           EXEC CICS XCTL PROGRAM (XCTL1) END-EXEC.",
    );
    editor = helper.get_editor("ADSORT.cbl");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC312738 CICS variables and paragraphs support", async () => {
    await helper.showDocument("ADSORT.cbl");
    let editor = helper.get_editor("ADSORT.cbl");
    await helper.waitFor(async () => {
      helper.sleep(100);
      const result: any[] = await vscode.commands.executeCommand(
        "vscode.executeDefinitionProvider",
        editor.document.uri,
        pos(58, 36),
      );
      return result.length > 0;
    });
    const result: any[] = await vscode.commands.executeCommand(
      "vscode.executeDefinitionProvider",
      editor.document.uri,
      pos(58, 36),
    );
    assert.strictEqual(
      result.length,
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
    await helper.showDocument("ADSORT.cbl");
    let editor = helper.get_editor("ADSORT.cbl");
    await helper.insertString(
      editor,
      pos(28, 0),
      "       88  CICS VALUE 'CICS '",
    );
    await helper.waitForDiagnostics(editor.document.uri);
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(28, 22), pos(28, 29)),
    );
    assert.ok(diagnostics[0].message.includes("Missing token"));
    await helper.deleteLine(editor, 28);
    await helper.insertString(
      editor,
      pos(28, 0),
      "       88  CICS VALUE 'CICS '.",
    );
    editor = helper.get_editor("ADSORT.cbl");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC266094 Underline the entire incorrect variable structure", async () => {
    await helper.showDocument("VAR.cbl");
    let editor = helper.get_editor("VAR.cbl");
    await helper.waitForDiagnostics(editor.document.uri);
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
    await helper.waitForDiagnostics(editor.document.uri);
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
      await helper.waitForDiagnostics(editor.document.uri);
      diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
      assert.strictEqual(diagnostics.length, 1);
      assert.ok(diagnostics[0].message.includes("Syntax error on 'COPY'"));

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
      assert.ok(
        d0 &&
          d0.source &&
          d0.source.includes("COBOL Language Support (copybook)"),
      );

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
    await helper.waitForDiagnostics(editor.document.uri);
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
    await helper.showDocument("USER1.cbl");
    const editor = helper.get_editor("USER1.cbl");
    await editor.edit((edit) => edit.delete(range(pos(32, 0), pos(32, 3))));
    await helper.waitForDiagnostics(editor.document.uri);
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(
      diagnostics[0].message,
      "The following token must start in Area B: Move",
    );

    await editor.edit((edit) => {
      edit.delete(range(pos(41, 0), pos(41, 3)));
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
    await helper.waitForDiagnostics(editor.document.uri);
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
    await helper.waitForDiagnostics(editor.document.uri);
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 3);
    assert.strictEqual(
      diagnostics[2].message,
      "The following token must start in Area A: Procedure",
    );

    await helper.insertString(editor, pos(31, 0), "      ");
    await helper.waitForDiagnostics(editor.document.uri);
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 4);
    assert.strictEqual(
      diagnostics[3].message,
      "The following token must start in Area A: 100-Print-User",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC314771: Support INCLUDE in EXEC SQL to build extended document", async () => {
    const extSrcPath = path.join("ADSORT.cbl");
    const diagPromise = helper.waitForDiagnosticsChange(extSrcPath);
    await helper.showDocument(extSrcPath);
    let editor = helper.get_editor("ADSORT.cbl");
    await helper.deleteLine(editor, 58);
    await helper.insertString(
      editor,
      pos(36, 11),
      "           EXEC SQL SQL_STATEMENT END-EXEC.",
    );
    const diagnostics = await diagPromise;
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
    await helper.showDocument("cobol-dc/ABCD.cbl");
    let editor = helper.get_editor("cobol-dc/ABCD.cbl");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
      500,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);

    await helper.deleteLine(editor, 18);
    await helper.insertString(editor, pos(18, 0), "       COPY MAID ABCD.");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(diagnostics[0].message, "Variable ABCD1 is not defined");
  });
  // .timeout(helper.TEST_TIMEOUT)
  // .slow(1000);

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
      "Extraneous input 'VvvALUE'",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("Show transition copybook errors", async () => {
    // Open program with error inside a copybook
    await helper.showDocument("TESTCPY2.cbl");
    const copybookPath = path.join("testing", "COPYC");
    const copybookUri = await helper.getUri(copybookPath);

    // Open copybook with an error
    await helper.showDocument(copybookPath);
    await helper.waitForDiagnostics(copybookUri);
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

  test("Diagnostics are updated for related files in accordance with the open/close files", async () => {
    // Open program which introduces error inside a copybook
    await helper.showDocument("DIAGNOSTIC_TEST_B.CBL");
    const prog2Uri = await helper.getUri("DIAGNOSTIC_TEST_B.CBL");

    await helper.waitFor(
      () => vscode.languages.getDiagnostics(prog2Uri).length === 1,
    );
    assert.strictEqual(
      vscode.languages.getDiagnostics(prog2Uri)[0].message,
      "Errors inside the copybook",
    );

    //open copybook
    const copybookPath = path.join("testing", "DIAGNOS.CPY");
    await helper.showDocument(copybookPath);
    const copybookUri = await helper.getUri(copybookPath);

    await helper.waitFor(
      () => vscode.languages.getDiagnostics(copybookUri).length === 1,
    );

    const copybookDiag = vscode.languages.getDiagnostics(copybookUri);
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
      vscode.languages.getDiagnostics(copybookUri)[0].message,
      "Extraneous input 'D'",
    );
    assert.strictEqual(
      vscode.languages.getDiagnostics(prog2Uri)[0].message,
      "Errors inside the copybook",
    );

    // close the DIAGNOSTIC_TEST_B, which is source of all errors
    await helper.showDocument("DIAGNOSTIC_TEST_B.CBL");
    await helper.closeActiveEditor();

    await helper.waitFor(
      () => vscode.languages.getDiagnostics(copybookUri).length === 0,
    );

    // expect no diagnostics for copybook
    assert.strictEqual(vscode.languages.getDiagnostics(copybookUri).length, 0);

    await helper.closeAllEditors();

    // Open 2 similar program, which introduces same issue as same location and same message
    await helper.showDocument("DIAGNOSTIC_TEST_B.CBL");
    await helper.showDocument("DIAGNOSTIC_TEST_C.CBL");
    await helper.showDocument(copybookPath);

    await helper.waitFor(
      () => vscode.languages.getDiagnostics(copybookUri).length === 2,
    );

    // closing active editor would remove the diagnostics for one of the file
    await helper.showDocument("DIAGNOSTIC_TEST_C.CBL");
    await helper.closeActiveEditor();
    await helper.showDocument(copybookPath);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(copybookUri).length === 1,
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test(
    "TC314993: TITLE Statement is allowed before ID DIVISION" +
      "TC315392: PROGRAM-ID Check Is Not Case Sensitive",
    async () => {
      const extSrcPath = path.join("TEST_TITLE.CBL");
      const diagPromise = helper.waitForDiagnosticsChange(extSrcPath);
      await helper.showDocument(extSrcPath);
      const diagnostics = await diagPromise;
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
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length > 1,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
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
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    const message = diagnostics[0].message;
    assert.match(message, /^BOOK3: Copybook not found/);
  });
});
