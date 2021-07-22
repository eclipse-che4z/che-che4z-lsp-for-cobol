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

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import lombok.Value;
import org.eclipse.lsp.cobol.core.model.Locality;

import static org.eclipse.lsp.cobol.core.model.variables.StructureType.MAP_NAME;

/** This value clause represents IDMS MAP name variable */
@Value
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class MapName extends SpecialVariable {
  @Getter private static final StructureType STRUCTURE_TYPE = MAP_NAME;

  public MapName(String name, Locality definition) {
    super(DEFAULT_LEVEL, name, definition, false, null);
  }

  @Override
  public StructureType getStructureType() {
    return MAP_NAME;
  }

  @Override
  public String getFormattedDisplayLine() {
    return String.format("MAP %S.", name);
  }
}
