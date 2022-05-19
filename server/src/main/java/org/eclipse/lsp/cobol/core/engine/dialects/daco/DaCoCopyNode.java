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
package org.eclipse.lsp.cobol.core.engine.dialects.daco;

import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;

/** Tree node that represents DaCo copybook related information */
@ToString(callSuper = true)
@Getter
public class DaCoCopyNode extends CopyNode {
  String layoutUsage;
  String suffix;

  public DaCoCopyNode(Locality locality, String layoutId, String layoutUsage, String suffix) {
    super(locality, layoutId);
    this.layoutUsage = layoutUsage;
    this.suffix = suffix;
  }

  public String getLayoutId() {
    return getName();
  }

  public String getParentSuffix() {
    return suffix;
  }
}
