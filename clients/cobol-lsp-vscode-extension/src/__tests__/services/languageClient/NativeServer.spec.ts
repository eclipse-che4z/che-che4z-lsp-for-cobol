import * as vscode from "vscode";
import { LanguageClient } from "vscode-languageclient/node";
import { NativeServer } from "../../../services/languageClient/ServerTypes";
import { startNativeServer } from "../../../services/languageClient/NativeServer";

const windows = process.platform === "win32";
if (windows) {
  test("Starts native language server", async () => {
    const nativeServer: NativeServer = {
      kind: "NATIVE",
      command: vscode.Uri.file("C:\\t e s t\\server\\executable"),
    };
    const clientOptions = {};
    await startNativeServer(nativeServer, clientOptions);
    expect(LanguageClient).toHaveBeenCalledTimes(1);
    expect(LanguageClient).toHaveBeenLastCalledWith(
      "cobol",
      "COBOL Language Support",
      {
        command: "c:\\t e s t\\server\\executable",
        args: [
          "pipeEnabled",
          "-Dline.separator=\r\n",
          "-Dlogback.statusListenerClass=ch.qos.logback.core.status.NopStatusListener",
          "-DserverType=NATIVE",
        ],
        options: {
          cwd: "c:\\t e s t\\server",
          detached: false,
        },
      },
      {
        errorHandler: expect.any(Function) as unknown,
      },
    );
  });
} else {
  test("Starts native language server", async () => {
    const nativeServer: NativeServer = {
      kind: "NATIVE",
      command: vscode.Uri.file("/t e s t/server/executable"),
    };
    const clientOptions = {};
    await startNativeServer(nativeServer, clientOptions);
    expect(LanguageClient).toHaveBeenCalledTimes(1);
    expect(LanguageClient).toHaveBeenLastCalledWith(
      "cobol",
      "COBOL Language Support",
      {
        command: "/t e s t/server/executable",
        args: [
          "pipeEnabled",
          "-Dline.separator=\r\n",
          "-Dlogback.statusListenerClass=ch.qos.logback.core.status.NopStatusListener",
          "-DserverType=NATIVE",
        ],
        options: { cwd: "/t e s t/server", detached: false },
      },
      {
        errorHandler: expect.any(Function) as unknown,
      },
    );
  });
}
