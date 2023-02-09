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
package org.eclipse.lsp.cobol.dialects.daco.processors.implicit;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.ProcedureSectionNode;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Generates predefined section content provider that generates content for a copybook
 */
@UtilityClass
class SectionsGenerator {

  /**
   * Read injected code content
   * @param predefinedSection set of DaCo predefined sessions in a program
   * @param existingSessions set of existing sessions in a program
   * @return a list of generated section name nodes
   */
  public List<CodeBlockDefinitionNode> generate(List<String> predefinedSection, Set<String> existingSessions) {
    Locality locality = Locality.builder()
        .uri(ImplicitCodeUtils.createFullUrl("daco-generated-sections"))
        .build();

    return predefinedSection.stream()
        .filter(s -> !existingSessions.contains(s))
        .map(name -> new ProcedureSectionNode(locality, name, "", locality))
        .collect(Collectors.toList());
  }
}
