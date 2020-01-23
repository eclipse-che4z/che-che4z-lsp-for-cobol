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
 *
 */

package com.ca.lsp.cobol.service;

import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageClient;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;

import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;

/** This test assert functions of the {@link MyLanguageServerImpl}, such as initialization. */
public class MyLanguageServerImplTest {

  @Test
  public void initialized() {
    LanguageClient client = mock(LanguageClient.class);
    ClientProvider provider = new ClientProvider();
    provider.set(client);

    MyLanguageServerImpl server = new MyLanguageServerImpl(null, null, provider);
    ArgumentCaptor<RegistrationParams> captor = ArgumentCaptor.forClass(RegistrationParams.class);
    server.initialized(new InitializedParams());

    Mockito.verify(client).registerCapability(captor.capture());
    RegistrationParams params = captor.getValue();
    assertRegistrationParams(params);
  }

  private void assertRegistrationParams(RegistrationParams params) {
    Registration registration = params.getRegistrations().get(0);
    assertNotNull(registration.getId());
    assertEquals("workspace/didChangeWatchedFiles", registration.getMethod());

    List<FileSystemWatcher> watchers =
        ((DidChangeWatchedFilesRegistrationOptions) registration.getRegisterOptions())
            .getWatchers();

    watchers.forEach(it -> assertTrue(it.getGlobPattern().startsWith("**/COPYBOOKS")));
    watchers.forEach(it -> assertEquals(7, it.getKind().intValue()));
  }
}
