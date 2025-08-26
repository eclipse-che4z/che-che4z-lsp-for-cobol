/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.jrpc;

import lombok.Value;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;

/** Dialect Copybook Info object is a part of the V2 dialect processing */
@Value
public class DialectCopybookInfo {
  String copybookName;
  Location statementLocation;
  Location nameLocation;
  String uri;
  String text;
  DialectCopybookInfo[] copybooks;
  DocumentReplacement[] replacements;
  Diagnostic[] diagnostics;
}
