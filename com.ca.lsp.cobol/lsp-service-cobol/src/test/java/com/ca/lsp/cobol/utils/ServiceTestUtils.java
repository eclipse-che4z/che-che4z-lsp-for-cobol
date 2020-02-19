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
 */

package com.ca.lsp.cobol.utils;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp4j.ConfigurationItem;
import org.eclipse.lsp4j.ConfigurationParams;
import java.util.Collections;

@UtilityClass
public final class ServiceTestUtils {

  public ConfigurationParams createParams() {
    ConfigurationParams params = new ConfigurationParams();
    ConfigurationItem item = new ConfigurationItem();
    item.setSection("broadcom-cobol-lsp.cpy-manager");
    item.setScopeUri(null);
    params.setItems(Collections.singletonList(item));
    return params;
  }
}
