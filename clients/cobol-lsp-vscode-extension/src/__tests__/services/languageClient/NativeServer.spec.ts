import * as vscode from "vscode";
import { LanguageClient } from "vscode-languageclient/node";
import { NativeServer } from "../../../services/languageClient/ServerTypes";
import { startNativeServer } from "../../../services/languageClient/NativeServer";

test("Starts native language server", async () => {
  const nativeServer: NativeServer = {
    kind: "NATIVE",
    command: vscode.Uri.parse("file:///native/server/folder/executable"),
  };
  const clientOptions = {};
  await startNativeServer(nativeServer, clientOptions);
  expect(LanguageClient).toHaveBeenCalledTimes(1);
  expect(LanguageClient).toHaveBeenLastCalledWith(
    "cobol",
    "COBOL Language Support",
    {
      command: "/native/server/folder/executable",
      args: [
        "pipeEnabled",
        "-Dline.separator=\r\n",
        "-Dlogback.statusListenerClass=ch.qos.logback.core.status.NopStatusListener",
        "-DserverType=NATIVE",
      ],
      options: { cwd: "/native/server/folder", detached: false },
    },
    {
      errorHandler: expect.any(Function) as unknown,
    },
  );
});
