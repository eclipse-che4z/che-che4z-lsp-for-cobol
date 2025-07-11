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
import { asPartialProfile, hasMember, Utils } from "../../util/Utils";
import { getErrorMessage } from "../../util/ErrorsUtils";
import { SettingsService } from "../../Settings";

const defaultConfigs: ExternalConfigurationOptions = {
  compiler: "IGYCRCTL",
  preprocessor: ["DSNHPC", "DFHECP1$"],
  type: ProcessorConfigurationType.COBOL,
};

export class CopybookDownloaderForE4E {
  constructor(
    private storagePath: vscode.Uri,
    private e4e: E4E,
    private outputChannel?: vscode.OutputChannel,
  ) {}

  private E4EConfigs = new Map<string, E4EConfig>();
  private E4EProfiles = new Map<string, ResolvedProfile | undefined>();
  private E4EElements = new Map<string, EndevorElement[] | undefined>();

  public clearConfigs() {
    this.E4EConfigs.clear();
  }
  public clearInvalidConfig(uri: string) {
    const config = this.E4EConfigs.get(uri);
    if (config) config.closed = true;
  }

  private async getE4EConfigImpl(
    uri: string,
  ): Promise<e4eResponse | undefined> {
    const profile = await this.e4e.getProfileInfo(uri);
    if (profile instanceof Error) throw profile;

    const compiler = SettingsService.getLspConfigCompiler();
    const preprocessor = SettingsService.getLspConfigPreprocessors();

    const promise: E4EExternalConfigurationResponse | Error =
      await this.e4e.getConfiguration(uri, {
        compiler: compiler ?? defaultConfigs.compiler,
        preprocessor: preprocessor ?? defaultConfigs.preprocessor,
        type: defaultConfigs.type,
      });
    if (promise instanceof Error) throw promise;

    const candidate = promise.pgroups.find(
      (x) => x.name === promise.pgms[0].pgroup,
    );
    if (!candidate) throw Error("Invalid configuration");

    const elements: { [key: string]: EndevorElement | EndevorMember } = {};
    const promises: Promise<EndevorMember[] | EndevorElement[] | Error>[] = [];

    for (const lib of candidate.libs) {
      if (DATASET in lib) {
        promises.push(this.getMembers(profile, lib.dataset));
      }
      if (ENVIRONMENT in lib) {
        promises.push(this.getElements(profile, lib));
      }
    }

    for (const promise of await Promise.all(promises)) {
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
    const e4eConfig = this.E4EConfigs.get(uri);
    if (e4eConfig) {
      if (!e4eConfig.closed) return e4eConfig.config;
      const result = await e4eConfig.config;
      if (result) return result;
    }
    if (!this.e4e.isEndevorElement(uri)) return undefined;
    const response = this.getE4EConfigImpl(uri).catch(
      (err: Error): undefined => {
        vscode.window.showErrorMessage(
          `An error occurred while retrieving Endevor configuration: ${err.message}.`,
        );
      },
    );
    this.E4EConfigs.set(uri, { config: response, closed: false });
    return response;
  }

  private writeLocationLogs(entries: unknown[]) {
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
    copybookName: string,
    _dialectType: string,
  ): Promise<vscode.Uri | undefined> {
    const response = await this.getE4EConfig(documentUri);
    if (!response) return;
    const first = response.elements[copybookName];

    if (!first) {
      this.outputChannel?.appendLine(
        `Failed to find ${copybookName} in Endevor`,
      );
    } else {
      try {
        if (DATASET in first)
          return await this.downloadDatasetE4E(response.profile, first);
        else if (ENVIRONMENT in first)
          return await this.downloadElementE4E(response.profile, first);
      } catch (err) {
        this.outputChannel?.appendLine(
          `Error while downloading copybook from Endevor ${copybookName} ${JSON.stringify(first)} - ${getErrorMessage(err)}`,
        );
      }
    }
  }

  public async listRemoteCopybooksE4E(documentUri: string) {
    const response = await this.getE4EConfig(documentUri);
    if (!response) {
      return [];
    }

    return Object.keys(response.elements);
  }

  public async downloadElementE4E(
    profile: ResolvedProfile,
    element: EndevorElement,
  ): Promise<vscode.Uri | undefined> {
    const use_map = element.use_map ? USE_MAP : "";
    const instance = CopybookURI.getEnviromentPath(element, profile);
    const filePath = await CopybookDownloaderForE4E.getCopybookPath(
      instance,
      use_map,
      this.storagePath,
      element.element,
      this.outputChannel,
    );

    try {
      const exists = await vscode.workspace.fs.stat(filePath);
      if (exists) {
        return filePath;
      }
    } catch (err) {
      if (hasMember(err, "code") && err.code === "FileNotFound") {
        // file doesn't exist - let's download the content of the copybook
        // and store it in the file
      } else {
        throw err;
      }
    }

    const resultElement = await this.e4e.getElement(profile, element);

    if (resultElement instanceof Error) {
      throw resultElement;
    } else {
      await vscode.workspace.fs.writeFile(
        filePath,
        Buffer.from(resultElement[0]),
      );
      return filePath;
    }
  }

  public async downloadDatasetE4E(
    profile: ResolvedProfile,
    member: EndevorMember,
  ): Promise<vscode.Uri | undefined> {
    const instance = [Utils.profileAsString(profile)];
    const filePath = await CopybookDownloaderForE4E.getCopybookPath(
      instance,
      member.dataset,
      this.storagePath,
      member.member,
      this.outputChannel,
    );

    try {
      const exists = await vscode.workspace.fs.stat(filePath);
      if (exists) {
        return filePath;
      }
    } catch (err) {
      if (hasMember(err, "code") && err.code === "FileNotFound") {
        // file doesn't exist - let's download the content of the copybook
        // and store it in the file
      } else {
        throw err;
      }
    }

    const memberContent = await this.e4e.getMember(profile, {
      dataset: member.dataset,
      member: member.member,
    });

    if (memberContent instanceof Error) {
      throw memberContent;
    } else {
      await vscode.workspace.fs.writeFile(filePath, Buffer.from(memberContent));
      return filePath;
    }
  }

  private static async getCopybookPath(
    instance: string[],
    mapped: string,
    downloadFolder: vscode.Uri,
    copybook: string,
    outputChannel?: vscode.OutputChannel,
  ): Promise<vscode.Uri> {
    const folder = CopybookURI.createDatasetPath(
      instance,
      mapped,
      downloadFolder,
      E4E_FOLDER,
    );

    /**
     * There is an issue with VSCode File Watcher on Linux where it
     * fails to watch subfolders changes when more subfolders are created
     * all at once.
     * https://github.com/microsoft/vscode/issues/142694
     *
     * As a workaround, the path is splitted into individual subfolders
     * are they are created incrementally one by one.
     */
    const subdirectories = CopybookURI.createDatasetSubdirectories(
      instance,
      E4E_FOLDER,
      mapped,
    );
    let finishedPath = downloadFolder;
    for (const subdirectory of subdirectories) {
      finishedPath = vscode.Uri.joinPath(finishedPath, subdirectory);

      try {
        await vscode.workspace.fs.createDirectory(finishedPath);
      } catch (err) {
        if (err instanceof vscode.FileSystemError.FileExists) {
          // ok - directory already exists, nothing to do
          outputChannel?.appendLine(
            `FileExists error while allocating '${finishedPath.toString()}' directory for copybooks: ${JSON.stringify(err)}`,
          );
        } else {
          outputChannel?.appendLine(
            `Unable to allocate ${finishedPath.toString()} - ${hasMember(err, "msg") && typeof err.msg === "string" && err.msg} ${JSON.stringify(err)}`,
          );
          break;
        }
      }
    }

    return vscode.Uri.joinPath(
      folder,
      copybook.substring(
        0,
        copybook.indexOf(".") !== -1 ? copybook.indexOf(".") : copybook.length,
      ),
    );
  }

  public async getProfileInfo(profile: string = "") {
    const partialProfile = asPartialProfile(profile);
    if (this.E4EProfiles.has(profile)) {
      return this.E4EProfiles.get(profile);
    }
    const resolvedProfile = await this.e4e.getProfileInfo(partialProfile);
    if (resolvedProfile instanceof Error) {
      vscode.window.showErrorMessage(resolvedProfile.message);
      this.E4EProfiles.set(profile, undefined);
      return;
    }
    this.E4EProfiles.set(profile, resolvedProfile);
    return resolvedProfile;
  }
  public async hasElement(
    profile: ResolvedProfile,
    endevorType: EndevorType,
    elementName: string,
  ): Promise<boolean> {
    const id = this.createProfileEndevorTypeId(profile, endevorType);
    elementName = elementName.toUpperCase();
    if (this.E4EElements.has(id)) {
      return (
        this.E4EElements.get(id)?.some(
          (x) => x.element.toUpperCase() == elementName,
        ) ?? false
      );
    }
    const members = await this.getElements(profile, endevorType);
    if (members instanceof Error) {
      this.E4EElements.set(id, undefined);
      return false;
    }
    this.E4EElements.set(id, members);
    return members.some((x) => x.element.toUpperCase() == elementName);
  }
  public clearProfiles() {
    this.E4EProfiles.clear();
  }
  private createProfileEndevorTypeId(
    profile: ResolvedProfile,
    endevorType: EndevorType,
  ) {
    return `${profile.instance}-${profile.profile}-${endevorType.environment}-${endevorType.stage}-${endevorType.system}-${endevorType.subsystem}-${endevorType.type}-${endevorType.use_map}`;
  }
}
interface E4EConfig {
  config: Promise<e4eResponse | undefined>;
  closed: boolean;
}
