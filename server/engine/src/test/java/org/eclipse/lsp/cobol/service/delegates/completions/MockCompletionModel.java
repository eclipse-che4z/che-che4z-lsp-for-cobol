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
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.*;
import org.eclipse.lsp.cobol.core.model.tree.variables.MnemonicNameNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;

import static org.mockito.Mockito.mock;

/** This class stores a model to assert the completion providers */
class MockCompletionModel {
  static final AnalysisResult RESULT =
      AnalysisResult.builder()
          .rootNode(new RootNode(Locality.builder().build(), new CopybooksRepository()))
          .build();
  static final CobolDocumentModel MODEL = new CobolDocumentModel("some text", RESULT);

  static {
    ProgramNode programNode = new ProgramNode(Locality.builder().build());
    RESULT.getRootNode().addChild(programNode);

    ImmutableList.of("constD1", "ConstD2")
        .forEach(
            name -> {
              VariableNode variable = new MnemonicNameNode(Locality.builder().build(), "sys", name);
              programNode.addVariableDefinition(variable);
            });

    ImmutableList.of("parD1", "ParD2", "Not-parD")
        .forEach(
            name -> {
              ParagraphNameNode nameNode = new ParagraphNameNode(Locality.builder().build(), name);
              programNode.registerParagraphNameNode(nameNode);
            });
    ImmutableList.of("secD1", "SecD2", "Not-secD")
        .forEach(
            name -> {
              SectionNameNode nameNode = new SectionNameNode(Locality.builder().build(), name, mock(MessageService.class));
              programNode.registerSectionNameNode(nameNode);
            });

    RootNode rootNode = new RootNode(Locality.builder().build(), new CopybooksRepository());
    RESULT.getRootNode().addChild(rootNode);
    ImmutableList.of("cpyU1", "CpyU2", "Not-cpyU")
              .forEach(
                      name -> {
                          CopyNode nameNode = new CopyNode(Locality.builder().build(), name);
                          rootNode.addChild(nameNode);
                      });

  }
}
