import { Uri } from "vscode";
import ProcessorGroupLib from "./ProcessorGroupLib";
import * as vscode from "vscode";
import { USS } from "../../constants";
import { getVariablesFromUri } from "../util/FSUtils";
import { SettingsService } from "../Settings";
import { CopybookDownloaderForUss } from "../copybook/downloader/CopybookDownloaderForUss";
import { CopybookLibs } from "../ProcessorGroupsLoader";
import { CopybookDownloaderForDsn } from "../copybook/downloader/CopybookDownloaderForDsn";

export class UssPathLibFactory {
  constructor(private defaultProfile: string) {}

  create(configs: CopybookLibs, documentUri: vscode.Uri) {
    const libs = [];
    for (const config of configs) {
      if (typeof config === "object" && USS in config) {
        libs.push(
          new UssPathLib(
            config.uss,
            documentUri,
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

  constructor(uss: string, documentUri: vscode.Uri, profile: string) {
    const variables = getVariablesFromUri(documentUri, false);
    this.uss = SettingsService.evaluateVariables([uss], variables)[0];
    this.profile = profile;
  }

  resolveCopybookUri(
    copybookName: string,
    _documentUri: Uri,
    _dsnDownloader: CopybookDownloaderForDsn,
    ussDownloader: CopybookDownloaderForUss,
  ): Promise<Uri | undefined> {
    return ussDownloader.resolveCopybookUri(
      this.profile,
      this.uss,
      copybookName,
    );
  }
}
