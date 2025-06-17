import * as vscode from "vscode";
import { ResolvedProfile } from "../../type/e4eApi";
import {
  externalApis,
  missingExtension,
} from "../copybook/CopybookDownloadService";

export abstract class EndevorLib {
  constructor(protected profile?: string) {}

  protected async configCheck(documentUri: vscode.Uri) {
    if (!externalApis.e4eDownloader) {
      missingExtension(documentUri, "Explorer for Endevor is not installed");
      return false;
    }

    return !!(await externalApis.e4eDownloader.getE4EConfig(
      documentUri.toString(),
    ));
  }

  protected async getProfile(
    documentUri: vscode.Uri,
  ): Promise<ResolvedProfile | undefined> {
    if (this.profile) {
      return await externalApis.e4eDownloader?.getProfileInfo(this.profile);
    } else {
      return await externalApis.e4eDownloader?.getProfileForUri(documentUri);
    }
  }
}
