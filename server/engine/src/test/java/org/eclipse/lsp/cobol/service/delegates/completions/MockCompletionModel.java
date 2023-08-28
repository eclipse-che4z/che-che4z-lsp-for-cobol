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
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.common.model.tree.ParagraphNameNode;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNameNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.MnemonicNameNode;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.common.AnalysisResult;

/** This class stores a model to assert the completion providers */
class MockCompletionModel {
  static final AnalysisResult RESULT =
      AnalysisResult.builder()
          .rootNode(new RootNode())
          .build();
  static final CobolDocumentModel MODEL = new CobolDocumentModel("", "some text", RESULT);
  static final SymbolAccumulatorService SYMBOL_SERVICE = new SymbolAccumulatorService();
  static final SymbolsRepository REPO = new SymbolsRepository();

  static {
    ProgramNode programNode = new ProgramNode(Locality.builder().build());
    RESULT.getRootNode().addChild(programNode);
    ImmutableList.of("constD1", "ConstD2")
        .forEach(
            name -> {
              VariableNode variable = new MnemonicNameNode(Locality.builder().build(), "sys", name);
                SYMBOL_SERVICE.addVariableDefinition(programNode, variable);
            });

    ImmutableList.of("parD1", "ParD2", "Not-parD")
        .forEach(
            name -> {
              ParagraphNameNode nameNode =
                  new ParagraphNameNode(Locality.builder().build(), name);
              SYMBOL_SERVICE.registerParagraphNameNode(programNode, nameNode);
            });
    ImmutableList.of("secD1", "SecD2", "Not-secD")
        .forEach(
            name -> {
              SectionNameNode nameNode =
                  new SectionNameNode(
                      Locality.builder().build(), name);
              SYMBOL_SERVICE.registerSectionNameNode(programNode, nameNode);
            });

    RootNode rootNode = new RootNode();
    RESULT.getRootNode().addChild(rootNode);
    ImmutableList.of("cpyU1", "CpyU2", "Not-cpyU")
        .forEach(
            name -> {
              CopyNode nameNode = new CopyNode(Locality.builder().build(), Locality.builder().build().toLocation(), name, "uri");
              rootNode.addChild(nameNode);
            });
      REPO.updateSymbols(SYMBOL_SERVICE.getProgramSymbols());
  }
}
