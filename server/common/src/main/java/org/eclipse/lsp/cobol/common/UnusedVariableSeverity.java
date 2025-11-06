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

public final class UnusedVariableSeverity {
  public ErrorSeverity severity = null;

  @Override
  public boolean equals(Object obj) {
    return obj instanceof UnusedVariableSeverity
        && Objects.equals(this.severity, ((UnusedVariableSeverity) obj).severity);
  }

  @Override
  public int hashCode() {
    return severity == null ? 0 : severity.hashCode();
  }
}
