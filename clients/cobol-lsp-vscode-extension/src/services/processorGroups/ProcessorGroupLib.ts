import * as vscode from "vscode";
import { CopybookDownloaderForDsn } from "../copybook/downloader/CopybookDownloaderForDsn";
import { CopybookDownloaderForUss } from "../copybook/downloader/CopybookDownloaderForUss";

export default interface ProcessorGroupLib {
  resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
    dsnDownloader: CopybookDownloaderForDsn,
    ussDownloader: CopybookDownloaderForUss,
  ): Promise<vscode.Uri | undefined>;
}
