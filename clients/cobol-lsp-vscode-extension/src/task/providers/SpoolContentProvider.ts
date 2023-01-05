/*
 * Copyright (c) 2022 Broadcom.
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
import { SettingsService } from "../../services/Settings";
import { Utils } from "../../services/util/Utils";

export default class SpoolContentProvider implements vscode.TextDocumentContentProvider {

    public static scheme = "spool-file.reference";
    private zoweProfile = SettingsService.getProfileName();

    onDidChange?: vscode.Event<vscode.Uri>;

    provideTextDocumentContent(uri: vscode.Uri, _token: vscode.CancellationToken): vscode.ProviderResult<string> {
        const zoweExplorerApi = Utils.getZoweExplorerAPI();
        const jobid = uri.path.split("/")[0];
        const jobname = uri.path.split("/")[1];
        const spoolid = uri.path.split("/")[2];
        const spoolName = uri.path.split("/")[3];
        const loadedProfile = zoweExplorerApi
            .getExplorerExtenderApi()
            .getProfilesCache()
            .loadNamedProfile(this.zoweProfile);
        const jesApi = zoweExplorerApi.getJesApi(loadedProfile);

        return  vscode.window.withProgress({
            location: vscode.ProgressLocation.Window,
            cancellable: false,
            title: `Loading ${spoolName}`,
        }, async progress => {
            progress.report({ increment: 0 });
            const result = await jesApi.getSpoolContentById(jobname, jobid, +spoolid);
            progress.report({ increment: 100 });
            return Promise.resolve(result);
        });
    }

}
