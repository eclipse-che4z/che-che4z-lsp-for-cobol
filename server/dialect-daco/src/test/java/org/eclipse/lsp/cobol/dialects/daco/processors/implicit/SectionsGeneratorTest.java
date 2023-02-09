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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockDefinitionNode;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.stream.Collectors;

/**
 * This unit tests check the {@link SectionsGenerator} class functionality
 */
class SectionsGeneratorTest {
  @Test
  void testCreatesSectionsFromProvidedNames() {
    List<String> generated = SectionsGenerator.generate(ImmutableList.of("LABEL1", "LABEL2", "LABEL_EX"), ImmutableSet.of("LABEL_EX"))
        .stream().map(CodeBlockDefinitionNode::getName)
        .collect(Collectors.toList());

    Assertions.assertIterableEquals(generated, ImmutableList.of("LABEL1", "LABEL2"));
  }

}
