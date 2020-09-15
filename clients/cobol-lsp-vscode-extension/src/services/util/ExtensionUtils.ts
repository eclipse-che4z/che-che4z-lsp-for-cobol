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

import * as vscode from "vscode";
import {EXTENSION_ID} from "../../constants";

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
     * This method return the name of the runtime IDE if available or "N.D." otherwise
     */
    public static getIDEName(): string {
        return (vscode.env) ? vscode.env.appName : "N.D.";
    }

    /**
     * Return the physical location of the extension
     */
    public static getExtensionPath(): string {
        return vscode.extensions.getExtension(EXTENSION_ID).extensionPath;
    }
}
