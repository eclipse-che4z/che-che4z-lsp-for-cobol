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

/**
 * This class collects utility methods for general purpose activities
 */
export class Utils {
    /**
     * This method provides a quick way to verify if the input is null or undefined.
     * The idea is to have something similar to the util library {@link node.isNullOrUndefined} that is deprecated.
     * @param content the string value target of the validation
     * @return true if the content is not null or undefined, false otherwise
     */
    public static isNullOrUndefined(content: string): boolean {
        return content === null || content === undefined;
    }
}
