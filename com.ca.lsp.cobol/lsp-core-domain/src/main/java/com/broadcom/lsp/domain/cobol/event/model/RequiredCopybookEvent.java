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

/**
 * This class is a data transfer object that contains the required information to retrieve a
 * copybook.
 */
@NoArgsConstructor
@Data
public class RequiredCopybookEvent extends DataEvent {
  private String name;
  private String documentUri;
  private String copybookScanAnalysis;

  @Builder
  public RequiredCopybookEvent(String name, String documentUri, String copybookScanAnalysis) {
    super(DataEventType.REQUIRED_COPYBOOK_EVENT, DataEventType.REQUIRED_COPYBOOK_EVENT.getId());
    this.name = name;
    this.documentUri = documentUri;
    this.copybookScanAnalysis = copybookScanAnalysis;
  }
}
