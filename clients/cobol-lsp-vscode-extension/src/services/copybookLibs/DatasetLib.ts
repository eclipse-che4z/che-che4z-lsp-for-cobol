import { DATASET } from "../../constants";
import * as vscode from "vscode";
import CopybookLib from "./CopybookLib";
import { CopybookLibs } from "../ProcessorGroupsLoader";
import { ProfileUtils } from "../util/ProfileUtils";
import { externalApis } from "../ExternalAPIsService";
import { ZoweLib } from "./ZoweLib";
import { MainframeRemoteLocation } from "../copybook/downloader/DownloadUtil";

export class DatasetLib extends ZoweLib implements CopybookLib {
  constructor(
    private dsn: string,
    profile?: string,
  ) {
    super(profile);
  }

  static create(configs: CopybookLibs) {
    const libs = [];
    for (const config of configs) {
      if (typeof config === "object" && DATASET in config) {
        // if (hasMember(config, 'DATASET') && typeof config[DATASET] === 'string') {
        libs.push(new DatasetLib(config.dataset, config.profile));
      }
    }
    return libs;
  }

  credentialsTestLocation(): MainframeRemoteLocation {
    return { dsn: this.dsn };
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

    if (!(await this.configCheck(documentUri))) {
      return;
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

    if (!(await this.configCheck(documentUri))) {
      return [];
    }

    const members = await externalApis.dsnService?.getAllMembers(
      this.profile ?? "profile",
      this.dsn,
    );

    return members?.map((m) => m.name) ?? [];
  }
}
