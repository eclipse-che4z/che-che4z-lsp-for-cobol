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

package com.broadcom.lsp.cobol.service.delegates.validations;

import lombok.AllArgsConstructor;

/**
 * This class contains human-readable text describing the source of diagnostics, including severity
 * level.
 */
@AllArgsConstructor
public enum SourceInfoLevels {
  ERROR("E"),
  WARNING("W"),
  INFO("I"),
  HINT("H");

  private static final String COBOL_LANG_SUPPORT_LABEL = "COBOL Language Support";

  private String label;

  public String getText() {
    return COBOL_LANG_SUPPORT_LABEL + " - " + label;
  }
}
