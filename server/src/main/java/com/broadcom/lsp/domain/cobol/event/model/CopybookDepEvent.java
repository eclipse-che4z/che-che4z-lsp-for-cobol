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
 */

package com.broadcom.lsp.domain.cobol.event.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CopybookDepEvent extends DataEvent {
  private String copybookName;
  private String textDocumentSync;
  private String documentUri;

  @Builder
  public CopybookDepEvent(String copybookName, String textDocumentSync, String documentUri) {
    super(DataEventType.COPYBOOK_DEP_EVENT, DataEventType.COPYBOOK_DEP_EVENT.getId());
    this.copybookName = copybookName;
    this.textDocumentSync = textDocumentSync;
    this.documentUri = documentUri;
  }
}
