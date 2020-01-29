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
package com.ca.lsp.cobol.service;

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.RunAnalysisEvent;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.FileChangeType;
import org.eclipse.lsp4j.FileEvent;
import org.junit.Test;
import org.mockito.ArgumentCaptor;

import java.util.Collections;

import static junit.framework.TestCase.assertNotNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

@Slf4j
public class WorkspaceServiceTest {
  /**
   * This test verifies that the Workspace Service reacts on the file change watcher's notifications
   */
  @Test
  public void testDidChangeWatchedFilesExistingFileChanged() {
    checkWatchers(
        new FileEvent(
            "file:///c%3A/workspace/COBOL/COPYBOOKS/CpyName.cpy", FileChangeType.Changed));
  }

  /**
   * This test verifies that the Workspace Service reacts on the directory change watcher's
   * notifications
   */
  @Test
  public void testDidChangeWatchedFilesAddedNewFile() {
    checkWatchers(new FileEvent("file:///c%3A/workspace/COBOL/COPYBOOKS", FileChangeType.Changed));
  }

  private void checkWatchers(FileEvent event) {
    DefaultDataBusBroker broker = mock(DefaultDataBusBroker.class);
    ArgumentCaptor<RunAnalysisEvent> captor = ArgumentCaptor.forClass(RunAnalysisEvent.class);

    CobolWorkspaceServiceImpl service = new CobolWorkspaceServiceImpl(broker);

    DidChangeWatchedFilesParams params =
        new DidChangeWatchedFilesParams(Collections.singletonList(event));
    service.didChangeWatchedFiles(params);

    verify(broker).invalidateCache();
    verify(broker).postData(captor.capture());
    assertNotNull(captor.getValue());
  }
}
