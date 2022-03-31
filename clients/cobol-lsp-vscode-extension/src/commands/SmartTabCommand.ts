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
import { Selection } from "vscode";
import { PUNCH_CARD } from "../constants";

const SMART_TAB_COMMAND: string = "cobol-lsp.smart-tab";
const SMART_OUTDENT_COMMAND: string = "cobol-lsp.smart-outdent";
const TAB_SPACES: number = 4;

/**
 * Class provides bind-to-command binding functionality
 */
abstract class SmartCommandProvider {
    /**
     * Constructor
     * @param context is a extension context
     * @param cobolCommandName is a name for cobol extension command
     */
    public constructor(private context: vscode.ExtensionContext, private cobolCommandName: string) {
    }

    /**
     * Initialize command provider
     */
    public init() {
        this.context.subscriptions.push(vscode.commands.registerTextEditorCommand(this.cobolCommandName, 
            (editor: vscode.TextEditor, edit: vscode.TextEditorEdit, ...args: any[]) => {
                this.execute(editor, edit, args);
            }));
    }

    /**
     * Execute command functinality
     * @param editor is a vscode text editor
     * @param edit is a text edit object
     * @param args is a command arguments
     */
    public abstract execute(editor: vscode.TextEditor, edit: vscode.TextEditorEdit, args: any[]);
}

class SmartTabCommandProvider extends SmartCommandProvider {
    public execute(editor: vscode.TextEditor, edit: vscode.TextEditorEdit) {
        const newSelections: Selection[] = new Array();

        for (let selection of editor.selections) {
            const position = selection.active;
            let column = findNextSolidPosition(editor, position);
            if (column === -1) {
                column = position.character;
                const nextPosition = getNextPosition(editor, column);  
                const lineLen = getCurrentLine(editor, position.line).length;      
                if (lineLen < nextPosition) {
                    const insertSize = nextPosition - lineLen;
                    edit.insert(position, ' '.repeat(insertSize));
                }                    
                column = nextPosition;
            } else {
                const nextPosition = getNextPosition(editor, column);
                const insertSize = nextPosition - column;
                edit.insert(position, ' '.repeat(insertSize));
                column = nextPosition - insertSize;
            }
            const newPosition: vscode.Position = new vscode.Position(position.line, column);
            newSelections.push(new vscode.Selection(newPosition, newPosition));
        }
        editor.selections = newSelections;
        vscode.commands.executeCommand('acceptSelectedSuggestion');
    }
}

class SmartOutdentCommandProvider extends SmartCommandProvider {
    public execute(editor: vscode.TextEditor, edit: vscode.TextEditorEdit) {
        const newSelections: Selection[] = new Array();

        for (let selection of editor.selections) {
            const position = selection.active;
    
            let charPosition = this.findSolidCharPosition(editor, position);
            if (charPosition === 0) {
                return;
            }
            let prevPosition = getPrevPosition(editor, charPosition);
            if (this.onlySpaces(getCurrentLine(editor, position.line), prevPosition, charPosition)) {
                edit.delete(new vscode.Range(new vscode.Position(position.line, prevPosition), new vscode.Position(position.line, charPosition)));
            } else {
                let prevSolidPosition = this.findPrevSolidPosition(editor, new vscode.Position(position.line, charPosition - 1));
                let removeSize = Math.max(0, Math.min(charPosition - prevSolidPosition - 1, TAB_SPACES));
                edit.delete(new vscode.Range(new vscode.Position(position.line, charPosition - removeSize), new vscode.Position(position.line, charPosition)));
                prevPosition = charPosition - removeSize;
            }
            const newPosition: vscode.Position = new vscode.Position(position.line, prevPosition);
            newSelections.push(new vscode.Selection(newPosition, newPosition));
        }
        editor.selections = newSelections;    
    }

    private findSolidCharPosition(editor: vscode.TextEditor, position: vscode.Position) {
        let result = 0;
        if (this.isCurrentSpace(editor, position)) {
            result = findNextSolidPosition(editor, position);
        } else {
            result = this.findPrevSolidPosition(editor, position);
        }
        if (result === -1) {
            result = position.character;
        }
        return result;
    }

    private onlySpaces(text: string, start: number, end: number): boolean {
        for (let i = start; i < end; i++) {
            if (text.charAt(i) !== ' ') {
                return false;
            }
        }
        return true;
    }

    private isCurrentSpace(editor: vscode.TextEditor, position: vscode.Position) {
        const text = getCurrentLine(editor, position.line)
        return text.charAt(position.character) == ' ';
    }

    private findPrevSolidPosition(editor: vscode.TextEditor, position: vscode.Position): number {
        const text = getCurrentLine(editor, position.line)
        for (let i = position.character; i >=0; i--) {
            if (text[i] !== ' ') {
                return i;
            }
        }
        return 0;
    }
}

/**
 * Initialize smart tab functionality
 * @param context 
 */
export function initSmartTab(context: vscode.ExtensionContext) {
    new SmartTabCommandProvider(context, SMART_TAB_COMMAND).init();
    new SmartOutdentCommandProvider(context, SMART_OUTDENT_COMMAND).init();
}

/**
 * Find first non-space character from the current cursor position
 * @param editor is a vscode text editor
 * @param position is a cursor position
 * @returns a character number with not space symbol
 */
function findNextSolidPosition(editor: vscode.TextEditor, position: vscode.Position): number {
    const text = getCurrentLine(editor, position.line)
    for (let i = position.character; i < text.length; i++) {
        if (text[i] !== ' ') {
            return i;
        }
    }
    return -1;
}


/**
 * Retrieve text line for the specified line number
 * @param editor is a vscode text editor
 * @param line is a line number
 * @returns a text string for the line number
 */
function getCurrentLine(editor: vscode.TextEditor, line: number): string {
    const textLine: vscode.TextLine = editor.document.lineAt(line);
    return textLine.text;
}

/**
 * Calculate next column predefined position
 * @param character is the current cursor position in the line
 * @return next column predefined position
 */
function getNextPosition(editor: vscode.TextEditor, character: number): number {
    for (const item in PUNCH_CARD) {
        if (character < Number(item)) {
            return Number(item);
        }
    }
    return character;
}

/**
 * Calculate previous column predefined position
 * @param character is the current cursor position in the line
 * @return previous predefined position
 */
 function getPrevPosition(editor: vscode.TextEditor, character: number): number {
    let prev: number = 0;
    for (const item in PUNCH_CARD) {
        if (character <= Number(item)) {
            return prev;
        }
        prev = Number(item);
    }
    return character;
}
