/*
 * Copyright (c) 2019 Broadcom.
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

import { DefaultJavaVersionCheck } from "../JavaVersionCheck";

describe("Check Java version", () => {
    it("Checks if Java version is supported", async () => {
        var javaCheck = new DefaultJavaVersionCheck();
        expect(javaCheck.isJavaVersionSupported('openjdk version "1.8.0-internal"')).toBeTruthy;
        expect(javaCheck.isJavaVersionSupported('java version "1.8.0_181"')).toBeTruthy;
        expect(javaCheck.isJavaVersionSupported('openjdk version "1.11.0-internal"')).toBeTruthy;
        expect(javaCheck.isJavaVersionSupported('java version "1.11.0_181"')).toBeTruthy;
        expect(javaCheck.isJavaVersionSupported('java version "10.0.1" 2018-04-17')).toBeTruthy;
        expect(javaCheck.isJavaVersionSupported('java version "9"')).toBeTruthy;
        expect(javaCheck.isJavaVersionSupported('java version "1.8.0_131"')).toBeTruthy;
        expect(javaCheck.isJavaVersionSupported('openjdk version "11.0.1" 2018-10-16')).toBeTruthy;
        expect(javaCheck.isJavaVersionSupported('openjdk version "12.0.1" 2018-10-16')).toBeTruthy;
        expect(javaCheck.isJavaVersionSupported('java 11 2018-09-25')).toBeTruthy;
        expect(javaCheck.isJavaVersionSupported('java 12 2019-03-19')).toBeTruthy;

        expect(javaCheck.isJavaVersionSupported('java version "1.7.0_131"')).toBeFalsy;
    });
});