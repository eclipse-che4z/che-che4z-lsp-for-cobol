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

import {
    DSN_CONTAINS_PROHIBITED_CHAR,
    DSN_MUSTBE_NOT_EMPTY,
    DSN_NOMORE_8CHARS,
    DSN_START_PROHIBITED_CHAR,
    SEGMENT_PLACEHOLDER,
} from "../../constants";

export function validateDatasetNames(inputValue: string): string | undefined {
    const datasets: string[] = inputValue.split(",").map(e => e.trim());
    for (const dataset of datasets) {
        const result = validateDatasetName(dataset);
        if (result) {
            return result;
        }
    }
    return undefined;
}

function validateDatasetName(inputValue: string): string | undefined {
    const nameSegments = inputValue.split(".");

    const segmentHlqFirstCharRegex = new RegExp("^([@#$A-Za-z])$");

    const segmentHlqSegmentRegex = new RegExp("^([@#$A-Za-z0-9-]{1,8})$");
    for (const segment of nameSegments) {
        if (segment.length === 0) {
            return DSN_MUSTBE_NOT_EMPTY;
        }

        if (segment.length > 8) {
            return DSN_NOMORE_8CHARS;
        }

        if (!segmentHlqFirstCharRegex.test(segment.charAt(0))) {

            return DSN_START_PROHIBITED_CHAR.replace(SEGMENT_PLACEHOLDER, segment);
        }

        if (!segmentHlqSegmentRegex.test(segment)) {
            return DSN_CONTAINS_PROHIBITED_CHAR.replace(SEGMENT_PLACEHOLDER, segment);
        }
    }
    return undefined;
}
