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

package org.eclipse.lsp.cobol.common.copybook;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * This value class represents a resolved copybook. It consists of the copybook name, its URI using
 * for positions and the content.
 */
@Data
@AllArgsConstructor
public class CopybookModel {
  CopybookId copybookId;
  CopybookName copybookName;
  String uri;
  String content;
}
