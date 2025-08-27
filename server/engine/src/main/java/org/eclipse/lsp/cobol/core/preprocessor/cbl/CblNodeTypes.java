/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.cbl;

/** CBL Node Types */
public enum CblNodeTypes {
  XOPTS,
  CICS_CONTAINER,
  ROOT,
  CBL,
  TOKEN,

  // CICS nodes
  APOST,
  QUOTE,
  CBLCARD,
  NOCBLCARD,
  CICS,
  COBOL2,
  CO2,
  COBOL3,
  CO3,
  CPSM,
  NOCPSM,
  DBCS,
  DEBUG,
  NODEBUG,
  DLI,
  EDF,
  NOEDF,
  EXCI,
  FEPI,
  NOFEPI,
  LENGTH,
  NOLENGTH,
  LIN,
  LINKAGE,
  NOLINKAGE,
  NATLANG,
  NUM,
  NONUM,
  OP,
  OPTIONS,
  NOP,
  NOOPTIONS,
  SEQ,
  NOSEQ,
  SP,
  SPIE,
  NOSPIE,
  SYSEIB,
  VBREF,
  NOVBREF,
  Q,
  LINECOUNT,
  SPACE,
  FLAG,

  UNKNOWN
}
