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
package org.eclipse.lsp.cobol.common.model;

/** Enumeration of Node types. */
public enum NodeType {
  AT_END,
  CODE_BLOCK_PARENT,
  CODE_BLOCK_USAGE,
  COMPILER_DIRECTIVE,
  COPY,
  CUSTOM,
  DELETE_STATEMENT,
  DIVISION,
  EMBEDDED_CODE,
  EVALUATE,
  EVALUATE_WHEN,
  EVALUATE_WHEN_OTHER,
  EXIT,
  EXIT_SECTION,
  FILE_CONTROL_ENTRY,
  FILE_USAGE,
  GO_BACK,
  GO_TO,
  IF,
  IF_ELSE,
  JSON_GENERATE,
  JSON_PARSE,
  LITERAL,
  OBSOLETE,
  OPEN_STATEMENT,
  PARAGRAPH,
  PARAGRAPH_NAME_NODE,
  PERFORM,
  PROCEDURE_DIVISION,
  PROCEDURE_SECTION,
  PROGRAM,
  PROGRAM_END,
  PROGRAM_ID,
  QUALIFIED_REFERENCE_NODE,
  READ_STATEMENT,
  REWRITE_STATEMENT,
  ROOT,
  SECTION,
  SECTION_NAME_NODE,
  SENTENCE,
  START_STATEMENT,
  STATEMENT,
  STOP,
  SUBROUTINE,
  SUBROUTINE_NAME_NODE,
  VARIABLE,
  VARIABLE_DEFINITION,
  VARIABLE_DEFINITION_NAME,
  VARIABLE_USAGE,
  WRITE_STATEMENT,
  XML_PARSE
}
