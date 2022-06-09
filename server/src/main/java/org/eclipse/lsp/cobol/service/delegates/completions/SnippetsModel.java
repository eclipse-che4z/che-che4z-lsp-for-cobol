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
package org.eclipse.lsp.cobol.service.delegates.completions;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/**
 * Class represents Snippet model. It is POJO class for Snippets.json
 */
@Getter
@Setter
@ToString
public class SnippetsModel {
  private String prefix;
  private String[] body;
  private String description;
  private String scope;

  public SnippetsModel(String prefix, String[] body, String description, String scope) {
    this.prefix = prefix;
    this.body = body;
    this.description = description;
    this.scope = scope;
  }
}
