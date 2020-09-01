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
import * as vscode from "vscode";
import {EXTENSION_ID, TELEMETRY_DEFAULT_CONTENT} from "../../../constants";

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
        return fs.existsSync(this.getTelemetryResourcePath()) ? ExtensionUtils.readTelemetryFileContent() : TELEMETRY_DEFAULT_CONTENT;
    }

    private static getTelemetryResourcePath() {
        return vscode.Uri.file(
            path.join(this.getExtensionPath(), "resources", "TELEMETRY_KEY")).fsPath;
    }

    private static getExtensionPath(): string {
        return vscode.extensions.getExtension(EXTENSION_ID).extensionPath;
    }

    private static readTelemetryFileContent(): string {
        return fs.readFileSync(ExtensionUtils.getTelemetryResourcePath(), "utf8");
    }
}
