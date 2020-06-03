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
import {CancellationToken} from "vscode";
import {ConfigurationParams, ConfigurationRequest} from "vscode-languageclient";
import {CopybooksPathGenerator} from "./CopybooksPathGenerator";
import {CopybookURI} from "./CopybookURI";

export class Middleware {
    private static extractFileAndCopybookNames(params: string): [string, string] {
        const firstDot = params.indexOf(".");
        const secondDot = params.indexOf(".", firstDot + 1);
        const lastDot = params.lastIndexOf(".");
        return [params.substring(secondDot + 1, lastDot), params.substring(lastDot + 1)];
    }
    constructor(
        private copybooksPathGenerator: CopybooksPathGenerator,
        private copybookResolverURI: CopybookURI) {
    }

    public async handleConfigurationRequest(
        params: ConfigurationParams,
        token: CancellationToken,
        next: ConfigurationRequest.HandlerSignature) {

        if (params.items.length === 1) {
            const sectionName = params.items[0].section;
            if (sectionName.startsWith("broadcom-cobol-lsp.copybook")) {
                const [cobolFileName, copybookName] = Middleware.extractFileAndCopybookNames(sectionName);
                return [await this.copybookResolverURI.resolveCopybookURI(copybookName, cobolFileName)];
            }
        }
        return next(params, token);
    }
}
