import { LocalFilesystemResourceService } from "../LocalFilesystemResourceService";
import { CopybookLibs } from "../ProcessorGroupsLoader";
import { SettingsService } from "../Settings";
import { getVariablesFromUri } from "../util/FSUtils";
import ProcessorGroupLib from "./ProcessorGroupLib";
import * as vscode from "vscode";

export default class LocalPathLib implements ProcessorGroupLib {
  constructor(private path: string) {}

  static create(configs: CopybookLibs) {
    const libs = [];
    for (const config of configs) {
      if (typeof config === "string") {
        libs.push(new LocalPathLib(config));
      }
    }
    return libs;
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
  ): Promise<vscode.Uri | undefined> {
    const variables = getVariablesFromUri(documentUri, false);
    const evaluatedPaths = SettingsService.evaluateVariables(
      [this.path],
      variables,
    );

    const uris = SettingsService.prepareLocalSearchUris(
      evaluatedPaths,
      vscode.workspace.workspaceFolders ?? [],
    );

    const allowedExtensions =
      await SettingsService.getCopybookExtension(documentUri);
    const promises = uris.map(async (uri) => {
      return await LocalFilesystemResourceService.searchDirectory(
        uri,
        copybookName,
        allowedExtensions ?? [],
      );
    });

    const results = await Promise.allSettled(promises);
    for (const result of results) {
      if (result.status === "fulfilled" && result.value) {
        return result.value;
      }
    }
  }
}
