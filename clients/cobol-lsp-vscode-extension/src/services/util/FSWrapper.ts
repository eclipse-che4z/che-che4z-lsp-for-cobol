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
  // Low fidelity way to determine if windows by using the vscode api UNC path formatting functionality
  // const testPath = "/hello/world";
  // const uri = vscode.Uri.file(testPath);
  // return uri.fsPath.includes("\\");
  return typeof process !== "undefined" && process.platform === "win32";
}

export function getPathSeparator() {
  if (isWindows()) return "\\";
  else return "/";
}

// Low fidelity to check if path is abolute based off the first directory entry of process.env[HOME] is common
export function isAbsolute(path: string): boolean {
  var refPath: string;
  let RgExp = new RegExp("^(?:[a-z]+:)?//", "i");

  if (typeof process !== "undefined" && process.env["HOME"]) {
    const refPathUri = vscode.Uri.file(process.env["HOME"]);
    const targetUri = vscode.Uri.file(path);
    const result = targetUri.fsPath.includes(refPathUri.fsPath);
    return result;
  } else if (RgExp.test(path)) {
    return true;
  } else return false;
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
