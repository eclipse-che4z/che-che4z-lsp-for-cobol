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
 *    Broadcom - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol;

import static com.google.inject.Key.get;
import static com.google.inject.name.Names.named;
import static java.util.concurrent.TimeUnit.SECONDS;
import static org.junit.jupiter.api.Assertions.*;

import com.google.gson.JsonObject;
import com.google.inject.Injector;
import java.io.PipedInputStream;
import java.io.PipedOutputStream;
import java.util.concurrent.CompletableFuture;
import org.eclipse.lsp.cobol.core.model.extendedapi.analysisresult.AnalysisResultDto;
import org.eclipse.lsp.cobol.lsp.CobolLanguageServer;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.lsp.jrpc.ExtendedApi;
import org.eclipse.lsp.cobol.service.mocks.MockExtendedApi;
import org.eclipse.lsp.cobol.service.mocks.MockLanguageServer;
import org.eclipse.lsp.cobol.service.providers.ClientProvider;
import org.eclipse.lsp4j.InitializeParams;
import org.eclipse.lsp4j.InitializeResult;
import org.eclipse.lsp4j.TextDocumentIdentifier;
import org.eclipse.lsp4j.jsonrpc.Launcher;
import org.eclipse.lsp4j.services.LanguageServer;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/** This test check the logic of the application bootstrap */
class LangServerBootstrapTest {

  private static final String PIPES = "pipeEnabled";
  private static final String URI = "file:///workspace/document%20with%20space.cbl";
  private static final int BUFFER_SIZE = 8192;
  private static final long TIMEOUT = 10;

  private LanguageServer server;
  private ExtendedApi extendedApi;

  @BeforeEach
  void setUp() {
    server = new MockLanguageServer();
    extendedApi = new MockExtendedApi();
  }

  @Test
  void initCtx() {
    Injector injector = LangServerBootstrap.initCtx();

    // Bound class in Service module
    CobolLanguageServer server = injector.getInstance(CobolLanguageServer.class);
    ExtendedApi extendedApi = injector.getInstance(ExtendedApi.class);
    ClientProvider clientProvider = injector.getInstance(ClientProvider.class);
    // Bound constant in Databus module
    Integer cacheSize = injector.getInstance(get(Integer.class, named("CACHE-MAX-SIZE")));

    assertNotNull(server);
    assertNotNull(extendedApi);
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
        LangServerBootstrap.createServerLauncher(server, extendedApi, System.in, System.out);

    assertNotNull(launcher.getRemoteProxy());
  }

  /**
   * Requests of both the language server and the extended API must be routed to their services, and
   * the parameters must be converted to the types declared by the services.
   */
  @Test
  void serverLauncherRoutesRequests() throws Exception {
    PipedOutputStream clientOut = new PipedOutputStream();
    PipedInputStream serverIn = new PipedInputStream(clientOut, BUFFER_SIZE);
    PipedOutputStream serverOut = new PipedOutputStream();
    PipedInputStream clientIn = new PipedInputStream(serverOut, BUFFER_SIZE);
    MockExtendedApi mockExtendedApi = new MockExtendedApi();
    LanguageServer languageServer =
        new MockLanguageServer() {
          @Override
          public CompletableFuture<InitializeResult> initialize(InitializeParams params) {
            return CompletableFuture.completedFuture(new InitializeResult());
          }
        };

    try {
      LangServerBootstrap.createServerLauncher(languageServer, mockExtendedApi, serverIn, serverOut)
          .startListening();
      Launcher<ServerWithExtendedApi> client =
          new Launcher.Builder<ServerWithExtendedApi>()
              .setLocalService(new Object())
              .setRemoteInterface(ServerWithExtendedApi.class)
              .setInput(clientIn)
              .setOutput(clientOut)
              .create();
      client.startListening();
      ServerWithExtendedApi remote = client.getRemoteProxy();

      assertNotNull(remote.initialize(new InitializeParams()).get(TIMEOUT, SECONDS));
      assertNotNull(remote.analysis(new JsonObject()).get(TIMEOUT, SECONDS));
      AnalysisResultDto result =
          remote.analysisResult(new TextDocumentIdentifier(URI)).get(TIMEOUT, SECONDS);

      assertNotNull(result);
      assertEquals(URI, mockExtendedApi.getLastDocument().getUri());
    } finally {
      // closing the streams stops the message processors
      clientOut.close();
      serverOut.close();
    }
  }

  /** Client side view of the server: the language server together with the extended API */
  private interface ServerWithExtendedApi extends LanguageServer, ExtendedApi {}
}
