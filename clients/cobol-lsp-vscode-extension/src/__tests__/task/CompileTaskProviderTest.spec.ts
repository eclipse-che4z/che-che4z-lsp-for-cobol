/*
 * Copyright (c) 2022 Broadcom.
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

import {CompileTaskProvider} from "../../task/CompileTaskProvider";

describe("CompileTaskProvider", () => {
    it("provides task is triggred", async () => {
        const task = new CompileTaskProvider();
        const mockCompileTask = jest.fn();
        (task as any).getCompileTask = mockCompileTask;
        await task.provideTasks({isCancellationRequested: false, onCancellationRequested: jest.fn()});
        expect(mockCompileTask).toBeCalledTimes(1);
    });

    it("resolve task is not triggred when jobcard and stepLib are not provided", () => {
        const task = new CompileTaskProvider();
        (task as any).getCompileTask = jest.fn();
        const taskToResolve = {
            definition: { type: "testTask" },
            isBackground: false,
            name: "testTaslResolve",
            presentationOptions: {},
            problemMatchers: [],
            runOptions: {},
            source: "",
        };
        const resolvedTask = task.resolveTask(taskToResolve,
            { isCancellationRequested: false, onCancellationRequested: jest.fn() });
        expect(resolvedTask).toBe(undefined);
    });

    it("resolve task is triggred when jobcard and stepLib are provided", () => {
        const task = new CompileTaskProvider();
        (task as any).getCompileTask = jest.fn();
        const taskToResolve = {
            definition: { type: "testTask", jobCard: "jobCard", steplib: "steplib" },
            isBackground: false,
            name: "testTaslResolve",
            presentationOptions: {},
            problemMatchers: [],
            runOptions: {},
            source: "",
        };
        const resolvedTask = task.resolveTask(taskToResolve,
            { isCancellationRequested: false, onCancellationRequested: jest.fn() });
        expect(resolvedTask).not.toBeUndefined();
    });
});
