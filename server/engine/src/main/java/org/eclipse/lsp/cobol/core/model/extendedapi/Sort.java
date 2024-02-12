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
package org.eclipse.lsp.cobol.core.model.extendedapi;

import lombok.EqualsAndHashCode;
import lombok.Value;
import org.apache.commons.lang3.StringUtils;

/** Data transport object of CF AST. Sort type represents SORT statement. */
@Value
@EqualsAndHashCode(callSuper = true)
public class Sort extends CFASTNode {

  public Sort(Location location,
              String inputTargetName, String inputTargetSectionName,
              Location inputStatement,
              String outputTargetName, String outputTargetSectionName,
              Location outputStatement) {
    super(CFASTNodeType.SORT.getValue(), location);
    if (!StringUtils.isEmpty(inputTargetName)) {
      getChildren().add(new Perform(inputTargetName, inputTargetSectionName, null, null, inputStatement));
    }
    if (!StringUtils.isEmpty(outputTargetName)) {
      getChildren().add(new Perform(outputTargetName, outputTargetSectionName, null, null, outputStatement));
    }
    getChildren().add(new CFASTNode(CFASTNodeType.END_SORT.getValue(), location));
  }
}
