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

import * as os from "os";
import { LinuxlanguageClient } from "./linuxlanguageClient";
import { MacosLanguageClient } from "./macosLanguageClient";
import { NativeLanguageClient } from "./nativelanguageClientInterface";
import { WindowsLanguageClient } from "./windowsLanguageClient";

export class NativeExecutableService {
  public constructor(public serverPath: string) {}

  public getNativeLanguageClient() {
    let client: NativeLanguageClient | undefined;
    switch (os.type()) {
      case "Windows_NT":
        client = new WindowsLanguageClient(this.serverPath);
        break;
      case "Darwin":
        client = new MacosLanguageClient(this.serverPath);
        break;
      case "Linux":
        client = new LinuxlanguageClient(this.serverPath);
        break;
      default:
        break;
    }
    if (client) {
      return client.getServer();
    }
  }
}
