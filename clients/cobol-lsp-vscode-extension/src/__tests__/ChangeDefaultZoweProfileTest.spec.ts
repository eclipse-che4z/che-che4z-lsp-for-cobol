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

import {changeDefaultZoweProfile} from "../commands/ChangeDefaultZoweProfile";
import { ProfileService } from "../services/ProfileService";
import {ZoweApi} from "../services/ZoweApi";

jest.mock("../services/ProfileService");
const profileService: ProfileService = new ProfileService(new ZoweApi());
profileService.getProfileFromMultiple = jest.fn();

test("Test changeDefaultZoweProfile command is defined", () => {
    expect(changeDefaultZoweProfile).toBeTruthy();
});

test("Test changeDefaultZoweProfile invoke call to zowe profile service", () => {
    changeDefaultZoweProfile(profileService);
    expect(profileService.getProfileFromMultiple).toBeCalled();
});
