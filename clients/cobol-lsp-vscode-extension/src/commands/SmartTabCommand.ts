/*
 * Copyright (c) 2021 Broadcom.
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

import * as vscode from "vscode";
import { DEFAULT_TAB_SIZE, PUNCH_CARD } from "../constants";
import { ProfileService } from "../services/ProfileService";

const SMART_TAB_COMMAND_NAME: string = "cobol-lsp.smart-tab";
const BUILD_IN_TAB_COMMAND_NAME: string = "tab";

let TabCommandHolder: vscode.Disposable = null;
let ContextHolder: vscode.ExtensionContext = null;

/**
 * Initialize smart tab functionality
 * @param context 
 */
export function initSmartTab(context: vscode.ExtensionContext) {
    context.subscriptions.push(vscode.commands.registerTextEditorCommand(SMART_TAB_COMMAND_NAME, 
    (editor: vscode.TextEditor, edit: vscode.TextEditorEdit, ...args: any[]) => {
        executeSmartTab(editor, edit, args);
    }));

    ContextHolder = context;
    performBinding();
}

/**
 * Execute a smart tab command
 */
function executeSmartTab(editor: vscode.TextEditor, edit: vscode.TextEditorEdit, args: any[]) {
    if (ProfileService.isCobolProgram(editor.document.uri.path)) {
        const position = editor.selection.active;
        const textLine = editor.document.lineAt(position.line);
        const lineSize = textLine.text.length;

        const nextPosition = getNextPosition(editor, position.character);
        if (nextPosition > lineSize) {
            navigateTo(editor, position.line, lineSize);
            edit.insert(editor.selection.active, ' '.repeat(nextPosition - lineSize));
        }
        navigateTo(editor, position.line, nextPosition);
    } else {
        executeDefaultTab(args);
    }
}

/**
 * Move cursor of the editor to a needed position
 * @param editor is an opened editor
 * @param line of the needed position
 * @param character number of the needed position in the line
 */
function navigateTo(editor: vscode.TextEditor, line: number, character: number) {
    const newPosition: vscode.Position = new vscode.Position(line, character);
    editor.selections = [new vscode.Selection(newPosition, newPosition)];
}

/**
 * Calculate next predefined tab position
 * @param character is the current cursor position in the line
 * @return next predefined tab position
 */
function getNextPosition(editor: vscode.TextEditor, character: number): number {
    for (const item in PUNCH_CARD) {
        if (character < Number(item)) {
            return Number(item);
        }
    }
    return character + (editor.options.tabSize === null ? DEFAULT_TAB_SIZE : editor.options.tabSize as number);
}

/**
 * Unbind tab button handler
 */
function performUnbinding() {
    if (TabCommandHolder) {
        TabCommandHolder.dispose();
        TabCommandHolder = null;
    }
}

/**
 * Bind tab button handler
 */
function performBinding() {
    if (!TabCommandHolder) {
        const tabSubstitution = vscode.commands.registerTextEditorCommand(BUILD_IN_TAB_COMMAND_NAME, 
        (editor: vscode.TextEditor, edit: vscode.TextEditorEdit, ...args: any[]) => {
            vscode.commands.executeCommand(SMART_TAB_COMMAND_NAME);
        });
        TabCommandHolder = tabSubstitution;
        ContextHolder.subscriptions.push(tabSubstitution);
    }
}

/**
 * Call default tab button functionality
 * @param args command parameters
 */
async function executeDefaultTab(args: any[]) {
    performUnbinding();
    await vscode.commands.executeCommand(BUILD_IN_TAB_COMMAND_NAME, args);
    performBinding();
}
