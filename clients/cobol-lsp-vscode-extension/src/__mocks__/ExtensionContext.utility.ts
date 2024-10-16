import type { ExtensionContext } from "vscode";

export function createExtensionContextMock(): ExtensionContext {
  return {
    subscriptions: [],
  } as unknown as ExtensionContext;
}
