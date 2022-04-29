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
/** Enum for the different Section types */
public enum SectionType {
  CONFIGURATION("CONFIGURATION"),
  FILE("FILE"),
  INPUT_OUTPUT("INPUT-OUTPUT"),
  LINKAGE("LINKAGE"),
  LOCAL_STORAGE("LOCAL-STORAGE"),
  MAP("MAP"),
  SCHEMA("SCHEMA"),
  IDMS_CONTROL("IDMS-CONTROL"),
  PROCEDURE("PROCEDURE"),
  WORKING_STORAGE("WORKING-STORAGE");
  @Getter private final String type;

  SectionType(String label) {
    this.type = label;
  }
}
