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

import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.CobolLanguageServer;
import org.eclipse.lsp.cobol.service.mocks.TestLanguageServer;
import org.eclipse.lsp.cobol.service.providers.ClientProvider;
import com.google.inject.Injector;
import org.eclipse.lsp4j.jsonrpc.Launcher;
import org.eclipse.lsp4j.services.LanguageServer;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.Socket;

import static com.google.inject.Key.get;
import static com.google.inject.name.Names.named;
import static java.util.concurrent.Executors.newSingleThreadExecutor;
import static org.junit.jupiter.api.Assertions.*;

/** This test check the logic of the application bootstrap */
class LangServerBootstrapTest {

  private static final String PIPES = "pipeEnabled";

  private LanguageServer server;

  @BeforeEach
  void setUp() {
    server = new TestLanguageServer();
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
  void createServerLauncherWithSocket() throws IOException {
    newSingleThreadExecutor()
        .submit(
            () -> {
              try {
                Socket socket = new Socket("127.0.0.1", 1044);
                assertTrue(socket.isConnected());
              } catch (IOException e) {
                fail(e.getMessage());
              }
            });
    Launcher<CobolLanguageClient> launcher = LangServerBootstrap.createServerLauncherWithSocket(server);

    assertNotNull(launcher.getRemoteProxy());
  }

  @Test
  void createServerLauncher() {
    Launcher<CobolLanguageClient> launcher =
        LangServerBootstrap.createServerLauncher(server, System.in, System.out);

    assertNotNull(launcher.getRemoteProxy());
  }

  @Test
  void startServer() throws IOException {
    Launcher<CobolLanguageClient> launcher =
        LangServerBootstrap.launchServer(new String[] {PIPES}, server);
    assertNotNull(launcher.getRemoteProxy());
  }
}
