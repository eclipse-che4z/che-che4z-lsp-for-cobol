import { Uri } from "vscode";
import ProcessorGroupLib from "./ProcessorGroupLib";
import { ProcessorGroupLibModel } from "../ProcessorGroupsLoader";
import * as vscode from "vscode";
import { USS } from "../../constants";
import { getVariablesFromUri } from "../util/FSUtils";
import { SettingsService } from "../Settings";
import { CopybookDownloaderForUss } from "../copybook/downloader/CopybookDownloaderForUss";

export class UssPathLibFactory {
  constructor(
    private ussDownloader: CopybookDownloaderForUss,
    private defaultProfile: string,
  ) {}

  create(configs: ProcessorGroupLibModel[], documentUri: vscode.Uri) {
    const libs = [];
    for (const config of configs) {
      if (typeof config === "object" && USS in config) {
        libs.push(
          new UssPathLib(
            config.uss,
            documentUri,
            this.ussDownloader,
            config.profile ?? this.defaultProfile,
          ),
        );
      }
    }
    return libs;
  }
}

export class UssPathLib implements ProcessorGroupLib {
  private uss: string;
  private profile: string;
  private downloader: CopybookDownloaderForUss;

  constructor(
    uss: string,
    documentUri: vscode.Uri,
    downloader: CopybookDownloaderForUss,
    profile: string,
  ) {
    const variables = getVariablesFromUri(documentUri, false);
    this.uss = SettingsService.evaluateVariables([uss], variables)[0];
    this.profile = profile;
    this.downloader = downloader;
  }

  resolveCopybookUri(
    copybookName: string,
    _documentUri: Uri,
  ): Promise<Uri | undefined> {
    return this.downloader.resolveCopybookUri(
      this.profile,
      this.uss,
      copybookName,
    );
  }
}
