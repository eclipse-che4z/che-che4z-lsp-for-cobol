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
import {userInfo} from "os";
import * as path from "path";
import {sep} from "path";
import * as vscode from "vscode";
import {EXTENSION_ID, TELEMETRY_DEFAULT_CONTENT} from "../../../constants";

/**
 * This class contains utility methods consumed within the application
 */
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

    /**
     * This method allows to anonymize the username value present in stack trace
     * @param content stack trace
     */
    public static anonymizeContent(content: string): string {
        return content.replace(new RegExp("\\" + sep + this.getUsername(), "g"), sep + "anonymous");
    }

    /**
     * This method return the name of the runtime IDE if available or "N.D." otherwise
     */
    public static getIDEName(): string {
        return (vscode.env) ? vscode.env.appName : "N.D.";
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

    private static getUsername(): string {
        return userInfo().username;
    }
}
