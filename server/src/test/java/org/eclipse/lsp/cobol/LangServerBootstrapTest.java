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

package org.eclipse.lsp.cobol;

import com.google.inject.Injector;
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.CobolLanguageServer;
import org.eclipse.lsp.cobol.service.mocks.MockLanguageServer;
import org.eclipse.lsp.cobol.service.providers.ClientProvider;
import org.eclipse.lsp4j.jsonrpc.Launcher;
import org.eclipse.lsp4j.services.LanguageServer;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static com.google.inject.Key.get;
import static com.google.inject.name.Names.named;
import static org.junit.jupiter.api.Assertions.*;

/** This test check the logic of the application bootstrap */
class LangServerBootstrapTest {

  private static final String PIPES = "pipeEnabled";

  private LanguageServer server;

  @BeforeEach
  void setUp() {
    server = new MockLanguageServer();
  }

  @Test
  void initCtx() {
    Injector injector = LangServerBootstrap.initCtx();

    // Bound class in Service module
    CobolLanguageServer server = injector.getInstance(CobolLanguageServer.class);
    ClientProvider clientProvider = injector.getInstance(ClientProvider.class);
    // Bound constant in Databus module
    Integer cacheSize = injector.getInstance(get(Integer.class, named("CACHE-MAX-SIZE")));

    assertNotNull(server);
    assertNotNull(clientProvider);
    assertNotNull(cacheSize);
  }

  @Test
  void isPipeEnabledPositive() {
    String[] args = new String[] {PIPES};
    assertTrue(LangServerBootstrap.isPipeEnabled(args));
  }

  @Test
  void isPipeEnabledUseSocket() {
    String[] args = new String[] {};
    assertFalse(LangServerBootstrap.isPipeEnabled(args));
  }

  @Test
  void isPipeEnabledInvalidArgument() {
    String[] args = new String[] {"invalidArgument"};
    assertFalse(LangServerBootstrap.isPipeEnabled(args));
  }

  @Test
  void createServerLauncher() {
    Launcher<CobolLanguageClient> launcher =
        LangServerBootstrap.createServerLauncher(server, System.in, System.out);

    assertNotNull(launcher.getRemoteProxy());
  }
}
