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
import { SettingsService, TabSettings } from "../services/Settings";

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

export class SmartTabCommandProvider extends SmartCommandProvider {
    public execute(editor: vscode.TextEditor, edit: vscode.TextEditorEdit) {
        let newSelections: Selection[] = new Array();
        const selections = getActualSelectionForTab(editor);
        for (let selection of selections.actualSelection) {
            const position = selection.active;
            let column = findNextSolidPosition(editor, position);
            if (column === -1) {
                column = position.character;
                const nextPosition = getNextPosition(editor, column, SettingsService.getTabSettings(), position.line);
                const lineLen = getCurrentLine(editor, position.line).length;
                if (lineLen < nextPosition) {
                    const insertSize = nextPosition - lineLen;
                    edit.insert(position, ' '.repeat(insertSize));
                }
                column = nextPosition;
            } else {
                const nextPosition = getNextPosition(editor, column, SettingsService.getTabSettings(), position.line);
                const insertSize = nextPosition - column;
                if (insertSize > 0) {
                    edit.insert(position, ' '.repeat(insertSize));
                    column = nextPosition - insertSize;
                }
            }
            const newPosition: vscode.Position = new vscode.Position(position.line, column);
            if (!checkRangeLiesBetweenSelection(selections.rangeSelection, newPosition)) {
                newSelections.push(new vscode.Selection(newPosition, newPosition));
            }
        }
        newSelections = newSelections.concat(selections.rangeSelection);
        editor.selections = newSelections;
        vscode.commands.executeCommand('acceptSelectedSuggestion');
    }
}

class SmartOutdentCommandProvider extends SmartCommandProvider {
    public execute(editor: vscode.TextEditor, edit: vscode.TextEditorEdit) {
        let newSelections: Selection[] = new Array();
        const selections = getActualSelectionForTab(editor);
        for (let selection of selections.actualSelection) {
            const position = selection.active;

            let charPosition = this.findSolidCharPosition(editor, position);
            if (charPosition === 0) {
                return;
            }
            let prevPosition = getPrevPosition(editor, charPosition, SettingsService.getTabSettings(), position.line);
            if (this.onlySpaces(getCurrentLine(editor, position.line), prevPosition, charPosition)) {
                edit.delete(new vscode.Range(new vscode.Position(position.line, prevPosition), new vscode.Position(position.line, charPosition)));
            } else {
                let prevSolidPosition = this.findPrevSolidPosition(editor, new vscode.Position(position.line, charPosition - 1));
                let removeSize = Math.max(0, Math.min(charPosition - prevSolidPosition - 1, getTabSize()));
                edit.delete(new vscode.Range(new vscode.Position(position.line, charPosition - removeSize), new vscode.Position(position.line, charPosition)));
                prevPosition = charPosition - removeSize;
            }
            const newPosition: vscode.Position = new vscode.Position(position.line, prevPosition);
            if (!checkRangeLiesBetweenSelection(selections.rangeSelection, newPosition)) {
                newSelections.push(new vscode.Selection(newPosition, newPosition));
            }
        }
        newSelections = newSelections.concat(selections.rangeSelection);
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
        for (let i = position.character; i >= 0; i--) {
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
function getNextPosition(editor: vscode.TextEditor, character: number, tabSettings: TabSettings, line: number): number {
    const rule = getRule(editor, line, tabSettings);

    for (const stop of rule.stops) {
        if (character < stop) {
            return stop;
        }
    }
    if (rule.maxPosition > 0) {
        return Math.min(character + getTabSize(), rule.maxPosition);
    }
    return character + getTabSize();
}

/**
 * Founds a tab rule for current line
 * @param editor
 * @param line is a current line number for a cursor
 * @param tabSettings is a tab settings object
 * @returns the tab rule that needs to be appliend for this line
 */
export function getRule(editor: vscode.TextEditor, line: number, tabSettings: TabSettings) {
    let rule = tabSettings.defaultRule;
    if (line > 0 && tabSettings.rules.length > 0) {
        line -= 1;
        const regexps = tabSettings.rules.map(r => new RegExp(r.regex));

        while (line >= 0) {
            let str = getCurrentLine(editor, line);
            if (str.length > 6 && str.charAt(6) !== '*') {
                for (let i = 0; i < regexps.length; i++) {
                    if (regexps[i].test(str)) {
                        return tabSettings.rules[i];
                    }
                }
            }
            line -= 1;
        }
    }
    return rule;
}

/**
 * Calculate previous column predefined position
 * @param character is the current cursor position in the line
 * @return previous predefined position
 */
function getPrevPosition(editor: vscode.TextEditor, character: number, tabSettings: TabSettings, line: number): number {
    const rule = getRule(editor, line, tabSettings);
    let prev: number = rule.stops[0];

    for (const stop of rule.stops) {
        if (character <= stop) {
            return prev;
        }
        prev = stop;
    }
    if (prev === rule.stops[rule.stops.length - 1] && (prev > character - getTabSize() || character > rule.maxPosition)) {
        return prev;
    }
    return Math.max(character - getTabSize(), rule.stops[0]);
}

/**
 * Gets a tab size from the current opened editor or a default tab value
 * @returns a tab size
 */
function getTabSize(): number {
    let tabSize = vscode.window.activeTextEditor?.options?.tabSize;
    if (tabSize) {
        tabSize = +tabSize;
    } else {
        tabSize = 4;
    }
    if (tabSize === 0) {
        tabSize = 4;
    }
    return +tabSize;
}

/**
 *
 * @param editor is a vscode text editor
 * @returns array of selection for tabbing
 */
function getActualSelectionForTab(editor: vscode.TextEditor) {
    const actualSelection: vscode.Selection[] = [];
    const rangeSelection: vscode.Selection[] = [];
    for (let selection of editor.selections) {
        const selectionStartLine = selection.start?.line ? selection.start.line : selection.active.line;
        const selectionEndLine = selection.end?.line ? selection.end.line : selection.active.line;
        const selectionActiveLine = selection.active.line;
        if (selectionActiveLine === selectionEndLine && selectionEndLine === selectionStartLine) {
            actualSelection.push(selection);
        } else {
            rangeSelection.push(selection);
            for (let lineNumber = selection.start.line; lineNumber <= selection.end.line; lineNumber++) {
                const endCharPosition = lineNumber === selection.start.line ? selection.start.character : 0;
                const characterPosition = findNextSolidPosition(editor, new vscode.Position(lineNumber, endCharPosition));
                if (characterPosition !== -1) {
                    const selection: vscode.Selection = new vscode.Selection(
                        new vscode.Position(lineNumber, characterPosition),
                        new vscode.Position(lineNumber, characterPosition));
                    actualSelection.push(selection);
                }
            }
        }
    }
    return { actualSelection, rangeSelection };
}

function checkRangeLiesBetweenSelection(rangeSelection: vscode.Selection[], newPosition: vscode.Position): boolean {
    for (let se of rangeSelection) {
        if (se.start.line <= newPosition.line && se.end.line >= newPosition.line) {
            if (se.start.character > newPosition.character) {
                se = new vscode.Selection(new vscode.Position(se.start.line, newPosition.character), se.end);
            }
            return true;
        }
    }
    return false;
}

