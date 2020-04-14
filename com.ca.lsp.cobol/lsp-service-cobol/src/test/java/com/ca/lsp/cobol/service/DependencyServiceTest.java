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
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.FileSystemConfiguration;
import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.ca.lsp.cobol.service.delegates.dependency.CopybookDependencyService;
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

/** This class represent all the unit test for the copybook dependency management service */
@Slf4j
public class DependencyServiceTest extends FileSystemConfiguration {
  public static final String NESTED_CPY_NAME = "CPYNEST2";
  private final DataBusBroker broker =
      Guice.createInjector(new DatabusModule()).getInstance(DataBusBroker.class);
  Provider<ConfigurationSettingsStorable> provider =
      () ->
          new ConfigurationSettingsStorable(unmodifiableList(Arrays.asList(FULL_PATH, FULL_PATH2)));

  private CopybookDependencyService dependencyService =
      new CopybookDependencyServiceImpl(broker, provider);

  @Before
  public void initActivities() {
    createWorkspaceFolderStructure();
    createDependencyFolder();
    dependencyService.setWorkspaceFolderPaths(Collections.singletonList(workspaceFolder));
  }

  @Test
  public void databusSubscriptionTest() {
    DataBusBroker brokerMock = mock(DataBusBroker.class);

    CopybookDependencyServiceImpl dependencyService =
        new CopybookDependencyServiceImpl(brokerMock, null);
    verify(brokerMock).subscribe(DataEventType.COPYBOOK_DEP_EVENT, dependencyService);
  }

  /**
   * This test proves that the .dep file should update and remove the copybooks which were already
   * downloaded and present in the .copybook directory
   */
  @Test
  public void whenACopybookIsFound_ShouldBeRemovedFromDepFile() {
    CopybookDependencyServiceImpl copybookDependencyServiceImpl =
        new CopybookDependencyServiceImpl(broker, provider);
    copybookDependencyServiceImpl.setWorkspaceFolderPaths(
        Collections.singletonList(workspaceFolder));
    Path depFileReference = createDependencyFileForCobolFile(COBOL_FILE_NAME);

    copybookDependencyServiceImpl.addCopybookInDepFile(
        createRequiredEvent(
            CPY_NAME_WITHOUT_EXT,
            COBOL_FILE_DOCUMENT_URI,
            TextDocumentSyncType.DID_OPEN.toString()),
        CPY_NAME_WITHOUT_EXT);

    int numberOfElements = getNumberOfElementsFromDepFile(depFileReference);

    // trigger the event which will update the .dep file @link{CopybookDependencyServiceImpl.class}
    invokeObserverCallback(copybookDependencyServiceImpl);

    assertEquals(numberOfElements - 1, getNumberOfElementsFromDepFile(depFileReference));
  }

  private Path createDependencyFileForCobolFile(String depFileName) {
    dependencyService.generateDependencyFile(depFileName);
    return Paths.get(depenencyFileFolderPath + filesystemSeparator() + depFileName + DEP_EXTENSION);
  }

  public RequiredCopybookEvent createRequiredEvent(
      String copybookName, String documentURI, String documentSyncType) {
    return new RequiredCopybookEvent(copybookName, documentURI, documentSyncType);
  }

  private void invokeObserverCallback(CopybookDependencyServiceImpl copybookDependencyServiceImpl) {
    copybookDependencyServiceImpl.observerCallback(
        CopybookDepEvent.builder()
            .copybookName(CPY_NAME_WITHOUT_EXT)
            .textDocumentSync("DID_CHANGE")
            .documentUri(COBOL_FILE_DOCUMENT_URI)
            .build());
  }

  /**
   * This test verify that the dependency file is created when a new copybook is found by the
   * preprocessor.
   */
  @Test
  public void depFileGenerationPositiveTest() {
    Path depFileReference = createDependencyFileForCobolFile(DEP_FILE_COST_NAME);
    assertTrue(Files.exists(depFileReference));
  }

  /**
   * This test verify that an already defined dependency file is updated with a new copybook
   * required to be downloaded.
   */
  @Test
  public void depFileUpdatePositiveTest() {
    Path depFileReference = createDependencyFileForCobolFile(DEP_FILE_COST_NAME);

    // check the number of elements inside the dependency file before update it
    int numberOfElements = getNumberOfElementsFromDepFile(depFileReference);

    dependencyService.updateDependencyList(depFileReference, "ANEWCPY2");

    assertEquals(numberOfElements + 1, getNumberOfElementsFromDepFile(depFileReference));
  }

  /** This test verify that an empty value for the copybook is not added in the deplist. */
  @Test
  public void depFileWithoutEmptyCopybookName() {
    Path depFileReference = createDependencyFileForCobolFile(DEP_FILE_COST_NAME);

    // check the number of elements inside the dependency file before update it
    int numberOfElements = getNumberOfElementsFromDepFile(depFileReference);

    dependencyService.addCopybookInDepFile(
        createRequiredEvent(
            CPY_NAME_WITHOUT_EXT,
            COBOL_FILE_DOCUMENT_URI,
            TextDocumentSyncType.DID_OPEN.toString()),
        EMPTY_COPYBOOK_NAME);

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

  @Test
  public void depFileForNestedCopybooksIsCreated() {
    dependencyService.addCopybookInDepFile(
        createRequiredEvent(
            NESTED_CPY_NAME,
            getDocumentURIFromCopybookName(),
            TextDocumentSyncType.DID_CHANGE.toString()),
        NESTED_CPY_NAME);
    assertDepFileIsCreated();
  }

  private String getDocumentURIFromCopybookName() {
    return Paths.get(copybooksFolderPath + filesystemSeparator() + CPYNEST_CPY).toUri().toString();
  }

  private void assertDepFileIsCreated() {
    assertTrue(
        Files.exists(
            Paths.get(
                depenencyFileFolderPath + filesystemSeparator() + "CPYNEST" + DEP_EXTENSION)));
  }
}
