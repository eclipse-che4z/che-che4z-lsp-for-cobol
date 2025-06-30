import CopybookLib from "./CopybookLib";
import { getVariablesFromUri } from "../util/FSUtils";
import { SettingsService } from "../Settings";
import { LibsDefinitions } from "../ProcessorGroupsLoader";
import { USS } from "../../constants";
import * as vscode from "vscode";
import { externalApis } from "../ExternalAPIsService";
import { ZoweLib } from "./ZoweLib";
import { MainframeRemoteLocation } from "../copybook/downloader/DownloadUtil";

export class UssPathLib extends ZoweLib implements CopybookLib {
  constructor(
    private uss: string,
    profile?: string,
  ) {
    super(profile);
  }

  static create(configs: LibsDefinitions) {
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
    dialect: string,
  ): Promise<vscode.Uri | undefined> {
    const variables = getVariablesFromUri(documentUri, false);
    const evaluatedPath = SettingsService.evaluateVariables(
      this.uss,
      variables,
    );

    const profile = this.getProfile(documentUri);

    if (!(await this.configCheck(documentUri))) {
      return;
    }

    const allowedExtensions = await SettingsService.getCopybookExtension(
      documentUri,
      dialect,
    );

    const member = await externalApis.ussService?.hasMember(
      profile,
      evaluatedPath,
      copybookName,
      allowedExtensions,
    );

    if (member) {
      return vscode.Uri.parse(
        `zowe-uss:/${profile}${evaluatedPath}/${member.name}${member.extension ? member.extension : ""}`,
      );
    }
  }

  async listCopybooks(
    documentUri: vscode.Uri,
    dialect: string,
    _outputChannel?: vscode.OutputChannel,
  ): Promise<string[]> {
    const profile = this.getProfile(documentUri);

    if (!(await this.configCheck(documentUri))) {
      return [];
    }

    const allowedExtensions = await SettingsService.getCopybookExtension(
      documentUri,
      dialect,
    );

    const members = await externalApis.ussService?.getAllMembers(
      profile,
      this.uss,
      allowedExtensions,
    );

    return members?.map((m) => m.name) ?? [];
  }

  credentialsTestLocation(): MainframeRemoteLocation {
    return { uss: this.uss };
  }
}
