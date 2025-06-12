import { Uri, OutputChannel } from "vscode";
import CopybookLib from "./CopybookLib";
import { hasMember } from "../util/Utils";
import { DATASET, ENVIRONMENT } from "../../constants";
import {
  CopybookLibs,
  EndevorDatasetConfigModel,
} from "../ProcessorGroupsLoader";
import {
  EndevorElement,
  EndevorMember,
  ResolvedProfile,
} from "../../type/e4eApi";
import { externalApis } from "../copybook/CopybookDownloadService";

export class EndevorMemberLib implements CopybookLib {
  constructor(private config: EndevorDatasetConfigModel) {}

  static create(configs: CopybookLibs) {
    const libs = [];
    for (const config of configs) {
      if (hasMember(config, "endevorDataset")) {
        libs.push(new EndevorMemberLib(config));
      }
    }
    return libs;
  }

  async resolveCopybookUri(copybookName: string, _documentUri: Uri) {
    const profile = await externalApis.e4eDownloader?.getProfileInfo(
      this.config.profile,
    );

    if (profile) {
      const foundMember = await externalApis.e4eDownloader?.hasMember(
        profile,
        this.config.endevorDataset,
        copybookName,
      );

      if (foundMember) {
        return async () =>
          externalApis.e4eDownloader?.downloadDatasetE4E(profile, foundMember);
      }
    }
    return;
  }

  // async downloadCopybook(profile: ResolvedProfile, element: EndevorMember) {
  //   // try {
  //   return await externalApis.e4eDownloader?.downloadDatasetE4E(
  //     profile,
  //     element,
  //   );

  //   throw new Error("Invalid endevor member");
  //   // } catch (err) {
  //   // throw err;
  //   // this.outputChannel?.appendLine(
  //   //   `Error while downloading element from Endevor ${JSON.stringify(element)} - ${getErrorMessage(err)}`,
  //   // );
  //   // }
  // }

  listCopybooks(
    documentUri: Uri,
    outputChannel?: OutputChannel,
  ): Promise<string[]> {
    throw new Error("Method not implemented.");
  }
}
