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
package org.eclipse.lsp.cobol.core.engine.dialects.daco.provider;

import com.google.common.collect.LinkedListMultimap;
import com.google.common.collect.Multimap;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;

import java.util.List;
import java.util.Set;

/**
 * Creates DaCo implicit code for future injection
 */
public class DaCoImplicitCodeProvider {

  private static final String WORKING_STORAGE = "WORKING-STORAGE";
  private static final String LINKAGE = "LINKAGE";
  private static final String PROCEDURE_DIVISION = "PROCEDURE";

  private final Set<String> existingSections;

  public DaCoImplicitCodeProvider(Set<String> existingSections) {
    this.existingSections = existingSections;
  }

  /**
   * Returns DaCo implicit code depend on COBOL text for future injection
   * @param input source code
   * @param nodes is generated nodes with DaCo dialect processor
   * @param copybookConfig copybook configuration to get predefine section list
   * @return multimap object where the key is a section name and a value is a code to inject
   */
  public Multimap<String, Pair<String, String>> getImplicitCode(String input, List<Node> nodes, CopybookConfig copybookConfig) {
    Multimap<String, Pair<String, String>> implicitCode = LinkedListMultimap.create();
    implicitCode.put(WORKING_STORAGE, WorkingSectionStaticGenerator.generate());
    implicitCode.putAll(WORKING_STORAGE, WorkingSectionDynamicGenerator.generate(input, nodes));
    implicitCode.put(LINKAGE, LinkageSectionStaticGenerator.generate());
    implicitCode.put(PROCEDURE_DIVISION, SectionsGenerator.generate(copybookConfig.getPredefinedSections(), existingSections));
    return implicitCode;
  }
}
