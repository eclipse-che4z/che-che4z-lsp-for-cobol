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

import { Uri, OutputChannel } from "vscode";
import CopybookLib from "../../../../services/copybookLibs/CopybookLib";

export class MockLib implements CopybookLib {
  constructor(
    private directory: { [key: string]: Uri | (() => Promise<Uri>) },
  ) {}

  resolveCopybookUri(
    copybookName: string,
    _documentUri: Uri,
    _dialect: string,
  ): Promise<Uri | (() => Promise<Uri | undefined>) | undefined> {
    return Promise.resolve(this.directory[copybookName]);
  }

  listCopybooks(
    _documentUri: Uri,
    _dialect: string,
    _outputChannel?: OutputChannel,
  ): Promise<string[]> {
    return Promise.resolve(Object.keys(this.directory));
  }
}
