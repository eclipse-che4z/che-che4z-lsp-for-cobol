import * as vscode from "vscode";
import { __ExtensionV1DialectDetail } from "@code4z/cobol-dialect-api";

export const isV1RuntimeDialectDetail = (
  dialect: unknown,
): dialect is __ExtensionV1DialectDetail => {
  if (dialect === null || typeof dialect !== "object") return false;
  if (!("name" in dialect) || typeof dialect.name !== "string") return false;
  if (!("description" in dialect) || typeof dialect.description !== "string")
    return false;
  if (!("jar" in dialect) || typeof dialect.jar !== "string") return false;
  if (!("snippets" in dialect) || typeof dialect.snippets !== "string")
    return false;
  try {
    vscode.Uri.parse(dialect.jar, true);
    vscode.Uri.parse(dialect.snippets, true);
  } catch (_error) {
    return false;
  }

  return true;
};
