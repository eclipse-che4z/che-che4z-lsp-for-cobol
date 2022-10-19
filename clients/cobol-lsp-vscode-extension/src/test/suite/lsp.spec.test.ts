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

import * as assert from 'assert';
import * as helper from './testHelper';
import * as vscode from "vscode";
import {getWorkspacePath, moveCursor, recursiveCopySync} from "./testHelper";
import * as path from 'path';

suite('Integration Test Suite', () => {
    const workspace_file = 'USER1.cbl';
    let editor: vscode.TextEditor;

    suiteSetup(async function () {
        this.timeout(30000);
        await helper.showDocument(workspace_file);
        helper.updateConfig('basic.json');
        editor = helper.get_editor(workspace_file);
        await helper.activate();
    });

    // open 'open' file, should be recognized as hlasm
    test('TC152048 Cobol file is recognized by LSP', async () => {
        // setting a language takes a while but shouldn't take longer than a second
        await helper.sleep(1000);
        assert.ok(editor.document.languageId === 'cobol');
    }).timeout(2000).slow(1000);

    test('TC152046 Nominal - check syntax Ok message', async () => {
        await helper.sleep(1000);
        const uri = vscode.window.activeTextEditor.document.uri;
        const diagnostics = vscode.languages.getDiagnostics(uri);
        assert.strictEqual(diagnostics.length, 0, "Checks that when opening Cobol file with correct syntax there is an appropriate message is shown");
    }).timeout(2000).slow(1000);

    test('TC152049 Navigate through definitions', async () => {
        vscode.commands.executeCommand('vscode.executeDefinitionProvider', editor.document.uri, new vscode.Position(28, 24)).then((result: any[]) => {
            assert.ok(result.length === 1
                && result[0].uri.fsPath === editor.document.fileName
                && result[0].range.start.line === 31
                && result[0].range.start.character === 7, 'Checks behavior of go to definition action');
        });
    }).timeout(2000).slow(1000);

    test('TC152080 Find all references from the word middle', async () => {
        vscode.commands.executeCommand('vscode.executeReferenceProvider', editor.document.uri, new vscode.Position(20, 15))
            .then((result: any[]) => {
                assert.ok(result.length === 3
                    && result[0].uri.fsPath === editor.document.fileName
                    && result[0].range.start.line === 20
                    && result[1].range.start.line === 34
                    && result[2].range.start.line === 42, 'Checks that LSP can find all references and navigate by them')
            });
    }).timeout(2000).slow(1000);

    test('TC152080 Find all references from the word begin', async () => {
        vscode.commands.executeCommand('vscode.executeReferenceProvider', editor.document.uri, new vscode.Position(20, 10))
            .then((result: any[]) => {
                assert.ok(result.length === 3
                    && result[0].uri.fsPath === editor.document.fileName
                    && result[0].range.start.line === 20
                    && result[1].range.start.line === 34
                    && result[2].range.start.line === 42, 'Checks that LSP can find all references and navigate by them');
            });
    }).timeout(2000).slow(1000);

    test('TC152047/ TC152052/ TC152051/ TC152050/ TC152053 Error case - file has syntax errors and semantic errors are marked and have detailed hints', async () => {
        await helper.showDocument("USER2.cbl");
        editor = helper.get_editor("USER2.cbl");
        await helper.sleep(2000);
        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 3);
        assert.ok(diagnostics.length === 3);
        assert.strictEqual(diagnostics[0].message, "Variable USER-CITY1 is not defined");
        helper.assertRangeIsEqual(diagnostics[0].range, new vscode.Range(new vscode.Position(39, 28), new vscode.Position(39, 38)));
        assert.strictEqual(diagnostics[1].message, "There is an issue with PROGRAM-ID paragraph");
        assert.strictEqual(diagnostics[1].severity, vscode.DiagnosticSeverity.Warning);
        helper.assertRangeIsEqual(diagnostics[1].range, new vscode.Range(new vscode.Position(49, 19), new vscode.Position(49, 30)));
        assert.strictEqual(diagnostics[2].message, "Syntax error on 'Program1-id' expected PROGRAM-ID");
        helper.assertRangeIsEqual(diagnostics[2].range, new vscode.Range(new vscode.Position(14, 7), new vscode.Position(14, 18)));
        assert.strictEqual(diagnostics[0].severity, diagnostics[2].severity);
        assert.strictEqual(diagnostics[2].severity, vscode.DiagnosticSeverity.Error, 'No syntax errors detected in USER2.cbl');
    }).timeout(5000).slow(1000);

    test('TC152054 Auto format of right trailing spaces', async () => {
        await helper.insertString(editor, new vscode.Position(34, 57), "        ");
        vscode.commands.executeCommand('vscode.executeFormatDocumentProvider', editor.document.uri, { tabSize: 4, insertSpaces: true })
        .then((result: any[]) => {
            helper.assertRangeIsEqual(result[0].range, new vscode.Range(new vscode.Position(34, 57),
                new vscode.Position(34, 65)));
            assert.strictEqual(result[0].newText, "");
        });
    }).timeout(3000).slow(1000);

    test('TC288736 error message for 80chars limit', async () => {
        await helper.showDocument("TEST.CBL");
        const editor = helper.get_editor("TEST.CBL");
        await helper.insertString(editor, new vscode.Position(22, 7), "oi3Bd5kC1f3nMFp0IWg62ZZgWMxHPJnuLWm4DqplZDzMIX69C6vjeL24YbobdQnoQsDenL35omljznHd0l1fP");
        await helper.sleep(1500);
        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 4);
        assert.strictEqual(diagnostics[0].message, "Source text cannot go past column 80");
        helper.assertRangeIsEqual(diagnostics[0].range,
            new vscode.Range(new vscode.Position(22, 80), new vscode.Position(22, 131)));

    }).timeout(4000).slow(1000);

    test("TC174655 Copybook - Nominal", async () => {
        await helper.showDocument("USERC1N1.cbl");
        let editor = helper.get_editor("USERC1N1.cbl");
        await helper.sleep(1000);
        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics[0].severity, vscode.DiagnosticSeverity.Error,
            'No syntax errors detected in USERC1N1.cbl');
    }).timeout(2000).slow(1000);

    test("TC174657: Copybook - not exist: no syntax ok message", async () => {
        await helper.showDocument("USERC1F.cbl");
        let editor = helper.get_editor("USERC1F.cbl");
        await helper.sleep(1000);
        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics[0].severity, vscode.DiagnosticSeverity.Error,
            'No syntax errors detected in USERC1F.cbl');
    }).timeout(2000).slow(1000);

    test("TC174658/TC174658 Copybook - not exist: error underlying and detailed hint", async () => {
        await helper.showDocument("USERC1F.cbl");
        let editor = helper.get_editor("USERC1F.cbl");
        await helper.sleep(1000);
        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 3);
        helper.assertRangeIsEqual(diagnostics[0].range,
            new vscode.Range(new vscode.Position(18, 12), new vscode.Position(18, 17)));
        assert.strictEqual(diagnostics[0].message, "BOOK3: Copybook not found");

    }).timeout(2000).slow(1000);

    test("TC174916/TC174917 Copybook - recursive error and detailed hint", async () => {
        await helper.showDocument("USERC1R.cbl");
        let editor = helper.get_editor("USERC1R.cbl");
        await helper.sleep(1000);
        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 5);
        helper.assertRangeIsEqual(diagnostics[0].range,
            new vscode.Range(new vscode.Position(18, 12), new vscode.Position(18, 18)));
        assert.strictEqual(diagnostics[0].message, "Recursive copybook declaration for: BOOK1R");

    }).timeout(2000).slow(1000);

    test("TC174932/TC174933 Copybook - invalid definition and hint", async () => {
        await helper.showDocument("USERC1N2.cbl");
        let editor = helper.get_editor("USERC1N2.cbl");
        await helper.sleep(1000);
        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 8);
        helper.assertRangeIsEqual(diagnostics[1].range,
            new vscode.Range(new vscode.Position(51, 38), new vscode.Position(51, 56)));
        assert.strictEqual(diagnostics[1].message, "Variable USER-PHONE-MOBILE1 is not defined");

    }).timeout(2000).slow(1000);

    test("TC312735 Check EXEC CICS is in Procedure Division", async () => {
        await helper.showDocument("ADSORT.cbl");
        let editor = helper.get_editor("ADSORT.cbl");
        await helper.sleep(1000);

        await helper.deleteLine(editor, 58);
        await helper.insertString(editor, new vscode.Position(34, 11), "           EXEC CICS XCTL PROGRAM (XCTL1) END-EXEC.");
        await helper.sleep(5000);

        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 2);
        helper.assertRangeIsEqual(diagnostics[0].range,
            new vscode.Range(new vscode.Position(34, 11), new vscode.Position(34, 15)));
        assert.strictEqual(diagnostics[0].message, "Missing token SQL at execSqlStatement");
    }).timeout(8000).slow(1000);

    test("TC266094 Underline the entire incorrect variable structure", async () => {
        await helper.showDocument("VAR.cbl");
        let editor = helper.get_editor("VAR.cbl");
        await helper.sleep(5000);

        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 2);
        helper.assertRangeIsEqual(diagnostics[0].range,
            new vscode.Range(new vscode.Position(22, 23), new vscode.Position(22, 43)));
        assert.strictEqual(diagnostics[0].message, "Variable CHILD1 is not defined");
        helper.assertRangeIsEqual(diagnostics[1].range,
            new vscode.Range(new vscode.Position(23, 23), new vscode.Position(23, 44)));
        assert.strictEqual(diagnostics[1].message, "Variable CHILD2 is not defined");
    }).timeout(7000).slow(1000);

    test("TC174952 Copybook - not exist, but dynamically appears", async () => {
        await helper.showDocument("VAR.cbl");
        let editor = helper.get_editor("VAR.cbl");
        await helper.sleep(6000);

        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 2);
        helper.assertRangeIsEqual(diagnostics[0].range,
            new vscode.Range(new vscode.Position(22, 23), new vscode.Position(22, 43)));
        assert.strictEqual(diagnostics[0].message, "Variable CHILD1 is not defined");
        helper.assertRangeIsEqual(diagnostics[1].range,
            new vscode.Range(new vscode.Position(23, 23), new vscode.Position(23, 44)));
        assert.strictEqual(diagnostics[1].message, "Variable CHILD2 is not defined");
    }).timeout(7000).slow(1000);

    test("Load resource file', () => {\n", async () => {
        await helper.showDocument("RES.cbl");
        let editor = helper.get_editor("RES.cbl");
        await helper.sleep(2000);
        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);

        assert.strictEqual(diagnostics.length, 1);
            assert.ok(diagnostics[0].message.includes( "Syntax error on 'FILE-CONTROsL"));
            helper.assertRangeIsEqual(diagnostics[0].range,
                new vscode.Range(new vscode.Position(5, 7), new vscode.Position(5, 20)));
    }).timeout(3000).slow(1000);

    test("TC174952 / TC174953 Copybook - definition not exist, but dynamically appears", async () => {
        await helper.showDocument("USERC1F.cbl");
        let editor = helper.get_editor("USERC1F.cbl");
        await helper.sleep(3000);
        let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        helper.assertRangeIsEqual(diagnostics[1].range,
            new vscode.Range(new vscode.Position(41, 29), new vscode.Position(41, 46)));
        assert.strictEqual(diagnostics[1].message, "Variable USER-PHONE-MOBILE is not defined");

        await editor.edit(edit => {
            edit.replace(
                new vscode.Range(new vscode.Position(18, 17), new vscode.Position(18, 18)),
                "T.");
        });
        await helper.sleep(3000);

        diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        for (const diagnostic of diagnostics) {
            assert.ok(!diagnostic.message.includes("Variable USER-PHONE-MOBILE is not defined"));
        }

    }).timeout(10000).slow(1000);

    test("'TC266074 LSP analysis for extended sources - basic scenario", async () => {
        const extSrcUser1FilePath = path.join(".c4z", ".extsrcs", "USER1.cbl");
        const user1FilePath = "USER1.cbl";
        helper.recursiveCopySync(
            path.join(getWorkspacePath(), user1FilePath),
            path.join(getWorkspacePath(), extSrcUser1FilePath));

        await helper.showDocument(extSrcUser1FilePath);
        let editor = helper.get_editor(extSrcUser1FilePath);
        await helper.insertString(editor, new vscode.Position(25, 0), "           COPY ABC.");

        let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 0);

        await editor.edit(edit => {
            edit.delete(
                new vscode.Range(new vscode.Position(25, 19),
                    new vscode.Position(25, 20)));
        });
        await helper.sleep(1500);
        diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 1);
        assert.ok(diagnostics[0].message.includes("Syntax error on 'COPY' expected"));

        await helper.insertString(editor, new vscode.Position(25, 20), "\n           Mov");
        await helper.sleep(1500);
        assert.strictEqual(vscode.languages.getDiagnostics(editor.document.uri).length, 1);

        await helper.showDocument("USER1.cbl");
        editor = helper.get_editor("USER1.cbl");
        await helper.insertString(editor, new vscode.Position(40, 0), "           COPY ABC.");
        await helper.sleep(1500);
        diagnostics = vscode.languages.getDiagnostics(editor.document.uri);

        assert.strictEqual(diagnostics.length, 1);
        assert.ok(diagnostics[0].message.includes("ABC: Copybook not found"));
        assert.ok(diagnostics[0].source.includes("COBOL Language Support (copybook)"));

        await helper.insertString(editor, new vscode.Position(40, 21), "\n           Mov");
        await helper.sleep(1500);
        diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 4);
        assert.ok(diagnostics[1].message.includes("A misspelled word, maybe you want to put MOVE"));
        await helper.closeAllEditors();
    }).timeout(15000).slow(1000);

    test("TC250107 Test Area A, check DIVISION and paragraph name warnings", async () => {
        await helper.showDocument("USER1.cbl");
        let editor = helper.get_editor("USER1.cbl");
        await helper.insertString(editor, new vscode.Position(13, 0), "      ");
        await helper.sleep(2500);
        let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 1);
        assert.strictEqual(diagnostics[0].message, "The following token must start in Area A: Identification");

        await helper.insertString(editor, new vscode.Position(16, 0), "      ");
        await helper.sleep(1500);
        diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 2);
        assert.strictEqual(diagnostics[1].message, "The following token must start in Area A: Data");

        await helper.insertString(editor, new vscode.Position(26, 0), "      ");
        await helper.sleep(1500);
        diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 3);
        assert.strictEqual(diagnostics[2].message, "The following token must start in Area A: Procedure");

        await helper.insertString(editor, new vscode.Position(31, 0), "      ");
        await helper.sleep(1500);
        diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 4);
        assert.strictEqual(diagnostics[3].message, "The following token must start in Area A: 100-Print-User");
        await helper.closeAllEditors();
    }).timeout(8000).slow(1000);

    test("TC250107 Test Area A, Check FD/SD level data", async () => {
        await helper.showDocument("USER1.cbl");
        let editor = helper.get_editor("USER1.cbl");
        await helper.insertString(editor, new vscode.Position(17, 0), "       FILE SECTION.\n");
        await helper.insertString(editor, new vscode.Position(18, 0), "           FD  TRANS-FILE-IN IS EXTERNAL.\n");
        await helper.sleep(2000);
        let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 2);
        assert.strictEqual(diagnostics[0].message, "The following token must start in Area A: FD");
        await helper.closeAllEditors();

    }).timeout(3000).slow(1000);

    test("TC250109 Test Area B", async () => {
        await helper.showDocument("USER1.cbl");
        const editor = helper.get_editor("USER1.cbl");
        await editor.edit(edit => {
            edit.replace(new vscode.Range(new vscode.Position(32, 0),
                            new vscode.Position(32, 3)), "");
        });
        await helper.sleep(1500);
        let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 1);
        assert.strictEqual(diagnostics[0].message, "The following token must start in Area B: Move");

        await editor.edit(edit => {
            edit.replace(new vscode.Range(new vscode.Position(41, 0),
                new vscode.Position(41, 3)), "");
        });
        await helper.sleep(1500);
        diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 2);
        assert.strictEqual(diagnostics[1].message, "The following token must start in Area B: Display");
        await helper.closeAllEditors();

    }).timeout(5000).slow(1000);

    test("TC250108 Test Program Name", async () => {
        await helper.showDocument("USER1.cbl");
        const editor = helper.get_editor("USER1.cbl");
        await editor.edit(edit => {
            edit.replace(new vscode.Range(new vscode.Position(48, 30),
                new vscode.Position(48, 32)), "1.");
        });
        await helper.sleep(1500);
        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.strictEqual(diagnostics.length, 1);
        assert.strictEqual(diagnostics[0].message, "Program-name must be identical to the program-name of the corresponding PROGRAM-ID paragraph: HELLO-WORLD");
        await helper.closeAllEditors();

    }).timeout(3000).slow(1000);

    test("TC247497 - Local Copybooks - check hidden folders under c4z", async () => {
        const extSrcPath = path.join(getWorkspacePath(), ".c4z", ".extsrcs");
        const extSrcUri = vscode.Uri.file(extSrcPath);
        const hiddenFolder = vscode.workspace.getWorkspaceFolder(extSrcUri);
        assert.ok(hiddenFolder !== undefined);

    }).timeout(1000).slow(1000);
});
