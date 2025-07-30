/*
 * Copyright (c) 2024 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
import * as t from "io-ts";
import { isLeft } from "fp-ts/Either";
import { PathReporter } from "io-ts/PathReporter";
import { workspace, Uri, FileSystemWatcher } from "vscode";
import { TextDecoder } from "util";

const ElementMetadata = t.type({
  processorGroup: t.string,
});

const ProcessorGroupDefinition = t.type({
  name: t.string,
  description: t.string,
});

const B4GTypeMetadataModel = t.type({
  elements: t.record(t.string, ElementMetadata),
  defaultProcessorGroup: t.string,
  definedProcessorGroups: t.array(ProcessorGroupDefinition),
  fileExtension: t.string,
});

const bridge4GitCacheMap: Map<string, B4GTypeMetadata | undefined> = new Map();
export type B4GTypeMetadata = t.TypeOf<typeof B4GTypeMetadataModel>;

const BRIDGE4GIT_CONFIG_FILE = "**/.bridge.json";

function decodeBridgeJson(json: unknown): B4GTypeMetadata | undefined {
  if (json === undefined) {
    return undefined;
  }
  try {
    const decoded = B4GTypeMetadataModel.decode(json); // Either<Errors, User>
    if (isLeft(decoded)) {
      throw Error(
        `Could not validate data: ${PathReporter.report(decoded).join("\n")}`,
      );
    }
    return decoded.right;
  } catch (e) {
    console.error(e);
    return undefined;
  }
}

export async function loadBridgeJsonContent(
  documentUri: Uri,
): Promise<B4GTypeMetadata | undefined> {
  const b4gPath = Uri.joinPath(documentUri, "../.bridge.json");
  if (bridge4GitCacheMap.has(b4gPath.toString())) {
    return bridge4GitCacheMap.get(b4gPath.toString());
  }
  return reloadBridgeJsonContent(b4gPath);
}

export const watcherChangeEventHandler = (uri: Uri) => {
  bridge4GitCacheMap.delete(uri.toString());
};

async function readBridge4GitJson(b4gPath: Uri) {
  const bridge4GitDataString = new TextDecoder().decode(
    await workspace.fs.readFile(b4gPath),
  );
  const bridge4GitDataJson: unknown = JSON.parse(bridge4GitDataString);
  return decodeBridgeJson(bridge4GitDataJson);
}

export function setupBridge4GitWatcher(): FileSystemWatcher {
  const bridge4GitWatcher = workspace.createFileSystemWatcher(
    BRIDGE4GIT_CONFIG_FILE,
  );
  bridge4GitWatcher.onDidChange(watcherChangeEventHandler);
  bridge4GitWatcher.onDidCreate(watcherChangeEventHandler);
  bridge4GitWatcher.onDidDelete(watcherChangeEventHandler);
  return bridge4GitWatcher;
}

async function reloadBridgeJsonContent(b4gPath: Uri) {
  try {
    const bridge4GitDataJson = await readBridge4GitJson(b4gPath);
    bridge4GitCacheMap.set(b4gPath.toString(), bridge4GitDataJson);
    return bridge4GitDataJson;
  } catch (e) {
    bridge4GitCacheMap.set(b4gPath.toString(), undefined);
    if (
      e &&
      typeof e === "object" &&
      "code" in e &&
      e.code !== "FileNotFound"
    ) {
      console.error(e);
    }
    return undefined;
  }
}
