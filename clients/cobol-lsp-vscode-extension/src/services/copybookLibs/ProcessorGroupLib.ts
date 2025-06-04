import * as vscode from "vscode";
import { CopybookDownloaderForDsn } from "../copybook/downloader/CopybookDownloaderForDsn";
import { CopybookDownloaderForUss } from "../copybook/downloader/CopybookDownloaderForUss";

export default interface CopybookLib {
  resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
    dsnDownloader?: CopybookDownloaderForDsn,
    ussDownloader?: CopybookDownloaderForUss,
    explorerApi?: IApiRegisterClient,
  ): Promise<vscode.Uri | undefined>;
}
