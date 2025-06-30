import { Uri, OutputChannel } from "vscode";
import CopybookLib from "./CopybookLib";
import { hasMember } from "../util/Utils";
import {
  LibsDefinitions,
  EndevorDatasetConfigModel,
} from "../ProcessorGroupsLoader";
import { externalApis } from "../ExternalAPIsService";
import { EndevorLib } from "./EndevorLib";

export class EndevorMemberLib extends EndevorLib implements CopybookLib {
  constructor(private config: EndevorDatasetConfigModel) {
    super(config.profile);
  }

  static create(configs: LibsDefinitions) {
    const libs = [];
    for (const config of configs) {
      if (hasMember(config, "dataset")) {
        libs.push(new EndevorMemberLib(config));
      }
    }
    return libs;
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: Uri,
    _dialect: string,
  ) {
    if (!this.configCheck(documentUri)) {
      return;
    }

    const profile = await this.getProfile(documentUri);

    if (profile) {
      const members = await externalApis.e4eDownloader?.getMembers(
        profile,
        this.config.dataset,
      );

      if (members instanceof Error) {
        return;
      }

      copybookName = copybookName.toUpperCase();
      const foundMember = members?.find(
        (member) => member.member.toUpperCase() === copybookName,
      );

      if (foundMember) {
        return async () =>
          externalApis.e4eDownloader?.downloadDatasetE4E(profile, foundMember);
      }
    }
  }

  async listCopybooks(
    documentUri: Uri,
    _dialect: string,
    _outputChannel?: OutputChannel,
  ): Promise<string[]> {
    if (!this.configCheck(documentUri)) {
      return [];
    }
    const profile = await this.getProfile(documentUri);
    if (profile) {
      const list = await externalApis.e4eDownloader?.getMembers(
        profile,
        this.config.dataset,
      );
      // TODO? handle error in better way?
      if (list instanceof Error) return [];
      return list?.map((m) => m.member) ?? [];
    }
    return [];
  }
}
