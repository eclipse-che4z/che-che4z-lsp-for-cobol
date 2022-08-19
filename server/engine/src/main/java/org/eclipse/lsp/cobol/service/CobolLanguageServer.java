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
package org.eclipse.lsp.cobol.service;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.AllArgsConstructor;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.messages.LocaleStore;
import org.eclipse.lsp.cobol.core.messages.LogLevelUtils;
import org.eclipse.lsp.cobol.core.model.ErrorCode;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.delegates.completions.Keywords;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.eclipse.lsp4j.services.WorkspaceService;

import javax.annotation.Nullable;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ForkJoinPool;

import static java.lang.Boolean.TRUE;
import static java.util.Arrays.stream;
import static java.util.Collections.emptyList;
import static java.util.concurrent.CompletableFuture.supplyAsync;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.*;
import static org.eclipse.lsp4j.TextDocumentSyncKind.Full;

/**
 * This class sets up the initial state of the services and applies other initialization activities,
 * such as set server capabilities and register file system watchers.
 */
@Slf4j
@Singleton
public class CobolLanguageServer implements LanguageServer {

  private final DisposableLSPStateService disposableLSPStateService;
  private final TextDocumentService textService;
  private final WorkspaceService workspaceService;
  private final WatcherService watchingService;
  private final SettingsService settingsService;
  private final LocaleStore localeStore;
  private final CustomThreadPoolExecutor customThreadPoolExecutor;
  private final ConfigurationService configurationService;
  private final CopybookNameService copybookNameService;
  private final Keywords keywords;

  @Inject
  @SuppressWarnings("squid:S107")
  CobolLanguageServer(
      TextDocumentService textService,
      WorkspaceService workspaceService,
      WatcherService watchingService,
      SettingsService settingsService,
      LocaleStore localeStore,
      CustomThreadPoolExecutor customThreadPoolExecutor,
      DisposableLSPStateService disposableLSPStateService,
      ConfigurationService configurationService,
      CopybookNameService copybookNameService,
      Keywords keywords) {
    this.textService = textService;
    this.workspaceService = workspaceService;
    this.watchingService = watchingService;
    this.settingsService = settingsService;
    this.localeStore = localeStore;
    this.customThreadPoolExecutor = customThreadPoolExecutor;
    this.disposableLSPStateService = disposableLSPStateService;
    this.configurationService = configurationService;
    this.copybookNameService = copybookNameService;
    this.keywords = keywords;
  }

  @Override
  public TextDocumentService getTextDocumentService() {
    return textService;
  }

  @Override
  public WorkspaceService getWorkspaceService() {
    return workspaceService;
  }

  @Override
  @NonNull
  public CompletableFuture<InitializeResult> initialize(@NonNull InitializeParams params) {
    ServerCapabilities capabilities = new ServerCapabilities();

    capabilities.setTextDocumentSync(Full);
    capabilities.setCompletionProvider(new CompletionOptions(false, emptyList()));
    capabilities.setDefinitionProvider(TRUE);
    capabilities.setReferencesProvider(TRUE);
    capabilities.setDocumentFormattingProvider(TRUE);
    capabilities.setDocumentHighlightProvider(TRUE);
    capabilities.setCodeActionProvider(TRUE);
    capabilities.setExecuteCommandProvider(collectExecuteCommandList());
    capabilities.setDocumentSymbolProvider(TRUE);
    capabilities.setHoverProvider(TRUE);
    capabilities.setFoldingRangeProvider(TRUE);

    WorkspaceFoldersOptions workspaceFoldersOptions = new WorkspaceFoldersOptions();
    workspaceFoldersOptions.setSupported(TRUE);
    WorkspaceServerCapabilities workspaceServiceCapabilities =
        new WorkspaceServerCapabilities(workspaceFoldersOptions);
    capabilities.setWorkspace(workspaceServiceCapabilities);

    return supplyAsync(() -> new InitializeResult(capabilities));
  }

  /**
   * Initialized request sent from the client after the 'initialize' request resolved. It is used as
   * hook to dynamically register capabilities, e.g. file system watchers.
   *
   * @param params - InitializedParams sent by a client
   */
  @Override
  public void initialized(@Nullable InitializedParams params) {
    configurationService.updateConfigurationFromSettings();
    watchingService.watchConfigurationChange();
    watchingService.watchPredefinedFolder();
    addLocalFilesWatcher();
    getLocaleFromClient();
    getLogLevelFromClient();
    copybookNameService.collectLocalCopybookNames();
    keywords.updateStorage();
  }

  private void getLogLevelFromClient() {
    settingsService
        .fetchConfiguration(LOGGING_LEVEL.label)
        .thenAccept(LogLevelUtils.updateLogLevel());
  }

  private void getLocaleFromClient() {
    settingsService.fetchConfiguration(LOCALE.label).thenAccept(localeStore.notifyLocaleStore());
  }

  @Override
  public CompletableFuture<Object> shutdown() {
    LOG.info("COBOL LS received shutdown request");
    try {
      cancelAllProcessing();
      disposableLSPStateService.shutdown();
    } catch (Exception exception) {
      return CompletableFuture.completedFuture(new ShutdownResponse(null, exception.getMessage()));
    }
    int exitCode = disposableLSPStateService.getExitCode();
    return CompletableFuture.completedFuture(new ShutdownResponse(null, String.valueOf(exitCode)));
  }

  /**
   * Attempts to stop all actively executing tasks, halts the processing of waiting tasks, and
   * returns a list of the tasks that were awaiting execution. These tasks are drained (removed)
   * from the task queue upon return from this method.
   *
   * <p>There are no guarantees beyond best-effort attempts to stop processing actively executing
   * tasks. This implementation cancels tasks via Thread.interrupt(), so any task that fails to
   * respond to interrupts may never terminate.
   *
   * <p>Source:
   * https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ThreadPoolExecutor.html#shutdownNow--
   */
  private void cancelAllProcessing() {
    // NOTE: shutdownNow principally is not a bad practice when we know what we are doing.
    //      Here in this case, since we are only stopping our own threads which don't
    //      require any clean up.It's ok. Java doc doesn't mention any bad practice for this.

    // cancels all the running task and clears empty queue on forkJoinPool.
    ForkJoinPool.commonPool().shutdownNow();

    // cancels all the running task on COBOL LS custom executor service.
    customThreadPoolExecutor.getThreadPoolExecutor().shutdownNow();
    customThreadPoolExecutor.getScheduledThreadPoolExecutor().shutdownNow();
    LOG.info("All processing abandoned as per shutdown call");
  }

  @Override
  public void exit() {
    int exitCode = disposableLSPStateService.getExitCode();
    LOG.info("COBOL LS server exits with code: " + exitCode);
    System.exit(exitCode);
  }

  private void addLocalFilesWatcher() {
    settingsService
        .fetchTextConfiguration(CPY_LOCAL_PATHS.label)
        .thenAccept(watchingService::addWatchers);
    settingsService
        .fetchTextConfiguration(SUBROUTINE_LOCAL_PATHS.label)
        .thenAccept(watchingService::addWatchers);
  }

  @NonNull
  private ExecuteCommandOptions collectExecuteCommandList() {
    return new ExecuteCommandOptions(
        stream(ErrorCode.values()).map(ErrorCode::getLabel).collect(toList()));
  }

  /** Represents the JSON RPC response structure for shutdown command as per LSP specification */
  @AllArgsConstructor
  private static class ShutdownResponse {
    private final String result;
    private final String error;
  }
}
