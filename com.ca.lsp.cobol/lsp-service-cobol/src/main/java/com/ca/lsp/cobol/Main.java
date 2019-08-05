/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol;

import com.ca.lsp.cobol.service.IMyLanguageServer;
import com.ca.lsp.cobol.service.MyLanguageServerImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.lsp4j.jsonrpc.Launcher;
import org.eclipse.lsp4j.launch.LSPLauncher;
import org.eclipse.lsp4j.services.LanguageClient;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.*;

/** @author zacan01 */
public class Main {
  private static final Logger LOG = LogManager.getLogger(Main.class);
  private static final Integer LSP_PORT = 1044;
  private static final String PIPE_ARGM = "pipeEnabled";

  public static void main(String[] args) throws InterruptedException, ExecutionException {
    if (args.length > 0) {
      startLSPServer(args[0]);
    } else {
      startLSPServer("socketEnabled");
    }
  }

  private static void startLSPServer(String pipeEnabled)
      throws InterruptedException, ExecutionException {
    MyLanguageServerImpl server = new MyLanguageServerImpl();

    if (PIPE_ARGM.equals(pipeEnabled)) {
      createLSPPipe(server, System.in, System.out);
    } else {
      createLSPSocket(server);
    }
  }

  private static void createLSPSocket(IMyLanguageServer server) {
    ExecutorService threadPool = Executors.newCachedThreadPool();
    threadPool.submit(
        () -> {
          while (true) {
            try (ServerSocket serverSocket = new ServerSocket(LSP_PORT)) {
              LOG.info("LS started using socket communication on port [{}]", LSP_PORT);

              // wait for clients to connect
              Socket socket = serverSocket.accept();

              Launcher<LanguageClient> l =
                  LSPLauncher.createServerLauncher(
                      server, socket.getInputStream(), socket.getOutputStream());

              // add clients to the server
              Runnable addClient = server.setSocketRemoteProxy(l.getRemoteProxy());
              l.startListening();
              CompletableFuture.runAsync(addClient);
            }
          }
        });
  }

  private static void createLSPPipe(IMyLanguageServer server, InputStream in, OutputStream out)
      throws InterruptedException, ExecutionException {
    Launcher<LanguageClient> l = LSPLauncher.createServerLauncher(server, in, out);
    Future<?> startListening = l.startListening();
    server.setPipeRemoteProxy(l.getRemoteProxy());
    startListening.get();
  }
}
