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

jest.mock("../services/util/Memoize");
export const memoizeInstances: { clearCache: () => unknown }[] = [];

afterEach(() => {
  memoizeInstances.forEach((i) => i.clearCache());
  // eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
  const external = jest.requireActual("../services/ExternalAPIsService");
  // eslint-disable-next-line @typescript-eslint/no-unsafe-member-access
  external.externalApis = undefined;
});
