import * as vscode from "vscode";

export async function existsAsync(path: string): Promise<boolean> {
  var pathExists: boolean;
  try {
    const info = await vscode.workspace.fs.stat(vscode.Uri.file(path));
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
    const result = vscode.Uri.joinPath(vscode.Uri.file(base), ...paths).fsPath;
    return result;
  }
  return "";
}

export async function mkdirAsync(folder: string, options?: any) {
  await vscode.workspace.fs.createDirectory(vscode.Uri.file(folder));
}

export async function readFileAsync(
  path: string,
  contentType?: string,
): Promise<string> {
  if (!contentType) contentType = "utf-8";
  const decoder = new TextDecoder(contentType);
  const content = await vscode.workspace.fs
    .readFile(vscode.Uri.file(path))
    .then((content: Uint8Array) => {
      return content;
    });
  return decoder.decode(content);
}

function isWindows() {
  return false;

  //TODO: Find a solid way to determin os
  // return window.navigator.userAgent.indexOf("Win") != -1;
}

export function getPathSeparator() {
  if (isWindows()) return "\\";
  else return "/";
}

// Low fidelity to check if path is abolute based off the first directory entry of process.env[HOME] is common
export function isAbsolute(path: string): boolean {
  const refPath = process.env["HOME"] ? process.env["HOME"] : "";
  // TODO: revise attempt to compare paths agnostic of os style path being queried
  // const sep = getPathSeparator();
  // const chunks = refPath.split(getPathSeparator());
  const result = path.includes(refPath);
  return result;
}

//Assumes both paths have atleast one common node
export function relative(path1: string, path2: string): string {
  var pathOneChunks = path1.split(getPathSeparator());
  const pathTwoChunks = path2.split(getPathSeparator());

  // Remove what is common
  for (const dir of pathOneChunks) {
    if (pathTwoChunks.includes(dir)) {
      pathOneChunks.shift();
      pathTwoChunks.shift();
    } else break;
  }

  // Populate the reverse paths if there are any
  const reverse = new Array(pathOneChunks.length).fill("..");

  const result = reverse.concat(pathTwoChunks).join(getPathSeparator());

  return result;
}
