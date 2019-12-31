/*
 * Copyright (c) 2019 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.cobol;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.broadcom.lsp.cdi.module.service.ServiceModule;
import com.ca.lsp.cobol.service.IMyLanguageServer;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.jsonrpc.Launcher;
import org.eclipse.lsp4j.launch.LSPLauncher;
import org.eclipse.lsp4j.services.LanguageClient;

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
    IMyLanguageServer server = LangServerCtx.getInjector().getInstance(IMyLanguageServer.class);

    try {
      Launcher<LanguageClient> launcher = startServer(args, server);
      server.setClientRemoteProxy(launcher.getRemoteProxy());

      // suspend the main thread on listening
      launcher.startListening().get();
    } catch (InterruptedException | ExecutionException e) {
      log.error("An error occurred while starting a language server", e);
      throw e;
    }
  }

  void initCtx() {
    LangServerCtx.getGuiceCtx(new ServiceModule(), new DatabusModule());
  }

  Launcher<LanguageClient> startServer(String[] args, IMyLanguageServer server) throws IOException {
    return isPipeEnabled(args)
        ? createServerLauncher(server, System.in, System.out)
        : createServerLauncherWithSocket(server);
  }

  boolean isPipeEnabled(String[] args) {
    return args.length > 0 && PIPE_ARG.equals(args[0]);
  }

  Launcher<LanguageClient> createServerLauncherWithSocket(IMyLanguageServer server)
      throws IOException {
    try (ServerSocket serverSocket = new ServerSocket(LSP_PORT)) {
      log.info("Language server started using socket communication on port [{}]", LSP_PORT);
      // wait for clients to connect
      Socket socket = serverSocket.accept();
      return createServerLauncher(server, socket.getInputStream(), socket.getOutputStream());
    } catch (IOException e) {
      log.error("Unable to start server using socket communication on port [{}]", LSP_PORT);
      throw e;
    }
  }

  Launcher<LanguageClient> createServerLauncher(
      IMyLanguageServer server, InputStream in, OutputStream out) {
    return LSPLauncher.createServerLauncher(server, in, out);
  }
}
