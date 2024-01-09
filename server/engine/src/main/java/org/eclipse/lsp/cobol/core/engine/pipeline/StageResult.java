/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.pipeline;

import lombok.AllArgsConstructor;
import lombok.Value;

/**
 * Processing Pipeline Stage Result
 */
@Value
@AllArgsConstructor
public class StageResult<T> {
  T data;
  boolean stopProcessing;

  public StageResult(T data) {
    this.data = data;
    stopProcessing = false;
  }
  /**
   * Creates an empty stage processing result
   * @return an empty stage processing result
   */
  public static StageResult<?> empty() {
    return new StageResult<Void>(null);
  }

  /**
   * Indicates if pipeline needs to be stopped after current processing stage
   * @return true if processing needs to be stopped and false otherwise
   */
  public boolean stopProcessing() {
    return stopProcessing;
  }
}
