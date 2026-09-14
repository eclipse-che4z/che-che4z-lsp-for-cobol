/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */
import * as vscode from "vscode";
import { CopyIdmsStatementContext as CopyIdmsStatementContextInCopybook } from "../generated/IdmsCopyParser";
import { CopyIdmsStatementContext as CopyIdmsStatementContextInProgram } from "../generated/IdmsParser";
import { constructRange, extractLevelRange } from "./util";

export const BLANK_STATEMENT = "CONTINUE";
export const BLANK_VALUE = "ZERO";
export const SPACE_VALUE = " ";

export interface ParseError {
  line: number;
  column: number;
  message: string;
  range: vscode.Range;
}

/**
 * Describes the position of a syntax element in the workspace: the file URI
 * and the range inside it.
 */
export interface Locality {
  uri: string;
  range: vscode.Range;
}

/** Description of an IDMS copybook referenced by a COPY IDMS statement */
export interface IdmsCopybookDescriptor {
  name: string | undefined;
  usage: Locality;
  statement: Locality;
  levelRange: vscode.Range | undefined;
  level: number;
  insert: boolean;
}

type CopyIdmsStatementCtx =
  | CopyIdmsStatementContextInCopybook
  | CopyIdmsStatementContextInProgram;

/**
 * Factory method for a copybook description object. Accepts a COPY IDMS
 * statement context produced by either the standalone copybook grammar or
 * the main program grammar, since both define the same statement shape.
 *
 * @param ctx IDMS copybook rule context
 * @param programDocumentUri uri of file
 * @return copybook descriptor
 */
export function createIdmsCopybookDescriptor(
  ctx: CopyIdmsStatementCtx,
  programDocumentUri: string,
): IdmsCopybookDescriptor {
  const usageRange = constructRange(ctx.copyIdmsOptions().copyIdmsSource());

  let levelRange: vscode.Range | undefined;
  let level = 0;
  const levelNumber = ctx.LEVEL_NUMBER();
  if (levelNumber) {
    levelRange = extractLevelRange(levelNumber.symbol);
    level = Number.parseInt(levelNumber.getText(), 10);
  }

  return {
    name: getCopySourceName(ctx),
    usage: { uri: programDocumentUri, range: usageRange },
    statement: { uri: programDocumentUri, range: constructRange(ctx) },
    levelRange,
    level,
    insert: false,
  };
}

function getCopySourceName(ctx: CopyIdmsStatementCtx): string | undefined {
  const copySourceContext = ctx
    .copyIdmsOptions()
    .copyIdmsSource()
    ?.copySource();
  if (!copySourceContext) {
    return undefined;
  }

  const literal = copySourceContext.literal();
  if (literal) {
    return literal.getText();
  }

  const cobolWord = copySourceContext.cobolWord();
  if (cobolWord) {
    return cobolWord.getText();
  }

  const subschemaNames = copySourceContext.SUBSCHEMA_NAMES();
  if (subschemaNames) {
    return subschemaNames.getText();
  }

  return undefined;
}
