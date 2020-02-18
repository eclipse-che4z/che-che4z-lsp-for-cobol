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

package com.ca.lsp.cobol.service.providers;

import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.NonNull;

@Singleton
public class SettingsProvider implements Provider<ConfigurationSettingsStorable> {
  private ConfigurationSettingsStorable configurationSettingsStorable;

  public void set(@NonNull ConfigurationSettingsStorable configurationSettingsStorable) {
    this.configurationSettingsStorable = configurationSettingsStorable;
  }

  @Override
  public ConfigurationSettingsStorable get() {
    return this.configurationSettingsStorable;
  }
}
