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
        assert.ok(editor.document.languageId === 'COBOL');
    }).timeout(10000).slow(4000);


    test('TC152046 Nominal - check syntax Ok message', async () => {
        await helper.sleep(1000);
        const uri = vscode.window.activeTextEditor.document.uri;
        const diagnostics = vscode.languages.getDiagnostics(uri);
        assert.strictEqual(diagnostics.length, 0, "Checks that when opening Cobol file with correct syntax there is an appropriate message is shown");
    }).timeout(10000).slow(4000);

    test('TC152049 Navigate through definitions', async () => {
        await helper.sleep(1000);
        const result: vscode.Location[] = await vscode.commands.executeCommand('vscode.executeDefinitionProvider', editor.document.uri, new vscode.Position(28, 24));
        await helper.sleep(2000);
        assert.ok(result.length == 1
            && result[0].uri.fsPath == editor.document.fileName
            && result[0].range.start.line == 31
            && result[0].range.start.character == 7, 'Checks behavior of go to definition action');
    }).timeout(10000).slow(4000);

    test('TC152080 Find all references from the word middle', async () => {
        const result: vscode.Location[] = await vscode.commands.executeCommand('vscode.executeReferenceProvider', editor.document.uri, new vscode.Position(20, 15));
        await helper.sleep(2000);
        assert.ok(result.length == 3
            && result[0].uri.fsPath == editor.document.fileName
            && result[0].range.start.line == 20
            && result[1].range.start.line == 34
            && result[2].range.start.line == 42, 'Checks that LSP can find all references and navigate by them');
    }).timeout(10000).slow(4000);

    test('TC152080 Find all references from the word begin', async () => {
        await helper.sleep(1000);
        const result: vscode.Location[] = await vscode.commands.executeCommand('vscode.executeReferenceProvider', editor.document.uri, new vscode.Position(20, 10));
        await helper.sleep(2000);
        assert.ok(result.length == 3
            && result[0].uri.fsPath == editor.document.fileName
            && result[0].range.start.line == 20
            && result[1].range.start.line == 34
            && result[2].range.start.line == 42, 'Checks that LSP can find all references and navigate by them');
    }).timeout(10000).slow(4000);


    test('TC152047/ TC152052/ TC152051/ TC152050/ TC152053 Error case - file has syntax errors and semantic errors are marked and have detailed hints', async () => {
        await helper.showDocument("USER2.cbl");
        editor = helper.get_editor("USER2.cbl");
        await helper.sleep(2000);
        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.ok(diagnostics.length == 3
            && diagnostics[0].message == "There is an issue with PROGRAM-ID paragraph"
            && diagnostics[0].severity == vscode.DiagnosticSeverity.Warning
            && helper.assertRangeIsEqual(diagnostics[0].range, new vscode.Range(new vscode.Position(49, 19), new vscode.Position(49, 30)))
            && diagnostics[1].message == "Variable USER-CITY1 is not defined"
            && helper.assertRangeIsEqual(diagnostics[1].range, new vscode.Range(new vscode.Position(39, 28), new vscode.Position(39, 38)))
            && diagnostics[2].message == "Syntax error on 'Program1-id' expected PROGRAM-ID"
            && helper.assertRangeIsEqual(diagnostics[2].range, new vscode.Range(new vscode.Position(14, 7), new vscode.Position(14, 18)))
            && diagnostics[1].severity == diagnostics[2].severity
            && diagnostics[2].severity == vscode.DiagnosticSeverity.Error, 'No syntax errors detected in USER2.cbl');
    }).timeout(10000).slow(4000);

    test('TC152054 Auto format of right trailing spaces', async () => {
        await helper.insertString(editor, new vscode.Position(34, 57), "        ");
        await helper.sleep(2000);
        const result: vscode.TextEdit[] = await vscode.commands.executeCommand('vscode.executeFormatDocumentProvider', editor.document.uri, { tabSize: 4, insertSpaces: true });
        assert.ok(helper.assertRangeIsEqual(result[0].range, new vscode.Range(new vscode.Position(34, 57), new vscode.Position(34, 65)))
            && result[0].newText == "",
            "Checks that auto format removed sight trailing spaces")
    }).timeout(10000).slow(4000);

    test('TC152058 Autocomplete functionality with snippets navigation', async () => {
        await helper.insertString(editor, new vscode.Position(40, 0), "           A");
        await vscode.commands.executeCommand('editor.action.triggerSuggest', editor.document.uri);
        await helper.sleep(2000);
        await helper.executeCommandMultipleTimes('selectNextSuggestion', 6)
        await vscode.commands.executeCommand('acceptSelectedSuggestion');
        await editor.edit(edit => edit.replace(editor.selection, "1"));
        await helper.sleep(2000);
        await vscode.commands.executeCommand("jumpToNextSnippetPlaceholder");
        await editor.edit(edit => edit.replace(editor.selection, "str"));
        await helper.sleep(2000);
        const text = editor.document.getText();
        const acceptedLine = text.split('\n')[40];
        assert.ok(acceptedLine.includes("ADD 1 TO str"),
            "Checks auto complete functionality, also with navigation by snippets");
    }).timeout(10000).slow(4000);

    test('TC288736 error message for 80chars limit', async () => {
        await helper.showDocument("TEST.CBL");
        editor = helper.get_editor("TEST.CBL");
        await helper.sleep(2000);
        await helper.insertString(editor, new vscode.Position(22, 7), "oi3Bd5kC1f3nMFp0IWg62ZZgWMxHPJnuLWm4DqplZDzMIX69C6vjeL24YbobdQnoQsDenL35omljznHd0l1fP");
        await helper.sleep(1000);
        const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
        assert.ok(diagnostics.length == 4
            && diagnostics[0].message == "Source text cannot go past column 80"
            && helper.assertRangeIsEqual(diagnostics[0].range, new vscode.Range(new vscode.Position(22, 80), new vscode.Position(22, 131))),
            "Source text can not go past column 80")

    }).timeout(10000).slow(4000);

})
