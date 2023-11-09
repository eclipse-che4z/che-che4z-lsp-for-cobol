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
package org.eclipse.lsp.cobol.dialects.idms;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

/**
 * Test for {@link IdmsCopybookService}
 */
@ExtendWith(MockitoExtension.class)
class IdmsCopybookServiceTest {

  @Mock
  private CopybookService copybookService;
  @Mock
  private ParseTreeListener treeListener;
  @Mock
  private MessageService messageService;

  private Set<CopybookName> processedCopybooks;
  private IdmsCopybookService service;

  @BeforeEach
  void init() {
    processedCopybooks = new HashSet<>();
    service = new IdmsCopybookService("uri", copybookService, CopybookProcessingMode.ENABLED,
        treeListener, messageService, processedCopybooks);
  }

  @Test
  void testNullContent() {
    CopybookName copybookName = new CopybookName("copybook");
    CopybookModel copybookModel = new CopybookModel(copybookName.toCopybookId(""), copybookName, "copybookUri", null);
    Locality locality = Locality.builder().build();
    List<SyntaxError> errors = new LinkedList<>();

    ResultWithErrors<List<Node>> result = service.processCopybook(copybookModel, 1, locality);
    result.unwrap(errors::addAll);

    assertEquals(1, errors.size());
  }

  @Test
  void testCircularDependency() {
    CopybookName copybookName = new CopybookName("copybook");
    CopybookModel copybookModel = new CopybookModel(copybookName.toCopybookId(""), copybookName, "copybookUri", "content");
    Locality locality = Locality.builder().build();
    List<SyntaxError> errors = new LinkedList<>();

    processedCopybooks.add(copybookModel.getCopybookName());
    ResultWithErrors<List<Node>> result = service.processCopybook(copybookModel, 1, locality);
    result.unwrap(errors::addAll);

    assertEquals(1, errors.size());
  }

  @Test
  void testCreateNode() {
    CopybookName copybookName = new CopybookName("copybook");
    CopybookModel copybookModel = new CopybookModel(copybookName.toCopybookId(""), copybookName, "copybookUri", "content");
    Locality locality = Locality.builder().build();
    List<SyntaxError> errors = new LinkedList<>();

    ResultWithErrors<List<Node>> result = service.processCopybook(copybookModel, 1, locality);
    result.unwrap(errors::addAll);

    assertEquals(0, errors.size());
    assertEquals(1, result.getResult().size());
    assertTrue(processedCopybooks.contains(copybookModel.getCopybookName()));
  }

}
