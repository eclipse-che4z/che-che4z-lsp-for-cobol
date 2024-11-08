/*
 * Copyright (c) 2024 Broadcom.
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

import { isRight, Left } from "fp-ts/Either";
import * as t from "io-ts";
import { PathReporter } from "io-ts/lib/PathReporter";

export class DecodingError extends Error {
  constructor(decodingErrors: Left<t.Errors>) {
    const message = PathReporter.report(decodingErrors).join("\n");
    super(message);
  }
}

export function decodeUnknown<T, A, I>(type: t.Type<T, A, I>, input: I): T {
  const decoded = type.decode(input);
  if (isRight(decoded)) {
    return decoded.right;
  }
  throw new DecodingError(decoded);
}
