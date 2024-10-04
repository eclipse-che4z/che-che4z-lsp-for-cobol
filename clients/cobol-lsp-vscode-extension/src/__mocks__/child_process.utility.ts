/*
 * Copyright (c) 2024 Broadcom.
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
import * as cp from "child_process";
import { PassThrough } from "stream";

export function mockSpawnProcess(stdout: string, stderr: string, exitCode = 0) {
  const stdoutStream = new PassThrough();
  const stderrStream = new PassThrough();

  const mockProcess: Partial<cp.ChildProcess> = {
    stdout: stdoutStream,
    stderr: stderrStream,
    on: (event, callback) => {
      if (event === "close") {
        stdoutStream.emit("data", stdout);
        stderrStream.emit("data", stderr);
        callback(exitCode, null);
      }
      return {} as cp.ChildProcess;
    },
  };

  return jest
    .spyOn(cp, "spawn")
    .mockReturnValue(mockProcess as cp.ChildProcess);
}
