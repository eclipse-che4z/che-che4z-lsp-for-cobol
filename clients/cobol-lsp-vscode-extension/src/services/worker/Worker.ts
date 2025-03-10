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
import { parentPort } from "worker_threads";
import { ControlFlowGraphBuilder } from "@code4z/analysis/lib/graphbuilder";
import { WorkerMessage } from "./WorkerMessage";

function processMessage(message: WorkerMessage): void {
  const cfgBuilder = new ControlFlowGraphBuilder(
    message.vmCount,
    message.severity,
  );
  const result = cfgBuilder.build(message.programs);
  parentPort?.postMessage(result);
}

parentPort?.on("message", (message: WorkerMessage) => {
  processMessage(message);
});
