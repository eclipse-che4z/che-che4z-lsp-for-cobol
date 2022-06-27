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
package org.eclipse.lsp.cobol.core.engine.dialects;

import lombok.Builder;
import lombok.Value;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.model.ExtendedDocumentHierarchy;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;

/**
 * Contains all needed data for dialect processing
 */
@Value
@Builder(toBuilder = true)
public class DialectProcessingContext {
  String programDocumentUri;
  ExtendedDocumentHierarchy extendedDocumentHierarchy;
  CopybookConfig copybookConfig;
}
