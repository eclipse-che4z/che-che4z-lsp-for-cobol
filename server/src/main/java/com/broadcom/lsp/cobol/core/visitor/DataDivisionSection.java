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

package com.broadcom.lsp.cobol.core.visitor;

import lombok.AllArgsConstructor;

import java.util.List;

import static com.broadcom.lsp.cobol.core.CobolParser.*;

/**
 * This class represents the supported sections of DATA DIVISION. Each division supports its own
 * list of data description formats. The client code should raise a semantic error if the sections
 * does not support the given type.
 */
@AllArgsConstructor
public enum DataDivisionSection {
  /** Default section, does not allow any definition. */
  NOT_INITIALIZED(List.of()),
  FILE(
      List.of(
          DataDescriptionEntryFormat1Context.class,
          DataDescriptionEntryFormat2Context.class,
          DataDescriptionEntryFormat3Context.class)),
  WORKING_STORAGE(
      List.of(
          DataDescriptionEntryFormat1Context.class,
          DataDescriptionEntryFormat2Context.class,
          DataDescriptionEntryFormat3Context.class,
          DataDescriptionEntryFormat1Level77Context.class)),
  LINKAGE(
      List.of(
          DataDescriptionEntryFormat1Context.class,
          DataDescriptionEntryFormat2Context.class,
          DataDescriptionEntryFormat3Context.class,
          DataDescriptionEntryFormat1Level77Context.class)),
  LOCAL_STORAGE(
      List.of(
          DataDescriptionEntryFormat1Context.class,
          DataDescriptionEntryFormat2Context.class,
          DataDescriptionEntryFormat3Context.class));
  private List<Class> allowedDefinitions;

  /**
   * Check if this section allows the given variable type to be defined.
   *
   * @param variableType - a class of the data description context with a variable
   * @return true if a variable of that type allowed in this section
   */
  public boolean allowsVariableType(Class variableType) {
    return allowedDefinitions.contains(variableType);
  }
}
