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
  E4E,
  ResolvedProfile,
  EndevorType,
  ExternalConfigurationOptions,
  ProcessorConfigurationType,
} from "../../../type/e4eApi.d";
import { CopybookURI } from "../CopybookURI";
import { E4E_FOLDER, USE_MAP } from "../../../constants";
import { asPartialProfile, hasMember, Utils } from "../../util/Utils";
import { SettingsService } from "../../Settings";
import { outputChannel } from "../../util/OutputChannel";

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

  private E4EProfiles = new Map<string, ResolvedProfile | undefined>();
  private E4EElements = new Map<string, EndevorElement[] | undefined>();
  private E4EMembers = new Map<string, EndevorMember[] | undefined>();

  public async getEndevorProcessorGroupConfig(uri: vscode.Uri) {
    const profile = await this.e4e.getProfileInfo(uri.toString());
    if (profile instanceof Error) {
      vscode.window.showErrorMessage(
        `An error occurred while retrieving Endevor configuration: ${profile.message}.`,
      );
      return;
    }

    const compiler = SettingsService.getLspConfigCompiler();
    const preprocessor = SettingsService.getLspConfigPreprocessors();

    const e4eConfiguration = await this.e4e.getConfiguration(uri.toString(), {
      compiler: compiler ?? defaultConfigs.compiler,
      preprocessor: preprocessor ?? defaultConfigs.preprocessor,
      type: defaultConfigs.type,
    });
    if (e4eConfiguration instanceof Error) {
      vscode.window.showErrorMessage(
        `An error occurred while retrieving Endevor configuration: ${e4eConfiguration.message}.`,
      );
      return;
    }

    return e4eConfiguration;
  }

  public async getMembers(
    profile: ResolvedProfile,
    dataset: string,
  ): Promise<EndevorMember[] | Error> {
    const id = this.createProfileDatasetId(profile, dataset);
    if (this.E4EMembers.has(id)) {
      return this.E4EMembers.get(id)!;
    }

    const list = await this.e4e.listMembers(profile, { dataset });
    if (list instanceof Error) {
      this.E4EMembers.set(id, undefined);
      return list;
    }

    const members = list.map((str) => ({
      dataset: dataset,
      member: str,
    }));

    this.E4EMembers.set(id, members);
    return members;
  }

  public async getElements(
    profile: ResolvedProfile,
    lib: EndevorType,
  ): Promise<EndevorElement[] | Error> {
    const id = this.createProfileEndevorTypeId(profile, lib);

    if (this.E4EElements.has(id)) {
      return this.E4EElements.get(id)!;
    }

    const list = await this.e4e.listElements(profile, lib);
    if (list instanceof Error) {
      this.E4EElements.set(id, undefined);
      return list;
    }

    const elements = list.map(([filename, fingerprint]) => ({
      environment: lib.environment,
      element: filename,
      use_map: lib.use_map ? true : false,
      stage: lib.stage,
      system: lib.system,
      subsystem: lib.subsystem,
      type: lib.type,
      fingerprint: fingerprint,
    }));

    this.E4EElements.set(id, elements);
    return elements;
  }

  public async downloadElementE4E(
    profile: ResolvedProfile,
    element: EndevorElement,
  ) {
    const use_map = element.use_map ? USE_MAP : "";
    const instance = CopybookURI.getEnviromentPath(element, profile);
    const filePath = await CopybookDownloaderForE4E.getCopybookPath(
      instance,
      use_map,
      this.storagePath,
      element.element,
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
      vscode.window.showErrorMessage(
        `Unable to download E4E element - ${JSON.stringify(element)} - ${resultElement.message}`,
      );
      return;
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
  ) {
    const instance = [Utils.profileAsString(profile)];
    const filePath = await CopybookDownloaderForE4E.getCopybookPath(
      instance,
      member.dataset,
      this.storagePath,
      member.member,
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
      vscode.window.showErrorMessage(
        `Unable to download E4E member - ${member.dataset}/${member.member} - ${memberContent.message}`,
      );
      return;
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
          outputChannel.appendLine(
            `FileExists error while allocating '${finishedPath.toString()}' directory for copybooks: ${JSON.stringify(err)}`,
          );
        } else {
          outputChannel.appendLine(
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

  public async getProfileForUri(uri: vscode.Uri) {
    const profile = await this.e4e.getProfileInfo(uri.toString());

    if (profile instanceof Error) {
      vscode.window.showErrorMessage(profile.message);
      return;
    }
    return profile;
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

  private createProfileDatasetId(profile: ResolvedProfile, dataset: string) {
    return `${profile.instance}-${profile.profile}-${dataset}`;
  }
}
