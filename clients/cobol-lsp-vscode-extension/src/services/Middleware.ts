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

import {CancellationToken, HandlerResult } from "vscode-jsonrpc";
import {ConfigurationParams, ConfigurationRequest} from "vscode-languageclient";
import {CopybookDownloadService} from "./CopybookDownloadService";
import {CopybookURI} from "./CopybookURI";
import {TelemetryService} from "./reporter/TelemetryService";

export class Middleware {
    private static extractFileAndCopybookNames(params: string): [string, string] {
        const firstDot = params.indexOf(".");
        const secondDot = params.indexOf(".", firstDot + 1);
        const lastDot = params.lastIndexOf(".");
        return [params.substring(secondDot + 1, lastDot), params.substring(lastDot + 1)];
    }
    constructor(
        private copybookResolverURI: CopybookURI,
        private copybookDownloader: CopybookDownloadService) {
    }

    public async handleConfigurationRequest(
        params: ConfigurationParams,
        token: CancellationToken,
        next: ConfigurationRequest.HandlerSignature): Promise<HandlerResult<any[], void>> {

        if (params.items.length > 0) {
            const sectionName = params.items[0].section;
            if (sectionName.startsWith("broadcom-cobol-lsp.copybook-resolve")) {
                //TODO: review if is useful send telemetry at this point - double check with requirements
                TelemetryService.registerEvent("resolve local copybook", ["COBOL", "copyooks", "copybook-resolve"], "Resolve a copybook from local folders");

                const [cobolFileName, copybookName] = Middleware.extractFileAndCopybookNames(sectionName);
                return [await this.copybookResolverURI.resolveCopybookURI(copybookName, cobolFileName)];
            }
            if (sectionName.startsWith("broadcom-cobol-lsp.copybook-download")) {
                //TODO: review if is useful send telemetry at this point - double check with requirements
                TelemetryService.registerEvent("resolve copybook from MF", ["COBOL", "copyooks", "copybook-download"], "Resolve a copybook from external configuration");

                const extractedNames = params.items.map(item => Middleware.extractFileAndCopybookNames(item.section));
                const copybookNames = extractedNames.map(names => names[1]);
                this.copybookDownloader.downloadCopybooks(extractedNames[0][0], copybookNames);
                return [];
            }
        }
        return next(params, token);
    }
}
