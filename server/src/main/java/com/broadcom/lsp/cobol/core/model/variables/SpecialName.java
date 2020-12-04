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
import lombok.EqualsAndHashCode;
import lombok.Value;

/**
 * This value class represents a special name. They may substitute environment names in the
 * SPECIAL-NAMES paragraph. They should are a special type of variable, allowed in certain
 * statements.
 */
@Value
@EqualsAndHashCode(callSuper = true)
public class SpecialName extends AbstractVariable {
  public SpecialName(String name, String qualifier, Locality definition) {
    super(name, qualifier, definition);
  }
}
