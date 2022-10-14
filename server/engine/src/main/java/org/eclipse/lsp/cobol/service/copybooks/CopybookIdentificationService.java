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

import org.eclipse.lsp4j.TextDocumentItem;

/** Identifies a copybook */
public interface CopybookIdentificationService {

  /**
   * Identifies a copybook
   *
   * @param copybookIdentifier Identifier for a copybook. It can be a copybook URI or text content.
   * @return True if it's a copybook. False otherwise
   */
  boolean isCopybook(TextDocumentItem copybookIdentifier) throws UndeterminedDocumentException;

  /** Runtime exception in case a doc is not recognisable if it's a copybook or a cobol program. */
  class UndeterminedDocumentException extends RuntimeException {}
}
