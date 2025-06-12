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

export class EndevorElementLib implements CopybookLib {
  constructor(private config: EndevorConfigModel) {}

  static create(configs: CopybookLibs) {
    const libs = [];
    for (const config of configs) {
      if (hasMember(config, ENVIRONMENT)) {
        libs.push(new EndevorElementLib(config));
      }
    }
    return libs;
  }

  async resolveCopybookUri(copybookName: string, _documentUri: Uri) {
    const profile = await externalApis.e4eDownloader?.getProfileInfo(
      this.config.profile,
    );

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
        return () => this.downloadCopybook(profile, foundElement);
      }
    }
    return;
  }

  async downloadCopybook(
    profile: ResolvedProfile,
    element: EndevorElement | EndevorMember,
  ) {
    // try {
    if (DATASET in element) {
      return await externalApis.e4eDownloader?.downloadDatasetE4E(
        profile,
        element,
      );
    } else if (ENVIRONMENT in element) {
      return await externalApis.e4eDownloader?.downloadElementE4E(
        profile,
        element,
      );
    }

    throw new Error("Invalid endevor element");
    // } catch (err) {
    // throw err;
    // this.outputChannel?.appendLine(
    //   `Error while downloading element from Endevor ${JSON.stringify(element)} - ${getErrorMessage(err)}`,
    // );
    // }
  }

  listCopybooks(
    documentUri: Uri,
    outputChannel?: OutputChannel,
  ): Promise<string[]> {
    throw new Error("Method not implemented.");
  }
}
