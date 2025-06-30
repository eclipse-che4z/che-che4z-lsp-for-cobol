import { Uri, OutputChannel } from "vscode";
import CopybookLib from "./CopybookLib";
import { hasMember } from "../util/Utils";
import { ENVIRONMENT } from "../../constants";
import { LibsDefinitions, EndevorConfigModel } from "../ProcessorGroupsLoader";
import { externalApis } from "../ExternalAPIsService";
import { EndevorLib } from "./EndevorLib";

export class EndevorElementLib extends EndevorLib implements CopybookLib {
  constructor(private config: EndevorConfigModel) {
    super(config.profile);
  }

  static create(configs: LibsDefinitions) {
    const libs = [];
    for (const config of configs) {
      if (hasMember(config, ENVIRONMENT)) {
        libs.push(new EndevorElementLib(config));
      }
    }
    return libs;
  }

  async resolveCopybookUri(
    copybookName: string,
    documentUri: Uri,
    _dialect: string,
  ) {
    const profile = await this.getProfile(documentUri);

    if (!this.configCheck(documentUri)) {
      return;
    }

    if (profile) {
      const elements = await externalApis.e4eDownloader?.getElements(profile, {
        use_map: this.config.use_map === false ? false : true,
        environment: this.config.environment,
        stage: this.config.stage,
        system: this.config.system,
        subsystem: this.config.subsystem,
        type: this.config.type,
      });

      if (elements instanceof Error) {
        return;
      }

      copybookName = copybookName.toUpperCase();
      const foundElement = elements?.find(
        (x) => x.element.toUpperCase() == copybookName,
      );

      if (foundElement) {
        return async () =>
          externalApis.e4eDownloader?.downloadElementE4E(profile, foundElement);
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
