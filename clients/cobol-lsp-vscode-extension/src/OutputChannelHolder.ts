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

export class OutputChannelHolder {
  private static mainChannel?: vscode.OutputChannel;
  private static analysisChannel?: vscode.LogOutputChannel;

  public static init(
    mainChannel: vscode.OutputChannel,
    analysisChannel: vscode.LogOutputChannel,
  ) {
    OutputChannelHolder.mainChannel = mainChannel;
    OutputChannelHolder.analysisChannel = analysisChannel;
  }

  public static getMainChannel(): vscode.OutputChannel | undefined {
    return OutputChannelHolder.mainChannel;
  }

  public static getAnalysisChannel(): vscode.LogOutputChannel | undefined {
    return OutputChannelHolder.analysisChannel;
  }
}
