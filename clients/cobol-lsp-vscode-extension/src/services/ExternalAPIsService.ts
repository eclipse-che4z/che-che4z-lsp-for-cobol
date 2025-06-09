import { E4E } from "../type/e4eApi";
import { ZoweDSNService } from "./copybook/downloader/CopybookDownloaderForDsn";
import { CopybookDownloaderForE4E } from "./copybook/downloader/CopybookDownloaderForE4E";
import { CopybookDownloaderForUss } from "./copybook/downloader/CopybookDownloaderForUss";
import * as vscode from "vscode";

let explorerApi: IApiRegisterClient | undefined;
let e4eApi: E4E | undefined;
let dsnDownloader: ZoweDSNService;
let ussDownloader: CopybookDownloaderForUss;
let e4eDownloader: CopybookDownloaderForE4E;
let storagePath: vscode.Uri;
let outputChannel: vscode.OutputChannel;

export function initialize(
  storagePathUri: vscode.Uri,
  explorer?: IApiRegisterClient,
  e4e?: E4E,
  log: vscode.OutputChannel,
  diagnosticsService?: DownloadDiagnosticsService,
  configurationInvalidation?: () => unknown,
) {
  outputChannel = log;
  storagePath = storagePathUri;
  if (e4e) e4eAppeared(e4e);
  if (explorer) explorerAppeared(explorer);
}

function e4eAppeared(api: E4E) {
  e4eApi = api;
  e4eDownloader = new CopybookDownloaderForE4E(
    storagePath,
    e4eApi,
    outputChannel,
  );
  diagnosticsService?.clearDiagnostics();
}

function explorerAppeared(api: IApiRegisterClient) {
  this.explorerApi = api;
  this.ussDownloader = new CopybookDownloaderForUss(this.explorerApi);
  this.dsnDownloader = new ZoweDSNService(this.explorerApi);
  this.diagnosticsService?.clearDiagnostics();
  if (this.explorerApi.onProfileUpdated) {
    this.explorerApi.onProfileUpdated((profile: IProfileLoaded) => {
      this.outputChannel?.appendLine(`Zowe profile ${profile.name} updated`);
      if (this.configurationInvalidation) {
        this.configurationInvalidation();
      }
    });
  }
}
