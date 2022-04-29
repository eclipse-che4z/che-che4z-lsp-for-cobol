/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.core.model.variables;

import lombok.Getter;

/** Enum for the different Division types */
public enum DivisionType {
  PROCEDURE_DIVISION("PROCEDURE DIVISION"),
  IDENTIFICATION_DIVISION("IDENTIFICATION DIVISION"),
  ENVIRONMENT_DIVISION("ENVIRONMENT DIVISION"),
  DATA_DIVISION("DATA DIVISION");
  @Getter private final String divName;

  DivisionType(String label) {
    this.divName = label;
  }
}
