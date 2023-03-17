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

import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Test for {@link ErrorHelper}
 */
@ExtendWith(MockitoExtension.class)
class ErrorHelperTest {
  @Test
  void testMissingCopybooks() {
    MessageService messageService = mock(MessageService.class);
    Locality locality = Locality.builder().build();
    when(messageService.getMessage("GrammarPreprocessorListener.errorSuggestion", "copybook"))
        .thenReturn("missing");

    SyntaxError result = ErrorHelper.missingCopybooks(messageService, locality, "copybook");
    checkSyntaxError(result, "missing", locality);
  }

  @Test
  void testCircularDependency() {
    MessageService messageService = mock(MessageService.class);
    Locality locality = Locality.builder().build();
    when(messageService.getMessage("IdmsCopybookVisitor.errorCircularDependency", "copybook"))
        .thenReturn("circular");

    SyntaxError result = ErrorHelper.circularDependency(messageService, locality, "copybook");
    checkSyntaxError(result, "circular", locality);
  }

  private void checkSyntaxError(SyntaxError result, String message, Locality locality) {
    assertEquals(ErrorSource.DIALECT, result.getErrorSource());
    assertEquals(locality.toOriginalLocation(), result.getLocation());
    assertEquals(locality.toOriginalLocation(), result.getLocation());
    assertEquals(ErrorSeverity.ERROR, result.getSeverity());
    assertEquals(ErrorCodes.MISSING_COPYBOOK.getLabel(), result.getErrorCode().getLabel());
    assertEquals(message, result.getSuggestion());
  }

}
