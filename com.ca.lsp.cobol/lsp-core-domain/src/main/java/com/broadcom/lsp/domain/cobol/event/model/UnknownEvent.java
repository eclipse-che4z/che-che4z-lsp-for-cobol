/*
 * Copyright (c) 2019 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */

package com.broadcom.lsp.domain.cobol.event.model;

import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;

/** This data class is used as a generic data transfer event. */
@Data
@RequiredArgsConstructor
public class UnknownEvent extends DataEvent {
  private String eventMessage;

  @Builder
  public UnknownEvent(String eventMessage) {
    super(DataEventType.UNKNOWN_EVENT, DataEventType.UNKNOWN_EVENT.getId());
    this.eventMessage = eventMessage;
  }
}
