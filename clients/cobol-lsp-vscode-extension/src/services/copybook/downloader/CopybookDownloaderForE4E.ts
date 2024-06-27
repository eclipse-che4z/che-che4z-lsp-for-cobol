/*
 * Copyright (c) 2024 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
import * as vscode from "vscode";
import * as fs from "node:fs";
import * as Path from "node:path";
import {
  EndevorElement,
  EndevorMember,
  e4eResponse,
  E4E,
  E4EExternalConfigurationResponse,
  ResolvedProfile,
  EndevorType,
  ExternalConfigurationOptions,
  ProcessorConfigurationType,
} from "../../../type/e4eApi.d";
import { CopybookURI } from "../CopybookURI";
import {
  DATASET,
  E4E_FOLDER,
  ENVIRONMENT,
  OUTPUT_MSG_SEARCH_LOCATION,
  USE_MAP,
} from "../../../constants";
import { CopybookName } from "../CopybookDownloadService";
import { Utils } from "../../util/Utils";
import { searchCopybookInExtensionFolder } from "../../util/FSUtils";

const defaultConfigs: ExternalConfigurationOptions = {
  compiler: "IGYCRCTL",
  preprocessor: ["DSNHPC", "DFHECP1$"],
  type: ProcessorConfigurationType.COBOL,
};

export class CopybookDownloaderForE4E {
  constructor(
    private storagePath: string,
    private e4e: E4E,
    private outputChannel?: vscode.OutputChannel,
  ) {}

  private E4EConfigs = new Map<string, Promise<e4eResponse | undefined>>();

  public clearConfigs() {
    this.E4EConfigs.clear();
  }

  private async getE4EConfigImpl(
    uri: string,
  ): Promise<e4eResponse | undefined> {
    const profile = await this.e4e.getProfileInfo(uri);
    if (profile instanceof Error) throw profile;

    const result: E4EExternalConfigurationResponse | Error =
      await this.e4e.getConfiguration(uri, defaultConfigs);
    if (result instanceof Error) throw result;

    const candidate = result.pgroups.find(
      (x) => x.name === result.pgms[0].pgroup,
    );
    if (!candidate) throw Error("Invalid configuration");

    const libs = candidate.libs as (EndevorElement | EndevorMember)[];
    let elements: { [key: string]: EndevorElement | EndevorMember } = {};
    const promises: Promise<EndevorMember[] | EndevorElement[] | Error>[] = [];

    for (const lib of libs) {
      if (DATASET in lib) {
        promises.push(this.getMembers(profile, lib.dataset));
      }
      if (ENVIRONMENT in lib) {
        promises.push(this.getElements(profile, lib));
      }
    }
    for await (const promise of promises) {
      if (promise instanceof Error) {
        this.outputChannel?.appendLine(promise.message);
      } else {
        for (const pro of promise) {
          if (DATASET in pro && !elements[pro.member]) {
            elements[pro.member] = pro;
          } else if (ENVIRONMENT in pro && !elements[pro.element])
            elements[pro.element] = pro;
        }
      }
    }

    this.writeLocationLogs(candidate?.libs);

    return {
      profile: profile,
      uri: uri,
      elements: elements,
    };
  }

  public async getE4EConfig(uri: string): Promise<e4eResponse | undefined> {
    const config = this.E4EConfigs.get(uri);
    if (config) {
      return config;
    }
    if (!this.e4e.isEndevorElement(uri)) return undefined;

    const response = this.getE4EConfigImpl(uri).catch((err) => {
      this.E4EConfigs.delete(uri);
      throw err;
    });
    this.E4EConfigs.set(uri, response);
    return response;
  }

  private writeLocationLogs(entries: any[]) {
    const ch = this.outputChannel;
    if (!ch) return;
    entries.forEach((libEntry) => {
      ch.appendLine(OUTPUT_MSG_SEARCH_LOCATION + JSON.stringify(libEntry));
    });
  }

  private async getMembers(
    profile: ResolvedProfile,
    dataset: string,
  ): Promise<EndevorMember[] | Error> {
    const list = await this.e4e.listMembers(profile, { dataset });
    if (list instanceof Error) return list;

    return list.map((str) => ({
      dataset: dataset,
      member: str,
    }));
  }
  private async getElements(
    profile: ResolvedProfile,
    lib: EndevorType,
  ): Promise<EndevorElement[] | Error> {
    const list = await this.e4e.listElements(profile, lib);
    if (list instanceof Error) return list;

    return list.map(([filename, fingerprint]) => ({
      environment: lib.environment,
      element: filename,
      use_map: lib.use_map ? true : false,
      stage: lib.stage,
      system: lib.system,
      subsystem: lib.subsystem,
      type: lib.type,
      fingerprint: fingerprint,
    }));
  }

  public async downloadCopybookE4E(
    documentUri: string,
    copybookName: CopybookName,
  ): Promise<boolean> {
    const response = await this.getE4EConfig(documentUri);
    if (!response) return false;
    const first = response.elements[copybookName.name];

    if (!first) {
      this.outputChannel?.appendLine(
        `Failed to find ${copybookName} in Endevor`,
      );
    } else if (DATASET in first)
      return await this.downloadDatasetE4E(response, first);
    else if (ENVIRONMENT in first)
      return await this.downloadElementE4E(response, first);
    return false;
  }

  public async downloadElementE4E(
    endevorApi: e4eResponse,
    element: EndevorElement,
  ): Promise<boolean> {
    try {
      const use_map = element.use_map ? USE_MAP : "";
      const instance = CopybookURI.getEnviromentPath(
        element,
        endevorApi.profile,
      );
      const filePath: string = CopybookDownloaderForE4E.getCopybookPath(
        instance,
        use_map,
        this.storagePath,
        element.element,
      );
      element.element = element.element;
      const resultElement = await this.e4e.getElement(
        endevorApi.profile,
        element,
      );

      if (resultElement instanceof Error) {
        this.outputChannel?.appendLine(resultElement.message);
      } else {
        await fs.promises.writeFile(filePath, resultElement[0]);
        return true;
      }
    } catch (err: any) {
      vscode.window.showErrorMessage(err.message);
    }
    return false;
  }

  public async downloadDatasetE4E(
    endevorApi: e4eResponse,
    member: EndevorMember,
  ): Promise<boolean> {
    try {
      const instance = Utils.profileAsString(endevorApi.profile);
      const filePath: string = CopybookDownloaderForE4E.getCopybookPath(
        instance,
        member.dataset,
        this.storagePath,
        member.member,
      );

      const memberContent = await this.e4e.getMember(endevorApi.profile, {
        dataset: member.dataset,
        member: member.member,
      });

      if (memberContent instanceof Error) {
        this.outputChannel?.appendLine(memberContent.message);
      } else {
        await fs.promises.writeFile(filePath, memberContent);
        return true;
      }
    } catch (err: any) {
      vscode.window.showErrorMessage(err.message);
    }
    return false;
  }

  private static getCopybookPath(
    instance: string,
    mapped: string,
    downloadFolder: string,
    copybook: string,
  ): string {
    let folder = CopybookURI.createDatasetPath(
      instance,
      mapped,
      downloadFolder,
      E4E_FOLDER,
    );

    if (!fs.existsSync(folder)) fs.mkdirSync(folder, { recursive: true });

    folder = Path.join(
      folder,
      copybook.substring(
        0,
        copybook.indexOf(".") !== -1 ? copybook.indexOf(".") : copybook.length,
      ),
    );

    return folder;
  }

  public async getE4ECopyBookLocation(
    copybookName: string,
    documentUri: string,
  ) {
    const config = await this.getE4EConfig(documentUri);
    if (!config) {
      throw Error;
    }
    const first = config.elements[copybookName];
    if (!first) return;
    let use_map;
    let instance;
    if (DATASET in first) {
      instance = Utils.profileAsString(config.profile);
      use_map = first.dataset;
    } else if (ENVIRONMENT in first) {
      use_map = first.use_map ? USE_MAP : "";
      instance = CopybookURI.getEnviromentPath(first, config.profile);
    } else return;
    const targetFolder = [
      CopybookURI.createDatasetPath(
        instance,
        use_map,
        this.storagePath,
        E4E_FOLDER,
      ),
    ];

    return searchCopybookInExtensionFolder(
      copybookName,
      targetFolder,
      [""],
      this.storagePath,
    );
  }
}
