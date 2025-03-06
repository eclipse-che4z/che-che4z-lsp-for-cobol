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
import { PositionDto, RangeDto } from "./model/external";

export function createRange(items: CFASTNode[]): RangeDto {
  var startLine = (items[0].location?.start?.line ?? 1) - 1;
  var startChar = (items[0].location?.start?.character ?? 1) - 1;

  var endLine = (items[items.length - 1].location?.end?.line ?? 1) - 1;
  var endChar = (items[items.length - 1].location?.end?.character ?? 1) - 1;
  return new RangeDto(
    new PositionDto(startLine, startChar),
    new PositionDto(endLine, endChar),
  );
}
