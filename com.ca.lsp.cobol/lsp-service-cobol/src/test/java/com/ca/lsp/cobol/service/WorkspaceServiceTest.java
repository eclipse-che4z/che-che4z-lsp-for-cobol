/*
 * Copyright (c) 2020 Broadcom.
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
package com.ca.lsp.cobol.service;

import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RunAnalysisEvent;
import com.google.gson.JsonPrimitive;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.ExecuteCommandParams;
import org.eclipse.lsp4j.FileEvent;
import org.eclipse.lsp4j.services.WorkspaceService;
import org.junit.Test;
import org.mockito.ArgumentCaptor;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static com.ca.lsp.core.cobol.model.ErrorCode.MISSING_COPYBOOK;
import static java.util.Arrays.asList;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static org.eclipse.lsp4j.FileChangeType.Changed;
import static org.junit.Assert.*;
import static org.mockito.ArgumentCaptor.forClass;
import static org.mockito.Mockito.*;

/**
 * This test checks the entry points of the {@link org.eclipse.lsp4j.services.WorkspaceService}
 * implementation.
 */
@Slf4j
public class WorkspaceServiceTest {
  /**
   * Test of the workspace/executeCommand entry point. Assert that on a MISSING_COPYBOOK the {@link
   * RequiredCopybookEvent} is fired.
   */
  @Test
  public void testExecuteCommand() {
    DataBusBroker broker = mock(DataBusBroker.class);
    String copybookName = "COPYBOOK";

    WorkspaceService service = new CobolWorkspaceServiceImpl(broker, null);

    CompletableFuture<Object> result =
        service.executeCommand(
            new ExecuteCommandParams(
                MISSING_COPYBOOK.name(),
                asList(new JsonPrimitive(copybookName), new JsonPrimitive(DOCUMENT_URI))));

    try {
      assertNull(result.get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
    verify(broker, timeout(10000)).invalidateCache();
    verify(broker, timeout(10000)).postData(any(RunAnalysisEvent.class));
  }
  /**
   * Test of the workspace/executeCommand entry point. Assert no changes applied if the command name
   * not recognized.
   */
  @Test
  public void testExecuteNonExistingCommand() {
    DataBusBroker broker = mock(DataBusBroker.class);
    WorkspaceService service = new CobolWorkspaceServiceImpl(broker, null);

    CompletableFuture<Object> result =
        service.executeCommand(new ExecuteCommandParams("Missing command name", emptyList()));

    try {
      assertNull(result.get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
    verify(broker, timeout(1000).times(0)).postData(any());
  }

  /**
   * Test of the workspace/executeCommand entry point. Assert no changes applied if the argument
   * list is incomplete.
   */
  @Test
  public void testExecuteCommandIncorrectArguments() {
    DataBusBroker broker = mock(DataBusBroker.class);
    WorkspaceService service = new CobolWorkspaceServiceImpl(broker, null);

    CompletableFuture<Object> result =
        service.executeCommand(
            new ExecuteCommandParams(
                MISSING_COPYBOOK.name(), singletonList(new JsonPrimitive(DOCUMENT_URI))));

    try {
      assertNull(result.get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
    verify(broker, never()).postData(any());
  }
  /**
   * This test verifies that the Workspace Service reacts on the file change watcher's notifications
   */
  @Test
  public void testDidChangeWatchedFilesExistingFileChanged() {
    checkWatchers(new FileEvent("file:///c%3A/workspace/COBOL/.copybooks/CpyName.cpy", Changed));
  }

  /**
   * This test verifies that the Workspace Service reacts on the directory change watcher's
   * notifications
   */
  @Test
  public void testDidChangeWatchedFilesAddedNewFile() {
    checkWatchers(new FileEvent("file:///c%3A/workspace/COBOL/.copybooks", Changed));
  }

  private void checkWatchers(FileEvent event) {
    DefaultDataBusBroker broker = mock(DefaultDataBusBroker.class);
    ArgumentCaptor<RunAnalysisEvent> captor = forClass(RunAnalysisEvent.class);

    WorkspaceService service = new CobolWorkspaceServiceImpl(broker, null);

    DidChangeWatchedFilesParams params = new DidChangeWatchedFilesParams(singletonList(event));
    service.didChangeWatchedFiles(params);

    verify(broker).invalidateCache();
    verify(broker).postData(captor.capture());
    assertNotNull(captor.getValue());
  }
}
