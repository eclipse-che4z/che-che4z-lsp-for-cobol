/*
 * Copyright (c) 2020 Broadcom.
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

import * as fs from "node:fs";
import * as iconv from "iconv-lite";
import * as Path from "node:path";
import * as vscode from "vscode";
import {
  C4Z_FOLDER,
  DOWNLOAD_QUEUE_LOCKED_ERROR_MSG,
  GITIGNORE_FILE,
  INSTALL_ZOWE,
  INVALID_CREDENTIALS_ERROR_MSG,
  PATHS_USS,
  PATHS_ZOWE,
  PROCESS_DOWNLOAD_ERROR_MSG,
  PROFILE_NAME_PLACEHOLDER,
  PROVIDE_PROFILE_MSG,
  SETTINGS_CPY_SECTION,
  UNLOCK_DOWNLOAD_QUEUE_MSG,
  ZOWE_EXT_MISSING_MSG,
} from "../../constants";
import { TelemetryService } from "../reporter/TelemetryService";
import { createFileWithGivenPath, SettingsService } from "../Settings";
import { ProfileUtils } from "../util/ProfileUtils";
import { Utils } from "../util/Utils";
import { CopybookURI } from "./CopybookURI";
import { CopybookProfile, DownloadQueue } from "./DownloadQueue";

export class CopybookName {
  public constructor(public name: string, public dialect: string) {}
}

const experimentTag = "experiment-tag";
export class CopybookDownloadService implements vscode.Disposable {
  public static checkWorkspace(): boolean {
    if (vscode.workspace.workspaceFolders.length === 0) {
      vscode.window.showErrorMessage("No workspace folder opened.");
      return false;
    }
    return true;
  }

  private static completedDownload: number = 0;
  private static totalDownload: number = 0;

  private static createErrorMessageForCopybooks(datasets: Set<string>) {
    CopybookDownloadService.processDownloadError(
      PROCESS_DOWNLOAD_ERROR_MSG + Array.from(datasets),
    );
  }

  private static processDownloadError(title: string) {
    const actionSettings = "Change settings";
    vscode.window.showErrorMessage(title, actionSettings).then((action) => {
      if (action === actionSettings) {
        vscode.commands.executeCommand("cobol-lsp.cpy-manager.goto-settings");
      }
    });
  }

  private static needsUserNotification(queue: CopybookProfile[]): boolean {
    return queue.find((profile) => !profile.quiet) !== undefined;
  }

  private static async showQueueLockedDialog(
    profileName: string,
  ): Promise<boolean> {
    const action = await vscode.window.showErrorMessage(
      DOWNLOAD_QUEUE_LOCKED_ERROR_MSG.replace(
        PROFILE_NAME_PLACEHOLDER,
        profileName,
      ),
      UNLOCK_DOWNLOAD_QUEUE_MSG,
    );
    return action === UNLOCK_DOWNLOAD_QUEUE_MSG;
  }

  private static isInvalidCredentials(e: any) {
    return e?.mDetails?.errorCode === 401;
  }

  private static async fetchCopybook(
    dataset: string,
    copybookProfile: CopybookProfile,
    isUSS: boolean,
  ): Promise<boolean> {
    let members: string[] = [];
    try {
      members = await CopybookDownloadService.getAllMembers(
        dataset,
        copybookProfile.profile,
        isUSS,
      );
    } catch (error) {
      if (CopybookDownloadService.isInvalidCredentials(error)) {
        throw error;
      }
      if (!copybookProfile.quiet) {
        vscode.window.showErrorMessage(error.message);
      }
      return false;
    }
    const remoteCopybook = CopybookDownloadService.getRemoteCopybookName(
      members,
      copybookProfile.getCopybook(),
    );
    if (!remoteCopybook) {
      return false;
    }
    copybookProfile.updateCopybook(remoteCopybook);
    await CopybookDownloadService.downloadCopybookFromMFUsingZowe(
      dataset,
      copybookProfile,
      isUSS,
    );
    return true;
  }

  private static getRemoteCopybookName(
    members: string[],
    copybookName: string,
  ) {
    return members.find(
      (ele) =>
        ele
          .substring(
            0,
            ele.lastIndexOf(".") !== -1 ? ele.lastIndexOf(".") : ele.length,
          )
          .toUpperCase() === copybookName.toUpperCase(),
    );
  }

  private static async getAllMembers(
    dataset: string,
    profileName: string,
    isUSS: boolean,
  ) {
    let members: string[];
    const zoweExplorerApi = await Utils.getZoweExplorerAPI();
    const loadedProfile = zoweExplorerApi
      .getExplorerExtenderApi()
      .getProfilesCache()
      .loadNamedProfile(profileName);
    if (isUSS) {
      const response = await zoweExplorerApi
        .getUssApi(loadedProfile)
        .fileList(dataset);
      members = response.apiResponse.items.map((el) => el.name);
    } else {
      const response = await zoweExplorerApi
        .getMvsApi(loadedProfile)
        .allMembers(dataset);
      members = response.apiResponse.items.map((el) => el.member);
    }
    return members;
  }

  private static async downloadCopybookFromMFUsingZowe(
    dataset: string,
    copybookprofile: CopybookProfile,
    isUSS: boolean,
  ) {
    const copybookPath = CopybookURI.createCopybookPath(
      copybookprofile.profile,
      dataset,
      copybookprofile.getCopybook(),
    );
    if (!fs.existsSync(copybookPath)) {
      try {
        // create .gitignore file within .c4z folder
        createFileWithGivenPath(C4Z_FOLDER, GITIGNORE_FILE, "/**");
        await CopybookDownloadService.downloadCopybookContent(
          dataset,
          copybookprofile.getCopybook(),
          copybookprofile.profile,
          isUSS,
        );
      } catch (err) {
        if (CopybookDownloadService.needsUserNotification([copybookprofile])) {
          vscode.window.showErrorMessage(err.message);
        }
      }
    }
  }

  private static async downloadCopybookContent(
    dataset: string,
    copybook: string,
    profileName: string,
    isUSS: boolean,
  ) {
    const zoweExplorerApi = await Utils.getZoweExplorerAPI();
    const loadedProfile = zoweExplorerApi
      .getExplorerExtenderApi()
      .getProfilesCache()
      .loadNamedProfile(profileName);
    const downloadBinary = !!SettingsService.getCopybookFileEncoding();
    const filePath = Path.join(
      CopybookURI.createDatasetPath(profileName, dataset),
      copybook.substring(
        0,
        copybook.indexOf(".") !== -1 ? copybook.indexOf(".") : copybook.length,
      ),
    );

    const downloadOptions = {
      file: filePath,
      binary: downloadBinary,
      returnEtag: true,
    };
    if (!SettingsService.getCopybookFileEncoding()) {
      (downloadOptions as any).encoding = loadedProfile.profile.encoding;
    }

    if (isUSS) {
      await zoweExplorerApi
        .getUssApi(loadedProfile)
        .getContents(`${dataset}/${copybook}`, downloadOptions);
    } else {
      await zoweExplorerApi
        .getMvsApi(loadedProfile)
        .getContents(`${dataset}(${copybook})`, downloadOptions);
    }

    if (downloadBinary) {
      let newContent = iconv.decode(
        fs.readFileSync(filePath),
        SettingsService.getCopybookFileEncoding() as string,
      );
      if (!isUSS) {
        // Based on assumption - Most of source code on z/OS is 80 characters per record - JCL, HLASM, COBOL
        // Can be exposed later on as a setting.
        newContent = newContent.replace(/.{80}/g, `$&\n`);
      }
      fs.writeFileSync(filePath, newContent);
    }
  }

  private static async handleCopybooks(
    toDownload: CopybookProfile[],
    errors: Set<string>,
    progress: vscode.Progress<{ message?: string; increment?: number }>,
    isUSS: boolean = false,
  ) {
    const promises = [];
    try {
      for (const cp of toDownload) {
        const datasets = isUSS
          ? SettingsService.getUssPath(cp.documentUri, cp.dialectType)
          : SettingsService.getDsnPath(cp.documentUri, cp.dialectType);
        for (const dataset of datasets) {
          if (CopybookDownloadService.needsUserNotification(toDownload)) {
            progress.report({
              message:
                "Looking in " +
                dataset +
                ". " +
                toDownload.length +
                " copybook(s) left.",
            });
          }
          promises.push(
            CopybookDownloadService.handleCopybook(
              progress,
              dataset,
              cp,
              errors,
              isUSS,
            ),
          );
        }
      }
      await Promise.all(promises);
    } catch (e) {
      if (CopybookDownloadService.isInvalidCredentials(e)) {
        throw e;
      }
      if (CopybookDownloadService.needsUserNotification(toDownload)) {
        vscode.window.showErrorMessage(e.toString());
      }
    }
  }

  private static async handleCopybook(
    progress: vscode.Progress<{ message?: string; increment?: number }>,
    dataset: string,
    cp: CopybookProfile,
    errors: Set<string>,
    isUSS: boolean,
  ) {
    try {
      const fetchResult = await CopybookDownloadService.fetchCopybook(
        dataset,
        cp,
        isUSS,
      );
      if (fetchResult) {
        this.updateDownloadProgress(progress, errors, cp);
      }
    } catch (e) {
      if (CopybookDownloadService.isInvalidCredentials(e)) {
        throw e;
      }
      if (!cp.quiet) {
        vscode.window.showErrorMessage(e.toString());
      }
    }
  }

  private static updateDownloadProgress(
    progress: vscode.Progress<{ message?: string; increment?: number }>,
    errors: Set<string>,
    cp: CopybookProfile,
  ) {
    errors.delete(cp.getCopybook());
    this.completedDownload++;
    const downloadPercent = Math.round(
      (this.completedDownload / this.totalDownload) * 100,
    );
    progress.report({
      increment: downloadPercent,
      message: downloadPercent + "%",
    });
  }

  private static isEligibleForCopybookDownload() {
    const dsnPath: string[] = vscode.workspace
      .getConfiguration(SETTINGS_CPY_SECTION)
      .get(PATHS_ZOWE);
    const ussPath: string[] = vscode.workspace
      .getConfiguration(SETTINGS_CPY_SECTION)
      .get(PATHS_USS);
    const providedProfile: string = vscode.workspace
      .getConfiguration(SETTINGS_CPY_SECTION)
      .get("profiles");
    return (
      dsnPath?.length > 0 || ussPath?.length > 0 || providedProfile?.length > 0
    );
  }

  private queue: DownloadQueue = new DownloadQueue();
  private lockedProfile: Set<string> = new Set();

  /**
   * This method is invoked by {@link CopybookURI#resolveCopybookURI} when the target copybbok is not found on
   * local workspaces and should be added in the download queue for copybooks that the LSP client will try
   * to download from MF
   * @param documentUri URI of the document open in workspace
   * @param copybookNames list of names of the copybooks required by the LSP server
   * @param quiet flag described that interaction with a user is not allowed
   */
  public async downloadCopybooks(
    documentUri: string,
    copybookNames: CopybookName[],
    quiet: boolean = true,
  ): Promise<void> {
    if (!CopybookDownloadService.isEligibleForCopybookDownload()) {
      if (!quiet) {
        CopybookDownloadService.createErrorMessageForCopybooks(
          new Set<string>(copybookNames.map((c) => c.name)),
        );
      }
      return;
    }
    const explorerAPI = await Utils.getZoweExplorerAPI();
    if (
      CopybookDownloadService.isEligibleForCopybookDownload() &&
      !explorerAPI
    ) {
      if (!quiet) {
        vscode.window
          .showErrorMessage(ZOWE_EXT_MISSING_MSG, INSTALL_ZOWE)
          .then((action) => {
            if (action === INSTALL_ZOWE) {
              vscode.commands.executeCommand(
                "workbench.extensions.search",
                "zowe.vscode-extension-for-zowe",
              );
            }
          });
      }
      return;
    }

    if (!CopybookDownloadService.checkWorkspace()) {
      return;
    }
    const profile = await ProfileUtils.getProfileNameForCopybook(documentUri);
    const availableProfiles = ProfileUtils.getAvailableProfiles(explorerAPI);

    if (!profile || availableProfiles.indexOf(profile) < 0) {
      if (!quiet) {
        const providedProfile: string = SettingsService.getProfileName();
        const message = providedProfile
          ? `${PROVIDE_PROFILE_MSG} Provided invalid profile name: ${providedProfile}`
          : `${PROVIDE_PROFILE_MSG}`;
        CopybookDownloadService.processDownloadError(message);
      }
      return;
    }

    if (this.lockedProfile.has(profile)) {
      if (quiet) {
        return;
      }
      if (await CopybookDownloadService.showQueueLockedDialog(profile)) {
        this.lockedProfile.delete(profile);
      } else {
        return;
      }
    }

    copybookNames.forEach((copybook) => {
      this.queue.push(
        documentUri,
        copybook.name,
        copybook.dialect,
        profile,
        quiet,
      );
    });
  }

  public async start() {
    let startTime: number | null = null;
    const errors = new Set<string>();
    while (true) {
      const element: CopybookProfile | undefined = await this.queue.pop();
      if (!element) {
        // undefined element means that service is disposed
        return;
      }
      if (startTime === null) {
        startTime = Date.now();
      }
      startTime = await this.run(element, errors, startTime);
    }
  }

  public dispose() {
    this.queue.stop();
  }

  private async process(
    progress: vscode.Progress<{ message?: string; increment?: number }>,
    element: CopybookProfile,
    errors: Set<string>,
    startTime: number,
  ) {
    {
      await this.handleQueue(element, errors, progress);

      if (!element.quiet && this.queue.length === 0 && errors.size > 0) {
        CopybookDownloadService.createErrorMessageForCopybooks(errors);
        errors.clear();
      }

      if (this.queue.length === 0) {
        TelemetryService.registerEvent(
          "Download copybooks from MF",
          ["copybook", "COBOL", experimentTag],
          "total time to search copybooks on MF",
          new Map().set(
            "time elapsed",
            TelemetryService.calculateTimeElapsed(startTime, Date.now()),
          ),
        );
        startTime = null;
      }
    }
  }

  private async run(
    element: CopybookProfile,
    errors: Set<string>,
    startTime: number,
  ) {
    await vscode.window.withProgress(
      {
        location: vscode.ProgressLocation.Notification,
        title: "Fetching copybooks",
      },
      async (
        progress: vscode.Progress<{ message?: string; increment?: number }>,
      ) => this.process(progress, element, errors, startTime),
    );
    return startTime;
  }

  private async handleQueue(
    element: CopybookProfile,
    errors: Set<string>,
    progress: vscode.Progress<{ message?: string; increment?: number }>,
  ) {
    const toDownload: CopybookProfile[] = [element];
    while (this.queue.length > 0) {
      toDownload.push(await this.queue.pop());
    }
    toDownload.map((cp) => cp.getCopybook()).forEach((cb) => errors.add(cb));
    CopybookDownloadService.totalDownload = toDownload.length;
    CopybookDownloadService.completedDownload = 0;
    try {
      await CopybookDownloadService.handleCopybooks(
        toDownload,
        errors,
        progress,
      );

      const toDownloadUSS = toDownload
        .filter((cp) => errors.has(cp.getCopybook()))
        .map((cp) => cp);
      const quiteModeOffCopybooks = toDownloadUSS
        .filter((cp) => !cp.quiet)
        .map((cp) => cp.getCopybook());
      errors.forEach((ele) => {
        if (!quiteModeOffCopybooks.includes(ele)) {
          errors.delete(ele);
        }
      });
      if (toDownloadUSS.length > 0) {
        await CopybookDownloadService.handleCopybooks(
          toDownloadUSS,
          errors,
          progress,
          true,
        );
      }
    } catch (e) {
      let errorMessage = e.toString();
      if (CopybookDownloadService.isInvalidCredentials(e)) {
        errorMessage = INVALID_CREDENTIALS_ERROR_MSG.replace(
          PROFILE_NAME_PLACEHOLDER,
          element.profile,
        );
        this.lockedProfile.add(element.profile);
        this.queue.clean();
        TelemetryService.registerEvent(
          "invalidCredentials",
          ["copybook", "COBOL", "experiment-tag"],
          "Zowe credentials is not valid",
        );
      }

      TelemetryService.registerExceptionEvent(
        undefined,
        errorMessage,
        ["copybook", "COBOL", experimentTag],
        "There is an issue with zowe api layer",
      );
      if (CopybookDownloadService.needsUserNotification(toDownload)) {
        vscode.window.showErrorMessage(errorMessage);
      }
    }
  }
}
