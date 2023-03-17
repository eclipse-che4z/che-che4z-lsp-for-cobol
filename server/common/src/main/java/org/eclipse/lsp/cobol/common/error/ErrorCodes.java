/*
 * Copyright (c) 2023 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.common.error;

import lombok.AllArgsConstructor;

/**
 * This enum represents the error codes that are used to determine some special type of errors. See
 * the instance documentation for more details. This is specifically used to trigger codeActions.
 */
@AllArgsConstructor
public enum ErrorCodes implements ErrorCode {
    /** This copybook does not present in the copybook folder */
    MISSING_COPYBOOK("missing copybook"),
    INCOMPATIBLE_SERVER_TYPE("incompatible server type");

    private String label;

    public String getLabel() {
        return label;
    }
}
