import { DATASET } from "../../constants";
import * as vscode from "vscode";
import CopybookLib from "./CopybookLib";
import { CopybookLibs } from "../ProcessorGroupsLoader";
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
    const profile = this.getProfile(documentUri);

    if (!(await this.configCheck(documentUri))) {
      return;
    }

    const member = await externalApis.dsnService?.hasMember(
      profile,
      this.dsn,
      copybookName,
    );

    if (member) {
      return vscode.Uri.parse(
        `zowe-dsn:/${profile}/${this.dsn}/${member.name}${member.extension ? member.extension : ""}`,
      );
    }
  }

  async listCopybooks(
    documentUri: vscode.Uri,
    _outputChannel?: vscode.OutputChannel,
  ): Promise<string[]> {
    const profile = this.getProfile(documentUri);

    if (!(await this.configCheck(documentUri))) {
      return [];
    }

    const members = await externalApis.dsnService?.getAllMembers(
      profile,
      this.dsn,
    );

    return members?.map((m) => m.name) ?? [];
  }
}
