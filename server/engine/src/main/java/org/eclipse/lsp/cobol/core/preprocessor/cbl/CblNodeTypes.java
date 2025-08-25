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
  LINECOUNT,
  SPACE,
  APOST,
  QUOTE,
  CBLCARD,
  NOCBLCARD,
  CICS,
  COBOL2,
  COBOL3,
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
  FLAG,
  NOFEPI,
  LENGTH,
  NOLENGTH,
  LINKAGE,
  NOLINKAGE,
  NATLANG,
  NUM,
  NONUM,
  OPTIONS,
  NOOPTIONS,
  SEQ,
  NOSEQ,
  SP,
  SPIE,
  NOSPIE,
  SYSEIB,
  VBREF,
  NOVBREF,

  UNKNOWN
}
