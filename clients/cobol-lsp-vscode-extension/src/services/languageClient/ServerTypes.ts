import type * as vscode from "vscode";

export interface SocketServer {
  kind: "SOCKET";
  port: number;
}

export interface NativeServer {
  kind: "NATIVE";
  command: vscode.Uri;
}
export interface JavaServer {
  kind: "JAVA";
  command: string;
  jar: vscode.Uri;
  dialects: vscode.Uri;
}
export type Server = SocketServer | JavaServer | NativeServer;
