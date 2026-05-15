/*
 * Copyright (c) 2025 Broadcom.
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
import { CopybookDownloaderForDsn as CopybookDownloaderForDsn } from "./copybook/downloader/CopybookDownloaderForDsn";
import { SettingsService } from "./Settings";
import { getE4EAPI } from "./copybook/E4ECopybookService";
import { Utils } from "./util/Utils";
import { clearProfiles } from "./util/ProfileUtils";
import { outputChannel } from "./util/OutputChannel";
import { TarContent } from "./util/TarUtil";
import { Memoize } from "./util/Memoize";
import { CopybookBinaryDownloader } from "./copybook/downloader/CopybookBinaryDownloader";

export type { ExternalAPIsService };

export let externalApis: ExternalAPIsService;
const diagnosticCollection: vscode.DiagnosticCollection =
  vscode.languages.createDiagnosticCollection("External APIs Diagnostics");

export async function initializeExternalAPIs(
  storagePath: vscode.Uri,
  configurationInvalidation?: () => unknown,
  cobolTarContentProvider?: Memoize<[tarFileUri: vscode.Uri], TarContent[]>,
) {
  const maybeE4E = await getE4EAPI();
  const maybeZowe = await Utils.getZoweExplorerAPI();

  externalApis = new ExternalAPIsService(
    storagePath,
    maybeZowe && "api" in maybeZowe ? maybeZowe.api : undefined,
    maybeE4E && "api" in maybeE4E ? maybeE4E.api : undefined,
    configurationInvalidation,
    cobolTarContentProvider,
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

  return externalApis;
}

export function missingExtension(documentUri: vscode.Uri, message: string) {
  diagnosticCollection.set(documentUri, [
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

export function deleteDiagnostics(documentUri: vscode.Uri) {
  diagnosticCollection.delete(documentUri);
}

export function clearDiagnostics() {
  diagnosticCollection.clear();
}

function makeCreateDeleteWatcher(scheme: string) {
  return vscode.workspace.createFileSystemWatcher(
    new vscode.RelativePattern(vscode.Uri.from({ scheme, path: "/" }), "**/*"),
    false,
    true,
    false,
  );
}

class ExternalAPIsService implements vscode.Disposable {
  e4eApi: E4E | undefined;
  dsnService?: CopybookDownloaderForDsn;
  ussService?: CopybookDownloaderForUss;
  e4eDownloader?: CopybookDownloaderForE4E;
  binaryDownloader?: CopybookBinaryDownloader;
  tarCache?: Memoize<[tarFileUri: vscode.Uri], TarContent[]>;
  toDispose: vscode.Disposable[] = [];

  constructor(
    private storagePath: vscode.Uri,
    explorer?: IApiRegisterClient,
    e4e?: E4E,
    private configurationInvalidation?: () => unknown,
    tarCache?: Memoize<[tarFileUri: vscode.Uri], TarContent[]>,
  ) {
    if (e4e) this.e4eAppeared(e4e);
    if (explorer) this.explorerAppeared(explorer);
    if (tarCache) this.tarCache = tarCache;
  }

  dispose(): void {
    for (const d of this.toDispose.reverse()) d.dispose();
    this.toDispose = [];
  }

  /**
   * Clears downloaders cache
   */
  clearCache() {
    this.dsnService?.clearMemberListCache();
    this.ussService?.clearMemberListCache();
    this.e4eDownloader?.clearProfiles();
    this.tarCache?.clearCache();
  }

  clearProfiles() {
    this.e4eDownloader?.clearProfiles();
    clearProfiles();
  }

  public handleAsEndevorElement(documentUri: string) {
    return (
      SettingsService.getCopybookEndevorDependencySettings() ===
        ENDEVOR_PROCESSOR && this.e4eApi?.isEndevorElement(documentUri)
    );
  }

  public e4eAppeared(api: E4E) {
    this.e4eApi = api;
    this.e4eDownloader = new CopybookDownloaderForE4E(
      this.storagePath,
      this.e4eApi,
    );
    diagnosticCollection.clear();
  }

  public explorerAppeared(api: IApiRegisterClient) {
    const ussService = new CopybookDownloaderForUss();
    const dsnService = new CopybookDownloaderForDsn();
    this.ussService = ussService;
    this.dsnService = dsnService;
    this.binaryDownloader = new CopybookBinaryDownloader(this.storagePath, api);
    diagnosticCollection.clear();
    if (api.onProfileUpdated) {
      api.onProfileUpdated((profile: IProfileLoaded) => {
        outputChannel.appendLine(`Zowe profile ${profile.name} updated`);
        this.clearCache();
        if (this.configurationInvalidation) {
          this.configurationInvalidation();
        }
      });
    }
    const ussWatcher = makeCreateDeleteWatcher("zowe-uss");
    const dsWatcher = makeCreateDeleteWatcher("zowe-ds");
    this.toDispose.push(
      ussWatcher,
      ussWatcher.onDidCreate((uri) => ussService.fsChanged(uri)),
      ussWatcher.onDidDelete((uri) => ussService.fsChanged(uri)),
      dsWatcher,
      dsWatcher.onDidCreate((uri) => dsnService.fsChanged(uri)),
      dsWatcher.onDidDelete((uri) => dsnService.fsChanged(uri)),
    );
  }

  public reenableFailedRequests() {
    this.dsnService?.reenableFailedRequests();
    this.ussService?.reenableFailedRequests();
  }
}
