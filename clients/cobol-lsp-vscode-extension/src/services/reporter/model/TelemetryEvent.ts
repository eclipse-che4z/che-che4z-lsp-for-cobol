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
    private readonly _timestamp;
    private _eventName: string;
    private _categories?: string[];
    private _notes?: string;
    private _rootCause?: string;
    private _measurements?: Map<string, number>;

    public constructor() {
        this._timestamp = new Date().toISOString();
    }

    get timestamp() {
        return this._timestamp;
    }

    get eventName(): string {
        return this._eventName;
    }

    set eventName(eventName: string) {
        this._eventName = eventName;
    }

    get categories(): string[] {
        return this._categories;
    }

    set categories(value: string[]) {
        this._categories = value;
    }

    get notes(): string {
        return this._notes;
    }

    set notes(notes: string) {
        this._notes = notes;
    }

    get rootCause(): string {
        return this._rootCause;
    }

    set rootCause(value: string) {
        this._rootCause = value;
    }

    get measurements(): Map<string, number> {
        return this._measurements;
    }

    set measurements(value: Map<string, number>) {
        this._measurements = value;
    }
}
