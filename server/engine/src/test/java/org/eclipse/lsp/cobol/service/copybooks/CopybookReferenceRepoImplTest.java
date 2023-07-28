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
    Set<String> copybookUsageReference = setUpRepo();
    assertEquals(1, copybookUsageReference.size());
    String referencedCopybookModels = copybookUsageReference.toArray(new String[0])[0];
    assertEquals(DOCUMENT_URI, referencedCopybookModels);
  }

  @Test
  void getCopybookUsageReference_complexDependency() {
    CopybookReferenceRepoImpl repo = new CopybookReferenceRepoImpl();

    repo.storeCopybookUsageReference("program1", "copy1");
    repo.storeCopybookUsageReference("copy1", "copy2");

    Set<String> references = repo.getCopybookUsageReference("copy2");

    assertEquals(2, references.size());
    assertTrue(references.contains("copy1"));
    assertTrue(references.contains("program1"));

    repo.storeCopybookUsageReference("program2", "copy1");

    references = repo.getCopybookUsageReference("copy2");

    assertEquals(3, references.size());
    assertTrue(references.contains("copy1"));
    assertTrue(references.contains("program1"));
    assertTrue(references.contains("program2"));
  }

  @Test
  void getCopybookUsageReference_circularDependency() {
    CopybookReferenceRepoImpl repo = new CopybookReferenceRepoImpl();

    repo.storeCopybookUsageReference("copy2", "copy1");
    repo.storeCopybookUsageReference("copy1", "copy2");

    Set<String> references = repo.getCopybookUsageReference("copy2");

    assertEquals(2, references.size());
    assertTrue(references.contains("copy1"));
    assertTrue(references.contains("copy2"));
  }

  @Test
  @EnabledOnOs({OS.WINDOWS})
  void getCopybookUsageReference_whenUriIsCaseInsensitive() {
    CopybookReferenceRepo repo = storeReferences();
    Set<String> copybookUsageReference = repo.getCopybookUsageReference("file:///C:/workspace/.c4z/.copybooks/PARENT.CPY");
    String referencedCopybookModels = copybookUsageReference.toArray(new String[0])[0];
    assertEquals(1, copybookUsageReference.size());
    assertEquals(DOCUMENT_URI, referencedCopybookModels);
  }

  private Set<String> setUpRepo() {
    CopybookReferenceRepo repo = storeReferences();
    return repo.getCopybookUsageReference(CPY_URI);
  }

  private CopybookReferenceRepo storeReferences() {
    CopybookReferenceRepo repo = new CopybookReferenceRepoImpl();
    repo.storeCopybookUsageReference(DOCUMENT_URI, CPY_URI);
    return repo;
  }
}
