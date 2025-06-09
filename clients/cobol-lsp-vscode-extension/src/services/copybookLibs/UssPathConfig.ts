import CopybookLib from "./CopybookLib";
import { getVariablesFromUri } from "../util/FSUtils";
import { SettingsService } from "../Settings";
import { ProfileUtils } from "../util/ProfileUtils";
import { CopybookLibs } from "../ProcessorGroupsLoader";
import { USS } from "../../constants";
import * as vscode from "vscode";
import { externalApis } from "../copybook/CopybookDownloadService";

export class UssPathLib implements CopybookLib {
  constructor(
    private uss: string,
    private profile?: string,
  ) {}

  static create(configs: CopybookLibs) {
    const libs = [];
    for (const config of configs) {
      if (typeof config === "object" && USS in config) {
        libs.push(new UssPathLib(config.uss, config.profile));
      }
    }
    return libs;
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
  ): Promise<vscode.Uri | undefined> {
    const variables = getVariablesFromUri(documentUri, false);
    const evaluatedUri = SettingsService.evaluateVariables(
      [this.uss],
      variables,
    )[0];

    if (!this.profile) {
      this.profile = ProfileUtils.getProfileNameForCopybook(
        documentUri,
        externalApis.explorerApi,
      );
    }

    return await externalApis.ussService?.resolveCopybookUri(
      this.profile ?? "profile",
      evaluatedUri,
      copybookName,
    );
  }

  async listCopybooks(
    documentUri: vscode.Uri,
    _outputChannel?: vscode.OutputChannel,
  ): Promise<string[]> {
    if (!this.profile) {
      this.profile = ProfileUtils.getProfileNameForCopybook(
        documentUri,
        externalApis.explorerApi,
      );
    }

    const members = await externalApis.ussService?.getAllMembers(
      this.profile ?? "profile",
      this.uss,
    );

    return members?.map((m) => m.name) ?? [];
  }
}
