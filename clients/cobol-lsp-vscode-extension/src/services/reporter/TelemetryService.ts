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

export class TelemetryService {

    /**
     * This method collect the data event for telemetring purpose, apply basic validation and delegate the reporter service to sent them to the target telemetry server
     * @param eventName name assigned for the event for the telemetry
     * @param categories optional list of keywords (act as tags)
     * @param notes optional brief description
     * @param telemetryMeasurement optional set of numeric data with a key name
     */
    public static registerEvent(eventName: string, categories?: string[], notes?: string, telemetryMeasurement?: Map<string, number>) {
        // exit if event name is empty
        if (!this.isValidEventName(eventName)) {
            return;
        }
        TelemetryFactory.getReporter().reportEvent(this.createTelemetryEvent(eventName, categories, notes, undefined, telemetryMeasurement));

    }

    /**
     * This method collect the exception data event for telemetring purpose, apply basic validation and delegate the reporter service to sent them to the target telemetry server
     * @param eventName name assigned for the event for the telemetry
     * @param rootCause the stacktrace attached for debugging purpose. User folder is anonymized
     * @param categories optional list of keywords (act as tags)
     * @param notes optional brief description
     * @param telemetryMeasurement optional set of numeric data with a key name
     */
    public static registerExceptionEvent(eventName = "RuntimeException", rootCause: string, categories?: string[], notes?: string, telemetryMeasurement?: Map<string, number>) {
        if (!(this.isValidEventName(eventName) && this.isValidRootCause(rootCause))) {
            return;
        }

        TelemetryFactory.getReporter().reportExceptionEvent(this.createTelemetryEvent(eventName, categories, notes, ExtensionUtils.anonymizeContent(rootCause), telemetryMeasurement));
    }

    private static isValidEventName(eventName: string): boolean {
        return eventName !== undefined && eventName.trim() !== "";
    }

    private static createTelemetryEvent(eventName: string, categories: string[], notes: string, rootCause?: string, telemetryMeasurement?: Map<string, number>) {
        const telemetryEvent = new TelemetryEvent();
        telemetryEvent.setEventName(eventName);
        telemetryEvent.setCategories(this.resolveCategories(categories));
        telemetryEvent.setNotes(notes);
        telemetryEvent.setRootCause(rootCause);
        telemetryEvent.setMeasurements(telemetryMeasurement);

        return telemetryEvent;
    }

    private static isValidRootCause(rootCause: string): boolean {
        return rootCause !== undefined && rootCause.trim() !== "";
    }

    private static resolveCategories(categories: string[]): string {
        return (categories) ? categories.toString() : "N.D";
    }

}
