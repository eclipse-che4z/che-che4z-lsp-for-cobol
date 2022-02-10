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
import { DownloadQueue } from "../../../services/copybook/DownloadQueue";
import { SettingsService } from "../../../services/Settings";

describe("Check download queue", () => {
    const element = "Test";
    const profile = "profile";
    const elementExtra = "Test_Extra";
    it("can add elements to queue", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        queue.push(element, SettingsService.DEFAULT_DIALECT, profile, false);
        const e = await queue.pop();
        expect(e).toEqual({ copybook: element, dialectType: SettingsService.DEFAULT_DIALECT, profile, quiet:false });
        expect(0).toEqual(queue.length);
    });
    it("can wait", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        const result = queue.pop().then(e => {
            expect(e).toEqual({ copybook: element, dialectType: SettingsService.DEFAULT_DIALECT, profile, quiet: true });
        });
        queue.push(element, SettingsService.DEFAULT_DIALECT, profile, true);
        await result;
        expect(0).toEqual(queue.length);
    });
    it("can have more then one element", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        queue.push(element, SettingsService.DEFAULT_DIALECT, profile, true);
        queue.push(elementExtra, SettingsService.DEFAULT_DIALECT, profile, false);
        expect(await queue.pop()).toEqual({ copybook: elementExtra, dialectType: SettingsService.DEFAULT_DIALECT, profile, quiet: false});
        expect(1).toEqual(queue.length);
        expect(await queue.pop()).toEqual({ copybook: element, dialectType: SettingsService.DEFAULT_DIALECT, profile, quiet: true });
        expect(0).toEqual(queue.length);
    });
    it("can ignore duplicates", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        queue.push(element, SettingsService.DEFAULT_DIALECT, profile, false);
        queue.push(element, SettingsService.DEFAULT_DIALECT, profile, false);
        expect(1).toEqual(queue.length);
    });
    it("saves both elements with different quiet flag", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        queue.push(element, SettingsService.DEFAULT_DIALECT, profile, false);
        queue.push(element, SettingsService.DEFAULT_DIALECT, profile, true);
        expect(2).toEqual(queue.length);
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
