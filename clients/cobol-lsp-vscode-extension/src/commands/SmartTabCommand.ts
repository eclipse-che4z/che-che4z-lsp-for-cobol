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
import { ProfileService } from "../services/ProfileService";

const COBOL_SECTIONS_DEFINITION: number[] = [6, 7, 11, 72, 80];

/**
 * Execute a smart tab command
 */
export function executeSmartTab() {
    const editor = vscode.window.activeTextEditor;
    if (editor == null) {
        return;
    }

    if (editor.selection.isEmpty) {
        const position = editor.selection.active;
        const textLine = editor.document.lineAt(position.line);
        const lineSize = textLine.text.length;

        const nextPosition = getNextPosition(editor, position.character);
        if (nextPosition > lineSize) {
            navigateTo(editor, position.line, lineSize);
            insertText(x => generateSpaces(nextPosition - lineSize)); 
        }
        navigateTo(editor, position.line, nextPosition);
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
 * Insert a text to the current position
 * @param getText function that returns a text to insert
 * @param i is the index of the current character
 */
function insertText(getText: (i:number) => string, i: number = 0) {
    let editor = vscode.window.activeTextEditor;
    let sels = editor.selections;

    if (i > 0)
    {
        sels[i - 1] = new vscode.Selection(sels[i - 1].end, sels[i - 1].end);
        editor.selections = sels; // required or the selection updates will be ignored
    }

    if (i < 0 || i >= sels.length) { 
        return; 
    }

    editor.edit(edit => edit.replace(sels[i], getText(i))).then(x => {
        insertText(getText, i + 1);
    });
}

/**
 * Generate a string with spaces
 * @param size is the size of a string
 * @returns generated string
 */
function generateSpaces(size: number): string {
    let result:string = "";
    for (let i = 0; i < size; i++) {
        result += " ";
    }
    return result;
}

/**
 * Return next predefined tab position
 * @param character is the current cursor position in the line
 */
function getNextPosition(editor: vscode.TextEditor, character: number) {

    if (ProfileService.isCobolProgram(editor.document.uri.path)) {
        for (let i = 0; i < COBOL_SECTIONS_DEFINITION.length; i++) {
            if (character < COBOL_SECTIONS_DEFINITION[i]) {
                return COBOL_SECTIONS_DEFINITION[i];
            }
        }
    }
    return character + (editor.options.tabSize === null ? 4 : editor.options.tabSize as number);
}
