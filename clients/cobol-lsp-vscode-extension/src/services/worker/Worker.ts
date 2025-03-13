/* eslint-disable @typescript-eslint/restrict-template-expressions */
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
import { DiagnosticSeverityDto } from "@code4z/analysis/lib/model/external";
import { Channel } from "@code4z/analysis/lib/vm/logger";
import { LoggerItem, WorkerMessage, WorkerResultMessage } from "./messages";

const MESSAGE_BULK_SIZE: number = 1000;

export class Logger implements Channel {
  public messages: LoggerItem[] = [];

  debug(message: string): void {
    this.messages.push({
      severity: DiagnosticSeverityDto.Hint,
      message: message,
    });
    this.messages = sendMessagesIfNeeded(this.messages);
  }
  trace(message: string): void {
    this.messages.push({
      severity: DiagnosticSeverityDto.Hint,
      message: message,
    });
    this.messages = sendMessagesIfNeeded(this.messages);
  }
  info(message: string): void {
    this.messages.push({
      severity: DiagnosticSeverityDto.Information,
      message: message,
    });
    this.messages = sendMessagesIfNeeded(this.messages);
  }
  warn(message: string): void {
    this.messages.push({
      severity: DiagnosticSeverityDto.Warning,
      message: message,
    });
    this.messages = sendMessagesIfNeeded(this.messages);
  }
  error(message: string): void {
    this.messages.push({
      severity: DiagnosticSeverityDto.Error,
      message: message,
    });
    this.messages = sendMessagesIfNeeded(this.messages);
  }
}

function processMessage(message: WorkerMessage): void {
  const channel = new Logger();
  try {
    const cfgBuilder = new ControlFlowGraphBuilder(
      message.vmCount,
      message.severity,
      channel,
    );
    const result = cfgBuilder.build(message.programs);
    const graphs = result.enters.map((e) => e.normalize());

    postMessage({
      type: "result",
      payload: {
        graphs: graphs,
        locations: result.locations,
        diagnostics: result.diagnostics,
      },
    });
  } catch (error) {
    channel.error(`${error}`);
  } finally {
    postMessage({ type: "log", payload: channel.messages });
  }
}

parentPort?.on("message", (message: WorkerMessage) => {
  processMessage(message);
});

function sendMessagesIfNeeded(messages: LoggerItem[]): LoggerItem[] {
  if (messages.length === MESSAGE_BULK_SIZE) {
    postMessage({ type: "log", payload: messages });
    messages = [];
  }
  return messages;
}

function postMessage(message: WorkerResultMessage) {
  parentPort?.postMessage(message);
}
