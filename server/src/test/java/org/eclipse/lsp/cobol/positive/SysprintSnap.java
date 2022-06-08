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
package org.eclipse.lsp.cobol.positive;

import lombok.Getter;
import lombok.Setter;
import org.eclipse.lsp4j.Range;
import java.util.List;

/**
 * Objects representing a cross-reference in a SYSPRINT file.
 *
 * <p>For e.g.:
 *
 * <p>Defined Cross-reference of data names References
 *
 * <p>42 ALPHA-LIT-UPPER-LOWER. . . . . 328 336 337 41
 *
 * <p>ALPHABETIC-LIT-LOWER . . . . . 308 317 40
 *
 * <p>ALPHABETIC-LIT-UPPER . . . . . 308 316 105
 *
 * <p>ANSI-REFERENCE . . . . . . . . 282 289 298 M306 M326
 */
@Getter
public class SysprintSnap {
  private final String dataName;
  private final int definedLineNo;
  private final List<Integer> references;
  @Setter private Range definitionLocation;
  @Setter private List<Range> referencesLocation;

  public SysprintSnap(String dataName, int definedLineNo, List<Integer> references) {
    this.dataName = dataName;
    this.definedLineNo = definedLineNo;
    this.references = references;
  }
}
