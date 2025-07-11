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
import {
  DiagnosticDto,
  DiagnosticSeverityDto,
  EventDto,
} from "@code4z/analysis/lib/model/external";
import { GraphDTO } from "@code4z/analysis/lib/model/GraphDTO";

export type WorkerMessage = {
  vmCount: number;
  severity: number;
  programs: Program[];
};

export type LoggerItem = {
  severity: DiagnosticSeverityDto;
  message: string;
};

export type WorkerProcessingResult = {
  graphs: GraphDTO[];
  locations: string[];
  diagnostics: Map<string, DiagnosticDto[]>;
  events: EventDto[];
};

export type WorkerResultMessage =
  | {
      type: "result";
      payload: WorkerProcessingResult;
    }
  | {
      type: "log";
      payload: LoggerItem[];
    };
