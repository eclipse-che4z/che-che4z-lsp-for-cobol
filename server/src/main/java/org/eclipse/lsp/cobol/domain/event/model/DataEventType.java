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
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol.domain.event.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

/** Enumeration of IDs for activities performed on the databus */
@AllArgsConstructor
public enum DataEventType {
  UNKNOWN_EVENT("UNKNOWN"),
  RUN_ANALYSIS_EVENT("RUN_ANALYSIS"),
  ANALYSIS_FINISHED_EVENT("ANALYSIS_FINISHED");
  @Getter private String id;
}
