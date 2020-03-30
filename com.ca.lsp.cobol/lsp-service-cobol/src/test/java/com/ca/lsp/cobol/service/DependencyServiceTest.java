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

import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.CopybookDepEvent;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.ca.lsp.cobol.FileSystemConfiguration;
import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.ca.lsp.cobol.service.delegates.dependency.CopybookDependencyServiceImpl;
import com.google.inject.Guice;
import com.google.inject.Provider;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static java.util.Collections.unmodifiableList;
import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

/** This class represent all the unit test for the copybook dependency managament service */
@Slf4j
public class DependencyServiceTest extends FileSystemConfiguration {
  private final DataBusBroker broker =
      Guice.createInjector(new DatabusModule()).getInstance(DataBusBroker.class);
  Provider<ConfigurationSettingsStorable> provider =
      () ->
          new ConfigurationSettingsStorable(
              PROFILE_NAME, unmodifiableList(Arrays.asList(DSNAME_1, DSNAME_2)));

  private CopybookDependencyServiceImpl dependencyService =
      new CopybookDependencyServiceImpl(broker, provider);

  @Before
  public void initActivities() {
    createWorkspaceFolderStructure();
    createDependencyFileStructure();

    dependencyService.setWorkspaceFolderPaths(Collections.singletonList(workspaceFolder));
  }

  @Test
  public void databusSubscriptionTest() {
    DataBusBroker brokerMock = mock(DataBusBroker.class);

    CopybookDependencyServiceImpl dependencyServiceT =
        new CopybookDependencyServiceImpl(brokerMock, null);
    verify(brokerMock).subscribe(DataEventType.COPYBOOK_DEP_EVENT, dependencyServiceT);
  }

  /**
   * This test proves that the .dep file should update and remove the copybooks which were already
   * downloaded and present in the .copybook directory
   */
  @Test
  public void depFileUpdateTest() {
    // create the .dep file
    Path depFileReference = createDependencyFile(COPYBOOK_NAME);
    dependencyService.addCopybookInDepFile(CPY_OUTER_NAME_ONLY2, DOCUMENT_URI);
    int numberOfElements = getNumberOfElementsFromDepFile(depFileReference);

    // trigger the event which will update the .dep file @link{CopybookDependencyServiceImpl.class}
    dependencyService.observerCallback(
        CopybookDepEvent.builder()
            .copybookName(CPY_OUTER_NAME_ONLY2)
            .textDocumentSync("DID_CHANGE")
            .documentUri(DOCUMENT_URI)
            .build());

    assertEquals(numberOfElements - 1, getNumberOfElementsFromDepFile(depFileReference));
  }

  /**
   * This test verify that the dependency file is created when a new copybook is found by the
   * preprocessor.
   */
  @Test
  public void depFileGenerationPositiveTest() {
    Path depFileReference = createDependencyFile(DEP_FILE_COST_NAME);
    assertTrue(Files.exists(depFileReference));
  }

  /**
   * This test verify that an already defined dependency file is updated with a new copybook
   * required to be downloaded.
   */
  @Test
  public void depFileUpdatePositiveTest() {
    // create the dep folder with the SOMPROG.dep
    Path depFileReference = createDependencyFile(DEP_FILE_COST_NAME);

    // check the number of elements before the update
    int numberOfElements = getNumberOfElementsFromDepFile(depFileReference);

    // update dep file with a new copybook
    dependencyService.updateDependencyList(depFileReference, "ANEWCPY2");
    // read the list again..
    // assert that number of element change by 1
    assertEquals(numberOfElements + 1, getNumberOfElementsFromDepFile(depFileReference));
  }

  /** This test verify that an empty value for the copybook is not added in the deplist. */
  @Test
  public void depFileWithoutEmptyCopybookName() {
    // create the dep folder with the SOMPROG.dep
    Path depFileReference = createDependencyFile(DEP_FILE_COST_NAME);

    // check the number of elements before the update
    int numberOfElements = getNumberOfElementsFromDepFile(depFileReference);

    // update dep file with a new copybook
    dependencyService.addCopybookInDepFile(EMPTY_COPYBOOK_NAME, DOCUMENT_URI);

    // assert that number of element didn't change
    assertEquals(numberOfElements, getNumberOfElementsFromDepFile(depFileReference));
  }

  private int getNumberOfElementsFromDepFile(Path depFileReference) {
    List<String> depFileReferenceElementList;

    depFileReferenceElementList = getElementListFromDepFile(depFileReference);

    assert depFileReferenceElementList != null;
    return depFileReferenceElementList.size();
  }

  private List<String> getElementListFromDepFile(Path depFileReference) {
    try {
      return Files.readAllLines(depFileReference);
    } catch (IOException e) {
      log.error(e.getMessage());
      return null;
    }
  }

  private Path createDependencyFile(String depFileName) {
    dependencyService.generateDependencyFile(depFileName);
    return Paths.get(depenencyFileFolderPath + filesystemSeparator() + depFileName + DEP_EXTENSION);
  }
}
