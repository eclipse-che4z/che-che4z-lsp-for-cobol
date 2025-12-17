import * as net from "node:net";
import { LanguageClient } from "vscode-languageclient/node";
import { startSocketServer } from "../../../services/languageClient/SocketServer";

jest.mock("node:net");

test("Starts socket language server on specified port", async () => {
  const clientOptions = {};
  await startSocketServer(1044, clientOptions);
  expect(LanguageClient).toHaveBeenCalledTimes(1);
  expect(LanguageClient).toHaveBeenLastCalledWith(
    "cobol",
    "COBOL Language Support",
    expect.any(Function),
    clientOptions,
  );
  expect(net.connect).toHaveBeenCalledWith({ host: "localhost", port: 1044 });
});
