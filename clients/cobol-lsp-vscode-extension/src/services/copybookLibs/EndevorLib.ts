import * as vscode from "vscode";
import { ResolvedProfile } from "../../type/e4eApi";
import { externalApis } from "../copybook/CopybookDownloadService";

export abstract class EndevorLib {
  constructor(protected profile?: string) {}

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
