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

package com.broadcom.lsp.domain.cobol.event.model;

import com.broadcom.lsp.domain.cobol.databus.model.RegistryId;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

/** The super class for all the events handled by the databus */
@NoArgsConstructor
@RequiredArgsConstructor
public class DataEvent {
  @Getter private RegistryId registryId = RegistryId.GENERAL_REGISTRY_ID;
  @Getter @NonNull private DataEventType eventType;
  @Getter @NonNull private String header;
}
