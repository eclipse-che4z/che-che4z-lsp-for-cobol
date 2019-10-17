/*
 * Copyright (c) 2019 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */

package com.broadcom.lsp.domain.cobol.model;

import lombok.Getter;

/**
 * Created on 17/10/2019
 */

public enum DataEventType {
    UNKNOWN_EVENT("UNKNOWN"),
    CPYBUILD_EVENT("CPYBUILD"),
    CBLSCAN_EVENT("CBLSCAN"),
    CBLFETCH_EVENT("CBLFETCH");
    @Getter
    private String id;

    DataEventType(String s) {
        this.id = s;
    }
}
