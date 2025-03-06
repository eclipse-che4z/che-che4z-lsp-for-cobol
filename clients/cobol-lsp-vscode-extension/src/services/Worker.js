const { parentPort } = require("worker_threads");
const { Program } = require("@code4z/analysis/lib/model/cfast");
const {
  ControlFlowGraphBuilder,
} = require("@code4z/analysis/lib/graphbuilder");

let cancelSource = undefined;

async function processMessage(message, cancel) {
  const cfgBuilder = new ControlFlowGraphBuilder(
    message.vmCount,
    message.severity,
  );
  const result = await cfgBuilder.build(message.programs, cancel);
  if (cancel.cancel) {
    return;
  }
  parentPort.postMessage(result);
}

parentPort.on("message", (message) => {
  if (message === "abort") {
    if (cancelSource) {
      cancelSource.cancel = true;
      cancelSource = undefined;
    }
    return;
  }

  cancelSource = { cancel: false };
  processMessage(message, cancelSource);
});
