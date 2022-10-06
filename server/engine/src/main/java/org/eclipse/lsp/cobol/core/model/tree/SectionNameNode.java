/*
 * Copyright (c) 2022 Broadcom.
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

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.engine.symbols.CodeBlockReference;
import org.eclipse.lsp.cobol.core.engine.symbols.Context;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolService;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp4j.Location;

import java.util.List;

/** The class represents section name node in COBOL grammar. */
@Getter
public class SectionNameNode extends Node implements Context {
  private final String name;
  @EqualsAndHashCode.Exclude @ToString.Exclude private final MessageService messageService;

  @EqualsAndHashCode.Exclude @ToString.Exclude private final SymbolService symbolService;

  public SectionNameNode(
      Locality location, String name, MessageService messageService, SymbolService symbolService) {
    super(location, NodeType.SECTION_NAME_NODE);
    this.name = name.toUpperCase();
    this.messageService = messageService;
    this.symbolService = symbolService;
  }

  @Override
  public List<Location> getDefinitions() {
    return symbolService.getSectionLocations(this, CodeBlockReference::getDefinitions);
  }

  @Override
  public List<Location> getUsages() {
    return symbolService.getSectionLocations(this, CodeBlockReference::getUsage);
  }
}
