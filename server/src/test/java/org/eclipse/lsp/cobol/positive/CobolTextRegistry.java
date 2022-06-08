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
package org.eclipse.lsp.cobol.positive;

import org.eclipse.lsp.cobol.service.mocks.CopybooksMock;

import java.util.List;
import java.util.Map;

public interface CobolTextRegistry extends CopybooksMock {
  /** @return all the Cobol files for positive tests */
  List<CobolText> getPositives();

  /** @return all the Cobol files for negative tests */
  List<CobolText> getNegatives();

  /**
   * Gives a map of positive filename mapped to a snap object.
   *
   * @param filename filename
   * @return Map of positive filename mapped to a snap objects.
   */
  Map<ReportSection, List<SysprintSnap>> getSnaps(String filename);
}
