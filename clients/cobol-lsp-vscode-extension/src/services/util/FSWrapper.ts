import * as vscode from "vscode";

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

export function join(...paths: string[]): string {
  if (paths.length > 0) {
    const base = paths.shift()!;
    var root = vscode.Uri.file(base);
    return vscode.Uri.joinPath(root, ...paths).fsPath;
  }
  return "";
}

export function mkdirSync(folder: string, options?: any) {
  vscode.workspace.fs.createDirectory(vscode.Uri.file(folder));
}

export async function readFileAsync(
  path: string,
  contentType: string,
): Promise<string> {
  const decoder = new TextDecoder(contentType);
  const content = await vscode.workspace.fs
    .readFile(vscode.Uri.file(path))
    .then((content: Uint8Array) => {
      return content;
    });
  return decoder.decode(content);
}

function isWindows() {
  return window.navigator.userAgent.indexOf("Win") != -1;
}

export function getPathSeparator() {
  if (isWindows()) return "\\";
  else return "/";
}

//TODO: add regex for absolute path validation
export function isAbsolute(path: string) {
  if (path.startsWith(".")) return false;
}
