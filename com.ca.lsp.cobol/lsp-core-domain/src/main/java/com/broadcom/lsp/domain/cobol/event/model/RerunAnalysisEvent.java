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

package com.broadcom.lsp.domain.cobol.event.model;

import static com.broadcom.lsp.domain.cobol.event.model.DataEventType.RERUN_ANALYSIS_EVENT;

/**
 * This class is a signal object to show that it is needed to run the syntax and semantic again for
 * all the registered documents.
 */
public class RerunAnalysisEvent extends DataEvent {
  public RerunAnalysisEvent() {
    super(RERUN_ANALYSIS_EVENT, RERUN_ANALYSIS_EVENT.getId());
  }
}
