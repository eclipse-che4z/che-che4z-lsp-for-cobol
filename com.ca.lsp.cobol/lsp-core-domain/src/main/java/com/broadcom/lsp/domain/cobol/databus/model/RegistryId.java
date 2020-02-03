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

package com.broadcom.lsp.domain.cobol.databus.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * This enumerations describes different layers of cache repositories. Each repository is assigned
 * to store the specific kind of information.
 */
@AllArgsConstructor
public enum RegistryId {
  GENERAL_REGISTRY_ID("general-registry"),
  SCANNER_REGISTRY_ID("scanner-registry"),
  FETCHER_REGISTRY_ID("fetcher-registry"),
  CPY_REGISTRY_ID("cpy-registry");
  @Getter private String id;
}
