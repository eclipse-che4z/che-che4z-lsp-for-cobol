import { DATASET } from "../../constants";
import { CopybookDownloaderForDsn } from "../copybook/downloader/CopybookDownloaderForDsn";
import * as vscode from "vscode";
import ProcessorGroupLib from "./ProcessorGroupLib";
import { CopybookLibs } from "../ProcessorGroupsLoader";

export class DatasetLibFactory {
  constructor(
    private dsnDownloader: CopybookDownloaderForDsn,
    private defaultProfile: string,
  ) {}

  create(configs: CopybookLibs) {
    const libs = [];
    for (const config of configs) {
      if (typeof config === "object" && DATASET in config) {
        libs.push(
          new DatasetPGLib(
            config.dataset,
            config.profile ?? this.defaultProfile,
          ),
        );
      }
    }
    return libs;
  }
}

export class DatasetPGLib implements ProcessorGroupLib {
  private dsn: string;
  private profile: string;

  constructor(dsn: string, profile: string) {
    this.dsn = dsn;
    this.profile = profile;
  }

  resolveCopybookUri(
    copybookName: string,
    _documentUri: vscode.Uri,
    dsnDownloader: CopybookDownloaderForDsn,
  ): Promise<vscode.Uri | undefined> {
    return dsnDownloader.resolveCopybookUri(
      this.profile,
      this.dsn,
      copybookName,
    );
  }
}
