import * as vscode from "vscode";

interface DialectV1 {
  apiVersion: 1;
  name: string;
  description: string;
  jar: vscode.Uri;
  snippets: vscode.Uri;
}
const mainExtensionId = "BroadcomMFD.cobol-language-support";

interface unregister {
  (): void;
}

export const registerDialect = async (
  extensionId: string,
  dialect: DialectV1,
): Promise<unregister> => {
  const main = vscode.extensions.getExtension(mainExtensionId);
  if (main === undefined) {
    throw new Error("Cannot find COBOL LS extension");
  }

  const mainApi = await main.activate();
  if (mainApi === undefined) {
    throw new Error("COBOL LS API is invalid");
  }
  // TODO: add more runtime checks (for api version, ...)

  return mainApi.dialectAPI_1_0().registerDialect(extensionId, dialect);
};
