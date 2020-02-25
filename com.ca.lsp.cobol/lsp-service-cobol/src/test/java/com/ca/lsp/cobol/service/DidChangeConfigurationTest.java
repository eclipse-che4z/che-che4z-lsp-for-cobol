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

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.FetchedSettingsEvent;
import com.ca.lsp.cobol.TestModule;
import com.ca.lsp.cobol.service.providers.ClientProvider;
import com.ca.lsp.cobol.service.providers.SettingsProvider;
import com.ca.lsp.cobol.utils.ServiceTestUtils;
import org.eclipse.lsp4j.ConfigurationParams;
import org.eclipse.lsp4j.services.LanguageClient;
import org.junit.BeforeClass;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * This test class checks if the workspace calls client configuration method and post data into the
 * databus
 */
public class DidChangeConfigurationTest {
  private LanguageClient client = Mockito.mock(LanguageClient.class);

  // TODO: Try to avoid mock and use real databus..
  // private DefaultDataBusBroker broker = mock(DefaultDataBusBroker.class);

  private DefaultDataBusBroker broker;

  private ClientProvider provider = new ClientProvider();

  @BeforeClass
  public static void setUp() {
    LangServerCtx.getGuiceCtx(new TestModule(), new DatabusModule());
  }

  /** testObject - the object which should be returned by workspace/configuration */
  @Test
  public void testDidChangeConfiguration() {

    broker = (DefaultDataBusBroker) LangServerCtx.getInjector().getInstance(DataBusBroker.class);

    CobolWorkspaceServiceImpl cobolWorkspaceService =
        new CobolWorkspaceServiceImpl(broker, provider);
    ArgumentCaptor<FetchedSettingsEvent> captor =
        ArgumentCaptor.forClass(FetchedSettingsEvent.class);

    ConfigurationParams params = ServiceTestUtils.createParams();

    List<Object> list = new ArrayList<>();
    CompletableFuture<List<Object>> completableFuture = new CompletableFuture<>();
    list.add("settings");
    completableFuture.complete(list);
    FetchedSettingsEvent fetchedSettingsEvent = new FetchedSettingsEvent();
    fetchedSettingsEvent.setContent(list);

    when(client.configuration(params)).thenReturn(completableFuture);
    provider.set(client);

    // subscribe the settingsProvider to the databus before
    SettingsProvider settingsProvider = new SettingsProvider();
    settingsProvider.setDatabus(broker);
    cobolWorkspaceService.didChangeConfiguration(null);

    verify(client).configuration(params);
    verify(broker).postData(captor.capture());
    assertNotNull(captor.getValue());

    assertEquals(fetchedSettingsEvent, captor.getValue());
  }
}
