/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */
import * as vscode from "vscode";

export const BLANK_STATEMENT = "CONTINUE";
export const BLANK_VALUE = "ZERO";
export const SPACE_VALUE = " ";

export interface ParseError {
  line: number;
  column: number;
  message: string;
  range: vscode.Range;
}
