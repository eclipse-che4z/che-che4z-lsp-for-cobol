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
import { workspace, Uri } from "vscode";
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

export type B4GTypeMetadata = t.TypeOf<typeof B4GTypeMetadataModel>;

export function decodeBridgeJson(
  json: unknown | undefined,
): B4GTypeMetadata | undefined {
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
): Promise<unknown | undefined> {
  const b4gPath = Uri.joinPath(documentUri, "../.bridge.json");
  try {
    return JSON.parse(
      new TextDecoder().decode(await workspace.fs.readFile(b4gPath)),
    );
  } catch (e: any) {
    if (e.code !== "FileNotFound") {
      console.error(e);
    }
    return undefined;
  }
}
