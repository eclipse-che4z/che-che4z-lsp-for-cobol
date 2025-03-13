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
 *   Broadcom, Inc. - initial API and implementation
 */
import { CFASTNode } from "./model/cfast";
import { RangeDto } from "./model/external";

export function createRange(items: CFASTNode[]): RangeDto {
  const startLine = (items[0].location?.start?.line ?? 1) - 1;
  const startChar = (items[0].location?.start?.character ?? 1) - 1;

  const endLine = (items[items.length - 1].location?.end?.line ?? 1) - 1;
  const endChar = (items[items.length - 1].location?.end?.character ?? 1) - 1;
  return {
    start: { line: startLine, character: startChar },
    end: { line: endLine, character: endChar },
  };
}
