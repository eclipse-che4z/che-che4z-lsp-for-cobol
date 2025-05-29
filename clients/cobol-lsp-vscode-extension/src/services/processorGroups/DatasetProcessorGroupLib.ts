import { DATASET } from "../../constants";
import { CopybookDownloaderForDsn } from "../copybook/downloader/CopybookDownloaderForDsn";
import { ProcessorGroupLibModel } from "../ProcessorGroupsLoader";
import * as vscode from "vscode";
import ProcessorGroupLib from "./ProcessorGroupLib";

export class DatasetLibFactory {
  constructor(
    private dsnDownloader: CopybookDownloaderForDsn,
    private defaultProfile: string,
  ) {}

  create(configs: ProcessorGroupLibModel[]) {
    const libs = [];
    for (const config of configs) {
      if (typeof config === "object" && DATASET in config) {
        libs.push(
          new DatasetPGLib(
            config.dataset,
            this.dsnDownloader,
            config.profile ?? this.defaultProfile,
          ),
        );
      }
    }
    return libs;
  }
}

export class DatasetPGLib implements ProcessorGroupLib {
  private uss: string;
  private profile: string;
  private downloader: CopybookDownloaderForDsn;

  constructor(
    dsn: string,
    downloader: CopybookDownloaderForDsn,
    profile: string,
  ) {
    this.uss = dsn;
    this.profile = profile;
    this.downloader = downloader;
  }

  resolveCopybookUri(
    copybookName: string,
    _documentUri: vscode.Uri,
  ): Promise<vscode.Uri | undefined> {
    return this.downloader.resolveCopybookUri(
      this.profile,
      this.uss,
      copybookName,
    );
  }
}
