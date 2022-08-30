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
package org.eclipse.lsp.cobol.utils;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.positive.CobolText;

/**
 * Class with test fixtures
 */
@UtilityClass
public class Fixtures {

  /**
   * Creates a default SUBSCHEMA-DESCRIPTION IDMS copybook with a body
   * @param body of an IDMS copybook
   * @return a copybook definition for test
   */
  public CobolText subschemaCopy(String body) {
    return new CobolText("SUBSCHEMA-DESCRIPTION", IdmsDialect.NAME, body);
  }

  /**
   * Creates a MAPS IDMS copybook with a body
   * @param body of an IDMS copybook
   * @return a copybook definition for test
   */
  public CobolText mapsCopy(String body) {
    return new CobolText("MAPS", IdmsDialect.NAME, body);
  }
}
