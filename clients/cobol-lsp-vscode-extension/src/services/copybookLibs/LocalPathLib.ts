import { LocalFilesystemResourceService } from "../LocalFilesystemResourceService";
import { CopybookLibs } from "../ProcessorGroupsLoader";
import { SettingsService } from "../Settings";
import { getVariablesFromUri } from "../util/FSUtils";
import CopybookLib from "./CopybookLib";
import * as vscode from "vscode";

export const localCopybooks = new LocalFilesystemResourceService();

export default class LocalPathLib implements CopybookLib {
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

  private getUris(documentUri: vscode.Uri) {
    const variables = getVariablesFromUri(documentUri, false);
    const evaluatedPaths = SettingsService.evaluateVariables(
      [this.path],
      variables,
    );

    return SettingsService.prepareLocalSearchUris(
      evaluatedPaths,
      vscode.workspace.workspaceFolders ?? [],
    );
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
  ): Promise<vscode.Uri | undefined> {
    const uris = this.getUris(documentUri);

    const allowedExtensions =
      await SettingsService.getCopybookExtension(documentUri);
    const promises = uris.map(async (uri) => {
      return await localCopybooks.searchDirectory(
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

  async listCopybooks(
    documentUri: vscode.Uri,
    outputChannel?: vscode.OutputChannel,
  ): Promise<string[]> {
    const uris = this.getUris(documentUri);

    const allowedExtensions =
      await SettingsService.getCopybookExtension(documentUri);

    const results = await Promise.allSettled(
      uris.map(async (directoryUri) =>
        localCopybooks.listDirectory(directoryUri, allowedExtensions ?? []),
      ),
    );

    const copybooks: string[] = [];

    results.forEach((result) => {
      if (result.status === "fulfilled") {
        result.value.forEach((copybook) => copybooks.push(copybook.filename));
      } else {
        outputChannel?.appendLine(
          `Unable to load copybooks completions: ${result.reason}`,
        );
      }
    });

    return copybooks;
  }
}
