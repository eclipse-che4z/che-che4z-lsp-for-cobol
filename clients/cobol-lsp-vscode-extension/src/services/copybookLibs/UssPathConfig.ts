import { Uri } from "vscode";
import CopybookLib from "./ProcessorGroupLib";
import { getVariablesFromUri } from "../util/FSUtils";
import { SettingsService } from "../Settings";
import { CopybookDownloaderForUss } from "../copybook/downloader/CopybookDownloaderForUss";
import { CopybookDownloaderForDsn } from "../copybook/downloader/CopybookDownloaderForDsn";
import { ProfileUtils } from "../util/ProfileUtils";
import { CopybookLibs } from "../ProcessorGroupsLoader";
import { USS } from "../../constants";

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

  resolveCopybookUri(
    copybookName: string,
    documentUri: Uri,
    _dsnDownloader: CopybookDownloaderForDsn,
    ussDownloader: CopybookDownloaderForUss,
    explorerApi?: IApiRegisterClient,
  ): Promise<Uri | undefined> {
    const variables = getVariablesFromUri(documentUri, false);
    const evaluatedUri = SettingsService.evaluateVariables(
      [this.uss],
      variables,
    )[0];

    if (!this.profile) {
      this.profile = ProfileUtils.getProfileNameForCopybook(
        documentUri,
        explorerApi,
      );
    }

    return ussDownloader.resolveCopybookUri(
      this.profile ?? "profile",
      evaluatedUri,
      copybookName,
    );
  }
}
