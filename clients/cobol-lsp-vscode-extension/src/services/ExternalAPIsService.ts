/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */

import * as vscode from "vscode";
import { E4E_INCOMPATIBLE, ENDEVOR_PROCESSOR } from "../constants";
import { E4E } from "../type/e4eApi";
import { CopybookDownloaderForE4E } from "./copybook/downloader/CopybookDownloaderForE4E";
import { CopybookDownloaderForUss } from "./copybook/downloader/CopybookDownloaderForUss";
import { ZoweDSNService as ZoweDSNService } from "./copybook/downloader/CopybookDownloaderForDsn";
import { SettingsService } from "./Settings";
import { getE4EAPI } from "./copybook/E4ECopybookService";
import { Utils } from "./util/Utils";
import { clearDiagnostics, showDiagnostics } from "./DiagnosticsService";

export class CopybookName {
  constructor(
    public name: string,
    public dialect: string,
  ) {}
}

export let externalApis: ExternalAPIsService;

export async function initializeExternalAPIs(
  storagePath: vscode.Uri,
  outputChannel: vscode.OutputChannel,
  configurationInvalidation?: () => unknown,
) {
  const maybeE4E = await getE4EAPI();
  const maybeZowe = await Utils.getZoweExplorerAPI();

  externalApis = new ExternalAPIsService(
    storagePath,
    maybeZowe && "api" in maybeZowe ? maybeZowe.api : undefined,
    maybeE4E && "api" in maybeE4E ? maybeE4E.api : undefined,
    outputChannel,
    configurationInvalidation,
  );

  if (maybeZowe && "futureApi" in maybeZowe) {
    void maybeZowe.futureApi.then((api) => {
      if (api) externalApis.explorerAppeared(api.api);
    });
  }

  if (!maybeE4E) outputChannel.appendLine(E4E_INCOMPATIBLE);
  else if ("futureApi" in maybeE4E)
    void maybeE4E.futureApi.then((api) => {
      if (api) externalApis.e4eAppeared(api.api);
      else outputChannel.appendLine(E4E_INCOMPATIBLE);
    });
}

export function missingExtension(documentUri: vscode.Uri, message: string) {
  showDiagnostics(documentUri, [
    {
      range: new vscode.Range(
        new vscode.Position(0, 0),
        new vscode.Position(1, 0),
      ),
      message: message,
      severity: vscode.DiagnosticSeverity.Warning,
    },
  ]);
}

class ExternalAPIsService {
  explorerApi: IApiRegisterClient | undefined;
  e4eApi: E4E | undefined;
  dsnService?: ZoweDSNService;
  ussService?: CopybookDownloaderForUss;
  e4eDownloader?: CopybookDownloaderForE4E;

  /**
   * Clears downloaders cache
   */
  clearCache() {
    this.dsnService?.clearMemberListCache();
    this.ussService?.clearMemberListCache();
    this.e4eDownloader?.clearConfigs();
    this.e4eDownloader?.clearProfiles();
  }
  clearProfiles() {
    this.e4eDownloader?.clearProfiles();
  }

  clearE4EConfig(uri: string) {
    this.e4eDownloader?.clearInvalidConfig(uri);
  }

  public handleAsEndevorElement(documentUri: string) {
    return (
      SettingsService.getCopybookEndevorDependencySettings() ===
        ENDEVOR_PROCESSOR && this.e4eApi?.isEndevorElement(documentUri)
    );
  }

  constructor(
    private storagePath: vscode.Uri,
    explorer?: IApiRegisterClient,
    e4e?: E4E,
    private outputChannel?: vscode.OutputChannel,
    private configurationInvalidation?: () => unknown,
  ) {
    if (e4e) this.e4eAppeared(e4e);
    if (explorer) this.explorerAppeared(explorer);
  }

  public e4eAppeared(api: E4E) {
    this.e4eApi = api;
    this.e4eDownloader = new CopybookDownloaderForE4E(
      this.storagePath,
      this.e4eApi,
      this.outputChannel,
    );
    clearDiagnostics();
  }

  public explorerAppeared(api: IApiRegisterClient) {
    this.explorerApi = api;
    this.ussService = new CopybookDownloaderForUss(this.explorerApi);
    this.dsnService = new ZoweDSNService(this.explorerApi);
    clearDiagnostics();
    if (this.explorerApi.onProfileUpdated) {
      this.explorerApi.onProfileUpdated((profile: IProfileLoaded) => {
        this.outputChannel?.appendLine(`Zowe profile ${profile.name} updated`);
        this.clearCache();
        if (this.configurationInvalidation) {
          this.configurationInvalidation();
        }
      });
    }
  }

  public reenableFailedRequests() {
    this.dsnService?.reenableFailedRequests();
    this.ussService?.reenableFailedRequests();
  }
}
