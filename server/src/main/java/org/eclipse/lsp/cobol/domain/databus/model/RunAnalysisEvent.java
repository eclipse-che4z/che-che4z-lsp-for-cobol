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

import lombok.Value;

/**
 * This class is a signal object to show that it is needed to run the syntax and semantic again for
 * all the registered documents.
 */
@Value
public class RunAnalysisEvent implements DataEvent {
  private boolean verbose;

  public RunAnalysisEvent() {
    this.verbose = false;
  }

  public RunAnalysisEvent(boolean verbose) {
    this.verbose = verbose;
  }
}
