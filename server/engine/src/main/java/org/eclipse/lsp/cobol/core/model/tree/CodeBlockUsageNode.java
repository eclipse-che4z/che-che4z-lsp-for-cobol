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

package org.eclipse.lsp.cobol.core.model.tree;

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.engine.symbols.CodeBlockReference;
import org.eclipse.lsp.cobol.core.engine.symbols.Context;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolService;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp4j.Location;

import java.util.List;
import java.util.function.Function;

/** The class represents usages of paragraphs or sections. */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class CodeBlockUsageNode extends Node implements Context {
  String name;
  final SymbolService symbolService;

  public CodeBlockUsageNode(Locality location, String name, SymbolService symbolService) {
    super(location, NodeType.CODE_BLOCK_USAGE);
    this.name = name;
    this.symbolService = symbolService;
  }

  @Override
  public List<Location> getDefinitions() {
    return getLocations(CodeBlockReference::getDefinitions);
  }

  @Override
  public List<Location> getUsages() {
    return getLocations(CodeBlockReference::getUsage);
  }

  private List<Location> getLocations(Function<CodeBlockReference, List<Location>> retriveLocations) {
    return getProgram()
        .map(p -> symbolService.getCodeBlockReference(p, getName()))
        .map(retriveLocations)
        .orElse(ImmutableList.of());
  }
}
