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

import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.CopybookName;

import java.util.Set;

/** Provide API definition to search for COBOL programs that refers a copybooks file. */
public interface CopybookReferenceRepo {
  /**
   * Gives all the usage references of a copybook URI.
   *
   * @param copybookUri is a URI of a copybook
   * @return a set of all reference of passed copybook URI {@link CopybookModel}
   */
  Set<CopybookModel> getCopybookUsageReference(String copybookUri);

  /** Clears all copybook references. */
  void clearReferences();

  /**
   * Stores the references of cobol programs which refers a copybook.
   *
   * @param copybookName CopybookName for which references are to be maintained.
   * @param documentUri Cobol program that refers the copybook
   * @param copybookModel @copybookModel for the copybook.
   */
  void storeCopybookUsageReference(
      CopybookName copybookName, String documentUri, CopybookModel copybookModel);
}
