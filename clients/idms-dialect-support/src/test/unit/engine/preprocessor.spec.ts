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
import { IDocumentProcessingContext } from "@code4z/cobol-dialect-api";
import { IdmsPreprocessor } from "../../../engine/preprocessor";
import { MessageService } from "../../../engine/services/MessageService";

jest.mock("vscode");

describe("IdmsPreprocessor test", () => {
  it("should resolve without error when executed", async () => {
    const outputChannel = {} as vscode.OutputChannel;
    const messageService = new MessageService({});
    const preprocessor = new IdmsPreprocessor(outputChannel, messageService);
    const context = {} as IDocumentProcessingContext;

    await expect(
      preprocessor.execute(context, "some text"),
    ).resolves.toBeUndefined();
  });
});
