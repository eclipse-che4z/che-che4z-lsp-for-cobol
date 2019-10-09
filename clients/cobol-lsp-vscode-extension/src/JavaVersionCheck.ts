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
export interface JavaVersionCheck {
    isJavaVersionSupported(versionString: string): boolean;
}

export class DefaultJavaVersionCheck implements JavaVersionCheck {
    public isJavaVersionSupported(versionString: string) {
        var versionPattern = new RegExp('(java|openjdk) (version)? ?"?((9|\d\d)|(1|9|\d\d)\.(1|8|\d\d).*).*');
        return versionPattern.test(versionString);
    }
}