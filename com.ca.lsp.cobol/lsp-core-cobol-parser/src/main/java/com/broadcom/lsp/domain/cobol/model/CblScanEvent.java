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
import lombok.Getter;
import lombok.Setter;

/**
 * Created by gl669210 on 15/10/2019
 */
@Builder
public class CblScanEvent extends DataEvent {
    @Getter @Setter private String name;
    @Getter @Setter private String position;
    @Getter @Setter private String uri;
}
