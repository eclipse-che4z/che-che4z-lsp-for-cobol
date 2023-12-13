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
import { userInfo } from "node:os";
import { sep } from "node:path";
import {
  TelemetryEvent,
  TelemetryEventMeasurements,
} from "./model/TelemetryEvent";
import { TelemetryFactory } from "./TelemetryFactory";
import { Utils } from "../util/Utils";

export class TelemetryService {
  /**
   *  This method calculate the time elapsed between two number representation of dates expressed as
   *  number of milliseconds elapsed since January 1, 1970 00:00:00 UTC.
   * @param startTime numeric representation of a starting time
   * @param endTime numeric representation of a ending time
   */
  public static calculateTimeElapsed(
    startTime: number,
    endTime: number,
  ): number {
    return startTime && endTime && endTime >= startTime
      ? (endTime - startTime) / 1000
      : 0;
  }

  /**
   * This method collect the data event for telemetry purpose, apply basic validation
   * and delegate the reporter service to sent them to the target telemetry server
   * @param eventName name assigned for the event for the telemetry
   * @param categories optional list of keywords (act as tags)
   * @param notes optional brief description
   * @param telemetryMeasurement optional set of numeric data with a key name
   */
  public static registerEvent(
    eventName: string,
    categories?: string[],
    notes?: string,
    telemetryMeasurement?: TelemetryEventMeasurements,
  ): void {
    if (this.isValidEventName(eventName)) {
      TelemetryFactory.getReporter().reportEvent(
        this.createTelemetryEvent(
          eventName,
          categories!,
          notes!,
          undefined,
          telemetryMeasurement,
        ),
      );
    }
  }

  /**
   * This method collect the exception data event for telemetry purpose, apply basic validation
   * and delegate the reporter service to sent them to the target telemetry server
   * @param eventName name assigned for the event for the telemetry
   * @param rootCause the stacktrace attached for debugging purpose.
   * @param categories optional list of keywords (act as tags)
   * @param notes optional brief description
   * @param telemetryMeasurement optional set of numeric data with a key name
   */
  public static registerExceptionEvent(
    eventName = "RuntimeException",
    rootCause: string,
    categories?: string[],
    notes?: string,
    telemetryMeasurement?: TelemetryEventMeasurements,
  ): void {
    if (this.isValidEventName(eventName) && this.isValidRootCause(rootCause)) {
      TelemetryFactory.getReporter().reportExceptionEvent(
        this.createTelemetryEvent(
          eventName,
          categories!,
          notes!,
          this.anonymizeContent(rootCause),
          telemetryMeasurement,
        ),
      );
    }
  }

  private static isValidEventName(eventName: string): boolean {
    return eventName !== undefined && eventName.trim() !== "";
  }

  private static createTelemetryEvent(
    eventName: string,
    categories: string[],
    notes: string,
    rootCause?: string,
    telemetryMeasurement?: TelemetryEventMeasurements,
  ): TelemetryEvent {
    return {
      timestamp: new Date().toISOString(),
      eventName,
      categories: this.resolveCategories(categories),
      notes,
      rootCause,
      measurements: telemetryMeasurement,
    };
  }

  private static resolveCategories(categories: string[]): string[] {
    return categories ? categories : ["N.D"];
  }

  private static isValidRootCause(rootCause: string): boolean {
    return !Utils.isNullOrUndefined(rootCause) && rootCause.trim() !== "";
  }

  /**
   * This method allows to anonymize the username value present in stack trace
   * @param content stack trace
   */
  private static anonymizeContent(content: string): string {
    return content.replace(
      new RegExp("\\" + sep + this.getUsername(), "g"),
      sep + "anonymous",
    );
  }

  private static getUsername(): string {
    return userInfo().username;
  }
}
