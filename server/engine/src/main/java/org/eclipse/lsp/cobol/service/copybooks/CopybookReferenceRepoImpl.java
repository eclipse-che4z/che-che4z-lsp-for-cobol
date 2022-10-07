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

import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.CopybookName;

import java.util.*;

/**
 * Provides API to search for COBOL programs that refers a copybooks file.
 *
 * <p>Implementation of @{@link CopybookReferenceRepo}.
 */
@Singleton
public class CopybookReferenceRepoImpl implements CopybookReferenceRepo {

  private final Map<String, Set<CopybookModel>> copybookRef;

  public CopybookReferenceRepoImpl() {
    this.copybookRef = new HashMap<>();
  }

  /**
   * Gives all the usage references of a copybook URI.
   *
   * @param copybookUri is a URI of a copybook
   * @return a set of all reference of passed copybook URI {@link CopybookModel}
   */
  @Override
  public Set<CopybookModel> getCopybookUsageReference(String copybookUri) {
    return copybookRef.getOrDefault(copybookUri, Collections.emptySet());
  }

  /** Clears all copybook references. */
  @Override
  public void clearReferences() {
    this.copybookRef.clear();
  }

  /**
   * Stores the references of cobol programs which refers a copybook.
   *
   * @param copybookName CopybookName for which references are to be maintained.
   * @param documentUri Cobol program that refers the copybook
   * @param copybookModel @copybookModel for the copybook.
   */
  @Override
  public void storeCopybookUsageReference(
      CopybookName copybookName, String documentUri, CopybookModel copybookModel) {
    Set<CopybookModel> copybookUsageRef =
        copybookRef.computeIfAbsent(copybookModel.getUri(), k -> new HashSet<>());
    CopybookModel copybookResolveContext =
        new CopybookModel(copybookName, documentUri, copybookModel.getContent());
    copybookUsageRef.add(copybookResolveContext);
    copybookRef.put(copybookModel.getUri(), copybookUsageRef);
  }
}
