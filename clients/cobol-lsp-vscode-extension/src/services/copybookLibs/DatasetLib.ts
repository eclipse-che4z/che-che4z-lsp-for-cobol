import { DATASET } from "../../constants";
import * as vscode from "vscode";
import CopybookLib from "./CopybookLib";
import { CopybookLibs } from "../ProcessorGroupsLoader";
import { ProfileUtils } from "../util/ProfileUtils";
import { externalApis } from "../copybook/CopybookDownloadService";

export class DatasetLib implements CopybookLib {
  constructor(
    private dsn: string,
    private profile?: string,
  ) {}

  static create(configs: CopybookLibs) {
    const libs = [];
    for (const config of configs) {
      if (typeof config === "object" && DATASET in config) {
        libs.push(new DatasetLib(config.dataset, config.profile));
      }
    }
    return libs;
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
  ): Promise<vscode.Uri | undefined> {
    if (!this.profile) {
      this.profile = ProfileUtils.getProfileNameForCopybook(
        documentUri,
        externalApis.explorerApi,
      );
    }

    return await externalApis.dsnService?.resolveCopybookUri(
      this.profile ?? "profile",
      this.dsn,
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

    const members = await externalApis.dsnService?.getAllMembers(
      this.profile ?? "profile",
      this.dsn,
    );

    return members?.map((m) => m.name) ?? [];
  }
}
