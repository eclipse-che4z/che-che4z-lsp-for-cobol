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

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created  on 15/10/2019
 */


@NoArgsConstructor
@Data
public class CblScanEvent extends DataEvent {
    private String name;
    private String position;
    private String uri;

    @Builder
    public CblScanEvent(String name, String position, String uri) {
        super(DataEventType.CBLSCAN_EVENT, DataEventType.CBLSCAN_EVENT.getId());
        this.name = name;
        this.position = position;
        this.uri = uri;
    }
}
