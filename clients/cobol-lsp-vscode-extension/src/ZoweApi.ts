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

import { AbstractSession, BasicProfileManager, IProfile, RestClient, Session } from "@zowe/imperative";
import * as os from "os";
import * as path from "path";

const ZOSMF_PREFIX = "/zosmf/restfiles/ds/";

export interface ProfilesMap {
    [key: string]: IProfile;
}

export class ZoweApi {

    private profileManager = new BasicProfileManager(this.createProfileParams());

    public async listZOSMFProfiles(): Promise<ProfilesMap> {
        const profiles: ProfilesMap = {};
        for (const loadedProfile of await this.profileManager.loadAll()) {
            if (loadedProfile.failNotFound) {
                profiles[loadedProfile.name] = loadedProfile.profile;
            }
        }
        return profiles;
    }

    public getDefaultProfileName() {
        return this.profileManager.getDefaultProfileName();
    }

    public async fetchMember(dataset: string, member: string, profileName: string): Promise<string> {
        const session: Session = await this.createSession(profileName);

        // default should be https
        const rpath = `${ZOSMF_PREFIX}${dataset}(${member})`;
        return await RestClient.getExpectString(session, rpath, [{
            "Content-Type": "application/json", "X-CSRF-ZOSMF-HEADER": "",
        }]);
    }

    public async listMembers(dataset: string, profileName: string): Promise<string[]> {
        // default should be https
        const session: Session = await this.createSession(profileName);
        const rpath = `${ZOSMF_PREFIX}${dataset}/member`;
        const result = await RestClient.getExpectJSON(session, rpath, [{
            "Content-Type": "application/json", "X-CSRF-ZOSMF-HEADER": "",
        }]);
        // tslint:disable-next-line: no-string-literal
        return result["items"].map((i: any) => i.member);
    }

    public async createSession(profileName: string) {
        const profile = (await new BasicProfileManager(this.createProfileParams()).load({ name: profileName })).profile;
        return new Session({
            ...{
                hostname: profile.host,
                type: AbstractSession.TYPE_BASIC,
            },
            ...profile,
        });
    }

    private createProfileParams() {
        const zoweHome = process.env.ZOWE_CLI_HOME || path.join(os.homedir(), ".zowe");
        return {
            profileRootDirectory: path.join(zoweHome, "profiles"),
            type: "zosmf",
        };
    }
}
