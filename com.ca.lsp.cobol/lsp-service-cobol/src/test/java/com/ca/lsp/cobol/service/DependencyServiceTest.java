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

import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.FileSystemConfiguration;
import com.ca.lsp.cobol.service.delegates.dependency.CopybookDependencyServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;

import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;

/** This class represent all the unit test for the copybook dependency managament service */
@Slf4j
public class DependencyServiceTest extends FileSystemConfiguration {
  public static final String NESTED_CPY_NAME = "CPYNEST2";
  private CopybookDependencyServiceImpl dependencyService = new CopybookDependencyServiceImpl();

  @Before
  public void initActivities() {
    createWorkspaceFolderStructure();
    createDependencyFolder();

    dependencyService.setWorkspaceFolderPaths(Collections.singletonList(workspaceFolder));
  }

  /**
   * This test verify that the dependency file is created when a new copybook is found by the
   * preprocessor.
   */
  @Test
  public void depFileGenerationPositiveTest() {
    Path depFileReference = createDependencyFile();
    assertTrue(Files.exists(depFileReference));
  }

  private Path createDependencyFile() {
    dependencyService.generateDependencyFile(DEP_FILE_COST_NAME);
    return Paths.get(
        depenencyFileFolderPath + filesystemSeparator() + DEP_FILE_COST_NAME + DEP_EXTENSION);
  }

  /**
   * This test verify that an already defined dependency file is updated with a new copybook
   * required to be downloaded.
   */
  @Test
  public void depFileUpdatePositiveTest() {
    // create the dep folder with the SOMPROG.dep
    Path depFileReference = createDependencyFile();

    // check the number of elements before the update
    int numberOfElements = getNumberOfElementsFromDepFile(depFileReference);

    // update dep file with a new copybook
    dependencyService.updateDependencyList(depFileReference, "ANEWCPY2");
    // read the list again..
    // assert that number of element change by 1
    assertEquals(numberOfElements + 1, getNumberOfElementsFromDepFile(depFileReference));
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

  /** This test verify that an empty value for the copybook is not added in the deplist. */
  @Test
  public void depFileWithoutEmptyCopybookName() {
    // create the dep folder with the SOMPROG.dep
    Path depFileReference = createDependencyFile();

    // check the number of elements before the update
    int numberOfElements = getNumberOfElementsFromDepFile(depFileReference);

    // update dep file with a new copybook
    dependencyService.addCopybookInDepFile(EMPTY_COPYBOOK_NAME, DOCUMENT_URI);

    // assert that number of element didn't change
    assertEquals(numberOfElements, getNumberOfElementsFromDepFile(depFileReference));
  }

  @Test
  public void depFileForNestedCopybooksIsCreated() {
    String documentURI =
        Paths.get(copybooksFolderPath + filesystemSeparator() + CPYNEST_CPY).toUri().toString();

    RequiredCopybookEvent requiredCopybookEvent =
        new RequiredCopybookEvent(
            NESTED_CPY_NAME, documentURI, TextDocumentSyncType.DID_CHANGE.toString());

    dependencyService.invoke(
        requiredCopybookEvent, NESTED_CPY_NAME, Collections.singletonList(workspaceFolder));
    assertDepFileIsCreated();
  }

  private void assertDepFileIsCreated() {
    assertTrue(
        Files.exists(
            Paths.get(
                depenencyFileFolderPath + filesystemSeparator() + "CPYNEST" + DEP_EXTENSION)));
  }
}
