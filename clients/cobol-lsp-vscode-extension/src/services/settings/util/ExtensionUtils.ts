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

import {userInfo} from "os";
import {sep} from "path";
import * as vscode from "vscode";
import {EXTENSION_ID} from "../../../constants";

/**
 * This class contains utility methods consumed within the application
 */
export class ExtensionUtils {
    /**
     *  This method calculate the time elapsed between two number representation of dates expressed as
     *  number of milliseconds elapsed since January 1, 1970 00:00:00 UTC.
     * @param startTime numeric represetation of a starting time
     * @param endTime numeric representation of a ending time
     */
    public static calculateTimeElapsed(startTime: number, endTime: number): number | undefined {
        return ((startTime && endTime) && (endTime >= startTime)) ? ((endTime - startTime) / 1000) : undefined;
    }

    /**
     * This method return the extension version declared into the package.json
     */
    public static getPackageVersion(): string {
        return vscode.extensions.getExtension(EXTENSION_ID).packageJSON.version;
    }

    // /**
    //  * This method return the value of the instrumentation key necessary to create the telemetry reporter from an
    //  * external file configuration. If the file doesn't exists it returns a generic value that will not be valid
    //  * for collect telemetry event.
    //  */
    // public static getTelemetryKeyId(): string {
    //     return fs.existsSync(this.getTelemetryResourcePath()) ? ExtensionUtils.getInstrumentationKey() : TELEMETRY_DEFAULT_CONTENT;
    // }

    // TODO: move to telemetry service
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

    // private static getTelemetryResourcePath() {
    //     return vscode.Uri.file(
    //         path.join(this.getExtensionPath(), "resources", "TELEMETRY_KEY")).fsPath;
    // }

    // TODO: update javadoc
    /**
     *
     */
    public static getExtensionPath(): string {
        return vscode.extensions.getExtension(EXTENSION_ID).extensionPath;
    }

    // private static getInstrumentationKey(): string {
    //     return Buffer.from(fs.readFileSync(ExtensionUtils.getTelemetryResourcePath(), "utf8").replace(/(\r\n|\n|\r)/gm, ""), "base64").toString();
    // }

    private static getUsername(): string {
        return userInfo().username;
    }
}
