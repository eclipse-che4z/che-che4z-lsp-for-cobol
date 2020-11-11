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

package com.broadcom.lsp.cobol;

import com.broadcom.lsp.cobol.service.CobolLanguageServer;
import com.broadcom.lsp.cobol.service.mocks.TestLanguageServer;
import com.broadcom.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import com.broadcom.lsp.cobol.service.utils.CustomThreadPoolExecutorService;
import com.google.inject.Injector;
import org.eclipse.lsp4j.jsonrpc.Launcher;
import org.eclipse.lsp4j.services.LanguageClient;
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
  private CustomThreadPoolExecutor customExecutor;

  @BeforeEach
  void setUp() {
    server = new TestLanguageServer();
    customExecutor = new CustomThreadPoolExecutorService(4, 5, 60, 3);
  }

  @Test
  void initCtx() {
    Injector injector = LangServerBootstrap.initCtx();

    // Bound class in Service module
    CobolLanguageServer server = injector.getInstance(CobolLanguageServer.class);
    CustomThreadPoolExecutor customExecutor = injector.getInstance(CustomThreadPoolExecutor.class);
    // Bound constant in Databus module
    Integer cacheSize = injector.getInstance(get(Integer.class, named("CACHE-MAX-SIZE")));

    assertNotNull(server);
    assertNotNull(customExecutor);
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
    Launcher<LanguageClient> launcher =
        LangServerBootstrap.createServerLauncherWithSocket(
            server, customExecutor.getThreadPoolExecutor());

    assertNotNull(launcher.getRemoteProxy());
  }

  @Test
  void createServerLauncher() {
    Launcher<LanguageClient> launcher =
        LangServerBootstrap.createServerLauncher(
            server, System.in, System.out, customExecutor.getThreadPoolExecutor());

    assertNotNull(launcher.getRemoteProxy());
  }

  @Test
  void startServer() throws IOException {
    Launcher<LanguageClient> launcher =
        LangServerBootstrap.launchServer(
            new String[] {PIPES}, server, customExecutor.getThreadPoolExecutor());
    assertNotNull(launcher.getRemoteProxy());
  }
}
