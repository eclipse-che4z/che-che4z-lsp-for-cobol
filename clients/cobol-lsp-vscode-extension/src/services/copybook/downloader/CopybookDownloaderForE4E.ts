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
} from "../../../type/e4eApi.d";
import { CopybookURI } from "../CopybookURI";
import { DATASET, E4E_FOLDER, ENVIRONMENT, USE_MAP } from "../../../constants";
import { CopybookName } from "../CopybookDownloadService";
import { Utils } from "../../util/Utils";

export class CopybookDownloaderForE4E {
  constructor(
    private storagePath: string,
    private outputChannel: vscode.OutputChannel | undefined,
  ) {}

  public async downloadCopybookE4E(
    copybookName: CopybookName,
    endevorApi: e4eResponse,
  ) {
    const first = endevorApi.elements[copybookName.name];

    if (!first) {
      this.outputChannel?.appendLine(
        `Failed to find ${copybookName} in Endevor`,
      );
    } else if (DATASET in first)
      await this.downloadDatasetE4E(endevorApi, first);
    else if (ENVIRONMENT in first)
      await this.downloadElementE4E(endevorApi, first);
  }

  public async downloadElementE4E(
    endevorApi: e4eResponse,
    element: EndevorElement,
  ) {
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
      const resultElement = await endevorApi.api.getElement(
        endevorApi.profile,
        element,
      );

      if (resultElement instanceof Error) {
        this.outputChannel?.appendLine(resultElement.message);
      } else {
        await fs.promises.writeFile(filePath, resultElement[0]);
      }
    } catch (err: any) {
      vscode.window.showErrorMessage(err.message);
    }
  }

  public async downloadDatasetE4E(
    endevorApi: e4eResponse,
    member: EndevorMember,
  ) {
    try {
      const instance = Utils.profileAsString(endevorApi.profile);
      const filePath: string = CopybookDownloaderForE4E.getCopybookPath(
        instance,
        member.dataset,
        this.storagePath,
        member.member,
      );

      const memberContent = await endevorApi.api.getMember(endevorApi.profile, {
        dataset: member.dataset,
        member: member.member,
      });

      if (memberContent instanceof Error) {
        this.outputChannel?.appendLine(memberContent.message);
      } else {
        await fs.promises.writeFile(filePath, memberContent);
      }
    } catch (err: any) {
      vscode.window.showErrorMessage(err.message);
    }
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
}
