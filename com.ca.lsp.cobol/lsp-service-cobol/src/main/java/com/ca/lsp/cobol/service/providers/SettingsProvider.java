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

import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.FetchedSettingsEvent;
import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Nullable;

@Singleton
@Slf4j
public class SettingsProvider
    implements Provider<ConfigurationSettingsStorable>, EventObserver<FetchedSettingsEvent> {
  private ConfigurationSettingsStorable configurationSettingsStorable;

  public void set(@Nullable ConfigurationSettingsStorable configurationSettingsStorable) {
    this.configurationSettingsStorable = configurationSettingsStorable;
  }

  @Override
  @Nullable
  public ConfigurationSettingsStorable get() {
    try {
      return deepCopy(configurationSettingsStorable);
    } catch (CloneNotSupportedException e) {
      log.error(e.getMessage());
      return null;
    }
  }

  private static ConfigurationSettingsStorable deepCopy(
      ConfigurationSettingsStorable configurationSettingsStorable)
      throws CloneNotSupportedException {
    return (ConfigurationSettingsStorable) configurationSettingsStorable.clone();
  }

  @Override
  public void observerCallback(FetchedSettingsEvent adaptedDataEvent) {}
}
