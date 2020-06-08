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
import * as cp from "child_process";

const versionPattern = new RegExp('(java|openjdk) (version)? ?"?((9|[0-9][0-9])|(1|9|[0-9][0-9])\.(1|8|[0-9][0-9]).*).*');

export class JavaCheck {
    public static isJavaVersionSupported(versionString: string) {
        return versionPattern.test(versionString);
    }
    public async isJavaInstalled() {
        return new Promise<any>((resolve, reject) => {
            const ls = cp.spawn("java", ["-version"]);
            ls.stderr.on("data", (data: any) => {
                if (!JavaCheck.isJavaVersionSupported(data.toString())) {
                    reject("Minimum expected Java version is 8");
                }
                resolve();
            });
            ls.on("error", (code: any) => {
                if ("Error: spawn java ENOENT" === code.toString()) {
                    reject("Java 8 is not found");
                }
                reject(code);
            });
            ls.on("close", (code: number) => {
                if (code !== 0) {
                    reject("An error occurred when checking if Java was installed");
                }
            });
        });
    }
}
