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

import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.FetchedSettingsEvent;
import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.google.gson.Gson;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.Builder;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.lang.reflect.Type;

/**
 * This class is resposible to keep the settings configuration provided by the user in the setting
 * storage system and that will be consumed by the {@Link FileSystemServiceImpl}
 */
@Singleton
@Slf4j
public class SettingsProvider
    implements Provider<ConfigurationSettingsStorable>, EventObserver<FetchedSettingsEvent> {
  private ConfigurationSettingsStorable configurationSettingsStorable;
  @Getter private DataBusBroker databus;

  public SettingsProvider() {}

  @Builder
  public SettingsProvider(DataBusBroker databus) {
    this.databus = databus;
    this.databus.subscribe(DataEventType.FETCHED_SETTINGS_EVENT, this);
  }

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

  @Inject
  public void setDatabus(@Nonnull DataBusBroker databus) {
    this.databus = databus;
    this.databus.subscribe(DataEventType.FETCHED_SETTINGS_EVENT, this);
  }

  private static ConfigurationSettingsStorable deepCopy(
      ConfigurationSettingsStorable configurationSettingsStorable)
      throws CloneNotSupportedException {
    return (ConfigurationSettingsStorable) configurationSettingsStorable.clone();
  }

  @Override
  public void observerCallback(FetchedSettingsEvent fetchedSettingsEvent) {
    Gson gson = new Gson();
    set(
        gson.fromJson(
            fetchedSettingsEvent.getContent().get(0).toString(),
            (Type) ConfigurationSettingsStorable.class));
  }
}
