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

export interface TelemetryEventMeasurements {
  readonly [key: string]: number;
}

export interface TelemetryEvent {
  timestamp: string;
  eventName: string;
  categories: string[];
  notes: string;
  rootCause?: string;
  measurements?: TelemetryEventMeasurements;
}
