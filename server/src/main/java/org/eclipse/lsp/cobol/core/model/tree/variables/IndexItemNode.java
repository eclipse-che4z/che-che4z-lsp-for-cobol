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
package org.eclipse.lsp.cobol.core.model.tree.variables;

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp4j.Location;

import java.util.List;

/**
 * This value class represents an Index item. It is defined using INDEXED BY statement in a {@link
 * TableDataNameNode} declaration.
 */
@Getter
@ToString(callSuper = true)
public class IndexItemNode extends VariableNode implements EffectiveData {

  protected IndexItemNode(Locality locality, String name, boolean global) {
    super(locality, name, VariableType.INDEX_ITEM, global);
  }

  @Override
  public List<Location> getDefinitions() {
    return ImmutableList.of(getLocality().toLocation());
  }

  @Override
  protected String getVariableDisplayString() {
    return "INDEXED BY " + getName();
  }

  @Override
  public EffectiveDataType getEffectiveDataType() {
    return EffectiveDataType.INTEGER;
  }
}
