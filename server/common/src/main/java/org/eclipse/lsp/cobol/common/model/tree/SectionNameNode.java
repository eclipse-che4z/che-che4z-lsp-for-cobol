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
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.common.model.tree;

import com.google.common.collect.ImmutableList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import lombok.Getter;
import lombok.Setter;
import org.eclipse.lsp.cobol.common.model.DefinedAndUsedStructure;
import org.eclipse.lsp.cobol.common.model.Describable;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.MarkupContent;
import org.eclipse.lsp4j.MarkupKind;

/** The class represents section name node in COBOL grammar. */
@Getter
public class SectionNameNode extends Node implements DefinedAndUsedStructure, Describable {
  private final String name;

  @Setter private List<Location> definitions = ImmutableList.of();
  @Setter private List<Location> usages = ImmutableList.of();

  public SectionNameNode(Locality location, String name) {
    super(location, NodeType.SECTION_NAME_NODE);
    this.name = name.toUpperCase();
  }

  @Override
  public List<Location> getDefinitions() {
    return definitions;
  }

  @Override
  public Stream<Location> getUsages() {
    return usages.stream();
  }

  /**
   * @return
   */
  @Override
  public List<MarkupContent> getFormattedDisplayString() {
    return getNearestParentByType(NodeType.PROCEDURE_SECTION)
        .map(ProcedureSectionNode.class::cast)
        .map(ProcedureSectionNode::getFullVariableDescription)
        .map(desc -> Arrays.stream(desc.split("\\r?\\n")))
        .orElse(Stream.empty())
        .map(line -> new MarkupContent(MarkupKind.PLAINTEXT, line))
        .collect(Collectors.toList());
  }
}
