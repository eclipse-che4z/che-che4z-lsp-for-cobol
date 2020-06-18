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
 *    Broadcom, Inc. - initial API and implementation
 */

package com.broadcom.lsp.domain.cobol.event.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * This class is a signal object to show that analysis is finished. Contains the uri of analyzed document.
 */
@NoArgsConstructor
@Data
public class AnalysisFinishedEvent extends DataEvent{
    private String documentUri;

    @Builder
    public AnalysisFinishedEvent(String documentUri) {
        super(DataEventType.ANALYSIS_FINISHED_EVENT, DataEventType.ANALYSIS_FINISHED_EVENT.getId());
        this.documentUri = documentUri;
    }
}
