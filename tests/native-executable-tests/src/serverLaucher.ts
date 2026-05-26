/**
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.

 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/

 * SPDX-License-Identifier: EPL-2.0

 * Contributors:
 *  Broadcom, Inc. - initial API and implementation
 */

import { Logger } from "vscode-languageserver-protocol";
import * as cp from "child_process";
import {
  StreamMessageReader,
  StreamMessageWriter,
} from "vscode-languageserver-protocol/node";
import * as os from "os";

const engines = {
  Windows_NT: {
    command: "engine.exe",
    cwd: "server/windows",
  },
  Darwin: {
    command: "./server-mac",
    cwd: "server/mac",
  },
  Linux: {
    command: "./server-linux",
    cwd: "server/linux",
  },
};

function isSupportedOs(osType: string): osType is keyof typeof engines {
  return osType in engines;
}

const utf8 = "utf-8";

export class ServerLaucher {
  createMessageTransporter = (logger: Logger) => {
    const osType = os.type();
    if (!isSupportedOs(osType)) {
      console.error("OS not supported yet !!!");
      return Promise.reject(Error("Unsupported OS"));
    }
    const { command, cwd } = engines[osType];

    const serverProcess = cp.spawn(
      command,
      [
        "-Dline.separator=\r\n",
        "-Dlogback.statusListenerClass=ch.qos.logback.core.status.NopStatusListener",
      ],
      { stdio: "pipe", detached: false, cwd },
    );
    if (!serverProcess || !serverProcess.pid) {
      console.log(
        serverProcess,
        `Launching server using command ${command} failed.`,
      );
    }

    serverProcess.stderr.on("data", (data) => {
      logger.error(typeof data === "string" ? data : data.toString(utf8));
    });
    serverProcess.stdout.on("data", (data) => {
      logger.log(typeof data === "string" ? data : data.toString(utf8));
    });
    return Promise.resolve({
      reader: new StreamMessageReader(serverProcess.stdout),
      writer: new StreamMessageWriter(serverProcess.stdin),
    });
  };
}
