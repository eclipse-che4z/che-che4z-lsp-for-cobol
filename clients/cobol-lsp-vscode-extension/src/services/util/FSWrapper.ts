import * as vscode from "vscode";
import { Utils } from "./Utils";
import { TextDecoder, TextEncoder } from "util";

export function existsSync(path: string): boolean {
  var pathExists: boolean;
  try {
    vscode.workspace.fs.stat(vscode.Uri.file(path));
    pathExists = true;
  } catch {
    pathExists = false;
  }
  return pathExists;
}

export async function writeFile(file: string, content: string) {
  const encoder = new TextEncoder();

  await vscode.workspace.fs.writeFile(
    vscode.Uri.file(file),
    encoder.encode(content),
  );
}

export function join(base: string, addition: string) {
  return vscode.Uri.joinPath(vscode.Uri.file(base), addition).fsPath;
}

export function mkdirSync(folder: string, options?: any) {
  vscode.workspace.fs.createDirectory(vscode.Uri.file(folder));
}

//TODO: Very much dislike making this async and propogating awaits up the callstack but
// spent some time trying to find a readFileSync function that is not node and was unsuccessful
export async function readFileAsync(path: string, contentType: string) {
  const decoder = new TextDecoder(contentType);
  const content = await vscode.workspace.fs
    .readFile(vscode.Uri.file(path))
    .then((content: Uint8Array) => {
      return content;
    });
  return decoder.decode(content);
}
