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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.domain.cobol.databus.impl.AbstractDataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.UnknownEvent;
import com.ca.lsp.cobol.FileSystemTestImpl;
import net.jodah.concurrentunit.Waiter;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Comparator;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

/**
 * This class contains all the unit test that perform the publish/subscribe acrivities for generate
 * the dependency file.
 */
public class FileSystemE2ETest extends FileSystemTestImpl {
  public static final String DOCUMENT_URI = "file:///C:/Users/test/Test.cbl";
  public static final String CPY_NAME_WITHOUT_EXT = "copy2";
  DefaultDataBusBroker broker =
      (DefaultDataBusBroker) LangServerCtx.getInjector().getInstance(AbstractDataBusBroker.class);

  private FileSystemServiceImpl fileSystemService = new FileSystemServiceImpl(broker);
  private Waiter waiter = new Waiter();

  @Before
  public void initActivities() {
    // the delegate will prepare the structure and this method will just setup the list of workspace
    // folders
    fileSystemService.setWorkspaceFolders(initWorkspaceFolderList());
  }

  @After
  public void cleanupTempFolder() {
    try {
      Files.walk(Paths.get(getWorkspaceFolderPath()))
          .sorted(Comparator.reverseOrder())
          .map(Path::toFile)
          .forEach(File::delete);
    } catch (IOException e) {
      e.printStackTrace();
    }

    broker.invalidateCache();
  }

  /**
   * This test verify that when the preprocessor publish a require copybook event the FileSystem
   * service subscribed to it react generating the dependency file.
   */
  @Test
  public void generateDependencyFileOnCallback() throws InterruptedException {
    // generate a required copybook event
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(CPY_NAME_WITHOUT_EXT)
            .documentUri(DOCUMENT_URI)
            .build());
    Thread.sleep(1000);
    assertTrue(depFileExists());
  }

  /**
   * This test verify that when a non required event is published on the databus, the dependency
   * file is not created. This test assume that .cobdep folder exists but no depfile is created.
   */
  @Test
  public void noDependencyFileWithOtherEvent() {
    // generate a required copybook event
    broker.postData(UnknownEvent.builder().build());
    assertFalse(depFileExists());
  }

  private boolean depFileExists() {
    return Files.exists(
        Paths.get(
            workspacePath
                + filesystemSeparator()
                + ".cobdeps"
                + filesystemSeparator()
                + "Test.dep"));
  }

  private String filesystemSeparator() {
    return FileSystems.getDefault().getSeparator();
  }
}
