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

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.ConsoleAppender;
import com.google.inject.Guice;
import com.google.inject.Injector;
import lombok.NonNull;
import org.eclipse.lsp.cobol.cli.Cli;
import org.eclipse.lsp.cobol.domain.modules.DatabusModule;
import org.eclipse.lsp.cobol.domain.modules.EngineModule;
import org.eclipse.lsp.cobol.domain.modules.ServiceModule;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.providers.ClientProvider;
import org.eclipse.lsp4j.jsonrpc.Launcher;
import org.eclipse.lsp4j.launch.LSPLauncher;
import org.eclipse.lsp4j.services.LanguageServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import picocli.CommandLine;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

/**
 * This class is an entry point for the application. It initializes the DI context and runs the
 * server to accept the connections using either socket on LSP_PORT or pipes using STDIO. After the
 * establishing of the connection the main thread suspends until it is stopped forcibly.
 *
 * <p>To run the extension using path, you may specify "pipeEnabled" as a program argument. In other
 * case the server will start using socket.
 */
public class LangServerBootstrap {
  public static boolean cliMode = false;
  private static final Integer LSP_PORT = 1044;
  private static final String PIPE_ARG = "pipeEnabled";
  // It's need to be static, so it will be initialized after cliMode mode calculated (it is used in logger setup)
  private final Logger logger = LoggerFactory.getLogger(LangServerBootstrap.class);

  /**
   * The entry point for the application.
   *
   * @param args command line arguments
   */
  public static void main(String[] args)
          throws ExecutionException, InterruptedException, IOException {
    if (isCliMode(args)) {
      cliMode = true;
      int exitCode = new CommandLine(new Cli()).execute(args);
      System.exit(exitCode);
    }
    LangServerBootstrap langServerBootstrap = new LangServerBootstrap();
    Injector injector = LangServerBootstrap.initCtx();
    LanguageServer server = injector.getInstance(LanguageServer.class);
    ClientProvider provider = injector.getInstance(ClientProvider.class);

    langServerBootstrap.start(args, server, provider);
  }

  private static boolean isCliMode(String[] args) {
    if (args.length == 0) {
      return false;
    }
    return !isPipeEnabled(args);
  }

  static Injector initCtx() {
    return Guice.createInjector(new ServiceModule(), new EngineModule(), new DatabusModule());
  }

  private void start(
          @NonNull String[] args, @NonNull LanguageServer server, @NonNull ClientProvider provider)
          throws IOException, InterruptedException, ExecutionException {
    logger.info(String.format("Java version: %s", System.getProperty("java.version")));
    try {
      if (isPipeEnabled(args)) {
        launchServerWithPipes(server, provider);
      } else {
        // Enable logging
        ch.qos.logback.classic.Logger rootLogger = (ch.qos.logback.classic.Logger) LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME);
        ConsoleAppender<ILoggingEvent> ca = new ConsoleAppender<>();
        ca.setContext(rootLogger.getLoggerContext());
        ca.setName("console");
        rootLogger.addAppender(ca);
        rootLogger.setLevel(Level.ALL);
        launchServerWithSocket(server, provider);
      }
    } catch (ExecutionException e) {
      logger.error("An error occurred while starting a language server", e);
      throw e;
    } catch (IOException e) {
      logger.error("Unable to start server using socket communication on port [{}]", LSP_PORT);
      throw e;
    }
  }

  private void launchServerWithSocket(LanguageServer server, ClientProvider provider)
          throws IOException, InterruptedException, ExecutionException {
    logger.info("Language server awaiting socket communication on port [{}]", LSP_PORT);
    try (ServerSocket serverSocket = new ServerSocket(LSP_PORT);
         Socket socket = serverSocket.accept();
         InputStream input = socket.getInputStream();
         OutputStream output = socket.getOutputStream()) {
      logger.info("Connection established successfully");
      Launcher<CobolLanguageClient> launcher = createServerLauncher(server, input, output);
      provider.setClient(launcher.getRemoteProxy());
      // suspend the main thread on listening
      launcher.startListening().get();
    }
  }

  @SuppressWarnings("squid:S106")
  private void launchServerWithPipes(
          @NonNull LanguageServer server, @NonNull ClientProvider provider)
          throws InterruptedException, ExecutionException {
    logger.info("Language server started using pipe communication");
    Launcher<CobolLanguageClient> launcher = createServerLauncher(server, System.in, System.out);
    provider.setClient(launcher.getRemoteProxy());
    // suspend the main thread on listening
    launcher.startListening().get();
  }

  static boolean isPipeEnabled(@NonNull String[] args) {
    return args.length > 0 && PIPE_ARG.equals(args[0]);
  }

  static Launcher<CobolLanguageClient> createServerLauncher(
          @NonNull LanguageServer server, @NonNull InputStream in, @NonNull OutputStream out) {
    ThreadFactory tf = new ThreadFactory() {
      private int counter = 0;

      public Thread newThread(Runnable r) {
        return new Thread(r, "LSP" + "-" + counter++);
      }
    };
    return new LSPLauncher.Builder<CobolLanguageClient>()
            .setLocalService(server)
            .setExecutorService(Executors.newCachedThreadPool(tf))
            .setRemoteInterface(CobolLanguageClient.class)
            .setInput(in)
            .setOutput(out)
            .create();
  }
}
