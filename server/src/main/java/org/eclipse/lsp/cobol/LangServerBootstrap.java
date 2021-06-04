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

import com.google.inject.Guice;
import com.google.inject.Injector;
import lombok.NonNull;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.domain.modules.DatabusModule;
import org.eclipse.lsp.cobol.domain.modules.EngineModule;
import org.eclipse.lsp.cobol.domain.modules.ServiceModule;
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.providers.ClientProvider;
import org.eclipse.lsp4j.jsonrpc.Launcher;
import org.eclipse.lsp4j.launch.LSPLauncher;
import org.eclipse.lsp4j.services.LanguageServer;

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

  /**
   * The entry point for the application.
   *
   * @param args command line arguments
   */
  public static void main(String[] args)
      throws ExecutionException, InterruptedException, IOException {
    Injector injector = initCtx();
    LanguageServer server = injector.getInstance(LanguageServer.class);
    ClientProvider provider = injector.getInstance(ClientProvider.class);

    start(args, server, provider);
  }

  Injector initCtx() {
    return Guice.createInjector(new ServiceModule(), new EngineModule(), new DatabusModule());
  }

  private void start(
      @NonNull String[] args, @NonNull LanguageServer server, @NonNull ClientProvider provider)
      throws IOException, InterruptedException, ExecutionException {
    try {
      Launcher<CobolLanguageClient> launcher = launchServer(args, server);
      provider.setClient(launcher.getRemoteProxy());
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

  @SuppressWarnings("squid:S106")
  Launcher<CobolLanguageClient> launchServer(@NonNull String[] args, @NonNull LanguageServer server)
      throws IOException {
    return isPipeEnabled(args)
        ? createServerLauncher(server, System.in, System.out)
        : createServerLauncherWithSocket(server);
  }

  boolean isPipeEnabled(@NonNull String[] args) {
    return args.length > 0 && PIPE_ARG.equals(args[0]);
  }

  @SuppressWarnings("resource")
  Launcher<CobolLanguageClient> createServerLauncherWithSocket(@NonNull LanguageServer server)
      throws IOException {
    try (ServerSocket serverSocket = new ServerSocket(LSP_PORT)) {
      LOG.info("Language server started using socket communication on port [{}]", LSP_PORT);
      LOG.info("Java version: " + System.getProperty("java.version"));
      // wait for clients to connect
      Socket socket = serverSocket.accept();
      return createServerLauncher(server, socket.getInputStream(), socket.getOutputStream());
    }
  }

  Launcher<CobolLanguageClient> createServerLauncher(
      @NonNull LanguageServer server, @NonNull InputStream in, @NonNull OutputStream out) {
    return new LSPLauncher.Builder<CobolLanguageClient>()
        .setLocalService(server)
        .setRemoteInterface(CobolLanguageClient.class)
        .setInput(in)
        .setOutput(out)
        .create();
  }
}
