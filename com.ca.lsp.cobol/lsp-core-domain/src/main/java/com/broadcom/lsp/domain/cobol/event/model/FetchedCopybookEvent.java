/*
 * Copyright (c) 2020 Broadcom.
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
import lombok.NoArgsConstructor;

/** This class is a data transfer object for retrieved copybook. */
@Data
@NoArgsConstructor
public class FetchedCopybookEvent extends DataEvent {
  private String name;
  private String uri;
  private String content;

  @Builder
  public FetchedCopybookEvent(String name, String uri, String content) {
    super(DataEventType.FETCHED_COPYBOOK_EVENT, DataEventType.FETCHED_COPYBOOK_EVENT.getId());
    this.name = name;
    this.uri = uri;
    this.content = content;
  }
}
