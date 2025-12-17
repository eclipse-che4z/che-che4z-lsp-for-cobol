import * as vscode from "vscode";
import { LanguageClient } from "vscode-languageclient/node";
import { JavaServer } from "../../../services/languageClient/ServerTypes";
import { startJavaServer } from "../../../services/languageClient/JavaServer";

jest.mock("../../../services/JavaCheck", () => ({
  getJavaVersion: jest.fn().mockResolvedValue(17),
}));

test("Starts java language server", async () => {
  const javaServer: JavaServer = {
    kind: "JAVA",
    command: "/test/bin/java",
    dialects: vscode.Uri.parse("file:///test/dialectsFolder"),
    jar: vscode.Uri.parse("file:///test/server/server.jar"),
  };

  await startJavaServer(javaServer, {});
  expect(LanguageClient).toHaveBeenCalledTimes(1);
  expect(LanguageClient).toHaveBeenCalledWith(
    "cobol",
    "COBOL Language Support",
    {
      command: "/test/bin/java",
      args: [
        "-Dline.separator=\r\n",
        "-Ddialect.path=/test/dialectsFolder",
        "-Xmx768M",
        "-jar",
        "/test/server/server.jar",
        "pipeEnabled",
      ],
      options: { detached: false },
    },
    { errorHandler: expect.any(Function) as any },
  );
});
