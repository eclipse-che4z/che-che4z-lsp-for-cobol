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
 * storage system and that will be consumed by the {@link
 * com.ca.lsp.cobol.service.CopybookServiceImpl}
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

  /**
   * The method invoked by a provider return the object that represent the user settings config.
   *
   * @return a {@link ConfigurationSettingsStorable} fullfilled with the user settings or an empty
   *     one if not present
   */
  @Override
  @Nullable
  public ConfigurationSettingsStorable get() {

    if (configurationSettingsStorable != null) {
      return deepCopy(configurationSettingsStorable);
    } else {
      return ConfigurationSettingsStorable.builder().build();
    }
  }

  /** @param databus the channel used for receive message about {@link FetchedSettingsEvent} */
  @Inject
  public void setDatabus(@Nonnull DataBusBroker databus) {
    this.databus = databus;
    this.databus.subscribe(DataEventType.FETCHED_SETTINGS_EVENT, this);
  }

  private static ConfigurationSettingsStorable deepCopy(
      ConfigurationSettingsStorable configurationSettingsStorable) {
    return ConfigurationSettingsStorable.builder()
        .profiles(configurationSettingsStorable.getProfiles())
        .paths(configurationSettingsStorable.getPaths())
        .build();
  }

  /**
   * When a message {@link FetchedSettingsEvent} is published on the databus the {@link
   * SettingsProvider} update the object that contains the user settings with new content
   *
   * @param fetchedSettingsEvent published object that contains update for the user settings
   */
  @Override
  public void observerCallback(FetchedSettingsEvent fetchedSettingsEvent) {
    Gson gson = new Gson();
    set(
        gson.fromJson(
            fetchedSettingsEvent.getContent().get(0).toString(),
            (Type) ConfigurationSettingsStorable.class));
  }
}
