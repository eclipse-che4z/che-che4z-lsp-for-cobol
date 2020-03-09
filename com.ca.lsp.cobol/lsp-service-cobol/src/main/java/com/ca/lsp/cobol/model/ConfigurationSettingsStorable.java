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

package com.ca.lsp.cobol.model;

import lombok.Value;

import java.util.Collections;
import java.util.List;

/**
 * This class act as a DTO to store the settings information provided by the user and required to
 * search copybooks on MF and in the copybook folder.
 */
@Value
public class ConfigurationSettingsStorable {
  private Object profiles;
  private List<String> paths;

  public static ConfigurationSettingsStorable emptyConfigurationSettingsStorable() {
    return new ConfigurationSettingsStorable(null, Collections.emptyList());
  }
}
