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
import { URI, Utils } from "vscode-uri";

export const Uri = URI;
Object.assign(Uri, Utils);

export class Location {
  constructor(public uri: URI, public range: Range) {}
}

export class Range {
  constructor(public start: Position, public end: Position) {}
}

export class Position {
  constructor(public line: number, public character: number) {}
}
