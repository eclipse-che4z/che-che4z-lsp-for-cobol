/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.core.model.variables;

import lombok.Getter;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;

/**
 * This enum holds all the variable structure types. It describes only types that are related to the
 * level number or special definition clauses. They also contain a message template for
 * localization.
 */
public enum StructureType {
  CONDITION_ITEM("variables.conditionName"),
  ELEMENT_ITEM("variables.elementaryItem"),
  TABLE_ITEM("variables.tableDataName"),
  MULTI_TABLE_ITEM("variables.tableDataName"),
  RENAME_ITEM("variables.renameItem"),
  MNEMONIC_NAME("variables.mnemonicName"),
  INDEX_NAME("variables.indexName"),
  GROUP_ITEM("variables.groupItem"),
  INDEPENDENT_ITEM("variables.independent");

  @Getter private final MessageTemplate template;

  StructureType(String id) {
    this.template = MessageTemplate.of(id);
  }
}
