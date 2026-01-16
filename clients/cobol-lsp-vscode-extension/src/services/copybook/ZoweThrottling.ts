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
 *   Broadcom, Inc. - initial API and implementation
 */

class AsyncSemaphore {
  private queue: (() => void)[] = [];
  private availableSlots = 0;

  constructor(private readonly slots: number) {
    if (slots > 0) this.availableSlots = slots;
    else throw Error("Positive number of slots required");
  }

  public async locked<T>(action: () => T | PromiseLike<T>): Promise<T> {
    try {
      if (this.availableSlots > 0) --this.availableSlots;
      else
        await new Promise<void>((resolve) => {
          this.queue.push(resolve);
        });

      return await Promise.resolve(action());
    } finally {
      const next = this.queue.shift();
      if (next) next();
      else ++this.availableSlots;
    }
  }
}

export const zoweSemaphore = new AsyncSemaphore(4);
