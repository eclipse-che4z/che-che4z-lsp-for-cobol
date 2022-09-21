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

import {CancellationToken, HandlerResult} from "vscode-jsonrpc";
import {ConfigurationParams, ConfigurationRequest} from "vscode-languageclient";
import {CopybookDownloadService, CopybookName} from "./copybook/CopybookDownloadService";
import {CopybookURI} from "./copybook/CopybookURI";

const PARAMS_REGEX = /^([^.]+)\.([^.]+)(\.(quiet|verbose))?\.(.+)\.([^.]+)\.([^.]+)$/

export class Middleware {
    constructor(
        private copybookDownloader: CopybookDownloadService) {
    }

    public async handleConfigurationRequest(
        params: ConfigurationParams,
        token: CancellationToken,
        next: ConfigurationRequest.HandlerSignature): Promise<HandlerResult<any[], void>> {

        const requestLines = params.items.map(item => Middleware.parseLine(item.section));
        if (requestLines.length > 0 && requestLines[0] !== undefined && requestLines[0].prefix == "cobol-lsp") {
            switch (requestLines[0].command) {
                case "copybook-resolve":
                    return [await CopybookURI.resolveCopybookURI(requestLines[0].copybookName,
                        requestLines[0].cobolFileName, requestLines[0].dialectName)]
                case "copybook-download":
                    const copybookNames: CopybookName[] = requestLines.map(requestLine => new CopybookName(requestLine.copybookName, requestLine.dialectName));
                    this.copybookDownloader.downloadCopybooks(requestLines[0].cobolFileName, copybookNames,
                        requestLines[0].quiet);
                    return [];
            }
        }
        return next(params, token);
    }

    private static parseLine(line: string): RequestLine | undefined {
        const match = PARAMS_REGEX.exec(line);
        if (match !== null) {
            return new RequestLine(
                match[1],
                match[2],
                match[5],
                match[6],
                match[7],
                "verbose" != match[4]
            );
        }
    }
}

export class RequestLine {
    constructor(
        readonly prefix: string,
        readonly command: string,
        readonly cobolFileName: string,
        readonly copybookName: string,
        readonly dialectName: string,
        readonly quiet: boolean
    ) { }
}
