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

import { Middleware } from "../services/Middleware";

function constructParams(sectionName: string): any {
    return {
        items: [
            {section: sectionName},
        ],
    };
}

// tslint:disable: no-unused-expression no-string-literal
describe("Copybook downloader", () => {
    const resolveCopybookURIMock = jest.fn().mockResolvedValue("copybookUri");
    const copybookResolverURI: any = {
        resolveCopybookURI: resolveCopybookURIMock,
    };
    const downloadCopybooksMock = jest.fn().mockResolvedValue(null);
    const copybookDownloader: any = {
        downloadCopybooks: downloadCopybooksMock,
    };
    const middleware = new Middleware(copybookResolverURI, copybookDownloader);

    beforeEach(() => {
        jest.clearAllMocks();
    });

    it("Handle copybook request", async () => {
        const params = constructParams("broadcom-cobol-lsp.copybook-resolve.cobFile.bookName");
        expect(await middleware.handleConfigurationRequest(params, null, null)).toEqual(["copybookUri"]);
        expect(resolveCopybookURIMock).toHaveBeenCalledWith("bookName", "cobFile");
    });
    it("Handle copybook request for name with dots", async () => {
        const params = constructParams("broadcom-cobol-lsp.copybook-resolve.USER.CLIST.COB.bookName");
        expect(await middleware.handleConfigurationRequest(params, null, null)).toEqual(["copybookUri"]);
        expect(resolveCopybookURIMock).toHaveBeenCalledWith("bookName", "USER.CLIST.COB");
    });
    it("Handle copybook download request", async () => {
        const params = {items: [
            "broadcom-cobol-lsp.copybook-download.cobFile.bookName",
            "broadcom-cobol-lsp.copybook-download.cobFile.bookName2",
        ].map(sectionName => ({section: sectionName}))};
        await expect(middleware.handleConfigurationRequest(params, null, null)).resolves.toEqual([]);
        expect(downloadCopybooksMock).toHaveBeenCalledWith("cobFile", ["bookName", "bookName2"]);
    });
    it("Call next for non cobol params", async () => {
        const params = constructParams("foo.bar");
        const next = jest.fn().mockReturnValue(["next"]);
        expect(await middleware.handleConfigurationRequest(params, null, next)).toEqual(["next"]);
        expect(next).toHaveBeenCalledWith(params, null);
    });
    it("Call next for unexpected second qualifier", async () => {
        const params = constructParams("broadcom-cobol-lsp.bar");
        const next = jest.fn().mockReturnValue(["next"]);
        expect(await middleware.handleConfigurationRequest(params, null, next)).toEqual(["next"]);
        expect(next).toHaveBeenCalledWith(params, null);
    });
});
