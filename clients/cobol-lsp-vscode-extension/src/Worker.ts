import { parentPort } from "worker_threads";
import { Program } from "@code4z/analysis/lib/model/cfast";
import { ControlFlowGraphBuilder } from "@code4z/analysis/lib/graphbuilder";

export class WorkerMessage {
  public constructor(
    public vmCount: number,
    public severity: number,
    public programs: Program[],
  ) {}
}

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
