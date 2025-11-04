/*
 * Copyright (c) 2025 Broadcom.
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

package org.eclipse.lsp.cobol.common;

import java.util.Objects;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;

public class UnusedVariableSeverity {
  public ErrorSeverity unusedSeverity = null;

  @Override
  public boolean equals(Object obj) {
    return obj instanceof UnusedVariableSeverity
        && Objects.equals(this.unusedSeverity, ((UnusedVariableSeverity) obj).unusedSeverity);
  }

  @Override
  public int hashCode() {
    return unusedSeverity == null ? 0 : unusedSeverity.hashCode();
  }
}
