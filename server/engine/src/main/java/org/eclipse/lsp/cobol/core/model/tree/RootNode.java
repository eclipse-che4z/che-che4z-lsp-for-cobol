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
package org.eclipse.lsp.cobol.core.model.tree;

import com.google.common.collect.Multimap;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.engine.symbols.CopyDefinition;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.logic.RootNodeWaitForVariableStructure;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp4j.Location;

import java.util.HashMap;
import java.util.Map;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.ROOT;

/**
 * The class represents the root. All trees must start with one root node. This class also creates
 * definition nodes for copyNodes and adds its usages.
 */
@ToString(callSuper = true)
@Getter
public class RootNode extends Node {
  private final Map<String, CopyDefinition> copyDefinitionMap = new HashMap<>();

  public RootNode(Locality locality, CopybooksRepository copybooks) {
    super(locality, ROOT);
    addProcessStep(ctx -> new RootNodeWaitForVariableStructure().accept(this, ctx));
    createCopyBookDefinitionNode(copybooks.getDefinitions());
  }

  private void createCopyBookDefinitionNode(Multimap<String, Location> definition) {
    for (Map.Entry<String, Location> copybook : definition.entries()) {
      copyDefinitionMap.put(
              copybook.getKey(), new CopyDefinition(copybook.getValue(), copybook.getKey()));
    }
  }
}
