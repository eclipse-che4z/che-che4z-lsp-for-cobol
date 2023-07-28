/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.service.copybooks;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Set;
import java.util.stream.Collectors;

import org.eclipse.lsp.cobol.common.copybook.CopybookModel;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.EnabledOnOs;
import org.junit.jupiter.api.condition.OS;

/** Test @{@link CopybookReferenceRepo} */
class CopybookReferenceRepoImplTest {

  public static final String DOCUMENT_URI = "file:///c:/workspace/document.cbl";
  private static final String CPY_URI = "file:///c:/workspace/.c4z/.copybooks/PARENT.CPY";
  public static final String COPYBOOK_CONTENT = "sample copybook text";

  @Test
  void clearReferences() {
    CopybookReferenceRepo repo = storeReferences();
    assertEquals(1, setUpRepo().size());
    repo.clearReferences();
    assertEquals(0, repo.getCopybookUsageReference(CPY_URI).size());
  }

  @Test
  void getCopybookUsageReference() {
    Set<CopybookModel> copybookUsageReference = setUpRepo();
    assertEquals(1, copybookUsageReference.size());
    CopybookModel referencedCopybookModels = copybookUsageReference.toArray(new CopybookModel[0])[0];
    assertEquals(COPYBOOK_CONTENT, referencedCopybookModels.getContent());
    assertEquals(DOCUMENT_URI, referencedCopybookModels.getUri());
  }

  @Test
  void getCopybookUsageReference_complexDependency() {
    CopybookReferenceRepoImpl repo = new CopybookReferenceRepoImpl();

    CopybookName copybookName1 = new CopybookName("1");
    CopybookModel copybookModel1 = new CopybookModel(copybookName1.toCopybookId(DOCUMENT_URI), copybookName1, "copy1", "");

    CopybookName copybookName2 = new CopybookName("2");
    CopybookModel copybookModel2 = new CopybookModel(copybookName2.toCopybookId(DOCUMENT_URI), copybookName2, "copy2", "");

    repo.storeCopybookUsageReference(copybookName1, "program1", copybookModel1);
    repo.storeCopybookUsageReference(copybookName1, "copy1", copybookModel2);

    Set<String> references = repo.getCopybookUsageReference("copy2").stream()
        .map(CopybookModel::getUri)
        .collect(Collectors.toSet());

    assertEquals(2, references.size());
    assertTrue(references.contains("copy1"));
    assertTrue(references.contains("program1"));

    repo.storeCopybookUsageReference(copybookName1, "program2", copybookModel1);

    references = repo.getCopybookUsageReference("copy2").stream()
        .map(CopybookModel::getUri)
        .collect(Collectors.toSet());

    assertEquals(3, references.size());
    assertTrue(references.contains("copy1"));
    assertTrue(references.contains("program1"));
    assertTrue(references.contains("program2"));
  }

  @Test
  void getCopybookUsageReference_circularDependency() {
    CopybookReferenceRepoImpl repo = new CopybookReferenceRepoImpl();

    CopybookName copybookName1 = new CopybookName("1");
    CopybookModel copybookModel1 = new CopybookModel(copybookName1.toCopybookId(DOCUMENT_URI), copybookName1, "copy1", "");

    CopybookName copybookName2 = new CopybookName("2");
    CopybookModel copybookModel2 = new CopybookModel(copybookName2.toCopybookId(DOCUMENT_URI), copybookName2, "copy2", "");

    repo.storeCopybookUsageReference(copybookName1, "copy2", copybookModel1);
    repo.storeCopybookUsageReference(copybookName1, "copy1", copybookModel2);

    Set<String> references = repo.getCopybookUsageReference("copy2").stream()
        .map(CopybookModel::getUri)
        .collect(Collectors.toSet());

    assertEquals(2, references.size());
    assertTrue(references.contains("copy1"));
    assertTrue(references.contains("copy2"));
  }

  @Test
  @EnabledOnOs({OS.WINDOWS})
  void getCopybookUsageReference_whenUriIsCaseInsensitive() {
    CopybookReferenceRepo repo = storeReferences();
    Set<CopybookModel> copybookUsageReference = repo.getCopybookUsageReference("file:///C:/workspace/.c4z/.copybooks/PARENT.CPY");
    CopybookModel referencedCopybookModels = copybookUsageReference.toArray(new CopybookModel[0])[0];
    assertEquals(1, copybookUsageReference.size());
    assertEquals(DOCUMENT_URI, referencedCopybookModels.getUri());
    assertEquals(COPYBOOK_CONTENT, referencedCopybookModels.getContent());
  }

  private Set<CopybookModel> setUpRepo() {
    CopybookReferenceRepo repo = storeReferences();
    return repo.getCopybookUsageReference(CPY_URI);
  }

  private CopybookReferenceRepo storeReferences() {
    CopybookReferenceRepo repo = new CopybookReferenceRepoImpl();
    CopybookName copybookName = new CopybookName("COPYBOOK");
    CopybookModel copybookModel = new CopybookModel(copybookName.toCopybookId(DOCUMENT_URI), copybookName, CPY_URI, COPYBOOK_CONTENT);
    repo.storeCopybookUsageReference(copybookName, DOCUMENT_URI, copybookModel);
    return repo;
  }
}
