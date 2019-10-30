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
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Created  on 16/10/2019
 */
@Slf4j
@NoArgsConstructor
@RequiredArgsConstructor
public class DataEvent {
    @Getter
    private RegistryId registryId = RegistryId.GENERAL_REGISTRY_ID;
    @Getter
    @NonNull
    private DataEventType eventType;
    @Getter
    @NonNull
    private String header;

}
