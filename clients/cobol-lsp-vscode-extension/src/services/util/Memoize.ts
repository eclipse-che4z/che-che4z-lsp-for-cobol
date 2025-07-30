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

export class Memoize<TArgs extends unknown[], TReturn> {
  private cache = new Map<string, Promise<TReturn | undefined>>();

  constructor(
    private fn: (...args: TArgs) => Promise<TReturn | undefined>,
    private handleError?: (error: unknown) => unknown,
    private generateKey: (...args: TArgs) => string = (...args) =>
      JSON.stringify(args),
  ) {}

  execute = async (...args: TArgs): Promise<TReturn | undefined> => {
    const key = this.generateKey(...args);

    if (this.cache.has(key)) {
      return this.cache.get(key)!;
    }

    const promise = this.fn(...args);
    this.cache.set(key, promise);

    try {
      const result = await promise;
      return result;
    } catch (error) {
      this.cache.set(key, Promise.resolve(undefined));
      if (this.handleError) {
        this.handleError(error);
      }
      return;
    }
  };

  invalidateCache = (...args: TArgs): void => {
    const key = this.generateKey(...args);
    this.cache.delete(key);
  };

  clearCache = () => {
    this.cache.clear();
  };
}
