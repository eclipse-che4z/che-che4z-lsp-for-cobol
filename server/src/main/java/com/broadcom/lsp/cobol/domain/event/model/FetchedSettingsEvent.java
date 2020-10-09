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

package com.broadcom.lsp.cobol.domain.event.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/** This class is a data transfer object for retrieved configuration settings. */
@Data
@NoArgsConstructor
public class FetchedSettingsEvent extends DataEvent {
  private List<Object> content;

  @Builder
  public FetchedSettingsEvent(List<Object> content) {
    super(DataEventType.FETCHED_SETTINGS_EVENT, DataEventType.FETCHED_SETTINGS_EVENT.getId());
    this.content = content;
  }
}
