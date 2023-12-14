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
  public constructor(
    private context: vscode.ExtensionContext,
    private cobolCommandName: string,
  ) {}

  /**
   * Initialize command provider
   */
  public init() {
    this.context.subscriptions.push(
      vscode.commands.registerTextEditorCommand(
        this.cobolCommandName,
        (
          editor: vscode.TextEditor,
          edit: vscode.TextEditorEdit,
          ...args: any[]
        ) => {
          this.execute(editor, edit, args);
        },
      ),
    );
  }

  /**
   * Execute command functinality
   * @param editor is a vscode text editor
   * @param edit is a text edit object
   * @param args is a command arguments
   */
  public abstract execute(
    editor: vscode.TextEditor,
    edit: vscode.TextEditorEdit,
    args: any[],
  ): void;
}

export class SmartTabCommandProvider extends SmartCommandProvider {
  public execute(editor: vscode.TextEditor, edit: vscode.TextEditorEdit) {
    let newSelections: Selection[] = new Array();
    const selections = getActualSelectionForTab(editor);
    for (let selection of selections.actualSelection) {
      const position = selection.active;
      if (
        !checkRangeLiesBetweenSelection(selections.rangeSelection, position)
      ) {
        handleIndividualTab(editor, position, edit, newSelections);
      }
    }
    const updatedRange = handleRangeSelection(
      selections.rangeSelection,
      editor,
      edit,
    );
    newSelections = newSelections.concat(updatedRange);
    editor.selections = newSelections;
    vscode.commands.executeCommand("acceptSelectedSuggestion");
  }
}

export class SmartOutdentCommandProvider extends SmartCommandProvider {
  public execute(editor: vscode.TextEditor, edit: vscode.TextEditorEdit) {
    let newSelections: Selection[] = new Array();
    const selections = getActualSelectionForTab(editor);
    for (let selection of selections.actualSelection) {
      const position = selection.active;
      if (
        !checkRangeLiesBetweenSelection(selections.rangeSelection, position)
      ) {
        this.handleIndividualSmartOutCommand(
          editor,
          edit,
          position,
          newSelections,
        );
      }
    }
    const updatedRange = this.handleRangeSelectionSmartOutCommand(
      editor,
      edit,
      selections.rangeSelection,
    );
    newSelections = newSelections.concat(updatedRange);
    if (newSelections.length > 0) {
      editor.selections = newSelections;
    }
  }

  private handleIndividualSmartOutCommand(
    editor: vscode.TextEditor,
    edit: vscode.TextEditorEdit,
    position: vscode.Position,
    newSelections: vscode.Selection[],
  ) {
    let charPosition = this.findSolidCharPosition(editor, position);
    if (charPosition === 0) {
      return;
    }
    let prevPosition = getPrevPosition(
      editor,
      charPosition,
      SettingsService.getTabSettings(),
      position.line,
    );
    if (
      this.onlySpaces(
        getCurrentLine(editor, position.line),
        prevPosition,
        charPosition,
      )
    ) {
      edit.delete(
        new vscode.Range(
          new vscode.Position(position.line, prevPosition),
          new vscode.Position(position.line, charPosition),
        ),
      );
    } else {
      let prevSolidPosition = this.findPrevSolidPosition(
        editor,
        new vscode.Position(position.line, charPosition - 1),
      );
      let removeSize = Math.max(
        0,
        Math.min(charPosition - prevSolidPosition - 1, getTabSize()),
      );
      edit.delete(
        new vscode.Range(
          new vscode.Position(position.line, charPosition - removeSize),
          new vscode.Position(position.line, charPosition),
        ),
      );
      prevPosition = charPosition - removeSize;
    }
    const newPosition: vscode.Position = new vscode.Position(
      position.line,
      prevPosition,
    );
    newSelections.push(new vscode.Selection(newPosition, newPosition));
  }

  private handleRangeSelectionSmartOutCommand(
    editor: vscode.TextEditor,
    edit: vscode.TextEditorEdit,
    rangeSelection: vscode.Selection[],
  ) {
    const result: Selection[] = new Array();
    for (let selection of rangeSelection) {
      let { lastShift, lastShifts } = this.getlastShift(editor);
      for (
        let lineNumber = selection.start.line;
        lineNumber <= selection.end.line;
        lineNumber++
      ) {
        const currentLine = editor.document.lineAt(lineNumber);
        if (lastShift) {
          let shift = lastShift.get(currentLine.lineNumber) || 0;
          while (
            (currentLine.firstNonWhitespaceCharacterIndex < shift ||
              shift < 0) &&
            lastShifts!.length > 0
          ) {
            lastShift = this.getlastShift(editor).lastShift;
            shift = lastShift!.get(currentLine.lineNumber) || 0;
          }
          edit.delete(
            new vscode.Range(
              new vscode.Position(
                currentLine.lineNumber,
                shift > currentLine.firstNonWhitespaceCharacterIndex
                  ? 0
                  : currentLine.firstNonWhitespaceCharacterIndex - shift,
              ),
              new vscode.Position(
                currentLine.lineNumber,
                currentLine.firstNonWhitespaceCharacterIndex,
              ),
            ),
          );
        } else {
          this.handleIndividualSmartOutCommand(
            editor,
            edit,
            new vscode.Position(
              currentLine.lineNumber,
              currentLine.firstNonWhitespaceCharacterIndex,
            ),
            result,
          );
        }
      }
      if (!lastShifts || lastShifts.length === 0) {
        RangeTabShiftStore.clearCache(editor.document.uri);
      }
      result.push(selection);
    }
    return result;
  }

  private getlastShift(editor: vscode.TextEditor) {
    const lastShifts = RangeTabShiftStore.getCachedShifts(editor.document.uri);
    const lastShift = lastShifts && lastShifts.pop();
    return { lastShift, lastShifts };
  }

  private findSolidCharPosition(
    editor: vscode.TextEditor,
    position: vscode.Position,
  ) {
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
      if (text.charAt(i) !== " ") {
        return false;
      }
    }
    return true;
  }

  private isCurrentSpace(editor: vscode.TextEditor, position: vscode.Position) {
    const text = getCurrentLine(editor, position.line);
    return text.charAt(position.character) == " ";
  }

  private findPrevSolidPosition(
    editor: vscode.TextEditor,
    position: vscode.Position,
  ): number {
    const text = getCurrentLine(editor, position.line);
    for (let i = position.character; i >= 0; i--) {
      if (text[i] !== " ") {
        return i;
      }
    }
    return 0;
  }
}

export class RangeTabShiftStore {
  private static store: Map<vscode.Uri, Map<number, number>[]> = new Map();
  static storeValue(key: vscode.Uri, val: Map<vscode.TextLine, number>) {
    const currentVal = this.store.get(key);
    const modifiedVal = new Map(
      Array.from(val).map(([key, val]) => [key.lineNumber, val]),
    );
    if (currentVal) {
      currentVal.push(modifiedVal);
    } else {
      this.store.set(key, [modifiedVal]);
    }
  }

  static clearCache(key: any) {
    this.store.delete(key);
  }

  static getCachedShifts(key: any) {
    return this.store.get(key);
  }

  static reset() {
    this.store = new Map();
  }
}

function handleIndividualTab(
  editor: vscode.TextEditor,
  position: vscode.Position,
  edit: vscode.TextEditorEdit,
  newSelections: vscode.Selection[],
) {
  let column = findNextSolidPosition(editor, position);
  if (column === -1) {
    column = position.character;
    const nextPosition = getNextPosition(
      editor,
      column,
      SettingsService.getTabSettings(),
      position.line,
    );
    const lineLen = getCurrentLine(editor, position.line).length;
    if (lineLen < nextPosition) {
      const insertSize = nextPosition - lineLen;
      edit.insert(position, " ".repeat(insertSize));
    }
    column = nextPosition;
  } else {
    const nextPosition = getNextPosition(
      editor,
      column,
      SettingsService.getTabSettings(),
      position.line,
    );
    const insertSize = nextPosition - column;
    if (insertSize > 0) {
      edit.insert(position, " ".repeat(insertSize));
      column = nextPosition - insertSize;
    }
  }
  const newPosition: vscode.Position = new vscode.Position(
    position.line,
    column,
  );
  newSelections.push(new vscode.Selection(newPosition, newPosition));
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
function findNextSolidPosition(
  editor: vscode.TextEditor,
  position: vscode.Position,
): number {
  const text = getCurrentLine(editor, position.line);
  for (let i = position.character; i < text.length; i++) {
    if (text[i] !== " ") {
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
function getNextPosition(
  editor: vscode.TextEditor,
  character: number,
  tabSettings: TabSettings,
  line: number,
): number {
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
export function getRule(
  editor: vscode.TextEditor,
  line: number,
  tabSettings: TabSettings,
) {
  let rule = tabSettings.defaultRule;
  if (line > 0 && tabSettings.rules.length > 0) {
    line -= 1;
    const regexps = tabSettings.rules.map((r) => new RegExp(r.regex!));

    while (line >= 0) {
      let str = getCurrentLine(editor, line);
      if (str.length > 6 && str.charAt(6) !== "*") {
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
function getPrevPosition(
  editor: vscode.TextEditor,
  character: number,
  tabSettings: TabSettings,
  line: number,
): number {
  const rule = getRule(editor, line, tabSettings);
  let prev: number = rule.stops[0];

  for (const stop of rule.stops) {
    if (character <= stop) {
      return prev;
    }
    prev = stop;
  }
  if (
    prev === rule.stops[rule.stops.length - 1] &&
    (prev > character - getTabSize() || character > rule.maxPosition)
  ) {
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
    const selectionStartLine = selection.start?.line
      ? selection.start.line
      : selection.active.line;
    const selectionEndLine = selection.end?.line
      ? selection.end.line
      : selection.active.line;
    const selectionActiveLine = selection.active.line;
    if (
      selectionActiveLine === selectionEndLine &&
      selectionEndLine === selectionStartLine
    ) {
      actualSelection.push(selection);
    } else {
      rangeSelection.push(selection);
      for (
        let lineNumber = selection.start.line;
        lineNumber <= selection.end.line;
        lineNumber++
      ) {
        const endCharPosition =
          lineNumber === selection.start.line ? selection.start.character : 0;
        const characterPosition = findNextSolidPosition(
          editor,
          new vscode.Position(lineNumber, endCharPosition),
        );
        if (characterPosition !== -1) {
          const selection: vscode.Selection = new vscode.Selection(
            new vscode.Position(lineNumber, characterPosition),
            new vscode.Position(lineNumber, characterPosition),
          );
          actualSelection.push(selection);
        }
      }
    }
  }
  return { actualSelection, rangeSelection };
}

function checkRangeLiesBetweenSelection(
  rangeSelection: vscode.Selection[],
  newPosition: vscode.Position,
): boolean {
  for (let se of rangeSelection) {
    if (se.start.line <= newPosition.line && se.end.line >= newPosition.line) {
      if (se.start.character > newPosition.character) {
        se = new vscode.Selection(
          new vscode.Position(se.start.line, newPosition.character),
          se.end,
        );
      }
      return true;
    }
  }
  return false;
}

function handleRangeSelection(
  rangeSelection: vscode.Selection[],
  editor: vscode.TextEditor,
  edit: vscode.TextEditorEdit,
) {
  const result: Selection[] = new Array();
  for (let selection of rangeSelection) {
    const expectedShiftMap = getCurrentPositionToNextPositionMap(
      selection,
      editor,
    );
    let shift = 0;
    let prevKey: vscode.TextLine;
    const finalShiftMap: Map<vscode.TextLine, number> = new Map();
    for (const key of expectedShiftMap.keys()) {
      if (
        prevKey! &&
        expectedShiftMap.get(prevKey) === expectedShiftMap.get(key)
      ) {
        shift =
          prevKey.firstNonWhitespaceCharacterIndex <
          key.firstNonWhitespaceCharacterIndex
            ? expectedShiftMap.get(prevKey)! -
              prevKey.firstNonWhitespaceCharacterIndex
            : expectedShiftMap.get(key)! - key.firstNonWhitespaceCharacterIndex;
        shift =
          shift > finalShiftMap.get(prevKey)!
            ? shift
            : finalShiftMap.get(prevKey)!;
        updateShiftMap(finalShiftMap, prevKey, shift);
        updateShiftMap(finalShiftMap, key, shift);
      } else {
        shift =
          key.firstNonWhitespaceCharacterIndex > expectedShiftMap.get(key)!
            ? 0
            : expectedShiftMap.get(key)! - key.firstNonWhitespaceCharacterIndex;
        updateShiftMap(finalShiftMap, key, shift);
      }
      prevKey = key;
    }
    finalShiftMap.forEach((val, key) => {
      edit.insert(
        new vscode.Position(
          key.lineNumber,
          key.firstNonWhitespaceCharacterIndex,
        ),
        " ".repeat(val),
      );
    });
    RangeTabShiftStore.storeValue(editor.document.uri, finalShiftMap);
    result.push(selection);
  }
  return result;
}

function getCurrentPositionToNextPositionMap(
  selection: vscode.Selection,
  editor: vscode.TextEditor,
) {
  const result: Map<vscode.TextLine, number> = new Map();
  for (
    let lineNumber = selection.start.line;
    lineNumber <= selection.end.line;
    lineNumber++
  ) {
    const currentLine = editor.document.lineAt(lineNumber);
    const column = currentLine.firstNonWhitespaceCharacterIndex;
    result.set(
      currentLine,
      getNextPosition(
        editor,
        column,
        SettingsService.getTabSettings(),
        currentLine.lineNumber,
      ),
    );
  }
  return result;
}

function updateShiftMap(
  finalShiftMap: Map<vscode.TextLine, number>,
  line: vscode.TextLine,
  shift: number,
) {
  if (line.firstNonWhitespaceCharacterIndex !== 71) {
    finalShiftMap.set(line, shift);
  }
}
