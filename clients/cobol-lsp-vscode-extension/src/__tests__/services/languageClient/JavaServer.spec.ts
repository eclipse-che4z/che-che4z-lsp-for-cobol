import * as vscode from "vscode";
import { LanguageClient } from "vscode-languageclient/node";
import { JavaServer } from "../../../services/languageClient/ServerTypes";
import { startJavaServer } from "../../../services/languageClient/JavaServer";
import { LanguageClientErrorHandler } from "../../../services/LanguageClientErrorHandler";

jest.mock("../../../services/JavaCheck", () => ({
  checkJavaVersion: jest.fn(),
}));

const windows = process.platform === "win32";
if (windows) {
  test("Starts java language server", async () => {
    const javaServer: JavaServer = {
      kind: "JAVA",
      command: "C:\\t e s t\\bin\\java",
      dialects: vscode.Uri.file("C:\\t e s t\\dialects"),
      jar: vscode.Uri.file("C:\\t e s t\\server\\server.jar"),
    };
    const clientOptions = {};
    const errorHandler = {} as LanguageClientErrorHandler;
    await startJavaServer(javaServer, clientOptions, errorHandler);
    expect(LanguageClient).toHaveBeenCalledTimes(1);
    expect(LanguageClient).toHaveBeenCalledWith(
      "cobol",
      "COBOL Language Support",
      {
        command: "C:\\t e s t\\bin\\java",
        args: [
          "-Dline.separator=\r\n",
          "-Ddialect.path=c:\\t e s t\\dialects",
          "-Xmx768M",
          "-jar",
          "c:\\t e s t\\server\\server.jar",
          "pipeEnabled",
        ],
        options: { detached: false },
      },
      { errorHandler },
    );
  });
} else {
  test("Starts java language server", async () => {
    const javaServer: JavaServer = {
      kind: "JAVA",
      command: "/t e s t/bin/java",
      dialects: vscode.Uri.file("/t e s t/dialectsFolder"),
      jar: vscode.Uri.file("/t e s t/server/server.jar"),
    };
    const clientOptions = {};
    const errorHandler = {} as LanguageClientErrorHandler;
    await startJavaServer(javaServer, clientOptions, errorHandler);
    expect(LanguageClient).toHaveBeenCalledTimes(1);
    expect(LanguageClient).toHaveBeenCalledWith(
      "cobol",
      "COBOL Language Support",
      {
        command: "/t e s t/bin/java",
        args: [
          "-Dline.separator=\r\n",
          "-Ddialect.path=/t e s t/dialectsFolder",
          "-Xmx768M",
          "-jar",
          "/t e s t/server/server.jar",
          "pipeEnabled",
        ],
        options: { detached: false },
      },
      { errorHandler },
    );
  });
}
