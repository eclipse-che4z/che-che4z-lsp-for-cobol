/*
 * Copyright (c) 2020 Broadcom.
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
import { DownloadQueue } from "../services/DownloadQueue";

describe("Check download queue", () => {
    const element = "Test";
    const profile = "profile";
    const elementExtra = "Test";
    it("can add elements to queue", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        queue.push(element, profile);
        const e = await queue.pop();
        expect(e).toEqual({ copybook: element, profile });
        expect(0).toEqual(queue.length);
    });
    it("can wait", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        const result = queue.pop().then(e => {
            expect(e).toEqual({ copybook: element, profile });
        });
        queue.push(element, profile);
        await result;
        expect(0).toEqual(queue.length);
    });
    it("can have more then one element", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        queue.push(element, profile);
        queue.push(elementExtra, profile);
        expect(await queue.pop()).toEqual({ copybook: element, profile });
        expect(1).toEqual(queue.length);
        expect(await queue.pop()).toEqual({ copybook: elementExtra, profile });
        expect(0).toEqual(queue.length);
    });
    it("can stop", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        queue.stop();
        expect(0).toEqual(queue.length);
    });
    it("can stop async", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        const result = queue.pop().then(e => {
            expect(e).toEqual(undefined);
        });
        queue.stop();
        await result;
        expect(0).toEqual(queue.length);
    });
});
