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

// import { join } from "node:path";
import { Executable } from "vscode-languageclient/node";
import { NativeLanguageClient } from "./nativelanguageClientInterface";

import { join } from "../util/FSWrapper";

export class WindowsLanguageClient implements NativeLanguageClient {
  private readonly executablePath: string;
  private readonly command: string;

  constructor(serverPath: string) {
    this.executablePath = join(serverPath, "native");
    this.command = `engine.exe`;
  }

  public getServer(): Executable {
    return {
      args: [
        "pipeEnabled",
        "-Dline.separator=\r\n",
        "-Dlogback.statusListenerClass=ch.qos.logback.core.status.NopStatusListener",
        "-DserverType=NATIVE",
      ],
      command: this.command,
      options: { detached: false, cwd: this.executablePath },
    };
  }
}
