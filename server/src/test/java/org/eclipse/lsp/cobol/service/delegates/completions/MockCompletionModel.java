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

package org.eclipse.lsp.cobol.service.delegates.completions;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.core.model.tree.RootNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.MnemonicNameNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.List;

import static com.google.common.collect.ImmutableMap.of;

/** This class stores a model to assert the completion providers */
class MockCompletionModel {
  private static final List<Location> LOCATIONS = new ArrayList<>();

  static final AnalysisResult RESULT =
      AnalysisResult.builder()
          .paragraphDefinitions(of("parD1", LOCATIONS, "ParD2", LOCATIONS, "Not-parD", LOCATIONS))
          .paragraphUsages(of("parU1", LOCATIONS, "ParU2", LOCATIONS, "Not-parU", LOCATIONS))
          .sectionDefinitions(of("secD1", LOCATIONS, "SecD2", LOCATIONS, "Not-secD", LOCATIONS))
          .sectionUsages(of("secU1", LOCATIONS, "SecU2", LOCATIONS, "Not-secU", LOCATIONS))
          .copybookDefinitions(of("cpyD1", LOCATIONS, "CpyD2", LOCATIONS, "Not-cpyD", LOCATIONS))
          .copybookUsages(of("cpyU1", LOCATIONS, "CpyU2", LOCATIONS, "Not-cpyU", LOCATIONS))
          .subroutineDefinitions(of("subD1", LOCATIONS, "SubD2", LOCATIONS, "Not-subD", LOCATIONS))
          .subroutineUsages(of("subU1", LOCATIONS, "SubU2", LOCATIONS, "Not-subU", LOCATIONS))
          .rootNode(new RootNode(Locality.builder().build(), new NamedSubContext()))
          .build();
  static final CobolDocumentModel MODEL = new CobolDocumentModel("some text", RESULT);

  static {
    ProgramNode programNode = new ProgramNode(Locality.builder().build());
    RESULT.getRootNode().addChild(programNode);
    ImmutableList.of("constD1", "ConstD2").forEach(name -> {
      VariableNode variable = new MnemonicNameNode(Locality.builder().build(), "sys", name);
      programNode.addVariableDefinition(variable);
    });
  }
}
