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
import {ExtensionUtils} from "../settings/util/ExtensionUtils";
import {TelemetryEvent} from "./model/TelemetryEvent";
import {TelemetryFactory} from "./TelemetryFactory";

function isValidEventName(eventName: string): boolean {
    return eventName !== undefined && eventName.trim() !== "";
}

function isValidRootCause(rootCause: string): boolean {
    return rootCause !== undefined && rootCause.trim() !== "";
}

function createTelemetryEvent(eventName: string, categories: string[], notes: string, rootCause?: string, telemetryMeasurement?: Map<string, number>) {
    const telemetryEvent = new TelemetryEvent();
    telemetryEvent.setEventName(eventName);
    telemetryEvent.setCategories(resolveCategories(categories));
    telemetryEvent.setNotes(notes);
    telemetryEvent.setRootCause(rootCause);

    if (telemetryMeasurement) {
        telemetryEvent.setMeasurements(telemetryMeasurement);
    }
    return telemetryEvent;
}

function resolveCategories(categories: string[]): string {
    return (categories) ? categories.toString() : "N.D";
}

export class TelemetryService {
    public static calculateTimeElapsed(startTime: number, endTime: number): number | undefined {
        return ((startTime && endTime) && (endTime >= startTime)) ? ((endTime - startTime) / 1000) : undefined;
    }

    public static registerEvent(eventName: string, categories?: string[], notes?: string, telemetryMeasurementMap?: Map<string, number>) {
        // exit if event name is empty
        if (!isValidEventName(eventName)) {
            return;
        }
        TelemetryFactory.getReporter().reportEvent(createTelemetryEvent(eventName, categories, notes, undefined, telemetryMeasurementMap));

    }

    public static registerExceptionEvent(eventName = "RuntimeException", rootCause: string, categories?: string[], notes?: string, telemetryMeasurement?: Map<string, number>) {
        // exit if event name is empty
        if (!(isValidEventName(eventName) && isValidRootCause(rootCause))) {
            return;
        }

        TelemetryFactory.getReporter().reportExceptionEvent(createTelemetryEvent(eventName, categories, notes, ExtensionUtils.anonymizeContent(rootCause), telemetryMeasurement));
    }

}
