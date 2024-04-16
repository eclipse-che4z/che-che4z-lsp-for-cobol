/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects.hp;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.eclipse.lsp4j.Range;

/**
 * HP Copybook descriptor
 */
@Data
@AllArgsConstructor
class CopybookDescriptor {
  Range statementRange;
  Range nameRange;
  String name;
  String variable;
}
