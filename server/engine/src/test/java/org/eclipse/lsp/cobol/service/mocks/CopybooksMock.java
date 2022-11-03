/*
 * Copyright (c) 2020 Broadcom.
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

package org.eclipse.lsp.cobol.service.mocks;

import org.eclipse.lsp.cobol.positive.CobolText;

import java.util.List;

public interface CopybooksMock {

  /** @return all the Cobol files for copybooks */
  List<CobolText> getCopybooks();


  /**
   *
   * @param filename
   * @return all the Cobol files for copybooks associated with a file
   */
  List<CobolText> getCopybooks(String filename);
}
