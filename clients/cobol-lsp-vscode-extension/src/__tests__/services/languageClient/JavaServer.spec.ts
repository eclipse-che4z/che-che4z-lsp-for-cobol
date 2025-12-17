import * as vscode from "vscode";
import { LanguageClient } from "vscode-languageclient/node";
import { JavaServer } from "../../../services/languageClient/ServerTypes";
import { startJavaServer } from "../../../services/languageClient/JavaServer";

jest.mock("../../../services/JavaCheck", () => ({
  getJavaVersion: jest.fn().mockResolvedValue(17),
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

    await startJavaServer(javaServer, {});
    expect(LanguageClient).toHaveBeenCalledTimes(1);
    expect(LanguageClient).toHaveBeenCalledWith(
      "cobol",
      "COBOL Language Support",
      {
        command: "C:\\t e s t\\bin\\java",
        args: [
          "-Dline.separator=\r\n",
          "-Ddialect.path=C:\\t e s t\\dialects",
          "-Xmx768M",
          "-jar",
          "C:\\t e s t\\server\\server.jar",
          "pipeEnabled",
        ],
        options: { detached: false },
      },
      { errorHandler: expect.any(Function) as unknown },
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

    await startJavaServer(javaServer, {});
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
      { errorHandler: expect.any(Function) as unknown },
    );
  });
}
