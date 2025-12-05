import type * as vscode from "vscode";

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
export type Server = NativeServer | JavaServer;

export interface ServerState {
  port: number; // port 0 means do NOT use socket
  preference: "JAVA" | "NATIVE";
  java: JavaServer;
  native: NativeServer;
}
