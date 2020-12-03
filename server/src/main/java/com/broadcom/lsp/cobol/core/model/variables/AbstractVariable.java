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

package com.broadcom.lsp.cobol.core.model.variables;

import com.broadcom.lsp.cobol.core.model.Locality;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;

import java.util.ArrayList;
import java.util.List;

/** This abstract class implements the functionality that is common for all the variables. */
@AllArgsConstructor
public abstract class AbstractVariable implements Variable {
  @Getter protected final String name;
  @Getter protected final String qualifier;
  @Getter protected final Locality definition;
  private final List<Locality> usages = new ArrayList<>();

  @Override
  public @NonNull List<Locality> getUsages() {
    return usages;
  }

  @Override
  public void addUsage(@NonNull Locality usage) {
    usages.add(usage);
  }
}
