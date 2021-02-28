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
import lombok.ToString;
import lombok.Value;

/**
 * This value class represents an Index item. It is defined using INDEXED BY statement in a {@link
 * TableDataName} declaration.
 */
@Value
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class IndexItem extends AbstractVariable {
  public IndexItem(String name, Locality definition, String scopeName) {
    super(name, definition, null, scopeName);
  }
}
