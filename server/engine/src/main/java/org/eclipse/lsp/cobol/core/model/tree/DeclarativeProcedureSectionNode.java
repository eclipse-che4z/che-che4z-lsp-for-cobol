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
package org.eclipse.lsp.cobol.core.model.tree;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.logic.DeclarativeProcedureSectionRegister;

/** The class represents declarative procedure section in COBOL. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class DeclarativeProcedureSectionNode extends ProcedureSectionNode {
  public DeclarativeProcedureSectionNode(
      Locality location, String name, String text, Locality definition) {
    super(location, name, text, definition);
    addProcessStep(ctx -> new DeclarativeProcedureSectionRegister().accept(this, ctx));
  }
}
