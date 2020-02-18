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

package com.ca.lsp.cobol.service;

import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.ca.lsp.cobol.service.providers.ClientProvider;
import com.ca.lsp.cobol.service.providers.SettingsProvider;
import com.ca.lsp.cobol.utils.Utility;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.eclipse.lsp4j.ConfigurationParams;
import org.eclipse.lsp4j.InitializedParams;
import org.eclipse.lsp4j.services.LanguageClient;
import org.junit.Test;
import org.mockito.Mockito;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import static org.mockito.Mockito.*;

/**
 * This test class checks if the workspace calls client configuration at the initialize method and
 * retrieves the setting configuration
 */
public class InitializeConfigurationTest {
  private LanguageClient client = Mockito.mock(LanguageClient.class);
  private ClientProvider provider = new ClientProvider();
  private SettingsProvider settingsProvider = Mockito.mock(SettingsProvider.class);
  private final String PROFILE_NAME = "myProfile";

  @Test
  public void testInitializeConfiguration() throws ExecutionException, InterruptedException {
    provider.set(client);

    MyLanguageServerImpl langServer =
        new MyLanguageServerImpl(null, null, null, provider, settingsProvider);

    ConfigurationParams params = Utility.createParams();

    List<String> paths = new ArrayList<>();
    ConfigurationSettingsStorable configurationSettingsStorable =
        new ConfigurationSettingsStorable();
    configurationSettingsStorable.setPaths(paths);
    configurationSettingsStorable.setProfiles(PROFILE_NAME);

    List<Object> list = new ArrayList<>();
    list.add(createJsonObject());
    CompletableFuture<List<Object>> completableFuture = new CompletableFuture<>();
    completableFuture.complete(list);
    when(client.configuration(params)).thenReturn(completableFuture);

    langServer.initialized(new InitializedParams());

    verify(client).configuration(params);
    verify(settingsProvider).set(configurationSettingsStorable);
  }

  private JsonObject createJsonObject() {
    JsonObject innerObject = new JsonObject();
    innerObject.addProperty("profiles", PROFILE_NAME);
    innerObject.addProperty("paths", "");

    JsonArray list2 = new JsonArray();

    JsonObject jsonObject = new JsonObject();
    jsonObject.addProperty("profiles", PROFILE_NAME);
    jsonObject.add("paths", list2);

    return jsonObject;
  }
}
