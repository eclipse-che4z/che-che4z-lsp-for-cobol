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

import com.broadcom.lsp.cobol.domain.modules.DatabusModule;
import com.broadcom.lsp.cobol.domain.modules.EngineModule;
import com.broadcom.lsp.cobol.domain.modules.LangServerCtx;
import com.broadcom.lsp.cobol.domain.modules.ServiceModule;
import com.broadcom.lsp.cobol.service.providers.ClientProvider;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.jsonrpc.Launcher;
import org.eclipse.lsp4j.launch.LSPLauncher;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.LanguageServer;

import javax.annotation.Nonnull;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ExecutionException;

/**
 * This class is an entry point for the application. It initializes the DI context and runs the
 * server to accept the connections using either socket on LSP_PORT or pipes using STDIO. After the
 * establishing of the connection the main thread suspends until it is stopped forcibly.
 *
 * <p>To run the extension using path, you may specify "pipeEnabled" as a program argument. In other
 * case the server will start using socket.
 */
@Slf4j
@UtilityClass
public class LangServerBootstrap {
  private static final Integer LSP_PORT = 1044;
  private static final String PIPE_ARG = "pipeEnabled";

  public static void main(String[] args)
      throws ExecutionException, InterruptedException, IOException {
    initCtx();
    LanguageServer server = LangServerCtx.getInjector().getInstance(LanguageServer.class);
    ClientProvider provider = LangServerCtx.getInjector().getInstance(ClientProvider.class);

    start(args, server, provider);
  }

  void initCtx() {
    LangServerCtx.getGuiceCtx(new ServiceModule(), new EngineModule(), new DatabusModule());
  }

  private void start(
      @Nonnull String[] args, @Nonnull LanguageServer server, @Nonnull ClientProvider provider)
      throws IOException, InterruptedException, ExecutionException {
    try {
      Launcher<LanguageClient> launcher = launchServer(args, server);
      provider.set(launcher.getRemoteProxy());
      // suspend the main thread on listening
      launcher.startListening().get();
    } catch (ExecutionException e) {
      LOG.error("An error occurred while starting a language server", e);
      throw e;
    } catch (IOException e) {
      LOG.error("Unable to start server using socket communication on port [{}]", LSP_PORT);
      throw e;
    }
  }

  Launcher<LanguageClient> launchServer(@Nonnull String[] args, @Nonnull LanguageServer server)
      throws IOException {
    return isPipeEnabled(args)
        ? createServerLauncher(server, System.in, System.out)
        : createServerLauncherWithSocket(server);
  }

  boolean isPipeEnabled(@Nonnull String[] args) {
    return args.length > 0 && PIPE_ARG.equals(args[0]);
  }

  Launcher<LanguageClient> createServerLauncherWithSocket(@Nonnull LanguageServer server)
      throws IOException {
    try (ServerSocket serverSocket = new ServerSocket(LSP_PORT)) {
      LOG.info("Language server started using socket communication on port [{}]", LSP_PORT);
      LOG.info("Java version: " + Runtime.version());
      // wait for clients to connect
      Socket socket = serverSocket.accept();
      return createServerLauncher(server, socket.getInputStream(), socket.getOutputStream());
    }
  }

  Launcher<LanguageClient> createServerLauncher(
      @Nonnull LanguageServer server, @Nonnull InputStream in, @Nonnull OutputStream out) {
    return LSPLauncher.createServerLauncher(server, in, out);
  }
}
