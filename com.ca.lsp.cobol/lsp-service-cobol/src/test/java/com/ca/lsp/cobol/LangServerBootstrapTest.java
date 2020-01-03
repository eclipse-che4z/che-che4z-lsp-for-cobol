/*
 *
 *  * Copyright (c) 2019 Broadcom.
 *  *
 *  * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *  *
 *  * This program and the accompanying materials are made
 *  * available under the terms of the Eclipse Public License 2.0
 *  * which is available at https://www.eclipse.org/legal/epl-2.0/
 *  *
 *  * SPDX-License-Identifier: EPL-2.0
 *  *
 *  * Contributors:
 *  * Broadcom, Inc. - initial API and implementation
 *  *
 *
 */

package com.ca.lsp.cobol;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.ca.lsp.cobol.service.MyLanguageServerImpl;
import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
import com.ca.lsp.cobol.service.mocks.TestLanguageServer;
import com.google.inject.Key;
import com.google.inject.name.Names;
import org.eclipse.lsp4j.jsonrpc.Launcher;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.LanguageServer;
import org.junit.Test;

import java.io.IOException;
import java.net.Socket;
import java.util.concurrent.Executors;

import static org.junit.Assert.*;

/** This test check the logic of the application bootstrap */
public class LangServerBootstrapTest {

  private static final String PIPES = "pipeEnabled";

  @Test
  public void initCtx() {
    LangServerBootstrap.initCtx();

    // Bound class in Service module
    MyLanguageServerImpl server =
        LangServerCtx.getInjector().getInstance(MyLanguageServerImpl.class);
    // Bound constant in Databus module
    Integer cacheSize =
        LangServerCtx.getInjector()
            .getInstance(Key.get(Integer.class, Names.named("CACHE-MAX-SIZE")));

    assertNotNull(server);
    assertNotNull(cacheSize);
  }

  @Test
  public void isPipeEnabledPositive() {
    String[] args = new String[] {PIPES};
    assertTrue(LangServerBootstrap.isPipeEnabled(args));
  }

  @Test
  public void isPipeEnabledUseSocket() {
    String[] args = new String[] {};
    assertFalse(LangServerBootstrap.isPipeEnabled(args));
  }

  @Test
  public void isPipeEnabledInvalidArgument() {
    String[] args = new String[] {"invalidArgument"};
    assertFalse(LangServerBootstrap.isPipeEnabled(args));
  }

  @Test
  public void createServerLauncherWithSocket() throws IOException {
    LanguageServer server = new TestLanguageServer(new TestLanguageClient(), null);

    Executors.newSingleThreadExecutor()
        .submit(
            () -> {
              try {
                Socket socket = new Socket("127.0.0.1", 1044);
                assertTrue(socket.isConnected());
              } catch (IOException e) {
                fail(e.getMessage());
              }
            });
    Launcher<LanguageClient> launcher = LangServerBootstrap.createServerLauncherWithSocket(server);

    assertNotNull(launcher.getRemoteProxy());
  }

  @Test
  public void createServerLauncher() {
    LanguageServer server = new TestLanguageServer(new TestLanguageClient(), null);

    Launcher<LanguageClient> launcher =
        LangServerBootstrap.createServerLauncher(server, System.in, System.out);

    assertNotNull(launcher.getRemoteProxy());
  }

  @Test
  public void startServer() throws IOException {
    Launcher<LanguageClient> launcher =
        LangServerBootstrap.launchServer(
            new String[] {PIPES}, new TestLanguageServer(new TestLanguageClient(), null));
    assertNotNull(launcher.getRemoteProxy());
  }
}
