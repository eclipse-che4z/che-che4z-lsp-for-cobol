
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
    it("Handle cpy-manager request", async () => {
        const copybookPathGenerator: any = {
            listUris: jest.fn().mockResolvedValue(["uri"]),
        };
        const middleware = new Middleware(copybookPathGenerator, null);
        const params = constructParams("broadcom-cobol-lsp.cpy-manager");
        expect(await middleware.handleConfigurationRequest(params, null, null)).toEqual(["uri"]);
    });
    it("Handle copybook request", async () => {
        const copybookResolverURI: any = {
            resolveCopybookURI: jest.fn().mockResolvedValue("copybookUri"),
        };
        const middleware = new Middleware(null, copybookResolverURI);
        const params = constructParams("broadcom-cobol-lsp.copybook.cobFile.bookName");
        expect(await middleware.handleConfigurationRequest(params, null, null)).toEqual(["copybookUri"]);
        expect(copybookResolverURI.resolveCopybookURI).toHaveBeenCalledWith("bookName", "cobFile");
    });
    it("Handle copybook request for name with dots", async () => {
        const copybookResolverURI: any = {
            resolveCopybookURI: jest.fn().mockResolvedValue("copybookUri"),
        };
        const middleware = new Middleware(null, copybookResolverURI);
        const params = constructParams("broadcom-cobol-lsp.copybook.USER.CLIST.COB.bookName");
        expect(await middleware.handleConfigurationRequest(params, null, null)).toEqual(["copybookUri"]);
        expect(copybookResolverURI.resolveCopybookURI).toHaveBeenCalledWith("bookName", "USER.CLIST.COB");
    });
    it("Call next for non cobol params", async () => {
        const middleware = new Middleware(null, null);
        const params = constructParams("foo.bar");
        const next = jest.fn().mockReturnValue(["next"]);
        expect(await middleware.handleConfigurationRequest(params, null, next)).toEqual(["next"]);
        expect(next).toHaveBeenCalledWith(params, null);
    });
    it("Call next for unexpected second qualifier", async () => {
        const middleware = new Middleware(null, null);
        const params = constructParams("broadcom-cobol-lsp.bar");
        const next = jest.fn().mockReturnValue(["next"]);
        expect(await middleware.handleConfigurationRequest(params, null, next)).toEqual(["next"]);
        expect(next).toHaveBeenCalledWith(params, null);
    });
});
