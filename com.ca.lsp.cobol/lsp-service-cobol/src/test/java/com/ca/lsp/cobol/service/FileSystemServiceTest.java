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

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.domain.cobol.databus.impl.AbstractDataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.FileSystemTestImpl;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.TimeoutException;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.*;

@Slf4j
public class FileSystemServiceTest extends FileSystemTestImpl
    implements EventObserver<RequiredCopybookEvent> {
  private DefaultDataBusBroker databus =
      (DefaultDataBusBroker) LangServerCtx.getInjector().getInstance(AbstractDataBusBroker.class);

  private FileSystemServiceImpl fileSystemService =
      (FileSystemServiceImpl) LangServerCtx.getInjector().getInstance(FileSystemService.class);

  // Activities performed
  // 1 - Create folder structure in temp folder - Create two copybooks in the provided structure
  // 2 - Create two copybooks in the provided structure
  // 3 - Initialize the workspaceFolder to reproduce what client does when a new workspace is opened
  //     on the IDE
  // 4 - Initialize the list of workspaces (workspace roots) that WorkspaceManager should have to
  //     apply search operations

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
  }

  /*
   * This test take in input a copybook name, retrieve the URI of the file (if it exists) and in case affermative return the
   * content, null otherwise.
   */
  @Test
  public void getContentByCopybookName() {
    assertNotNull(fileSystemService.getContentByCopybookName(CPY_OUTER_NAME_ONLY2));
  }

  @Test
  public void getNullWithNotCopybookNotFound() {
    assertNull(fileSystemService.getContentByCopybookName("ANTHR_CPY"));
  }

  @Test
  public void testDataSentOnDatabus() {
    FetchedCopybookEvent fetchedCopybookEvent =
        FetchedCopybookEvent.builder().name(CPY_OUTER_NAME_ONLY2).content("SOME_CONTENT").build();

    assertTrue(
        fetchedCopybookEvent.getName().length() > 0
            && fetchedCopybookEvent.getContent().length() > 0);
  }

  /**
   * This test verify that a new dependency file is created when a new copybook not present into the
   * COPYBOOK folder.
   */
  @Test
  public void depFileGenerationPositiveTest() {
    Path depFileReference;
    try {
      depFileReference = fileSystemService.generateDependencyFile();
      assertTrue(Files.exists(depFileReference));
    } catch (URISyntaxException | IOException e) {
      e.printStackTrace();
      fail("Error for generate dep file");
    }
  }

  /**
   * This test verify that when a copybook is found in the COPYBOOK folder, the dependency file is
   * not created.
   */
  @Test
  public void depFileGenerationNegativeTest() throws TimeoutException, InterruptedException {
    /*
       The following scenario is applied:
         0. The .cobdep folder is not present
         1. A required copybook event is generated
         2. The FileSystem service subscribed for that event try to search the required copybook in
    the copybook folder
         3. The copybook is present in the COPYBOOK folder
         4. The .cobdeps folder is not generated.
        */

    databus.invalidateCache();
    databus.postData(RequiredCopybookEvent.builder().name(CPY_OUTER_NAME_ONLY2).build());

    assertFalse(Files.exists(Paths.get(workspacePath + filesystemSeparator() + COBDEPS)));
  }

  /**
   * This test verify that an already defined dependency file is updated with a new copybook
   * required to be downloaded.
   */
  @Test
  public void depFileUpdatePositiveTest() {
    // create the dep folder with the SOMPROG.dep
    Path depFileReference = null;
    try {
      depFileReference = fileSystemService.generateDependencyFile();
    } catch (URISyntaxException | IOException e) {
      e.printStackTrace();
    }

    if (depFileReference != null) {
      // check the number of elements before the update
      List<String> depFileReferenceElementList;
      int numberOfElements = 0;
      log.info("Read the dependency file 1st time");
      depFileReferenceElementList = getElementListFromDepFile(depFileReference);
      if (depFileReferenceElementList != null) {
        numberOfElements = depFileReferenceElementList.size();
      }

      fileSystemService.updateDependencyList(depFileReference, "ANEWCPY2");
      // read the list again..

      log.info("Read the dep file second time");
      depFileReferenceElementList = getElementListFromDepFile(depFileReference);

      if (depFileReferenceElementList != null) {
        assertEquals(numberOfElements + 1, depFileReferenceElementList.size());
      } else {
        fail("Error during reading dependency file in update");
      }
    } else {
      fail("Error during reading dependency file in read");
    }
  }

  private List<String> getElementListFromDepFile(Path depFileReference) {
    try {
      return Files.readAllLines(depFileReference);
    } catch (IOException e) {
      log.error(e.getLocalizedMessage());
      return null;
    }
  }

  // TODO: MUST be refactored..
  /**
   * This test verify that an already defined dependency file is not updated when a copybook already
   * defined in COPYBOOK folder is recognized during the analysis.
   */
  @Test
  public void depFileUpdateNegativeTest() throws TimeoutException, InterruptedException {
    // create the dep folder with the SOMPROG.dep
    try {
      fileSystemService.generateDependencyFile();
    } catch (URISyntaxException | IOException e) {
      e.printStackTrace();
    }

    Path dependencyFile =
        Paths.get(
            workspacePath + filesystemSeparator() + COBDEPS + filesystemSeparator() + SOMEPROG_DEP);

    if (!Files.exists(dependencyFile)) {
      fail("Error creating dependency file");
    }

    // read copybook number in dep file
    List<String> result = null;
    try (Stream<String> lines = Files.lines(dependencyFile)) {
      result = lines.collect(Collectors.toList());
      System.out.println(result.size());
    } catch (IOException e) {
      e.printStackTrace();
    }

    int copybookInDepFile = result.size();

    // create a new required event - the copybook already exist
    databus.invalidateCache();
    databus.postData(RequiredCopybookEvent.builder().name("copy2").build());

    assertEquals(copybookInDepFile, result.size());
  }

  @Override
  public void observerCallback(RequiredCopybookEvent event) {
    log.info(event.toString());
    log.info("OBSERVER CALLBACK FROM TEST METHOD");
  }
}
