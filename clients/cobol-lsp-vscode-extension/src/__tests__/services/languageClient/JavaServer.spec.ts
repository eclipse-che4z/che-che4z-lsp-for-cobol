import * as vscode from "vscode";
import { type JavaServer } from "../../../services/languageClient/ServerTypes";
import { startJavaServer } from "../../../services/languageClient/JavaServer";
import { LanguageClient } from "vscode-languageclient/node";

jest.mock("../../../services/JavaCheck", () => ({
  getJavaVersion: jest.fn().mockReturnValue(17),
}));
jest.mock("vscode-languageclient/node", () => {
  const LanguageClient = jest.fn().mockImplementation(() => ({
    createDefaultErrorHandler: jest.fn(),
    start: jest.fn(),
  }));

  return {
    LanguageClient,
    State: { Stopped: 1 },
  };
});

const javaServer: JavaServer = {
  kind: "JAVA",
  command: "/test/bin/java",
  dialects: vscode.Uri.file("/test/dialectsFolder"),
  jar: vscode.Uri.file("/test/server/server.jar"),
};

test("Start Java Language Server", async () => {
  const languageClient = await startJavaServer(javaServer, {}, []);
  expect(LanguageClient).toHaveBeenCalledTimes(1);
  expect(LanguageClient).toHaveBeenCalledWith(
    "cobol",
    "COBOL Language Support",
    {
      args: [
        "-Dline.separator=\r\n",
        "-Ddialect.path=/test/dialectsFolder",
        "-Xmx768M",
        "-jar",
        "/test/server/server.jar",
        "pipeEnabled",
      ],
      command: "/test/bin/java",
      options: { detached: false },
    },
    { errorHandler: undefined },
  );
});
