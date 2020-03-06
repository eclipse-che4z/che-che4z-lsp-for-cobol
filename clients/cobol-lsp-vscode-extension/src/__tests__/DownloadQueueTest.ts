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
import { DownloadQueue } from "../DownloadQueue";

describe("Check download queue", () => {
    const element = "Test";
    const profile = "profile";
    const elementExtra = "Test";
    it("Can add elements to queue", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        queue.push(element, profile);
        const e = await queue.pop();
        expect(e).toEqual({ copybook: element, profile });
        expect(0).toEqual(queue.length);
    });
    it("Can wait", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        const result = queue.pop().then(e => {
            expect(e).toEqual({ copybook: element, profile });
        });
        queue.push(element, profile);
        await result;
        expect(0).toEqual(queue.length);
    });
    it("Can have more then one element", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        queue.push(element, profile);
        queue.push(elementExtra, profile);
        expect(await queue.pop()).toEqual({ copybook: element, profile });
        expect(1).toEqual(queue.length);
        expect(await queue.pop()).toEqual({ copybook: elementExtra, profile });
        expect(0).toEqual(queue.length);
    });
});
