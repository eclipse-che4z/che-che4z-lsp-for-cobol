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
package org.eclipse.lsp.cobol.dialects.daco.processors.implicit;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.GroupItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;

/**
 * Helps to create variable nodes
 */
@UtilityClass
class GeneratorHelper {
  public GroupItemNode createGroupNode(int level, String name) {
    Locality locality = Locality.builder()
        .uri(ImplicitCodeUtils.createFullUrl("daco-implicit-code"))
        .build();
    return new GroupItemNode(locality, level, name, false, false, UsageFormat.UNDEFINED);
  }

  public ElementaryItemNode createElementaryNode(int level, String name, String picClause, String value, UsageFormat usageFormat) {
    Locality locality = Locality.builder()
        .uri(ImplicitCodeUtils.createFullUrl("daco-implicit-code"))
        .build();
    return new ElementaryItemNode(locality, level, name, false, picClause, value,
        usageFormat, false, false, false);
  }

}
