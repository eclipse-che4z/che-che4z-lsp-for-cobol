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

package com.ca.lsp.cobol.service.utils;

public enum SettingsParametersEnum {
  CPY_MANAGER("cpy-manager"),
  LSP_PREFIX("broadcom-cobol-lsp");

  public final String label;

  SettingsParametersEnum(String label) {
    this.label = label;
  }
}
