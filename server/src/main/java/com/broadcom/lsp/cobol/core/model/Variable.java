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
package com.broadcom.lsp.cobol.core.model;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/** This data class represents a COBOL variable, that may contain a structure. */
@Data
public class Variable {
  int levelNumber;
  String name;
  List<String> children = new ArrayList<>();
  Variable parent;

  public Variable(String levelNumber, String name) {
    super();
    this.levelNumber = Integer.parseInt(levelNumber);
    this.name = name.toUpperCase();
  }
}
