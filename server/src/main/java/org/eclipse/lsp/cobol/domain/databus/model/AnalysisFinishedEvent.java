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

package org.eclipse.lsp.cobol.domain.databus.model;

import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * This class is a signal object to show that analysis finished. Contains the uri of analyzed
 * document.
 */
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@Data
public class AnalysisFinishedEvent implements DataEvent {
  private String documentUri;
  private List<String> copybookUris;
  private CopybookProcessingMode copybookProcessingMode;

  @Builder
  public AnalysisFinishedEvent(
      String documentUri,
      List<String> copybookUris,
      CopybookProcessingMode copybookProcessingMode) {
    this.documentUri = documentUri;
    this.copybookUris = copybookUris;
    this.copybookProcessingMode = copybookProcessingMode;
  }
}
