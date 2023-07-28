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

import java.io.File;
import java.util.*;

/**
 * Provides API to search for COBOL programs that refers a copybooks file.
 *
 * <p>Implementation of @{@link CopybookReferenceRepo}.
 */
@Singleton
public class CopybookReferenceRepoImpl implements CopybookReferenceRepo {

  private final Map<String, Set<String>> copybookRef;

  public CopybookReferenceRepoImpl() {
    this.copybookRef = new HashMap<>();
  }

  /**
   * Gives all the usage references of a copybook URI.
   *
   * @param copybookUri is a URI of a copybook
   * @return a set of all reference of passed copybook URI
   */
  @Override
  public Set<String> getCopybookUsageReference(String copybookUri) {
    Set<String> result = new HashSet<>();
    getReferences(copybookUri, result);
    return result;
  }

  /** Clears all copybook references. */
  @Override
  public void clearReferences() {
    this.copybookRef.clear();
  }

  /**
   * Stores the references of cobol programs which refers a copybook.
   *
   * @param documentUri Cobol document (program or copybook) that refers the copybook
   * @param copybookUri copybook uri
   */
  @Override
  public void storeCopybookUsageReference(String documentUri, String copybookUri) {
    Set<String> copybookUsageRef =
        copybookRef.computeIfAbsent(copybookUri, k -> new HashSet<>());
    copybookUsageRef.add(documentUri);
    copybookRef.put(copybookUri, copybookUsageRef);
  }

  private void getReferences(String copybookUri, Set<String> result) {
    copybookRef.entrySet().stream()
        .filter(entry -> Objects.nonNull(entry.getKey()))
        .filter(entry -> new File(entry.getKey()).equals(new File(copybookUri)))
        .map(Map.Entry::getValue)
        .flatMap(Collection::stream)
        .filter(d -> !result.contains(d))
        .forEach(d -> {
          result.add(d);
          getReferences(d, result);
        });
  }
}
