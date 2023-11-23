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

import * as vscode from "vscode";
import { SelectionObject } from "../Helper";

/**
 * Change text (commenting/uncommenting) in active editor according to action type.
 *
 * @param actionType an item from CommentAction
 */
export function commentCommand(actionType: CommentAction) {
  const activeEditor = vscode.window.activeTextEditor;
  if (!activeEditor) {
    return;
  }
  new ToggleComments(activeEditor, actionType).doIt();
}

/**
 * Toggles comments in the active text editor based on selection and action type.
 */
export class ToggleComments {
  constructor(
    private textEditor: vscode.TextEditor,
    private actionType: CommentAction,
  ) {}

  /**
   * Do commenting/uncommenting.
   */
  public doIt() {
    const replacingList: SelectionObject[] = [];
    for (const selection of this.textEditor.selections)
      replacingList.push(this.handleSelection(selection));
    if (replacingList.length === 0) return;
    this.textEditor.edit((editBuilder) => {
      for (const replacing of replacingList)
        editBuilder.replace(replacing.selection, replacing.text);
    });
  }

  private handleSelection(selection: vscode.Selection): SelectionObject {
    const selectedLines = this.getSelectedLines(selection);
    const textLines = selectedLines
      .map((it) => it.text)
      .map(ensureIndicatorArea);
    const processedLines = textLines.map(this.evaluateAction(textLines));
    const lineSeparator =
      this.textEditor.document.eol === vscode.EndOfLine.LF ? "\n" : "\r\n";
    const selectionRange = new vscode.Range(
      new vscode.Position(selectedLines[0].range.start.line, 0),
      new vscode.Position(
        selectedLines[selectedLines.length - 1].range.end.line,
        selectedLines[selectedLines.length - 1].range.end.character,
      ),
    );
    return {
      selection: selectionRange,
      text: processedLines.join(lineSeparator),
    };
  }

  private evaluateAction(textLines: string[]) {
    switch (this.actionType) {
      case CommentAction.COMMENT:
        return commentLine;
      case CommentAction.UNCOMMENT:
        return uncommentLine;
      case CommentAction.TOGGLE:
        const allIsComment = textLines
          .map(getLineCommentStatus)
          .every(
            (it) =>
              it === LineCommentStatus.COMMENT ||
              it === LineCommentStatus.COMMENTED_TWICE,
          );
        return allIsComment ? uncommentLine : commentLine;
    }
  }

  private getSelectedLines(selection: vscode.Selection): vscode.TextLine[] {
    const selectedLines: vscode.TextLine[] = [];
    for (let i = selection.start.line; i <= selection.end.line; i++)
      selectedLines.push(this.textEditor.document.lineAt(i));
    return selectedLines;
  }
}

export enum CommentAction {
  COMMENT,
  UNCOMMENT,
  TOGGLE,
}

export enum LineCommentStatus {
  COMMENT,
  COMMENTED_TWICE,
  OTHER_TYPE, // the other type is used when we have something other than a comment in indicator area
  NON_COMMENT,
}

const CBL_REGEXP = new RegExp("^\\s{0,6}((CBL|PROCESS)\\s+.*)$", "i");

/**
 * Shift CBL/PROCESS to right if it is in sequence or indicator area.
 *
 * @param line a COBOL line
 */
export function ensureIndicatorArea(line: string): string {
  const match = CBL_REGEXP.exec(line);
  if (match) return "       " + match[1];
  return line;
}

/**
 * Evaluate type of COBOL line in terms of comment / non-comment.
 *
 * @param line a COBOL line
 */
export function getLineCommentStatus(line: string): LineCommentStatus {
  const indicatorArea = line.charAt(6);
  if (indicatorArea === "*" || indicatorArea === "/") {
    const afterIndicator = line.charAt(7);
    if (afterIndicator === "*" || afterIndicator === "/")
      return LineCommentStatus.COMMENTED_TWICE;
    return LineCommentStatus.COMMENT;
  }
  if (indicatorArea === " ") return LineCommentStatus.NON_COMMENT;
  return LineCommentStatus.OTHER_TYPE;
}

/**
 * Return commented line.
 *
 * @param line a COBOL line
 */
export function commentLine(line: string): string {
  const status = getLineCommentStatus(line);
  if (
    status === LineCommentStatus.COMMENT ||
    status === LineCommentStatus.COMMENTED_TWICE
  )
    return line.substring(0, 6) + "*" + line.substring(6);
  return setIndicatorTo(line, "*");
}

/**
 * Return uncommented line.
 *
 * @param line a COBOL line
 */
export function uncommentLine(line: string): string {
  const status = getLineCommentStatus(line);
  if (status === LineCommentStatus.COMMENT) return setIndicatorTo(line, " ");
  if (status === LineCommentStatus.COMMENTED_TWICE)
    return line.substring(0, 6) + line.substring(7);
  return line;
}

/**
 * Return a COBOL line with desired indicator. If the line is shorter than 7 character it will be extended.
 *
 * @param line a COBOL line
 * @param indicator a desired indicator
 */
export function setIndicatorTo(line: string, indicator: string): string {
  const sequenceArea = line.substring(0, 6);
  const tail = line.substring(7);
  return sequenceArea + " ".repeat(6 - sequenceArea.length) + indicator + tail;
}
