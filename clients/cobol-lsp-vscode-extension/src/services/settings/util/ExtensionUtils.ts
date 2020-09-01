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

import * as fs from "fs";
import * as path from "path";
import {URL} from "url";
import * as vscode from "vscode";
import {C4Z_FOLDER, EXTENSION_ID} from "../../../constants";
import {SettingsUtils} from "./SettingsUtils";

const TELEMETRY_KEY_FILENAME = "TELEMETRY_KEY";

export class ExtensionUtils {
    /**
     * This method return the extension version declared into the package.json
     */
    public static getPackageVersion(): string {
        return vscode.extensions.getExtension(EXTENSION_ID).packageJSON.version;
    }

    /**
     * This method return the value of the instrumentation key necessary to create the telemetry reporter from an
     * external file configuration. If the file doesn't exists it returns a generic value that will not be valid
     * for collect telemetry event.
     */
    public static getTelemetryKeyId(): string {
        let key: string = "GENERIC_INVALID_KEY";
        for (const workspaceFolder of SettingsUtils.getWorkspacesURI()) {
            const uri: URL = new URL(path.join(workspaceFolder, C4Z_FOLDER, TELEMETRY_KEY_FILENAME));

            if (fs.existsSync(uri)) {
                key = this.readContentFromFile(uri);
            }
        }
        return key;
    }

    private static readContentFromFile(filePath: URL) {
        return fs.readFileSync(filePath, "utf8");
    }
}
