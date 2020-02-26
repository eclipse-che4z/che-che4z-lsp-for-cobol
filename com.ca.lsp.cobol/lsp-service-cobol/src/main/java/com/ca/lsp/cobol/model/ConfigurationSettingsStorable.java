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

package com.ca.lsp.cobol.model;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
public class ConfigurationSettingsStorable implements Cloneable {
  private Object profiles;
  private List<String> paths;

  @Builder
  public ConfigurationSettingsStorable(Object profiles, List<String> paths) {
    this.profiles = profiles;
    this.paths = paths;
  }

  @Override
  public Object clone() throws CloneNotSupportedException {
    return super.clone();
  }
}
