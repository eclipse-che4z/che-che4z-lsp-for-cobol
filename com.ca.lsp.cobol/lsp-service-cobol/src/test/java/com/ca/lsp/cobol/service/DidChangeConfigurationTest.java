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

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.FetchedSettingsEvent;
import com.ca.lsp.cobol.service.providers.ClientProvider;
import com.ca.lsp.cobol.utils.ServiceTestUtils;
import org.eclipse.lsp4j.ConfigurationParams;
import org.eclipse.lsp4j.services.LanguageClient;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.*;

/**
 * This test class checks if the workspace calls client configuration method and post data into the
 * databus
 */
public class DidChangeConfigurationTest {
  private LanguageClient client = Mockito.mock(LanguageClient.class);
  private DefaultDataBusBroker broker = mock(DefaultDataBusBroker.class);
  private ClientProvider provider = new ClientProvider();

  /** testObject - the object which should be returned by workspace/configuration */
  @Test
  public void testDidChangeConfiguration() {
    CobolWorkspaceServiceImpl cobolWorkspaceService =
        new CobolWorkspaceServiceImpl(broker, null, null);
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

    cobolWorkspaceService.didChangeConfiguration(null);

    verify(client).configuration(params);
    verify(broker).postData(captor.capture());
    assertNotNull(captor.getValue());

    assertEquals(fetchedSettingsEvent, captor.getValue());
  }
}
