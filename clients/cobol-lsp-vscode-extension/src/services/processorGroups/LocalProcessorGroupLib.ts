import { LocalFilesystemResourceService } from "../LocalFilesystemResourceService";
import { ProcessorGroupLibModel } from "../ProcessorGroupsLoader";
import { SettingsService } from "../Settings";
import { getVariablesFromUri } from "../util/FSUtils";
import ProcessorGroupLib from "./ProcessorGroupLib";
import * as vscode from "vscode";

export default class LocalPathLib implements ProcessorGroupLib {
  private uris: vscode.Uri[];

  constructor(path: string, documentUri: vscode.Uri) {
    const variables = getVariablesFromUri(documentUri, false);
    const evaluatedPaths = SettingsService.evaluateVariables([path], variables);

    this.uris = SettingsService.prepareLocalSearchUris(
      evaluatedPaths,
      vscode.workspace.workspaceFolders ?? [],
    );
  }

  static create(configs: ProcessorGroupLibModel[], documentUri: vscode.Uri) {
    const libs = [];
    for (const config of configs) {
      if (typeof config === "string") {
        libs.push(new LocalPathLib(config, documentUri));
      }
    }
    return libs;
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
  ): Promise<vscode.Uri | undefined> {
    const allowedExtensions = await SettingsService.getCopybookExtension(
      documentUri.toString(),
    );
    const promises = this.uris.map(async (uri) => {
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
