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
import {TelemetryEvent} from "./model/TelemetryEvent";
import {TelemetryFactory} from "./TelemetryFactory";

function isValidEventName(eventName: string): boolean {
    return eventName !== undefined && eventName.trim() !== "";
}

function isValidRootCause(rootCause: string): boolean {
    return rootCause !== undefined && rootCause.trim() !== "";
}

function createTelemetryEvent(eventName: string, categories: string[], notes: string, timeElapsed?: string, rootCause?: string) {
    const telemetryEvent = new TelemetryEvent();
    telemetryEvent.setEventName(eventName);
    telemetryEvent.setCategories(resolveCategories(categories));
    telemetryEvent.setNotes(notes);
    telemetryEvent.setRootCause(rootCause);
    telemetryEvent.setTimeElapsed(timeElapsed);
    return telemetryEvent;
}

function resolveCategories(categories: string[]): string {
    return (categories) ? categories.toString() : "N.D";
}

function calculateTimeElapsed(startTime: number, endTime: number): string {
    return (startTime && endTime) ? ((endTime - startTime) / 1000).toString() : "N.D";
}

export class TelemetryService {
    public static registerEvent(eventName: string, categories?: string[], notes?: string, startTime?: number, endTime?: number) {
        // exit if event name is empty
        if (!isValidEventName(eventName)) {
            return;
        }

        TelemetryFactory.getReporter().reportEvent(createTelemetryEvent(eventName, categories, notes, calculateTimeElapsed(startTime, endTime)));
    }

    public static registerExceptionEvent(eventName = "RuntimeException", rootCause: string, categories?: string[], notes?: string, startTime?: number, endTime?: number) {
        // exit if event name is empty
        if (!(isValidEventName(eventName) && isValidRootCause(rootCause))) {
            return;
        }
        TelemetryFactory.getReporter().reportExceptionEvent(createTelemetryEvent(eventName, categories, notes, calculateTimeElapsed(startTime, endTime), rootCause));
    }

}
