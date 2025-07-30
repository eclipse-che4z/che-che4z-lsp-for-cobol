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

import { memoizeInstances } from "../../../__tests__/jest.setup";
import type { Memoize as MemoizeType } from "../Memoize";

// eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
const original = jest.requireActual("../Memoize");

// eslint-disable-next-line @typescript-eslint/no-unsafe-member-access
const OriginalMemoize = original.Memoize as typeof MemoizeType;

export class Memoize extends OriginalMemoize<unknown[], unknown> {
  constructor(
    fn: (...args: unknown[]) => Promise<unknown>,
    handleError?: (error: unknown) => unknown,
    generateKey: (...args: unknown[]) => string = (...args) =>
      JSON.stringify(args),
  ) {
    super(fn, handleError, generateKey);
    memoizeInstances.push(this);
  }
}
