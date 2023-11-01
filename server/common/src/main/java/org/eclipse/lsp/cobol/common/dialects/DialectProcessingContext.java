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
package org.eclipse.lsp.cobol.common.dialects;

import java.util.ArrayList;
import java.util.List;
import lombok.Builder;
import lombok.Value;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.tree.Node;

/** Contains all needed data for dialect processing */
@Value
@Builder(toBuilder = true)
public class DialectProcessingContext {
  AnalysisConfig config;
  String programDocumentUri;
  ExtendedDocument extendedDocument;
  @Builder.Default List<Node> dialectNodes = new ArrayList<>();
}
