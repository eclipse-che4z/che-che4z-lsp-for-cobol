import * as net from "node:net";
import { LanguageClient } from "vscode-languageclient/node";
import { startSocketServer } from "../../../services/languageClient/SocketServer";
import { LanguageClientErrorHandler } from "../../../services/LanguageClientErrorHandler";

jest.mock("node:net");

test("Starts socket language server on specified port", async () => {
  const clientOptions = {};
  const errorHandler = {} as LanguageClientErrorHandler;
  await startSocketServer(1044, clientOptions, errorHandler);
  expect(LanguageClient).toHaveBeenCalledTimes(1);
  expect(LanguageClient).toHaveBeenLastCalledWith(
    "cobol",
    "COBOL Language Support",
    expect.any(Function),
    { errorHandler },
  );
  expect(net.connect).toHaveBeenCalledWith({ host: "localhost", port: 1044 });
});
