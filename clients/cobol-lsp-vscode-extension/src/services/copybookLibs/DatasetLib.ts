import { DATASET } from "../../constants";
import { CopybookDownloaderForDsn } from "../copybook/downloader/CopybookDownloaderForDsn";
import * as vscode from "vscode";
import CopybookLib from "./ProcessorGroupLib";
import { CopybookLibs } from "../ProcessorGroupsLoader";
import { ProfileUtils } from "../util/ProfileUtils";
import { CopybookDownloaderForUss } from "../copybook/downloader/CopybookDownloaderForUss";

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
    dsnDownloader?: CopybookDownloaderForDsn,
    _ussDownloader?: CopybookDownloaderForUss,
    explorerApi?: IApiRegisterClient,
  ): Promise<vscode.Uri | undefined> {
    if (!this.profile) {
      this.profile = ProfileUtils.getProfileNameForCopybook(
        documentUri,
        explorerApi,
      );
    }

    return await dsnDownloader?.resolveCopybookUri(
      this.profile ?? "profile",
      this.dsn,
      copybookName,
    );
  }
}
