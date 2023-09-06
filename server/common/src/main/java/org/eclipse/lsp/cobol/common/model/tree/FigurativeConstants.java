/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.common.model.tree;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Enumeration of figurative constant type.
 * Ref - https://www.ibm.com/docs/en/cobol-zos/6.3?topic=literals-figurative-constants
 */
public enum FigurativeConstants {
  ZERO,
  ZEROS,
  ZEROES,
  SPACE,
  SPACES,
  HIGH_VALUE,
  HIGH_VALUES,
  LOW_VALUE,
  LOW_VALUES,
  QUOTE,
  QUOTES,
  NULL,
  NULLS;

  public static final List<String> FIGURATIVE_CONSTANTS =
      Stream.of(FigurativeConstants.values())
          .map(e -> e.toString().replace("_", "-"))
          .collect(Collectors.toList());
}
