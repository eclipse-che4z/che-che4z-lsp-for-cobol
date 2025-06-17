import { Uri, OutputChannel } from "vscode";
import CopybookLib from "./CopybookLib";
import { hasMember } from "../util/Utils";
import { DATASET, ENVIRONMENT } from "../../constants";
import { CopybookLibs, EndevorConfigModel } from "../ProcessorGroupsLoader";
import {
  EndevorElement,
  EndevorMember,
  ResolvedProfile,
} from "../../type/e4eApi";
import { externalApis } from "../copybook/CopybookDownloadService";
import { EndevorLib } from "./EndevorLib";

export class EndevorElementLib extends EndevorLib implements CopybookLib {
  constructor(private config: EndevorConfigModel) {
    super(config.profile);
  }

  static create(configs: CopybookLibs) {
    const libs = [];
    for (const config of configs) {
      if (hasMember(config, ENVIRONMENT)) {
        libs.push(new EndevorElementLib(config));
      }
    }
    return libs;
  }

  async resolveCopybookUri(copybookName: string, documentUri: Uri) {
    const profile = await this.getProfile(documentUri);

    if (profile) {
      const element: EndevorElement = {
        use_map: this.config.use_map === false ? false : true,
        environment: this.config.environment,
        stage: this.config.stage,
        system: this.config.system,
        subsystem: this.config.subsystem,
        type: this.config.type,
        element: copybookName.toUpperCase(),
        fingerprint: "",
      };
      const foundElement = await externalApis.e4eDownloader?.hasElement(
        profile,
        element,
        copybookName,
      );

      if (foundElement) {
        return async () =>
          externalApis.e4eDownloader?.downloadElementE4E(profile, foundElement);
      }
    }
    return;
  }

  async listCopybooks(
    documentUri: Uri,
    _outputChannel?: OutputChannel,
  ): Promise<string[]> {
    const profile = await this.getProfile(documentUri);
    if (profile) {
      const list = await externalApis.e4eDownloader?.getElements(profile, {
        use_map: this.config.use_map === false ? false : true,
        environment: this.config.environment,
        stage: this.config.stage,
        system: this.config.system,
        subsystem: this.config.subsystem,
        type: this.config.type,
      });
      // TODO? handle error in better way?
      if (list instanceof Error) return [];
      return list?.map((m) => m.element) ?? [];
    }
    return [];
  }
}
