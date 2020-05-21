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

import com.ca.lsp.cobol.service.providers.ClientProvider;
import com.ca.lsp.cobol.utils.ServiceTestUtils;
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

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * This test class checks if the workspace calls client configuration at the initialize method and
 * retrieves the setting configuration
 */
public class InitializeConfigurationTest {
  private LanguageClient client = Mockito.mock(LanguageClient.class);
  private ClientProvider provider = new ClientProvider();
  private static final String PROFILE_NAME = "myProfile";
  protected static final String DSNAME_1 = "HLQLF01.DSNAME1";
  protected static final String DSNAME_2 = "HLQLF01.DSNAME2";

  /**
   * This test verify that the server is able to store the initial settings retrivied from the
   * settings.json
   */
  @Test
  public void testInitializeConfiguration() {
    provider.set(client);

    MyLanguageServerImpl langServer = new MyLanguageServerImpl(null, null, null, null, null);

    ConfigurationParams params = ServiceTestUtils.createParams();
    List<Object> list = new ArrayList<>();
    list.add(createJsonObject());
    CompletableFuture<List<Object>> completableFuture = new CompletableFuture<>();
    completableFuture.complete(list);

    when(client.configuration(params)).thenReturn(completableFuture);
    langServer.initialized(new InitializedParams());

    // check that server send the request for the initial configuration settings and retrieve a
    // setting configuration
    verify(client).configuration(params);
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
