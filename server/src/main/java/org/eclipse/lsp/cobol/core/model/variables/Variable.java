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
package org.eclipse.lsp.cobol.core.model.variables;

import org.eclipse.lsp.cobol.core.model.Locality;
import lombok.NonNull;

import java.util.List;

/**
 * This interface describes a COBOL Variable. Variable has a name and a unique definition locality.
 */
public interface Variable extends Renameable, Conditional {

  /**
   * Get level number of the variable
   *
   * @return the level number
   */
  int getLevelNumber();

  /**
   * Get name of the variable
   *
   * @return String variable name
   */
  @NonNull
  String getName();

  /**
   * Get definition locality for this variable. The definition is unique
   *
   * @return the definition {@link Locality}
   */
  @NonNull
  Locality getDefinition();

  /**
   * Get list of usage localities for this variable
   *
   * @return list of usage {@link Locality}
   */
  @NonNull
  List<Locality> getUsages();

  /**
   * Store a usage of this variable
   *
   * @param usage - a {@link Locality} of this variable usage
   */
  void addUsage(@NonNull Locality usage);

  /**
   * Get the parent of this variable in the hierarchy
   *
   * @return parent {@link Variable}
   */
  Variable getParent();

  /**
   * Get user friendly variable description.
   *
   * @return the string with described variable.
   */
  String getFormattedDisplayLine();
}
