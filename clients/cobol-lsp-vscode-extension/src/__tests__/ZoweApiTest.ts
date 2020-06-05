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

import { RestClient } from "@zowe/imperative";
import { Session } from "inspector";
import { homedir } from "os";
import * as path from "path";
import { ZoweApi } from "../services/ZoweApi";
import { Type, ZoweError } from "../services/ZoweError";

const loadMock = jest.fn();
const loadAllMock = jest.fn();
jest.mock("@zowe/imperative/lib/profiles/src/BasicProfileManager", () => {
    return {
        BasicProfileManager: jest.fn().mockImplementation(() => {
            return {
                load: loadMock,
                loadAll: loadAllMock,
                getDefaultProfileName: () => "defaultName",
            };
        }),
    };
});

let zoweApi: ZoweApi;

beforeEach(() => {
    jest.clearAllMocks();
    zoweApi = new ZoweApi();
});

describe("ZoweApi public methods", () => {
    it("listZOSMFProfiles returns map of founded profiles", async () => {
        const profile = {
            name: "foo",
            password: "bar",
        };
        const profileFound = {
            name: "profileName",
            failNotFound: true,
            profile: profile,
        };
        const profileNotFound = {
            name: "wrongName",
            failNotFound: false,
        };
        loadAllMock.mockResolvedValue([profileFound, profileNotFound]);
        const expectedMap = {
            profileName: profile,
        };
        await expect(zoweApi.listZOSMFProfiles()).resolves.toEqual(expectedMap);
        expect(loadAllMock).toBeCalledTimes(1);
    });
    it("getDefaultProfileName works as expected", () => {
        expect(zoweApi.getDefaultProfileName()).toBe("defaultName");
    });
    it("fetchMember call RestClient with right path", async () => {
        const getExpectStringMock = jest.fn().mockResolvedValue("content");
        RestClient.getExpectString = getExpectStringMock;
        const createSessionMock = jest.fn().mockResolvedValue(new Session());
        zoweApi.createSession = createSessionMock;
        await expect(zoweApi.fetchMember("dataSet", "theMember", "profile")).resolves.toEqual("content");
        expect(getExpectStringMock).toBeCalledTimes(1);
        expect(getExpectStringMock.mock.calls[0][1]).toBe("/zosmf/restfiles/ds/dataSet(theMember)");
        expect(createSessionMock).toBeCalledWith("profile");
    });
    it("listMember call RestClient with right path", async () => {
        const getExpectJsonMock = jest.fn().mockResolvedValue({
            items: [
                {member: "member1"},
                {member: "member2"},
            ],
        });
        RestClient.getExpectJSON = getExpectJsonMock;
        const createSessionMock = jest.fn().mockResolvedValue(new Session());
        zoweApi.createSession = createSessionMock;
        await expect(zoweApi.listMembers("dataSet", "profile")).resolves.toStrictEqual(["member1", "member2"]);
        expect(createSessionMock).toBeCalledWith("profile");
        expect(getExpectJsonMock).toBeCalledTimes(1);
        expect(getExpectJsonMock.mock.calls[0][1]).toBe("/zosmf/restfiles/ds/dataSet/member")
    });
    it("throw No Password error if profile don't have a password", async () => {
        loadMock.mockResolvedValue({profile: {password: ""}});
        const expectedError = new ZoweError("No password", Type.NoPassword);
        await expect(zoweApi.createSession("zoweProfile")).rejects.toEqual(expectedError);
        expect(loadMock).toBeCalledWith({name: "zoweProfile"});
    });
    it("createSession works fine if password is set", async () => {
        loadMock.mockResolvedValue({profile: {password: "secret", host: "theHost"}});
        const expectedSession = {
            hostname: "theHost",
            password: "secret",
            type: "basic",
        };
        expect(zoweApi.createSession("zoweProfile")).resolves.toEqual({ISession: expectedSession});
        expect(loadMock).toBeCalledWith({name: "zoweProfile"});
    });
});
describe("ZoweApi private methods", () => {
    let OLD_ZOWE_CLI_HOME: string;

    beforeEach(() => {
        OLD_ZOWE_CLI_HOME = process.env.ZOWE_CLI_HOME;
    });

    afterEach(() => {
        process.env.ZOWE_CLI_HOME = OLD_ZOWE_CLI_HOME;
    });

    it("Creates profile params with ZOWE_CLI_HOME env variable", () => {
        process.env.ZOWE_CLI_HOME = "zoweHome";
        const expectedParams = {
            profileRootDirectory: path.join("zoweHome", "profiles"),
            type: "zosmf",
        };
        expect((zoweApi as any).createProfileParams()).toEqual(expectedParams)
    });
    it("Creates profile params with home dir", () => {
        process.env.ZOWE_CLI_HOME = "";
        (homedir as any) = jest.fn().mockReturnValue("userHome");
        const expectedParams = {
            profileRootDirectory: path.join("userHome", ".zowe", "profiles"),
            type: "zosmf",
        };
        expect((zoweApi as any).createProfileParams()).toEqual(expectedParams);
    });
});
