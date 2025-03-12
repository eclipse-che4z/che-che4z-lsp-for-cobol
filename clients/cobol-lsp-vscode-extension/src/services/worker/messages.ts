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
import { Program } from "@code4z/analysis/lib/model/cfast";

export type WorkerMessage = {
    vmCount: number,
    severity: number,
    programs: Program[],
}

export type LoggerItem = {
    severity: number,
    message: string,
}

export type SomethingResemblingEngineProcessingResult = {
... // Graph won't survive the cloning process as Graph
}

export type WorkerResultMessage = {
    type: "result",
    payload: SomethingResemblingEngineProcessingResult,
} | {
    type: "log",
    payload: LoggerItem[],
}
