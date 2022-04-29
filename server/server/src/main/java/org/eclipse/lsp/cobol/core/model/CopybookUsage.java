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
package org.eclipse.lsp.cobol.core.model;

import lombok.Value;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis.CopybookName;

/**
 * This value class describes a usage of a copybook inside a COPY statement. Here, name is a copybook
 * name, copybook ID is the unique copy entry identifier, and locality points to this entry position
 * in the document
 */
@Value
public class CopybookUsage {
  CopybookName name;
  String copybookId;
  Locality locality;
}
