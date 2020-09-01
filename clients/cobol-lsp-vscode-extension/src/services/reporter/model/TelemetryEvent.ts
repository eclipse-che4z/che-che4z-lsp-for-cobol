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

export class TelemetryEvent {
    private readonly timestamp: string;
    private eventName: string;
    private notes?: string;
    private rootCause?: string;
    private categories?: string[];
    private timeElapsed?: string;

    public constructor() {
        this.timestamp = new Date().toISOString();
    }

    public setEventName(reportType: string) {
        this.eventName = reportType;
    }

    public getEventName(): string {
        return this.eventName;
    }

    public setNotes(notes: string) {
        this.notes = notes;
    }

    public setCategories(...categories: string[]) {
        this.categories = categories;
    }

    public setRootCause(rootCause: string) {
        this.rootCause = rootCause;
    }

    public getTimestamp(): string {
        return this.timestamp;
    }

    public getNotes(): string {
        return this.notes;
    }

    public getRootCause(): string {
        return this.rootCause;
    }

    public getCategories(): string[] {
        return this.categories;
    }

    public getTimeElapsed(): string {
        return this.timeElapsed;
    }

    public setTimeElapsed(timeElapsed: string): void {
        this.timeElapsed = timeElapsed;
    }
}
