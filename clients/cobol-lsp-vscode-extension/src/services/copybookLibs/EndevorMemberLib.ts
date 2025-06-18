import { Uri, OutputChannel } from "vscode";
import CopybookLib from "./CopybookLib";
import { hasMember } from "../util/Utils";
import {
  CopybookLibs,
  EndevorDatasetConfigModel,
} from "../ProcessorGroupsLoader";
import { externalApis } from "../ExternalAPIsService";
import { EndevorLib } from "./EndevorLib";

export class EndevorMemberLib extends EndevorLib implements CopybookLib {
  constructor(private config: EndevorDatasetConfigModel) {
    super(config.profile);
  }

  static create(configs: CopybookLibs) {
    const libs = [];
    for (const config of configs) {
      if (hasMember(config, "endevorDataset")) {
        libs.push(new EndevorMemberLib(config));
      }
    }
    return libs;
  }

  async resolveCopybookUri(copybookName: string, documentUri: Uri) {
    if (!(await this.configCheck(documentUri))) {
      return;
    }

    const profile = await this.getProfile(documentUri);

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

  async listCopybooks(
    documentUri: Uri,
    _outputChannel?: OutputChannel,
  ): Promise<string[]> {
    if (!(await this.configCheck(documentUri))) {
      return [];
    }
    const profile = await this.getProfile(documentUri);
    if (profile) {
      if (!this.configCheck(documentUri)) {
        return [];
      }

      const list = await externalApis.e4eDownloader?.getMembers(
        profile,
        this.config.endevorDataset,
      );
      // TODO? handle error in better way?
      if (list instanceof Error) return [];
      return list?.map((m) => m.member) ?? [];
    }
    return [];
  }
}
