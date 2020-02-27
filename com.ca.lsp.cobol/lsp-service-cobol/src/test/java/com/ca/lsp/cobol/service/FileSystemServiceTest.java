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

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.FileSystemConfiguration;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;

import java.nio.file.Path;
import java.util.Collections;

import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

@Slf4j
public class FileSystemServiceTest extends FileSystemConfiguration
    implements EventObserver<RequiredCopybookEvent> {

  private CopybookServiceImpl fileSystemService =
      (CopybookServiceImpl) LangServerCtx.getInjector().getInstance(CopybookService.class);

  // Activities performed
  // 1 - Create folder structure in temp folder - Create two copybooks in the provided
  // structprivaure
  // 2 - Create two copybooks in the provided structure
  // 3 - Initialize the workspaceFolder to reproduce what client does when a new workspace is opened
  //     on the IDE
  // 4 - Initialize the list of workspaces (workspace roots) that WorkspaceManager should have to
  //     apply search operations

  @Before
  public void initActivities() {
    // the delegate will prepare the structure and this method will just setup the list of workspace
    // folders
    fileSystemService.setWorkspaceFolders(generateWorkspaceFolder());
  }

  /**
   * This test verify that for a given copybook present in the workspace folder the
   * FileSystemService is able to found it
   */
  @Test
  public void findCopybookByNamePositiveTest() {
    assertNotNull(fileSystemService.findCopybook(CPY_OUTER_NAME_ONLY2));
  }

  /**
   * This test verify that asking for a copybook not present in the workspace folder return null to
   * the client
   */
  @Test
  public void findCopybookByNameNegativeTest() {
    assertNull(fileSystemService.findCopybook(COPYBOOK_NOT_PRESENT));
  }

  /*
   * This test take in input a copybook name and MF configuration (profile, target dataset list), and retrieve the
   * content of the copybook, null otherwise.
   */
  @Test
  public void getContentByCopybookName() {
    Path path =
        fileSystemService.findCopybook(
            CPY_OUTER_NAME_ONLY2,
            (String) configurationSettingsStorable.getProfiles(),
            configurationSettingsStorable.getPaths());

    assertNotNull(fileSystemService.retrieveContentByPath(path));
  }

  /**
   * In this test we assert that looking for a copybook that doesn't exists on the target folders
   * returns null.
   */
  @Test
  public void getNullWithNotCopybookNotFound() {
    assertNull(
        fileSystemService.findCopybook(
            COPYBOOK_NOT_PRESENT,
            (String) configurationSettingsStorable.getProfiles(),
            configurationSettingsStorable.getPaths()));
  }

  /**
   * This test verify that the fetched copybook event is correctly generated and contains the
   * required informations that the filesystem service should return back to the client.
   */

  // TODO: Refactor using mockito and the verify that the fetch cpyb is correctly defined
  @Test
  public void testCorrectFetchedDataAreGenerated() {
    FetchedCopybookEvent fetchedCopybookEvent =
        FetchedCopybookEvent.builder().name(CPY_OUTER_NAME_ONLY2).content("SOME_CONTENT").build();

    assertTrue(
        fetchedCopybookEvent.getName().length() > 0
            && fetchedCopybookEvent.getContent().length() > 0);
  }

  /**
   * This test verify that the search in the copybook folder is applied searching only in the
   * dataset name folder provided by the setting and the copybook is found
   */
  @Test
  public void findCopybookWithDatasetFilteringPositiveTest() {
    // use the list of paths for the search in copybooks delimited only to this list
    assertNotNull(
        fileSystemService.findCopybook(
            CPY_OUTER_NAME_ONLY2,
            (String) configurationSettingsStorable.getProfiles(),
            configurationSettingsStorable.getPaths()));
  }

  /**
   * This test verify that the setting provide a list of dataset path in the copybook folder to
   * search the dataset but the dataset is not found and the method return null.
   */
  @Test
  public void findCopybookWithDatasetFilteringNegativeTest() {
    assertNull(
        fileSystemService.findCopybook(
            "ANTHCPY1",
            (String) configurationSettingsStorable.getProfiles(),
            configurationSettingsStorable.getPaths()));
  }
  //
  /**
   * This test verify that when the setting provide a dataset path that is not present in the
   * copybook folder the search method return null;
   */
  @Test
  public void findCopybookWithWrongFolderStructure() {
    assertNull(
        fileSystemService.findCopybook(
            CPY_OUTER_NAME_ONLY2,
            (String) configurationSettingsStorable.getProfiles(),
            Collections.singletonList("HLQLF02.DSNAME1")));
  }

  @Override
  public void observerCallback(RequiredCopybookEvent event) {
    log.info(event.toString());
    log.info("OBSERVER CALLBACK FROM TEST METHOD");
  }
}
