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

            const nextPosition = getNextPosition(editor, position.character);
            const insertSize = nextPosition - position.character;
            edit.insert(position, ' '.repeat(insertSize));
        }
        editor.selections = newSelections;
    }
}

class SmartOutdentCommandProvider extends SmartCommandProvider {
    public execute(editor: vscode.TextEditor, edit: vscode.TextEditorEdit) {
        const newSelections: Selection[] = new Array();

        for (let selection of editor.selections) {
            const position = selection.active;
    
            const firstPosition = this.findFirstPosition(editor, position.line);
            const prevPosition = getPrevPosition(editor, firstPosition);

            edit.delete(new vscode.Range(new vscode.Position(position.line, prevPosition), new vscode.Position(position.line, firstPosition)));
            const newPosition: vscode.Position = new vscode.Position(position.line, prevPosition);
            newSelections.push(new vscode.Selection(newPosition, newPosition));
        }
        editor.selections = newSelections;    
    }

    private findFirstPosition(editor: vscode.TextEditor, line: number): number {
        const textLine: vscode.TextLine = editor.document.lineAt(line);
        const text = textLine.text;
        for (let i = 0; i < text.length; i++) {
            if (text[i] !== ' ') {
                return i;
            }
        }
        return text.length - 1;
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
