/*
 * Copyright (c) 2025 Broadcom.
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

export enum RenumberAction {
  LEFT,
  RIGHT,
}

const maxLines = 999999;

const leftStart = 0;
const leftEnd = 6;
const leftDigits = 6;
const leftMultiplier = 100;

const rightStart = 72;
const rightEnd = 80;
const rightMultiplier = 1000;
const rightDigits = 8;
/**
 * Renumber 1-7 or 73-80 columns in active editor.
 *
 * @param actionType RenumberAction
 */
export async function renumberLines(
  actionType: RenumberAction,
  activeEditor: vscode.TextEditor | undefined = vscode.window.activeTextEditor,
) {
  if (!activeEditor) {
    return;
  }
  await notificationHandler(
    renum,
    activeEditor,
    actionType,
    "Renumbering Sequential Lines...",
  );
}
/**
 * Remove sequential numbers at 1-7 or 73-80 columns in active editor.
 *
 * @param actionType RenumberAction
 */
export async function unNumberLines(
  actionType: RenumberAction,
  activeEditor: vscode.TextEditor | undefined = vscode.window.activeTextEditor,
) {
  if (!activeEditor) {
    return;
  }

  await notificationHandler(
    unNumber,
    activeEditor,
    actionType,
    "Removing Sequential Lines...",
  );
}

async function unNumber(
  textEditor: vscode.TextEditor,
  actionType: RenumberAction,
) {
  const { start, end } =
    actionType == RenumberAction.LEFT
      ? {
          start: leftStart,
          end: leftEnd,
        }
      : {
          start: rightStart,
          end: rightEnd,
        };

  await textEditor.edit((editBuilder) => {
    for (let i = 0; i < textEditor.document.lineCount; i++) {
      if (textEditor.document.lineAt(i).text.charAt(start) != "*") {
        const range = new vscode.Range(
          new vscode.Position(i, start),
          new vscode.Position(i, end),
        );
        editBuilder.replace(range, " ".repeat(6));
      }
    }
  });
}

async function renum(
  textEditor: vscode.TextEditor,
  actionType: RenumberAction,
) {
  const { start, end, multiplier, digits } =
    actionType == RenumberAction.LEFT
      ? {
          start: leftStart,
          end: leftEnd,
          multiplier: leftMultiplier,
          digits: leftDigits,
        }
      : {
          start: rightStart,
          end: rightEnd,
          multiplier: rightMultiplier,
          digits: rightDigits,
        };

  await textEditor.edit((editBuilder) => {
    const lineCount = textEditor.document.lineCount;
    if (lineCount > maxLines) return;
    for (let i = 0; i < lineCount; i++) {
      const line = textEditor.document.lineAt(i);
      const text = line.text;
      const divider = i > 99999 ? 100 : i > 9999 ? 10 : 1;
      const value = (i + 1) * (multiplier / divider);
      const range = new vscode.Range(
        new vscode.Position(i, start),
        new vscode.Position(i, end),
      );
      if (actionType == RenumberAction.RIGHT && text.length <= start) {
        const padLength = start - text.length;
        const placeholderRange = new vscode.Position(i, text.length);
        editBuilder.replace(placeholderRange, " ".repeat(padLength));
      }
      if (textEditor.document.lineAt(i).text.charAt(start) != "*") {
        const lineNumberText = value.toString().padStart(digits, "0");
        editBuilder.replace(range, lineNumberText);
      }
    }
  });
}

export async function notificationHandler<A, B>(
  task: (arg: A, arg2: B) => Promise<void>,
  arg: A,
  arg2: B,
  title: string,
  delayMs: number = 1000,
  minShowMs: number = 1000,
): Promise<void> {
  let taskFinished = false;
  const taskPromise = task(arg, arg2).finally(() => {
    taskFinished = true;
  });

  const loaderPromise = new Promise<void>((resolve) => {
    setTimeout(() => {
      if (!taskFinished) {
        const startTime = Date.now();
        vscode.window
          .withProgress(
            {
              location: vscode.ProgressLocation.Notification,
              title,
              cancellable: false,
            },
            async () => {
              await taskPromise;
              const elapsed = Date.now() - startTime;
              if (elapsed < minShowMs) {
                await new Promise((r) => setTimeout(r, minShowMs - elapsed));
              }
            },
          )
          .then(() => resolve());
      } else {
        resolve();
      }
    }, delayMs);
  });

  await Promise.all([taskPromise, loaderPromise]);
}
